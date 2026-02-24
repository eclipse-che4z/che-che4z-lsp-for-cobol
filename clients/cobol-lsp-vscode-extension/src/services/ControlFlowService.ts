/*
 * Copyright (c) 2025 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as vscode from "vscode";
import { Program } from "@code4z/analysis";
import { Worker } from "worker_threads";
import { join } from "path";
import {
  DiagnosticDto,
  DiagnosticRelatedInformationDto,
  DiagnosticSeverityDto,
  DiagnosticTagDto,
  EventDto,
  LocationDto,
  RangeDto,
} from "@code4z/analysis/lib/model/external";
import { SettingsService } from "./Settings";
import { WorkerResultMessage } from "./worker/messages";
import { GraphDTO } from "@code4z/analysis/lib/model/GraphDTO";
import { telemetryEvent, telemetryExceptionEvent } from "./reporter";
import { getVariablesFromUri } from "./util/FSUtils";
import { ANALYSIS_LIMIT_REASON } from "../constants";

const EVENT_ANALYSIS_ERROR = "ccf.analysis.error";

/**
 * Control Flow Analysis callback
 */
export interface ControlFlowAnalysisCallback {
  (graphs: GraphDTO[], locations: string[]): void;
}

export type ApiResult = {
  controlFlowAST: Program[];
  documentUri: string;
};

type IncompleteReason = {
  code: string;
  message: string;
};

export type AnalysisResult = {
  documentUri: string;
  graphs: GraphDTO[];
  locations: string[];
  incomplete?: IncompleteReason;
};

interface AnalysisServiceDelegate {
  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    locations: string[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
    events: EventDto[],
    requestVersion: number,
  ): void;
  finishTaskWithError(
    documentUri: string,
    error: Error,
    requestVersion: number,
  ): void;
}

type LatestResultData = {
  resolved: boolean;
  requestVersion: number;
} & (
  | {
      resolve: undefined;
      reject: undefined;
      promise: undefined;
    }
  | {
      resolve: (value: AnalysisResult | PromiseLike<AnalysisResult>) => void;
      reject: (reason: Error) => void;
      promise: Promise<AnalysisResult>;
    }
  | {
      resolve: undefined;
      reject: undefined;
      promise: Promise<AnalysisResult>;
    }
);

export class AnalysisTask {
  private worker: Worker = new Worker(join(__dirname, "./Worker.js"));

  constructor(
    private documentUri: string,
    public programs: Program[],
    public requestVersion: number,
    private delegate: AnalysisServiceDelegate,
    private mainChannel?: vscode.OutputChannel,
    private logChannel?: vscode.LogOutputChannel,
  ) {
    this.logChannel?.debug(
      `Create new task with request version: ${requestVersion}`,
    );

    this.worker.on("message", (data: WorkerResultMessage) => {
      if (data.type === "result") {
        this.delegate.finishTask(
          this.documentUri,
          data.payload.graphs,
          data.payload.locations,
          convertDiagnostics(data.payload.diagnostics),
          data.payload.events,
          this.requestVersion,
        );
      } else if (data.type === "error") {
        this.delegate.finishTaskWithError(
          this.documentUri,
          Error(data.payload),
          this.requestVersion,
        );
      } else if (data.type === "log") {
        for (const message of data.payload) {
          switch (message.severity) {
            case DiagnosticSeverityDto.Error:
              this.logChannel?.error(message.message);
              break;
            case DiagnosticSeverityDto.Warning:
              this.logChannel?.warn(message.message);
              break;
            case DiagnosticSeverityDto.Information:
              this.logChannel?.info(message.message);
              break;
            default:
              this.logChannel?.debug(message.message);
              break;
          }
        }
      }
    });
    this.worker.on("error", (error) => {
      this.mainChannel?.appendLine(
        `Error occured during Control Flow Analysis: ${error}`,
      );
      this.delegate.finishTaskWithError(
        this.documentUri,
        error,
        this.requestVersion,
      );
    });

    this.worker.postMessage({
      vmCount: SettingsService.getMaxVMCount(),
      severity: SettingsService.getUnreachableCodeSeverity()?.valueOf(),
      programs: programs,
    });
  }

  public async abort() {
    await this.worker.terminate();
  }
}

function extractFilename(documentUri: string) {
  try {
    return getVariablesFromUri(documentUri).filename;
  } catch (_e) {
    return "????????";
  }
}

export class ControlFlowAnalysisService implements AnalysisServiceDelegate {
  private tasks: Map<string, AnalysisTask>;
  private latestResults: Map<string, LatestResultData>;
  private diagnosticService: DiagnosticService;
  private requestVersion: number = 1;
  private hideProgress?: () => void = undefined;

