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
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.assistedinject.Assisted;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.*;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.NEWLINE;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.lang.String.format;

/**
 * ANTLR visitor, which preprocesses a given COBOL program by executing COPY and REPLACE statements.
 */
@Slf4j
public class CobolSemanticParserListenerImpl extends CobolPreprocessorBaseListener
    implements CobolSemanticParserListener {
  private static final String RECURSION_DETECTED = "Recursive copybook declaration for: %s";
  private static final String COPYBOOK_OVER_8_CHARACTERS =
      "Copybook declaration has more than 8 characters for: %s";
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";

  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  @Getter private final SemanticContext semanticContext = new SemanticContext();
  @Getter private final Map<String, List<Position>> innerMappings = new HashMap<>();
  @Getter private final Map<String, Integer> copybookDeltas = new HashMap<>();

  private PreprocessorCleanerServiceImpl cleaner;
  private String documentUri;
  private BufferedTokenStream tokens;
  private String textDocumentSyncType;
  private CobolPreprocessor preprocessor;
  private Provider<CopybookResolution> resolutions;
  private Deque<CopybookUsage> copybookStack;

  @Inject
  CobolSemanticParserListenerImpl(
      @Assisted("uri") String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted("textDocumentSyncType") String textDocumentSyncType,
      PreprocessorCleanerServiceImpl cleaner,
      CobolPreprocessor preprocessor,
      Provider<CopybookResolution> resolutions) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookStack = copybookStack;
    this.textDocumentSyncType = textDocumentSyncType;
    this.cleaner = cleaner;
    this.preprocessor = preprocessor;
    this.resolutions = resolutions;
  }

  @Nonnull
  @Override
  public CobolDocumentContext context() {
    return cleaner.context();
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
    cleaner.push();

    /*
     * replacement phrase
     */
    for (ReplacingPhraseContext replacingPhrase : ctx.replacingPhrase()) {
      context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause());
    }

    /*
     * copy the copy book
     */
    String copybookName = retrieveCopybookName(ctx.copySource());
    Position position = retrievePosition(ctx.copySource());
    String copyBookContent = getCopyBookContent(copybookName, position);

    if (copyBookContent != null) {
      context().write(copyBookContent + NEWLINE);
      context().replaceReplaceablesByReplacements(tokens);
    }

    if (innerMappings.get(copybookName) != null) {
      int copybookLength = innerMappings.get(copybookName).size();
      int copybookDefinitionLength = ctx.getStop().getTokenIndex() - ctx.getStart().getTokenIndex();
      int delta = copybookLength - copybookDefinitionLength;

      copybookDeltas.put(copybookName, delta);
    }

    String content = context().read();
    cleaner.pop();

    context().write(content);
  }

  private String getCopyBookContent(String copybookName, Position position) {
    /*
     * define the copy book
     */
    if (copybookName == null) return "";
    defineCopybook(copybookName, position);
    checkCopybookNameLength(copybookName, position);

    if (copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals)) {
      copybookStack.forEach(
          it ->
              errors.add(
                  SyntaxError.syntaxError()
                      .severity(1)
                      .suggestion(String.format(RECURSION_DETECTED, it.getName()))
                      .position(it.getPosition())
                      .build()));
      return "";
    }

    CopybookModel copybook =
        resolutions.get().resolve(copybookName, documentUri, textDocumentSyncType);

    if (copybook == null || copybook.getContent() == null) {
      errors.add(
          SyntaxError.syntaxError()
              .position(position)
              .suggestion(format(ERROR_SUGGESTION, copybookName))
              .severity(1)
              .errorCode(MISSING_COPYBOOK)
              .build());
      return "";
    }

    copybookStack.push(new CopybookUsage(copybookName, null, position));
    ResultWithErrors<PreprocessedInput> result =
        preprocessor.process(
            copybook.getUri(), copybook.getContent(), copybookStack, textDocumentSyncType);
    errors.addAll(result.getErrors());

    PreprocessedInput input = result.getResult();
    innerMappings.putAll(input.getTokenMapping());
    copybookDeltas.putAll(input.getCopybookDeltas());

    copybookStack.pop();
    return input.getInput();
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
  public void exitReplaceArea(ReplaceAreaContext ctx) {
    /*
     * replacement phrase
     */
    List<ReplaceClauseContext> replaceClauses = ctx.replaceByStatement().replaceClause();

    context().storeReplaceablesAndReplacements(replaceClauses);
    context().replaceReplaceablesByReplacements(tokens);

    String content = context().read();

    cleaner.pop();
    context().write(content);
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
    final String copybookName;
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

  private void defineCopybook(@Nullable String copybookName, @Nonnull Position position) {
    if (copybookName == null) {
      return;
    }
    semanticContext.getCopybooks().addUsage(copybookName, position);
  }

  @Nonnull
  private Position retrievePosition(@Nonnull ParserRuleContext token) {
    return new Position(
        documentUri,
        token.getStart().getStartIndex(),
        token.getStop().getStopIndex(),
        token.getStart().getLine(),
        token.getStart().getCharPositionInLine());
  }
}
