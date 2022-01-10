/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;
import org.eclipse.lsp.cobol.service.PredefinedCopybooks;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;

import static java.util.UUID.randomUUID;
import static java.util.stream.Collectors.toList;
import static org.codehaus.plexus.util.StringUtils.isEmpty;
import static org.eclipse.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.INFO;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.*;

/**
 * This class is a framework for the copybook analysis. The actual implementations may change the
 * behavior overriding the methods.
 */
@Slf4j
abstract class CopybookAnalysis {
  private static final String HYPHEN = "-";
  private static final String UNDERSCORE = "_";
  private static final String SYNTAX_ERROR_CHECK_COPYBOOK_NAME =
      "Syntax error by checkCopybookName: {}";
  protected final Deque<CopybookUsage> copybookStack;
  protected final Deque<List<Pair<String, String>>> recursiveReplaceStmtStack;
  private final Map<String, DocumentMapping> nestedMappings;
  // used for both copy and sql-include statements
  private final List<Pair<String, String>> replacingClauses;
  private final String documentUri;
  private final CopybookConfig copybookConfig;
  private final TextPreprocessor preprocessor;
  private final CopybookService copybookService;
  private final MessageService messageService;

  CopybookAnalysis(
      Map<String, DocumentMapping> nestedMappings,
      List<Pair<String, String>> replacingClauses,
      String documentUri,
      CopybookConfig copybookConfig,
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      Deque<CopybookUsage> copybookStack,
      MessageService messageService,
      Deque<List<Pair<String, String>>> recursiveReplaceStmtStack) {
    this.nestedMappings = nestedMappings;
    this.replacingClauses = replacingClauses;
    this.documentUri = documentUri;
    this.copybookConfig = copybookConfig;
    this.preprocessor = preprocessor;
    this.copybookService = copybookService;
    this.copybookStack = copybookStack;
    this.messageService = messageService;
    this.recursiveReplaceStmtStack = recursiveReplaceStmtStack;
  }

  /**
   * Handle the copy statement applying the logic according to the specific implementation.
   *
   * @param context
   * @param copySource
   * @param maxLength
   * @return the functions that should be applied to the preprocessor stack
   */
  public ResultWithErrors<Function<PreprocessorStack, Consumer<NamedSubContext>>> handleCopybook(
      ParserRuleContext context, ParserRuleContext copySource, int maxLength) {
    List<SyntaxError> errors = new ArrayList<>();
    CopybookMetaData metaData =
        CopybookMetaData.builder()
            .name(retrieveCopybookName(copySource))
            .context(context)
            .copybookId(randomUUID().toString())
            .config(copybookConfig)
            .nameLocality(
                PreprocessorUtils.buildLocality(copySource, documentUri, copybookStack.peek()))
            .contextLocality(
                PreprocessorUtils.buildLocality(context, documentUri, copybookStack.peek()))
            .build();

    CopybookModel model = getCopyBookContent(metaData).unwrap(errors::addAll);

    String uri = model.getUri();
    errors.addAll(checkCopybookName(metaData, maxLength));

    Optional<ExtendedDocument> copybookDocument =
        processCopybook(
                metaData,
                uri,
                handleReplacing(
                        metaData,
                        preprocessor.cleanUpCode(uri, model.getContent()).unwrap(errors::addAll))
                    .unwrap(errors::addAll))
            .unwrap(errors::addAll);
    copybookDocument.ifPresent(it -> collectNestedSemanticData(uri, metaData.getCopybookId(), it));

    return new ResultWithErrors<>(compose(copybookDocument, uri, metaData), errors);
  }

  private Function<PreprocessorStack, Consumer<NamedSubContext>> compose(
      Optional<ExtendedDocument> copybookDocument, String uri, CopybookMetaData metaData) {
    return stack -> {
      beforeWriting()
          .andThen(
              copybookDocument
                  .map(ExtendedDocument::getText)
                  .map(it -> writeCopybook(metaData.getCopybookId(), it))
                  .orElse(it -> {}))
          .andThen(afterWriting(metaData.getContext()))
          .accept(stack);
      return storeCopyStatementSemantics(metaData, uri, copybookDocument);
    };
  }

  protected ResultWithErrors<Optional<ExtendedDocument>> processCopybook(
      CopybookMetaData metaData, String uri, String content) {
    copybookStack.push(metaData.toCopybookUsage());
    final ResultWithErrors<ExtendedDocument> result =
        preprocessor.processCleanCode(
            uri,
            content,
            copybookStack,
            copybookConfig,
            recursiveReplaceStmtStack,
            replacingClauses);
    copybookStack.pop();
    if (Objects.nonNull(recursiveReplaceStmtStack.peek())) recursiveReplaceStmtStack.pop();
    return new ResultWithErrors<>(Optional.of(result.getResult()), result.getErrors());
  }

  protected ResultWithErrors<CopybookModel> getCopyBookContent(CopybookMetaData metaData) {
    List<SyntaxError> errors = new ArrayList<>();
    if (metaData.getName().isEmpty()) return emptyModel(metaData.getName(), errors);

    if (hasRecursion(metaData.getName())) {
      errors.addAll(copybookStack.stream().map(this::reportRecursiveCopybook).collect(toList()));
      return emptyModel(metaData.getName(), errors);
    }

    CopybookModel copybook =
        copybookService.resolve(metaData.getName(), documentUri, metaData.getConfig());
    if (copybook.getContent() == null) {
      return emptyModel(
          metaData.getName(),
          ImmutableList.of(reportMissingCopybooks(metaData.getName(), metaData.getNameLocality())));
    }

    return new ResultWithErrors<>(copybook, errors);
  }