  public constructor(
    private mainChannel?: vscode.OutputChannel,
    private logChannel?: vscode.LogOutputChannel,
  ) {
    this.tasks = new Map<string, AnalysisTask>();
    this.diagnosticService = new DiagnosticService();
    this.latestResults = new Map<string, LatestResultData>();
  }

  private setTask(documentUri: string, task: AnalysisTask) {
    this.tasks.set(documentUri, task);
    if (!this.hideProgress) {
      const p = new Promise<void>((resolve) => {
        this.hideProgress = resolve;
      });
      vscode.window.withProgress(
        {
          location: vscode.ProgressLocation.Window,
          title: `Analyzing ${extractFilename(documentUri)}`,
        },
        () => p,
      );
    }
  }

  private deleteTask(documentUri: string) {
    this.tasks.delete(documentUri);
    if (this.tasks.size == 0 && this.hideProgress) {
      this.hideProgress();
      this.hideProgress = undefined;
    }
  }

  public async invalidate(documentUri: string, rejectPromise: boolean) {
    this.invalidatePromise(documentUri, rejectPromise);
    if (rejectPromise) {
      this.diagnosticService.clearDiagnostics(documentUri);
    }
    await this.removeTask(documentUri);
  }

  public async getAnalysis(documentUri: string): Promise<AnalysisResult> {
    this.logChannel?.debug(
      `Get analysis request for the document: ${documentUri}`,
    );

    const latestResult = this.latestResults.get(documentUri);
    if (latestResult?.promise) {
      return latestResult.promise;
    } else if (latestResult) {
      return this.fillLatestResultPromise(latestResult);
    } else {
      return this.fillLatestResultPromise(
        this.createLatestResultEntry(documentUri, 0),
      );
    }
  }

  public makeControlFlowAstNotificationHandler() {
    return (result: ApiResult) => {
      this.handleControlFlowAst(result).catch(() => {});
    };
  }

  async handleControlFlowAst(result: ApiResult) {
    this.logChannel?.debug("Handle AST from backend");
    if (result.documentUri) {
      this.invalidatePromise(result.documentUri, false);
      const removal = this.removeTask(result.documentUri);
      if (result.controlFlowAST.length > 0) {
        this.queueAnalysis(result.controlFlowAST, result.documentUri);
      }
      await removal;
    }
  }

  queueAnalysis(programs: Program[], documentUri: string) {
    this.logChannel?.debug("Queue Analysis");

    this.requestVersion++;

    const latestResult = this.latestResults.get(documentUri);
    if (latestResult?.resolved || !latestResult) {
      void this.createLatestResultEntry(documentUri, this.requestVersion);
    } else {
      latestResult.requestVersion = this.requestVersion;
    }

    const task = new AnalysisTask(
      documentUri,
      programs,
      this.requestVersion,
      this,
      this.mainChannel,
      this.logChannel,
    );
    this.setTask(documentUri, task);
  }

  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    locations: string[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
    events: EventDto[],
    requestVersion: number,
  ): void {
    this.logChannel?.debug(
      `Finish task for request version: ${requestVersion}`,
    );

    const result = this.latestResults.get(documentUri);
    this.logChannel?.debug(
      `Latest result request version: ${result?.requestVersion}`,
    );

    if (requestVersion === result?.requestVersion) {
      this.logChannel?.debug(
        `Resolve promise for request version: ${result?.requestVersion}`,
      );

      result.resolved = true;
      const resultObject = {
        documentUri: documentUri,
        graphs: graphs,
        locations: locations,
        incomplete: getIncompleteReason(events),
      };
      if (result.resolve) result.resolve(resultObject);
      else result.promise = Promise.resolve(resultObject);
    }

    this.diagnosticService.showAllDiagnostics(documentUri, diagnostics);
    events.forEach((event) => {
      if ("eventName" in event) {
        telemetryEvent(event.eventName, ["ccf"], event.message);
      } else {
        telemetryExceptionEvent(event.errorName, event.message, ["ccf"]);
      }
    });

    this.deleteTask(documentUri);
  }

  finishTaskWithError(
    documentUri: string,
    error: Error,
    requestVersion: number,
  ): void {
    this.logChannel?.error(`Analysis terminated with error: ${error.message}`);
    this.logChannel?.debug(
      `Finish task with error for request version: ${requestVersion}`,
    );

    const result = this.latestResults.get(documentUri);
    this.logChannel?.debug(
      `Latest result request version: ${result?.requestVersion}`,
    );

    if (requestVersion === result?.requestVersion) {
      this.logChannel?.debug(
        `Reject promise for request version: ${result?.requestVersion}`,
      );

      result.resolved = true;
      if (result.reject) result.reject(error);
      else result.promise = Promise.reject(error);
    }

    this.diagnosticService.showAllDiagnostics(documentUri, new Map());
    telemetryExceptionEvent(EVENT_ANALYSIS_ERROR, error.message, ["ccf"]);

    this.tasks.delete(documentUri);
  }

