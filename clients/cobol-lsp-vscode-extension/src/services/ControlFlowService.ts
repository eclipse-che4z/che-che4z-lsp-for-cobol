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
  (graphs: GraphDTO[]): void;
}

export class ApiResult {
  public controlFlowAST: Program[] = [];
  public documentUri: string | undefined;
}

interface AnalysisServiceDelegate {
  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void;
}

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
  private callbacks: Map<string, ControlFlowAnalysisCallback>;
  private diagnosticService: DiagnosticService;

  public constructor(
    private mainChannel?: vscode.OutputChannel,
    private logChannel?: vscode.LogOutputChannel,
  ) {
    this.tasks = new Map<string, AnalysisTask>();
    this.callbacks = new Map<string, ControlFlowAnalysisCallback>();
    this.diagnosticService = new DiagnosticService();
  }

  public queueAnalysis(programs: Program[], documentUri: string) {
    const task = new AnalysisTask(
      documentUri,
      programs,
      this,
      this.mainChannel,
      this.logChannel,
    );
    this.tasks.set(documentUri, task);
  }

  public async cancelAnalysis(documentUri: string) {
    const exitsing = this.tasks.get(documentUri);
    if (exitsing) {
      await exitsing.abort();
    }
  }

  public addCallback(
    documentUri: string,
    listener: ControlFlowAnalysisCallback,
  ) {
    this.callbacks.set(documentUri, listener);
  }

  finishTask(
    documentUri: string,
    graphs: GraphDTO[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void {
    this.diagnosticService.showAllDiagnostics(documentUri, diagnostics);

    const callback = this.callbacks.get(documentUri);
    if (callback) {
      this.callbacks.delete(documentUri);
      callback(graphs);
    }
    this.tasks.delete(documentUri);
  }

  public async handleControlFlowAst(result: ApiResult) {
    if (result.documentUri) {
      await this.cancelAnalysis(result.documentUri);
      if (result.controlFlowAST.length > 0) {
        this.queueAnalysis(result.controlFlowAST, result.documentUri);
      }
    }
  }

  public static makeControlFlowAstNotificationHandler(
    mainChannel?: vscode.OutputChannel,
    logChannel?: vscode.LogOutputChannel,
  ) {
    const service = new ControlFlowAnalysisService(mainChannel, logChannel);
    return (result: ApiResult) => {
      service.handleControlFlowAst(result).catch(() => {});
    };
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
