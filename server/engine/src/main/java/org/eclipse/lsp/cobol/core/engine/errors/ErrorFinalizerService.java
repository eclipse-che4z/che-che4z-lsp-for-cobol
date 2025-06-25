/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.errors;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.engine.errors.AnalysisMode.ADVANCED;

import com.google.common.collect.ImmutableSet;
import com.google.gson.JsonElement;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/** Process errors for copybooks statements */
@Singleton
public class ErrorFinalizerService {

  private final MessageService messageService;
  private AnalysisMode filterDiagnostics = ADVANCED;
  public static final Set<String> TOLERATED_ERRORS =
      ImmutableSet.of(
          "cobolParser.subSchemaNameLength",
          "cobolParser.ObsoleteCode",
          "CobolVisitor.functionReturningMsg",
          "CobolVisitor.misspelledWord",
          "CobolVisitor.duplicateFileName",
          "CobolVisitor.progIDIssueMsg",
          "CobolVisitor.funcIDIssueMsg",
          "CobolVisitor.subroutineNotFound",
          "semantics.functionExpected",
          "semantics.functionRedefined",
          "semantics.redefinedContainValue",
          "semantics.redefineImmediatelyFollow",
          "semantics.levelsMustMatch",
          "semantics.noFileControl",
          "cics.enableTranslator",
          "semantics.unknownVariableDefinition",
          "Communications.noSyntaxError",
          "Communications.syntaxAnalysisInProgress",
          "Communications.syntaxAnalysisInProgressTitle",
          "CompilerDirectivesTransformation.sequenceNumber",
          "ContinuationLineTransformation.compilerDirectiveContinued",
          "ContinuationLineTransformation.continuationLineContentAreaA",
          "ContinuationLineTransformation.periodRequired",
          "missing.period",
          "input.mismatch.skipAnalysis",
          "inlineComment.missingBlank",
          "db2SqlParser.currentQueryAcceleration",
          "db2SqlParser.maxIntValue",
          "db2SqlParser.pieceSize",
          "db2SqlParser.size",
          "parsers.validValueMsg",
          "parsers.maxLength",
          "parsers.exactLength",
          "parsers.intRangeValue ",
          "parsers.alphaNumeric",
          "parsers.startsWith",
          "parsers.stringLengthRange",
          "parsers.allowedStringValues",
          "parsers.notAllowedVariableName",
          "ErrorStrategy.endOfFile",
          "ErrorStrategy.endOfLine",
          "ErrorStrategy.reportMissingToken",
          "ErrorStrategy.reportNoViableAlternative",
          "ErrorStrategy.reportInputMismatch",
          "ErrorStrategy.reportUnwantedToken",
          "ErrorStrategy.performMissingEnd",
          "GrammarPreprocessorListener.copyBkContainsUnderScore",
          "GrammarPreprocessorListener.copyBkOverMaxChars",
          "GrammarPreprocessorListener.copyBkStartsOrEndsWithHyphen",
          "GrammarPreprocessorListener.errorSuggestion",
          "GrammarPreprocessorListener.copyBkNestedReplaceStmt",
          "GrammarPreprocessorListener.controlDirectiveWrongArgs",
          "GrammarPreprocessorListener.langMissingEnterDirective",
          "ReplacingServiceImpl.invalidWord",
          "ReplacingServiceImpl.pseudoTxtInvalidLength",
          "semantics.paragraphNotDefined",
          "semantics.cannotBeRenamed",
          "semantics.childToRenameNotFound",
          "semantics.emptyStructure",
          "semantics.incorrectChildrenOrder",
          "semantics.noStructureBeforeRename",
          "semantics.numberNotAllowedAtTop",
          "semantics.previousWithoutPicFor88",
          "semantics.tooManyClauses",
          "semantics.globalNon01Level",
          "semantics.globalTooManyDefinitions",
          "semantics.notDefined",
          "semantics.ambiguous",
          "variables.indexName",
          "variables.elementaryItem",
          "variables.independent",
          "variables.groupItem",
          "variables.tableDataName",
          "variables.multiTableDataName",
          "variables.renameItem",
          "variables.mnemonicName",
          "variables.conditionName",
          "variables.elementaryWithType",
          "variables.nonzeroInteger",
          "variables.integer",
          "variables.blankWhenZero",
          "variables.signClause",
          "variables.mapName",
          "workspaceError.ServerType",
          "jsonParseProcess.identifier.typeError",
          "jsonParseProcess.identifier1.groupItemError",
          "jsonParseProcess.identifier2.groupItemError",
          "jsonParseProcess.identifier1.elementaryItemError",
          "jsonParseProcess.condition1",
          "jsonParseProcess.condition2",
          "jsonParseProcess.identifier2",
          "jsonParseProcess.identifier5",
          "jsonParseProcess.identifier4",
          "jsonParseProcess.omittedIdentifier3",
          "jsonParseProcess.identifier3",
          "jsonParseProcess.noDefnIdentifier1",
          "jsonParseProcess.identifier2.wrongClause",
          "jsonParseProcess.identifier2.overlap",
          "jsonGenProcess.identifier1.elementaryItemError",
          "jsonGenProcess.identifier2.groupItemError",
          "jsonGenProcess.identifier3.dataType",
          "jsonGenProcess.identifier6.dataType",
          "jsonGenProcess.condition.dataType",
          "xmlGenProcess.identifier2.overlap",
          "xmlParse.identifier1.dataType",
          "xmlParse.identifier2.dataType",
          "xmlParse.validating.phrase",
          "xmlParse.returnNational.phrase",
          "xmlParse.unsupported.ccid",
          "xmlParse.encoding.phrase",
          "xmlParse.ccid.nationalItem",
          "readFileOperation.notOpened",
          "writeFileOperation.notOpened",
          "rewriteFileOperation.notOpened",
          "deleteFileOperation.notOpened",
          "startFileOperation.notOpened",
          "compilerDirective.deprecatedDirectiveUse",
          "compilerDirective.warning.deprecatedDirectiveUse",
          "compilerDirective.info.deprecatedDirectiveUse",
          "cicsParser.missingEndExec",
          "cicsParser.invalidInput",
          "cics.invalidExecBlock",
          "db2Parser.missingSql",
          "db2Parser.missingEndExec",
          "cobolParser.expectSpace",
          "procedureDivisionHeaderProcess.wrongNodeLocation",
          "procedureDivisionHeaderProcess.wrongDataName",
          ErrorCodes.MISSING_COPYBOOK.getLabel());

