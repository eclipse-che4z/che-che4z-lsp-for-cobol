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
import { EngineProcessingResult } from "@code4z/analysis/lib/graphbuilder";
import { Graph } from "@code4z/analysis/lib/model/Graph";
import { Worker } from "worker_threads";
import { join } from "path";
import {
  DiagnosticDto,
  DiagnosticTagDto,
} from "@code4z/analysis/lib/model/external";
import { SettingsService } from "./Settings";
import { OutputChannelHolder } from "../OutputChannelHolder";
import { WorkerMessage } from "../Worker";

/**
 * Control Flow Analysis callback
 */
export interface ControlFlowAnalysisCallback {
  (graphs: Graph[]): void;
}

/**
 * Adds a Control Flow Analysis callback function, this callback will be fired on analysis finished event
 * @param documentUri the document uri
 * @param callback a callback, that will be fired on finish analysis
 */
export function addControlFlowAnalysisCallback(
  documentUri: string,
  callback: ControlFlowAnalysisCallback,
): void {
  ControlFlowAnalysisService.instance().addCallback(documentUri, callback);
}

/**
 * Handle AST and starts analysis it
 */
export async function controlFlowAstHandler(result: ApiResult) {
  if (result.documentUri) {
    await ControlFlowAnalysisService.instance().cancelAnalysis(
      result.documentUri,
    );
    if (result.controlFlowAST.length > 0) {
      ControlFlowAnalysisService.instance().queueAnalysis(
        result.controlFlowAST,
        result.documentUri,
      );
    }
  }
}

export class ApiResult {
  public controlFlowAST: Program[] = [];
  public documentUri: string | undefined;
}

interface AnalysisServiceDelegate {
  finishTask(
    documentUri: string,
    graphs: Graph[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void;
}

class AnalysisTask {
  private worker: Worker = new Worker(join(__dirname, "./Worker.js"));

  constructor(
    private documentUri: string,
    public programs: Program[],
    private delegate: AnalysisServiceDelegate,
  ) {
    this.worker.on("message", (data: EngineProcessingResult) => {
      this.delegate.finishTask(
        this.documentUri,
        data.enters,
        convertDiagnostics(data.diagnostics),
      );
    });
    this.worker.on("error", (code) => {
      OutputChannelHolder.getOutputChannel()?.appendLine(
        `Error starting Control Flow Analysis: ${code}`,
      );
    });

    this.worker.postMessage(
      new WorkerMessage(
        SettingsService.getMaxVMCount(),
        SettingsService.getUnreachableCodeSeverity()?.valueOf() || 0,
        programs,
      ),
    );
  }

  public async abort() {
    await this.worker.terminate();
  }
}

export class ControlFlowAnalysisService implements AnalysisServiceDelegate {
  private static _instance: ControlFlowAnalysisService;
  private tasks: Map<string, AnalysisTask>;
  private callbacks: Map<string, ControlFlowAnalysisCallback>;
  private diagnosticService: DiagnosticService;

  private constructor() {
    this.tasks = new Map<string, AnalysisTask>();
    this.callbacks = new Map<string, ControlFlowAnalysisCallback>();
    this.diagnosticService = new DiagnosticService();
  }

  public static instance(): ControlFlowAnalysisService {
    if (ControlFlowAnalysisService._instance === undefined) {
      ControlFlowAnalysisService._instance = new ControlFlowAnalysisService();
    }
    return ControlFlowAnalysisService._instance;
  }

  public queueAnalysis(programs: Program[], documentUri: string) {
    const task = new AnalysisTask(documentUri, programs, this);
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
    graphs: Graph[],
    diagnostics: Map<string, vscode.Diagnostic[]>,
  ): void {
    this.diagnosticService.showAllDiagnostics(diagnostics);

    const callback = this.callbacks.get(documentUri);
    if (callback) {
      this.callbacks.delete(documentUri);
      callback(graphs);
    }
    this.tasks.delete(documentUri);
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

  public showAllDiagnostics(diagnostics: Map<string, vscode.Diagnostic[]>) {
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
        severity = vscode.DiagnosticSeverity.Warning;
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