  private createLatestResultEntry(
    documentUri: string,
    requestVersion: number,
  ): LatestResultData {
    this.logChannel?.debug(
      `Creating a result entry with request version: ${requestVersion}`,
    );
    const latestResultEntry: LatestResultData = {
      resolve: undefined,
      reject: undefined,
      promise: undefined,
      resolved: false,
      requestVersion: requestVersion,
    };
    this.latestResults.set(documentUri, latestResultEntry);
    return latestResultEntry;
  }

  private fillLatestResultPromise(lrd: LatestResultData) {
    lrd.promise = new Promise<AnalysisResult>((r, e) => {
      lrd.resolve = r;
      lrd.reject = e;
    });
    return lrd.promise;
  }

  private invalidatePromise(documentUri: string, rejectPromise: boolean) {
    const latestResult = this.latestResults.get(documentUri);
    if (latestResult) {
      if (rejectPromise) {
        this.latestResults.delete(documentUri);
        latestResult.reject?.(Error("invalidate"));
      } else {
        latestResult.requestVersion = 0;
      }
    }
  }

  private async removeTask(documentUri: string) {
    const task = this.tasks.get(documentUri);
    if (task) {
      this.logChannel?.debug(`Stop task for the document: ${documentUri}`);
      this.deleteTask(documentUri);
      await task.abort();
    }
  }
}

class DiagnosticService {
  private diagnosticCollection: vscode.DiagnosticCollection;

  public constructor() {
    this.diagnosticCollection =
      vscode.languages.createDiagnosticCollection("Control Flow");
  }

  public showDiagnostics(
    documentUri: vscode.Uri,
    diagnostics: vscode.Diagnostic[],
  ) {
    this.diagnosticCollection.set(documentUri, diagnostics);
  }

  public showAllDiagnostics(
    documentUri: string,
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ) {
    this.clearDiagnostics(documentUri);
    diagnostics.forEach((v, k) =>
      this.diagnosticCollection.set(vscode.Uri.parse(k), v),
    );
  }

  public clearDiagnostics(documentUri: string) {
    this.diagnosticCollection.delete(vscode.Uri.parse(documentUri));
  }
}

const severityTranslation: vscode.DiagnosticSeverity[] = [
  vscode.DiagnosticSeverity.Error,
  vscode.DiagnosticSeverity.Warning,
  vscode.DiagnosticSeverity.Information,
  vscode.DiagnosticSeverity.Hint,
];

function getIncompleteReason(events: EventDto[]): IncompleteReason | undefined {
  if (
    events.some(
      (event) =>
        "eventName" in event && event.eventName === ANALYSIS_LIMIT_REASON.event,
    )
  ) {
    return {
      code: ANALYSIS_LIMIT_REASON.code,
      message: ANALYSIS_LIMIT_REASON.message,
    };
  }
  return undefined;
}

function asRange(r: RangeDto): vscode.Range {
  return new vscode.Range(
    new vscode.Position(r.start.line, r.start.character),
    new vscode.Position(r.end.line, r.end.character),
  );
}

function asLocation(r: LocationDto): vscode.Location {
  return new vscode.Location(vscode.Uri.parse(r.uri), asRange(r.range));
}

function asTag(t: DiagnosticTagDto): vscode.DiagnosticTag {
  switch (t) {
    case DiagnosticTagDto.Deprecated:
      return vscode.DiagnosticTag.Deprecated;
    case DiagnosticTagDto.Unnecessary:
      return vscode.DiagnosticTag.Unnecessary;
  }
}

function asRelatedInfo(
  ri: DiagnosticRelatedInformationDto,
): vscode.DiagnosticRelatedInformation {
  return new vscode.DiagnosticRelatedInformation(
    asLocation(ri.location),
    ri.message,
  );
}

function asDiagnostic(d: DiagnosticDto): vscode.Diagnostic {
  const r = new vscode.Diagnostic(
    asRange(d.range),
    d.message,
    severityTranslation[d.severity ?? -1],
  );
  r.tags = d.tags?.map(asTag);
  r.relatedInformation = d.relatedInformation?.map(asRelatedInfo);
  return r;
}

function convertDiagnostics(
  diagnostics: Map<string, DiagnosticDto[]>,
): Map<string, vscode.Diagnostic[]> {
  const diagnosticsMap = new Map<string, vscode.Diagnostic[]>();
  for (const [key, value] of diagnostics) {
    diagnosticsMap.set(key, value.map(asDiagnostic));
  }
  return diagnosticsMap;
}