  protected String retrieveCopybookName(ParserRuleContext ctx) {
    return PreprocessorStringUtils.trimQuotes(ctx.getText().toUpperCase());
  }

  protected Consumer<PreprocessorStack> beforeWriting() {
    return PreprocessorStack::pop;
  }

  protected Consumer<PreprocessorStack> afterWriting(ParserRuleContext context) {
    return it -> it.accumulateTokenShift(context);
  }

  protected Consumer<NamedSubContext> storeCopyStatementSemantics(
      CopybookMetaData metaData, String uri, Optional<ExtendedDocument> copybookDocument) {
    return addCopybookUsage(metaData)
        .andThen(addCopybookDefinition(metaData, uri))
        .andThen(collectCopybookStatement(metaData))
        .andThen(copybookDocument.map(this::addNestedCopybook).orElseGet(() -> it -> {}));
  }

  private Consumer<NamedSubContext> collectCopybookStatement(CopybookMetaData metaData) {
    return it -> it.addStatement(metaData.getCopybookId(), metaData.getContextLocality());
  }

  private void collectNestedSemanticData(
      String uri, String copybookId, ExtendedDocument copybookDocument) {
    nestedMappings.putAll(copybookDocument.getDocumentMapping());
    nestedMappings.putIfAbsent(copybookId, nestedMappings.get(uri));
  }

  protected Consumer<NamedSubContext> addCopybookUsage(CopybookMetaData metaData) {
    return copybooks ->
        copybooks.addUsage(metaData.getName(), metaData.getNameLocality().toLocation());
  }

  protected Consumer<NamedSubContext> addCopybookDefinition(CopybookMetaData metaData, String uri) {
    return copybooks -> {
      if (!(isEmpty(metaData.getName()) || isEmpty(uri) || isPredefined(uri)))
        copybooks.define(
            metaData.getName(),
            new Location(uri, new Range(new Position(0, 0), new Position(0, 0))));
    };
  }

  protected Consumer<NamedSubContext> addNestedCopybook(ExtendedDocument copybookDocument) {
    return copybooks -> copybooks.merge(copybookDocument.getCopybooks());
  }

  protected ResultWithErrors<String> handleReplacing(CopybookMetaData metaData, String text) {
    return new ResultWithErrors<>(text, ImmutableList.of());
  }

  private boolean hasRecursion(String copybookName) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals);
  }

  private Consumer<PreprocessorStack> writeCopybook(String copybookId, String copybookContent) {
    return it ->
        it.write(CPY_ENTER_TAG + copybookId + CPY_URI_CLOSE + copybookContent + CPY_EXIT_TAG);
  }

  private SyntaxError reportMissingCopybooks(String copybookName, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.errorSuggestion", copybookName))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build();
    LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    return error;
  }

  private List<SyntaxError> checkCopybookName(CopybookMetaData metaData, int maxLength) {
    List<SyntaxError> errors = new ArrayList<>();
    final String copybookName = metaData.getName();
    final Locality locality = metaData.getNameLocality();
    if (copybookName.length() > maxLength) {
      errors.add(
          addCopybookError(
              copybookName,
              maxLength,
              locality,
              INFO,
              "GrammarPreprocessorListener.copyBkOverMaxChars",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));
    }
    // The first or last character must not be a hyphen.
    if (copybookName.startsWith(HYPHEN) || copybookName.endsWith(HYPHEN)) {
      errors.add(
          addCopybookError(
              copybookName,
              locality,
              ERROR,
              "GrammarPreprocessorListener.copyBkStartsOrEndsWithHyphen",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));
    }

    // copybook Name can't contain _
    if (copybookName.contains(UNDERSCORE))
      errors.add(
          addCopybookError(
              copybookName,
              locality,
              ERROR,
              "GrammarPreprocessorListener.copyBkContainsUnderScore",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));
    return errors;
  }

  protected ResultWithErrors<CopybookModel> emptyModel(
      String copybookName, List<SyntaxError> errors) {
    return new ResultWithErrors<>(new CopybookModel(copybookName, "", ""), errors);
  }

  protected SyntaxError addCopybookError(
      String copybookName,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(info)
            .suggestion(messageService.getMessage(messageID, copybookName))
            .locality(locality)
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  protected SyntaxError addCopybookError(
      String copybookName,
      int maxNameLength,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(info)
            .suggestion(messageService.getMessage(messageID, maxNameLength, copybookName))
            .locality(locality)
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  private boolean isPredefined(String uri) {
    return PredefinedCopybooks.isCopybookPredefined(uri);
  }

  private SyntaxError reportRecursiveCopybook(CopybookUsage usage) {
    return addCopybookError(
        usage.getName(),
        usage.getLocality(),
        ERROR,
        "GrammarPreprocessorListener.recursionDetected",
        "Syntax error by reportRecursiveCopybook: {}");
  }
}
