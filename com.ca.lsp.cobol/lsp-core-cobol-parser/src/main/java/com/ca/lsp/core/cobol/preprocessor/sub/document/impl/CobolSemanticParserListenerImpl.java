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
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.*;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorStringUtils;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;
import static java.util.Optional.ofNullable;

/**
 * ANTLR visitor, which preprocesses a given COBOL program by executing COPY and REPLACE statements.
 */
@Slf4j
public class CobolSemanticParserListenerImpl extends CobolPreprocessorBaseListener
    implements CobolSemanticParserListener {
  private static final String RECURSION_DETECTED = "Recursive copybook declaration for: %s";

  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  private final PreprocessorCleanerServiceImpl preprocessorCleanerService;
  private final String documentUri;
  private final BufferedTokenStream tokens;
  private final SemanticContext semanticContext;

  CobolSemanticParserListenerImpl(
      String documentUri, BufferedTokenStream tokens, SemanticContext semanticContext) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.semanticContext = semanticContext;

    preprocessorCleanerService = new PreprocessorCleanerServiceImpl();
  }

  @Nonnull
  @Override
  public CobolDocumentContext context() {
    return preprocessorCleanerService.context();
  }

  @Override
  public void enterCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // push a new context for the COMPILER OPTIONS terminals
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceByStatement(@Nonnull ReplaceByStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceOffStatement(@Nonnull ReplaceOffStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterTitleStatement(@Nonnull TitleStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterParagraphName(@Nonnull ParagraphNameContext ctx) {
    semanticContext.getParagraphs().define(ctx.getText().toUpperCase(), retrievePosition(ctx));
  }

  @Override
  public void enterCopyStatement(@Nonnull CopyStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitDataDescriptionEntryFormat1(@Nonnull DataDescriptionEntryFormat1Context ctx) {
    createVariableAndDefine(ctx);
  }

  @Override
  public void exitDataDescriptionEntryFormat2(@Nonnull DataDescriptionEntryFormat2Context ctx) {
    createVariableAndDefine(ctx);
  }

  @Override
  public void exitDataDescriptionEntryFormat3(@Nonnull DataDescriptionEntryFormat3Context ctx) {
    createVariableAndDefine(ctx);
  }

  @Override
  public void exitCopyStatement(@Nonnull CopyStatementContext ctx) {
    /*
     * define the copy book
     */
    CopySourceContext copySource = ctx.copySource();
    String copybookName = retrieveCopybookName(copySource);
    Position position = retrievePosition(copySource);
    defineCopybook(copybookName, position);
    this.preprocessorCleanerService.excludeStatementFromText(ctx, COMMENT_TAG, tokens);
  }

  @Override
  public void exitReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    /*
     * replacement phrase
     */
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitReplaceByStatement(@Nonnull ReplaceByStatementContext ctx) {
    // throw away terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitReplaceOffStatement(@Nonnull ReplaceOffStatementContext ctx) {
    // throw away REPLACE OFF terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitTitleStatement(@Nonnull TitleStatementContext ctx) {
    // throw away title statement
    preprocessorCleanerService.pop();
  }

  @Override
  public void visitTerminal(@Nonnull TerminalNode node) {
    preprocessorCleanerService.visitTerminal(node, tokens);
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
    if (checkThisCopybookNotPresentInHierarchy(copybookName)) {
      semanticContext.getCopybooks().addUsage(copybookName, position);
      semanticContext.getVariables().define(new Variable("-1", copybookName), position);
    } else {
      reportRecursiveCopybooks(copybookName);
    }
  }

  private boolean checkThisCopybookNotPresentInHierarchy(@Nonnull String copybookName) {
    return semanticContext.getCopybookUsageTracker().stream()
        .map(CopybookUsage::getName)
        .noneMatch(copybookName::equals);
  }

  private void reportRecursiveCopybooks(@Nonnull String copybookName) {
    if (!semanticContext.getCopybookUsageTracker().isEmpty()) {
      semanticContext
          .getCopybookUsageTracker()
          .get(0)
          .getUsages()
          .forEach(toSyntaxError(copybookName));
    }
  }

  private void createVariableAndDefine(@Nonnull ParserRuleContext ctx) {
    String levelNumber;

    if (ctx instanceof DataDescriptionEntryFormat1Context) {
      DataDescriptionEntryFormat1Context ctxDataDescF1 = (DataDescriptionEntryFormat1Context) ctx;
      levelNumber = ctxDataDescF1.otherLevel().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF1.dataName());

    } else if (ctx instanceof DataDescriptionEntryFormat2Context) {
      DataDescriptionEntryFormat2Context ctxDataDescF2 = (DataDescriptionEntryFormat2Context) ctx;
      levelNumber = ctxDataDescF2.LEVEL_NUMBER_66().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF2.dataName());
    } else {
      DataDescriptionEntryFormat3Context ctxDataDescF3 = (DataDescriptionEntryFormat3Context) ctx;
      levelNumber = ctxDataDescF3.LEVEL_NUMBER_88().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF3.dataName());
    }
  }

  private void defineVariableIfPresent(
      @Nullable String levelNumber, @Nullable DataNameContext dataName) {
    ofNullable(dataName)
        .ifPresent(
            variable ->
                semanticContext
                    .getVariables()
                    .define(
                        new Variable(levelNumber, variable.getText()), retrievePosition(dataName)));
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

  @Nonnull
  private Consumer<Position> toSyntaxError(@Nonnull String copybookName) {
    return it ->
        errors.add(
            SyntaxError.syntaxError()
                .severity(1)
                .suggestion(String.format(RECURSION_DETECTED, copybookName))
                .position(it)
                .build());
  }
}
