/*
 * Copyright (c) 2020 Broadcom.
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
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.*;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.*;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorStringUtils;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.assistedinject.Assisted;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.*;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils.convertTokensToPositions;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils.retrieveTokens;
import static java.lang.String.format;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.apache.commons.lang3.StringUtils.isEmpty;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class CobolSemanticParserListenerImpl extends CobolPreprocessorBaseListener
    implements CobolSemanticParserListener {
  private static final String RECURSION_DETECTED = "Recursive copybook declaration for: %s";
  private static final String COPYBOOK_OVER_8_CHARACTERS =
      "Copybook declaration has more than 8 characters for: %s";
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";

  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  @Getter private final NamedSubContext<Position> copybooks = new NamedSubContext<>();

  @Getter private final Map<String, List<Position>> documentMappings = new HashMap<>();

  private PreprocessorCleanerServiceImpl cleaner;
  private String documentUri;
  private BufferedTokenStream tokens;
  private String textDocumentSyncType;
  private CobolPreprocessor preprocessor;
  private Provider<CopybookResolution> resolutions;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;

  @Inject
  CobolSemanticParserListenerImpl(
      @Assisted("uri") String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted("textDocumentSyncType") String textDocumentSyncType,
      PreprocessorCleanerServiceImpl cleaner,
      CobolPreprocessor preprocessor,
      Provider<CopybookResolution> resolutions,
      ReplacingService replacingService) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookStack = copybookStack;
    this.textDocumentSyncType = textDocumentSyncType;
    this.cleaner = cleaner;
    this.preprocessor = preprocessor;
    this.resolutions = resolutions;
    this.replacingService = replacingService;
  }

  @Nonnull
  @Override
  public String getResult() {
    return cleaner.peek().read();
  }

  @Override
  public void enterExecCicsStatement(@Nonnull ExecCicsStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void exitExecCicsStatement(@Nonnull ExecCicsStatementContext ctx) {
    cleaner.excludeStatementFromText(ctx, EXEC_CICS_TAG, tokens);
  }

  @Override
  public void enterExecSqlStatement(@Nonnull ExecSqlStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void exitExecSqlStatement(@Nonnull ExecSqlStatementContext ctx) {
    cleaner.excludeStatementFromText(ctx, EXEC_SQL_TAG, tokens);
  }

  @Override
  public void enterExecSqlImsStatement(@Nonnull ExecSqlImsStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void exitExecSqlImsStatement(@Nonnull ExecSqlImsStatementContext ctx) {
    cleaner.excludeStatementFromText(ctx, EXEC_SQLIMS_TAG, tokens);
  }

  @Override
  public void enterEjectStatement(@Nonnull EjectStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void exitEjectStatement(@Nonnull EjectStatementContext ctx) {
    cleaner.excludeStatementFromText(ctx, COMMENT_TAG, tokens);
  }

  @Override
  public void enterCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // push a new context for the COMPILER OPTIONS terminals
    cleaner.push();
  }

  @Override
  public void enterReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    cleaner.push();
  }

  @Override
  public void enterReplaceByStatement(@Nonnull ReplaceByStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void enterReplaceOffStatement(@Nonnull ReplaceOffStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void enterTitleStatement(@Nonnull TitleStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void enterCopyStatement(@Nonnull CopyStatementContext ctx) {
    cleaner.push();
  }

  @Override
  public void exitCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    cleaner.pop();
  }

  @Override
  public void exitCopyStatement(@Nonnull CopyStatementContext ctx) {

    // throw away COPY terminals
    cleaner.pop();

    // a new context for the copy book content
    cleaner.peek().write(CPY_ENTER_TAG);
    /*
     * copy the copy book
     */
    String copybookName = retrieveCopybookName(ctx.copySource());
    Position position = retrievePosition(ctx.copySource());

    checkCopybookNameLength(copybookName, position);

    CopybookModel model = getCopyBookContent(copybookName, position);

    ExtendedDocument copybookDocument = processCopybook(copybookName, position, model);
    documentMappings.putAll(copybookDocument.getDocumentPositions());
    copybooks.merge(copybookDocument.getCopybooks());

    String copybookContent = copybookDocument.getText();

    addCopybookUsage(copybookName, position);
    addCopybookDefinition(copybookName, model.getUri());

    List<ReplacingPhraseContext> replacingPhraseContexts = ctx.replacingPhrase();

    String copybookId = getCopybookId(model.getUri(), replacingPhraseContexts);

    cleaner.peek().write("<URI>" + copybookId + "</URI>. ");
    if (!replacingPhraseContexts.isEmpty()) {

      cleaner
          .push()
          .write(
              applyReplacing(copybookId, model.getUri(), copybookContent, replacingPhraseContexts));
    } else {
      cleaner.push().write(copybookContent);
    }

    cleaner.peek().write(CPY_EXIT_TAG);

    String content = cleaner.peek().read();
    cleaner.pop();

    cleaner.peek().write(content);
  }

  private String applyReplacing(
      String copybookId,
      String uri,
      String copybookContent,
      List<ReplacingPhraseContext> replacingPhraseContexts) {

    List<ReplaceClauseContext> replaceClauses =
        replacingPhraseContexts.stream()
            .map(ReplacingPhraseContext::replaceClause)
            .flatMap(List::stream)
            .collect(toList());
    String replacedContent =
        replacingService.applyReplacing(copybookContent, replaceClauses, tokens);

    documentMappings.put(
        copybookId, convertTokensToPositions(uri, retrieveTokens(replacedContent)));
    return replacedContent;
  }

  private String getCopybookId(
      String copybookURI, List<ReplacingPhraseContext> replacingPhraseContexts) {
    return copybookURI
        + replacingPhraseContexts.stream()
            .map(RuleContext::getText)
            .reduce(String::concat)
            .orElse("")
            .replaceAll("[^a-zA-Z0-9]+", "")
            .trim();
  }

  private CopybookModel getCopyBookContent(String copybookName, Position position) {

    if (copybookName == null) return emptyModel(null);

    if (hasRecursion(copybookName)) {
      copybookStack.forEach(this::reportRecursiveCopybook);
      return emptyModel(copybookName);
    }

    CopybookModel copybook =
        resolutions.get().resolve(copybookName, documentUri, textDocumentSyncType);

    if (copybook == null || copybook.getContent() == null) {
      reportMissingCopybooks(copybookName, position);
      return emptyModel(copybookName);
    }

    return copybook;
  }

  private boolean hasRecursion(String copybookName) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals);
  }

  private ExtendedDocument processCopybook(
      String copybookName, Position position, CopybookModel copybook) {
    copybookStack.push(new CopybookUsage(copybookName, position));
    ResultWithErrors<ExtendedDocument> result =
        preprocessor.process(
            copybook.getUri(), copybook.getContent(), copybookStack, textDocumentSyncType);
    copybookStack.pop();

    errors.addAll(result.getErrors());

    return result.getResult();
  }

  private CopybookModel emptyModel(String copybookName) {
    return new CopybookModel(copybookName, "", "");
  }

  private void reportRecursiveCopybook(CopybookUsage usage) {
    errors.add(
        SyntaxError.syntaxError()
            .severity(1)
            .suggestion(String.format(RECURSION_DETECTED, usage.getName()))
            .position(usage.getPosition())
            .build());
  }

  private void reportMissingCopybooks(String copybookName, Position position) {
    errors.add(
        SyntaxError.syntaxError()
            .position(position)
            .suggestion(format(ERROR_SUGGESTION, copybookName))
            .severity(1)
            .errorCode(MISSING_COPYBOOK)
            .build());
  }

  private void checkCopybookNameLength(String copybookName, Position position) {
    if (copybookName != null && copybookName.length() > 8) {
      errors.add(
          SyntaxError.syntaxError()
              .severity(3)
              .suggestion(String.format(COPYBOOK_OVER_8_CHARACTERS, copybookName))
              .position(position)
              .build());
    }
  }

  @Override
  public void exitReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    /*
     * replacement phrase
     */
    List<ReplaceClauseContext> replaceClauses = ctx.replaceByStatement().replaceClause();

    String content = replacingService.applyReplacing(cleaner.peek().read(), replaceClauses, tokens);

    cleaner.pop();
    cleaner.peek().write(content);
  }

  @Override
  public void exitReplaceByStatement(@Nonnull ReplaceByStatementContext ctx) {
    // throw away terminals
    cleaner.pop();
  }

  @Override
  public void exitReplaceOffStatement(@Nonnull ReplaceOffStatementContext ctx) {
    // throw away REPLACE OFF terminals
    cleaner.pop();
  }

  @Override
  public void exitTitleStatement(@Nonnull TitleStatementContext ctx) {
    // throw away title statement
    cleaner.pop();
  }

  @Override
  public void visitTerminal(@Nonnull TerminalNode node) {
    cleaner.visitTerminal(node, tokens);
  }

  @Nullable
  private String retrieveCopybookName(@Nonnull CopySourceContext copySource) {
    String copybookName;
    if (copySource.cobolWord() != null) {
      copybookName = copySource.cobolWord().getText().toUpperCase();
    } else if (copySource.literal() != null) {
      copybookName =
          PreprocessorStringUtils.trimQuotes(copySource.literal().getText())
              .replace("\\", "/")
              .toUpperCase();
    } else {
      LOG.warn("Unknown copy book reference type {}", copySource);
      copybookName = null;
    }

    return copybookName;
  }

  private void addCopybookUsage(@Nullable String copybookName, @Nonnull Position position) {
    ofNullable(copybookName).ifPresent(it -> copybooks.addUsage(it, position));
  }

  private void addCopybookDefinition(String copybookName, String uri) {
    if (!isEmpty(copybookName) && !isEmpty(uri)) {
      copybooks.define(copybookName, new Position(uri, 0, -1, 1, 0, null));
    }
  }

  @Nonnull
  private Position retrievePosition(@Nonnull ParserRuleContext token) {
    return new Position(
        documentUri,
        token.getStart().getStartIndex(),
        token.getStop().getStopIndex(),
        token.getStart().getLine(),
        token.getStart().getCharPositionInLine(),
        token.getStart().getText());
  }
}
