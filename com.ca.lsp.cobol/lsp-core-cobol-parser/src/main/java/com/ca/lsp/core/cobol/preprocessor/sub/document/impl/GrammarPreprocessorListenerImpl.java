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
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorCleanerService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
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
import java.util.*;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.lang.String.format;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static org.apache.commons.lang3.StringUtils.isEmpty;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener {
  private static final String RECURSION_DETECTED = "Recursive copybook declaration for: %s";
  private static final String COPYBOOK_OVER_8_CHARACTERS =
      "Copybook declaration has more than 8 characters for: %s";
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";

  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  @Getter private final NamedSubContext<Position> copybooks = new NamedSubContext<>();
  @Getter private final Map<String, List<Position>> nestedMappings = new HashMap<>();

  private PreprocessorCleanerService cleaner;
  private String documentUri;
  private BufferedTokenStream tokens;
  private String textDocumentSyncType;
  private CobolPreprocessor preprocessor;
  private Provider<CopybookResolution> resolutions;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted("uri") String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted("textDocumentSyncType") String textDocumentSyncType,
      PreprocessorCleanerService cleaner,
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
    return cleaner.read();
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
    CopySourceContext copySource = ctx.copySource();
    List<ReplaceClauseContext> replacing = getReplacing(ctx);

    String copybookName = retrieveCopybookName(copySource);
    Position position = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, position);

    String uri = model.getUri();
    String rawContent = model.getContent();
    String copybookId = getCopybookId(uri, replacing);
    String replacedContent = applyReplacing(rawContent, replacing);

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, replacedContent, position);
    String copybookContent = copybookDocument.getText();

    checkCopybookNameLength(copybookName, position);
    addCopybookUsage(copybookName, position);
    addCopybookDefinition(copybookName, uri);

    collectNestedSemanticData(uri, copybookId, copybookDocument);
    writeCopybook(copybookId, copybookContent);
  }

  @Override
  public void exitReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    List<ReplaceClauseContext> replaceClauses = ctx.replaceByStatement().replaceClause();

    String content = applyReplacing(cleaner.read(), replaceClauses);

    cleaner.pop();
    cleaner.write(content);
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
    cleaner.writeToken(node, tokens);
  }

  private List<ReplaceClauseContext> getReplacing(@Nonnull CopyStatementContext ctx) {
    return ofNullable(ctx.replacingPhrase())
        .map(ReplacingPhraseContext::replaceClause)
        .orElse(emptyList());
  }

  private void collectNestedSemanticData(
      String uri, String copybookId, ExtendedDocument copybookDocument) {
    copybooks.merge(copybookDocument.getCopybooks());
    nestedMappings.putAll(copybookDocument.getDocumentPositions());
    nestedMappings.putIfAbsent(copybookId, nestedMappings.get(uri));
  }

  private void writeCopybook(String copybookId, String copybookContent) {
    // throw away COPY terminals
    cleaner.pop();
    // write copybook beginning trigger
    cleaner.write(CPY_ENTER_TAG);
    cleaner.write("<URI>");
    cleaner.write(copybookId);
    cleaner.write("</URI>");
    cleaner.write(copybookContent);
    // write copybook closing trigger
    cleaner.write(CPY_EXIT_TAG);
  }

  private String applyReplacing(
      String rawContent, List<ReplaceClauseContext> replaceClauseContexts) {
    return replacingService.applyReplacing(rawContent, replaceClauseContexts, tokens);
  }

  private String getCopybookId(
      String copybookURI, List<ReplaceClauseContext> replacingPhraseContexts) {
    return copybookURI
        + replacingPhraseContexts.stream()
            .map(RuleContext::getText)
            .reduce(String::concat)
            .orElse("")
            .replaceAll("[^a-zA-Z0-9]+", "")
            .trim();
  }

  private CopybookModel getCopyBookContent(String copybookName, Position position) {

    if (copybookName.isEmpty()) return emptyModel(copybookName);

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
      String copybookName, String uri, String content, Position position) {
    copybookStack.push(new CopybookUsage(copybookName, position));
    ResultWithErrors<ExtendedDocument> result =
        preprocessor.process(uri, content, copybookStack, textDocumentSyncType);
    copybookStack.pop();

    errors.addAll(result.getErrors());

    return result.getResult();
  }

  private CopybookModel emptyModel(String copybookName) {
    return new CopybookModel(copybookName, "", "");
  }

  @Nonnull
  private String retrieveCopybookName(@Nonnull CopySourceContext copySource) {
    return retrieveCopybookName(
        Optional.<RuleContext>ofNullable(copySource.cobolWord()).orElse(copySource.literal()));
  }

  private String retrieveCopybookName(@Nonnull RuleContext context) {
    return context.getText().toUpperCase();
  }

  private void addCopybookUsage(@Nonnull String copybookName, @Nonnull Position position) {
    copybooks.addUsage(copybookName, position);
  }

  private void addCopybookDefinition(String copybookName, String uri) {
    if (!(isEmpty(copybookName) || isEmpty(uri))) {
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

  private void reportRecursiveCopybook(CopybookUsage usage) {
    errors.add(
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(format(RECURSION_DETECTED, usage.getName()))
            .position(usage.getPosition())
            .build());
  }

  private void reportMissingCopybooks(String copybookName, Position position) {
    errors.add(
        SyntaxError.syntaxError()
            .position(position)
            .suggestion(format(ERROR_SUGGESTION, copybookName))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build());
  }

  private void checkCopybookNameLength(String copybookName, Position position) {
    if (copybookName.length() > 8) {
      errors.add(
          SyntaxError.syntaxError()
              .severity(INFO)
              .suggestion(format(COPYBOOK_OVER_8_CHARACTERS, copybookName))
              .position(position)
              .build());
    }
  }
}
