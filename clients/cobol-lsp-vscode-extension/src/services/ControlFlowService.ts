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
import { Program } from "@code4z/analysis/lib/model/cfast";
import { Worker } from "worker_threads";
import { join } from "path";
import {
  DiagnosticDto,
  DiagnosticRelatedInformationDto,
  DiagnosticSeverityDto,
  DiagnosticTagDto,
  LocationDto,
  RangeDto,
} from "@code4z/analysis/lib/model/external";
import { SettingsService } from "./Settings";
import { WorkerResultMessage } from "./worker/messages";
import { GraphDTO } from "@code4z/analysis/lib/model/GraphDTO";

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

export type AnalysisResult = {
  documentUri: string;
  graphs: GraphDTO[];
  locations: string[];
};

interface AnalysisServiceDelegate {
  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    locations: string[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void;
}

type LatestResultData = {
  resolve: (value: AnalysisResult | PromiseLike<AnalysisResult>) => void;
  promise: Promise<AnalysisResult>;
  resolved: boolean;
};

class AnalysisTask {
  private worker: Worker = new Worker(join(__dirname, "./Worker.js"));

  constructor(
    private documentUri: string,
    public programs: Program[],
    private delegate: AnalysisServiceDelegate,
    private mainChannel?: vscode.OutputChannel,
    private logChannel?: vscode.LogOutputChannel,
  ) {
    this.worker.on("message", (data: WorkerResultMessage) => {
      if (data.type === "result") {
        this.delegate.finishTask(
          this.documentUri,
          data.payload.graphs,
          data.payload.locations,
          convertDiagnostics(data.payload.diagnostics),
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
    this.worker.on("error", (code) => {
      this.mainChannel?.appendLine(
        `Error starting Control Flow Analysis: ${code}`,
      );
      this.delegate.finishTask(this.documentUri, [], [], new Map());
    });

    this.worker.postMessage({
      vmCount: SettingsService.getMaxVMCount(),
      severity: SettingsService.getUnreachableCodeSeverity()?.valueOf() || 0,
      programs: programs,
    });
  }

  public async abort() {
    await this.worker.terminate();
  }
}

export class ControlFlowAnalysisService implements AnalysisServiceDelegate {
  private tasks: Map<string, AnalysisTask>;
  private latestResults: Map<string, LatestResultData>;
  private diagnosticService: DiagnosticService;

  public constructor(
    private mainChannel?: vscode.OutputChannel,
    private logChannel?: vscode.LogOutputChannel,
  ) {
    this.tasks = new Map<string, AnalysisTask>();
    this.diagnosticService = new DiagnosticService();
    this.latestResults = new Map<string, LatestResultData>();
  }

  public async invalidate(documentUri: string) {
    const task = this.tasks.get(documentUri);
    this.latestResults.delete(documentUri);
    if (task) {
      await task.abort();
    }
  }

  public getAnalysis(documentUri: string): Promise<AnalysisResult> {
    const promiseWithResolver = this.latestResults.get(documentUri);
    if (promiseWithResolver) {
      return promiseWithResolver.promise;
    } else {
      return this.createLatestResultPromise(documentUri);
    }
  }

  public async handleControlFlowAst(result: ApiResult) {
    if (result.documentUri) {
      await this.invalidate(result.documentUri);
      if (result.controlFlowAST.length > 0) {
        this.queueAnalysis(result.controlFlowAST, result.documentUri);
      }
    }
  }

  private queueAnalysis(programs: Program[], documentUri: string) {
    const latestResult = this.latestResults.get(documentUri);
    if (latestResult?.resolved || !latestResult) {
      void this.createLatestResultPromise(documentUri);
    }

    const task = new AnalysisTask(
      documentUri,
      programs,
      this,
      this.mainChannel,
      this.logChannel,
    );
    this.tasks.set(documentUri, task);
  }

  public makeControlFlowAstNotificationHandler() {
    return (result: ApiResult) => {
      this.handleControlFlowAst(result).catch(() => {});
    };
  }

  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    locations: string[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void {
    const result = this.latestResults.get(documentUri);
    if (result) {
      result.resolved = true;
      result.resolve({
        documentUri: documentUri,
        graphs: graphs,
        locations: locations,
      });
    }

    this.diagnosticService.showAllDiagnostics(documentUri, diagnostics);
    this.tasks.delete(documentUri);
  }

  private createLatestResultPromise(
    documentUri: string,
  ): Promise<AnalysisResult> {
    let res: (
      value: AnalysisResult | PromiseLike<AnalysisResult>,
    ) => void = () => {};
    const prom = new Promise<AnalysisResult>((r, __e) => {
      res = r;
    });

    const promiseWithResolver = {
      resolve: res,
      promise: prom,
      resolved: false,
    };
    this.latestResults.set(documentUri, promiseWithResolver);
    return prom;
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
    this.diagnosticCollection.delete(vscode.Uri.parse(documentUri));
    diagnostics.forEach((v, k) =>
      this.diagnosticCollection.set(vscode.Uri.parse(k), v),
    );
  }
}

const severityTranslation: vscode.DiagnosticSeverity[] = [
  vscode.DiagnosticSeverity.Error,
  vscode.DiagnosticSeverity.Warning,
  vscode.DiagnosticSeverity.Information,
  vscode.DiagnosticSeverity.Hint,
];

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
