/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import * as vscode from "vscode";
import * as antlr from "antlr4ng";
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import {
  CollectingErrorListener,
  CopybookContentVisitor,
  ProgramVisitor,
} from "./parsing";
import { ProgramLexer } from "../generated/ProgramLexer";
import { MessageService } from "./services/MessageService";
import { ProgramParser } from "../generated/ProgramParser";
import { addParsingErrors, extractSuffix, updateVariableName } from "./util";
import { CopybookContentLexer } from "../generated/CopybookContentLexer";
import { CopybookContentParser } from "../generated/CopybookContentParser";
import {
  CopybookDescriptor,
  CopybookDescriptorPD,
  ParseError,
  ProgramInfo,
  VariableAccumulator,
  VariableDescriptor,
} from "./model";

const WRK_SUFFIX = "WRK";

export class CopybookPreprocessor {
  private firstCopybookLevel: number = 0;

  public constructor(
    private readonly messageService: MessageService,
    private readonly outputChannel: vscode.OutputChannel,
  ) {}

  public async execute(
    context: IDocumentProcessingContext,
    text: string,
  ): Promise<ProgramInfo> {
    const { programInfo, errors } = this.analyzeProgram(text);
    addParsingErrors(context, errors);

    await this.processCopybooks(
      context,
      programInfo.copybooks,
      programInfo.accumulator,
    );
    return programInfo;
  }

  private analyzeProgram(text: string): {
    programInfo: ProgramInfo;
    errors: ParseError[];
  } {
    const charStream = antlr.CharStream.fromString(text);

    const lexer = new ProgramLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new ProgramParser(tokenStream);
    parser.setMessageService(this.messageService);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const tree = parser.startRule();
    const visitor = new ProgramVisitor(this.messageService);
    const copybooks = visitor.visit(tree) || [];
    const programInfo = visitor.programInfo;
    programInfo.copybooks = copybooks;

    this.outputChannel.appendLine(
      `Parsing completed with ${lexerErrors.errors.length} lexer errors and ${parserErrors.errors.length} parser errors`,
    );

    console.log(`Found ${programInfo.copybooks.length} copybook descriptors:`);
    return {
      programInfo: visitor.programInfo,
      errors: [...lexerErrors.errors, ...parserErrors.errors],
    };
  }