  @Inject
  public ErrorFinalizerService(MessageService messageService) {
    this.messageService = messageService;
  }

  /**
   * Localize syntax error
   *
   * @param syntaxError - syntax error
   * @return localized syntax error
   */
  public SyntaxError localizeErrorMessage(SyntaxError syntaxError) {
    return ofNullable(syntaxError.getMessageTemplate())
        .map(
            template ->
                syntaxError.toBuilder()
                    .messageTemplate(null)
                    .errorCode(
                        syntaxError.getErrorCode() == null
                            ? template::getTemplate
                            : syntaxError.getErrorCode())
                    .suggestion(messageService.localizeTemplate(template))
                    .build())
        .orElse(syntaxError);
  }

  /**
   * Process errors to check if needed to create errors for copybook statements
   *
   * @param ctx - an analysis context
   * @param copybooksRepository - copybook repository
   */
  public void processLateErrors(AnalysisContext ctx, CopybooksRepository copybooksRepository) {
    List<SyntaxError> accumulatedErrors =
        ctx.getAccumulatedErrors().stream()
            .filter(err -> keepDiagnotics(err, TOLERATED_ERRORS))
            .collect(toList());
    accumulatedErrors.addAll(collectErrorsForCopybooks(accumulatedErrors, copybooksRepository));
    List<SyntaxError> distinct = accumulatedErrors.stream().distinct().collect(toList());
    ctx.getAccumulatedErrors().clear();
    ctx.getAccumulatedErrors().addAll(distinct);
  }

  private List<SyntaxError> collectErrorsForCopybooks(
      List<SyntaxError> errors, CopybooksRepository copybooksRepository) {
    Set<SyntaxError> processedErrors = new HashSet<>();
    errors.stream()
        .filter(shouldRaise(processedErrors))
        .forEach(err -> raiseError(err, copybooksRepository, processedErrors));
    return new LinkedList<>(processedErrors);
  }

  private void raiseError(
      SyntaxError error,
      CopybooksRepository copybooksRepository,
      Set<SyntaxError> processedErrors) {
    Stream.of(error)
        .filter(shouldRaise(processedErrors))
        .forEach(
            err -> {
              for (Locality locality :
                  copybooksRepository
                      .getDefinitionStatements()
                      .get(err.getLocation().getCopybookId())) {
                raiseErrorForCopybook(locality, processedErrors, copybooksRepository);
              }
            });
  }

  private void raiseErrorForCopybook(
      Locality copybookStatementLocality,
      Set<SyntaxError> processedErrors,
      CopybooksRepository copybooksRepository) {
    SyntaxError newError =
        SyntaxError.syntaxError()
            .location(copybookStatementLocality.toOriginalLocation())
            .errorSource(ErrorSource.COPYBOOK)
            .severity(ErrorSeverity.ERROR)
            .messageTemplate(MessageTemplate.of("postprocessing.copybookHasErrors"))
            .build();
    if (processedErrors.contains(newError)) {
      return;
    }
    processedErrors.add(newError);
    for (Locality locality :
        copybooksRepository.getDefinitionStatements().get(newError.getLocation().getCopybookId())) {
      raiseErrorForCopybook(locality, processedErrors, copybooksRepository);
    }
  }

  private Predicate<SyntaxError> shouldRaise(Set<SyntaxError> processedErrors) {
    return err ->
        (err.getLocation() != null
            && err.getLocation().getCopybookId() != null
            && !processedErrors.contains(err));
  }

  /**
   * Filter diagnostic based on the diagnostic level provided by the client
   *
   * @param syntaxError syntax error to be processed
   * @param toleratedErrors
   * @return true if diagnostics is within the clients diagnostic level, false otherwise
   */
  public boolean keepDiagnotics(SyntaxError syntaxError, Set<String> toleratedErrors) {
    if (this.filterDiagnostics == ADVANCED) return true;
    return ofNullable(syntaxError.getErrorCode())
        .map(errCode -> !toleratedErrors.contains(errCode.getLabel()))
        .orElse(true);
  }

  /**
   * update the diagnostics level set by client
   *
   * @param levels
   */
  public void updateDiagnosticsLevel(List<Object> levels) {
    if (levels != null && !levels.isEmpty()) {
      if (levels.get(0) instanceof JsonElement) {
        JsonElement option = (JsonElement) levels.get(0);
        filterDiagnostics = AnalysisMode.valueOf(option.getAsString());
      }
    }
  }
}
