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
  DiagnosticSeverityDto,
  DiagnosticTagDto,
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
  private worker: Worker = new Worker(join(__dirname, "./dist/Worker.js"));

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
          if (message.severity === vscode.DiagnosticSeverity.Error.valueOf()) {
            this.logChannel?.error(message.message);
          } else if (
            message.severity === vscode.DiagnosticSeverity.Warning.valueOf()
          ) {
            this.logChannel?.warn(message.message);
          } else if (
            message.severity === vscode.DiagnosticSeverity.Information.valueOf()
          ) {
            this.logChannel?.info(message.message);
          } else {
            this.logChannel?.debug(message.message);
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

function convertDiagnostics(
  diagnostics: Map<string, DiagnosticDto[]>,
): Map<string, vscode.Diagnostic[]> {
  const diagnosticsMap = new Map<string, vscode.Diagnostic[]>();
  for (const [key, value] of diagnostics) {
    const diagnostics = [];
    for (const diagnosticDTO of value) {
      const range = new vscode.Range(
        new vscode.Position(
          diagnosticDTO.range.start.line,
          diagnosticDTO.range.start.character,
        ),
        new vscode.Position(
          diagnosticDTO.range.end.line,
          diagnosticDTO.range.end.character,
        ),
      );

      let severity: vscode.DiagnosticSeverity | undefined = undefined;
      if (diagnosticDTO.severity) {
        if (
          diagnosticDTO.severity.valueOf() ===
          DiagnosticSeverityDto.Error.valueOf()
        ) {
          severity = vscode.DiagnosticSeverity.Error;
        }

        if (
          diagnosticDTO.severity.valueOf() ===
          DiagnosticSeverityDto.Warning.valueOf()
        ) {
          severity = vscode.DiagnosticSeverity.Warning;
        }

        if (
          diagnosticDTO.severity.valueOf() ===
          DiagnosticSeverityDto.Information.valueOf()
        ) {
          severity = vscode.DiagnosticSeverity.Information;
        }

        if (
          diagnosticDTO.severity.valueOf() ===
          DiagnosticSeverityDto.Hint.valueOf()
        ) {
          severity = vscode.DiagnosticSeverity.Hint;
        }
      }
      const diagnostic = new vscode.Diagnostic(
        range,
        diagnosticDTO.message,
        severity,
      );

      if (diagnosticDTO.tags) {
        diagnostic.tags = [
          ...diagnosticDTO.tags.map((t) => {
            return t == DiagnosticTagDto.Deprecated
              ? vscode.DiagnosticTag.Deprecated
              : vscode.DiagnosticTag.Unnecessary;
          }),
        ];
      }
      if (diagnosticDTO.relatedInformation) {
        const riArray: vscode.DiagnosticRelatedInformation[] = [];
        for (const ri of diagnosticDTO.relatedInformation) {
          const riRange = new vscode.Range(
            new vscode.Position(
              ri.location.range.start.line,
              diagnosticDTO.range.start.character,
            ),
            new vscode.Position(
              ri.location.range.end.line,
              ri.location.range.end.character,
            ),
          );
          const location: vscode.Location = new vscode.Location(
            vscode.Uri.parse(ri.location.uri),
            riRange,
          );
          riArray.push(
            new vscode.DiagnosticRelatedInformation(location, ri.message),
          );
        }
        diagnostic.relatedInformation = riArray;
      }
      diagnostics.push(diagnostic);
    }
    diagnosticsMap.set(key, diagnostics);
  }
  return diagnosticsMap;
}