  private async processCopybooks(
    context: IDocumentProcessingContext,
    descriptors: CopybookDescriptor[],
    accumulator: VariableAccumulator,
  ) {
    descriptors.forEach((descriptor) =>
      console.log(
        `Descriptor: name=${descriptor.name}, level=${descriptor.level}, suffix=${descriptor.suffix}, parentName=${descriptor.parentName}`,
      ),
    );

    for (const descriptor of descriptors) {
      this.outputChannel.appendLine(
        `Descriptor: ${JSON.stringify(descriptor)}`,
      );

      if (descriptor instanceof CopybookDescriptorPD) {
        context.replace(descriptor.nameRange, "");
        continue;
      }

      this.validateMissingSuffix(
        context,
        descriptor.suffix,
        descriptor.statementRange,
      );
      this.validateInvalidSuffix(
        context,
        descriptor.suffix,
        descriptor.suffixRange,
      );

      const hasWrkSuffix = descriptor.suffix?.toUpperCase() === WRK_SUFFIX;
      let copybookName = descriptor.name;
      let parentNameSuffix = undefined;
      if (hasWrkSuffix) {
        this.validateParentName(
          context,
          descriptor.parentName,
          descriptor.parentNameRange,
        );
        parentNameSuffix = extractSuffix(descriptor.parentName);
      } else {
        copybookName =
          descriptor.name + (descriptor.suffix ? `_${descriptor.suffix}` : "");
      }

      console.log(`Resolving copybook '${copybookName}'...`);
      this.outputChannel.appendLine(`Resolving copybook '${copybookName}'...`);
      const copybook = await context.resolveCopybook(
        copybookName,
        descriptor.statementRange,
        descriptor.nameRange,
      );

      if (copybook) {
        console.log(
          `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
        );
        this.outputChannel.appendLine(
          `Resolved copybook '${copybookName}' at ${copybook.uri.toString()}`,
        );
        const variables = this.insertCopybookContent(
          context,
          copybook,
          descriptor.level,
          parentNameSuffix,
        );
        accumulator.insertCopybookVariables(descriptor, variables);
      }
    }
  }

  private validateMissingSuffix(
    context: IDocumentProcessingContext,
    suffix: string | undefined,
    statementRange: vscode.Range,
  ) {
    if (!suffix) {
      const message = this.messageService.get(
        "validation.missing.layout_usage",
      );

      context.addDiagnostic(
        new vscode.Diagnostic(
          statementRange,
          message,
          vscode.DiagnosticSeverity.Warning,
        ),
      );
    }
  }

  private validateInvalidSuffix(
    context: IDocumentProcessingContext,
    suffix: string | undefined,
    suffixRange: vscode.Range | undefined,
  ) {
    if (suffix && suffixRange && !/^[A-Z]{3}$/.test(suffix)) {
      const message = this.messageService.get("validation.layout_usage");
      context.addDiagnostic(new vscode.Diagnostic(suffixRange, message));
    }
  }

  private validateParentName(
    context: IDocumentProcessingContext,
    parentName: string | undefined,
    parentNameRange: vscode.Range | undefined,
  ) {
    if (!parentName || !/^[A-Z]+-[A-Z]{2}\d$/.test(parentName)) {
      const message = this.messageService.get(
        "validation.copybook.parentName",
        parentName,
      );

      if (parentNameRange) {
        context.addDiagnostic(
          new vscode.Diagnostic(
            parentNameRange,
            message,
            vscode.DiagnosticSeverity.Error,
          ),
        );
      }
    }
  }

  private insertCopybookContent(
    context: IDocumentProcessingContext,
    copybook: {
      context: IDocumentProcessingContext;
      uri: vscode.Uri;
      text: string;
    },
    copybookLevel: number,
    prevSuffix?: string,
  ): VariableDescriptor[] {
    const charStream = antlr.CharStream.fromString(copybook.text);
    const lexer = new CopybookContentLexer(charStream);
    const tokenStream = new antlr.CommonTokenStream(lexer);
    const parser = new CopybookContentParser(tokenStream);

    lexer.removeErrorListeners();
    parser.removeErrorListeners();

    const lexerErrors = new CollectingErrorListener();
    const parserErrors = new CollectingErrorListener();

    lexer.addErrorListener(lexerErrors);
    parser.addErrorListener(parserErrors);

    const tree = parser.startRule();

    addParsingErrors(context, [...lexerErrors.errors, ...parserErrors.errors]);

    const descriptors = new CopybookContentVisitor().visit(tree) || [];
    descriptors.forEach((descriptor) => {
      this.processVariableDescriptor(
        copybook.context,
        descriptor,
        copybookLevel,
        prevSuffix,
      );
    });

    return descriptors;
  }

  private processVariableDescriptor(
    context: IDocumentProcessingContext,
    descriptor: VariableDescriptor,
    copybookLevel: number,
    suffix?: string,
  ) {
    if (suffix) {
      const updatedName = updateVariableName(descriptor.name, suffix);
      context.replace(descriptor.nameRange, updatedName);
    }

    if (descriptor.type === "DEFINITION") {
      const updatedLevel = this.calculateLevel(copybookLevel, descriptor.level);
      this.outputChannel.appendLine(
        `Processing variable '${descriptor.name}' with level ${descriptor.level}. Copybook level: ${copybookLevel}. First copybook Level: ${this.firstCopybookLevel} Updated level: ${updatedLevel}`,
      );
      if (updatedLevel != descriptor.level) {
        const updatedLevelStr = updatedLevel.toString().padStart(2, "0");
        context.replace(descriptor.levelRange, updatedLevelStr);
        descriptor.level = updatedLevel;
      }
    }
  }

  private calculateLevel(copybookLevel: number, level: number): number {
    if (copybookLevel != 0) {
      if (this.firstCopybookLevel == 0) {
        this.firstCopybookLevel = level;
        return copybookLevel;
      }
      return level - this.firstCopybookLevel + copybookLevel;
    }
    return level;
  }
}
