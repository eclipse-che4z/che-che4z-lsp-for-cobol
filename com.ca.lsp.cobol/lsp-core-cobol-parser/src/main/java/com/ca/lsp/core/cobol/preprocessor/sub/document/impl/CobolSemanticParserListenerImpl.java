/*
 * Copyright (c) 2019 Broadcom.
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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.CopySourceContext;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParserListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorStringUtils;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Optional;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;

/**
 * ANTLR visitor, which preprocesses a given COBOL program by executing COPY and REPLACE statements.
 */
public class CobolSemanticParserListenerImpl extends CobolPreprocessorBaseListener
    implements CobolSemanticParserListener {

  private static final Logger LOG = LoggerFactory.getLogger(CobolSemanticParserListenerImpl.class);

  private final Deque<CobolDocumentContext> contexts = new ArrayDeque<>();
  private final BufferedTokenStream tokens;
  private final CobolPreprocessor.CobolSourceFormatEnum format;
  private final SemanticContext semanticContext;

  CobolSemanticParserListenerImpl(
      final BufferedTokenStream tokens,
      final SemanticContext semanticContext,
      final CobolPreprocessor.CobolSourceFormatEnum format) {
    this.tokens = tokens;
    this.format = format;
    this.semanticContext = semanticContext;

    contexts.push(new CobolDocumentContext());
  }

  private final PreprocessorCleanerServiceImpl preprocessorCleanerService =
      new PreprocessorCleanerServiceImpl(contexts);

  @Override
  public CobolDocumentContext context() {
    return contexts.peek();
  }

  @Override
  public void enterCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
    // push a new context for COMPILER OPTIONS terminals
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterReplaceOffStatement(
      final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void enterParagraphName(final CobolPreprocessorParser.ParagraphNameContext ctx) {
    semanticContext.getParagraphs().define(ctx.getText().toUpperCase(), retrievePosition(ctx));
  }

  @Override
  public void enterCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitDataDescriptionEntryFormat1(
      CobolPreprocessorParser.DataDescriptionEntryFormat1Context ctx) {
    createVariableAndDefine(ctx);
  }

  @Override
  public void exitDataDescriptionEntryFormat2(
      CobolPreprocessorParser.DataDescriptionEntryFormat2Context ctx) {
    createVariableAndDefine(ctx);
  }

  @Override
  public void exitDataDescriptionEntryFormat3(
      CobolPreprocessorParser.DataDescriptionEntryFormat3Context ctx) {
    createVariableAndDefine(ctx);
  }

  private void createVariableAndDefine(ParserRuleContext ctx) {
    String levelNumber;

    if (ctx instanceof CobolPreprocessorParser.DataDescriptionEntryFormat1Context) {
      CobolPreprocessorParser.DataDescriptionEntryFormat1Context ctxDataDescF1 =
          (CobolPreprocessorParser.DataDescriptionEntryFormat1Context) ctx;
      levelNumber = ctxDataDescF1.otherLevel().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF1.dataName());

    } else if (ctx instanceof CobolPreprocessorParser.DataDescriptionEntryFormat2Context) {
      CobolPreprocessorParser.DataDescriptionEntryFormat2Context ctxDataDescF2 =
          (CobolPreprocessorParser.DataDescriptionEntryFormat2Context) ctx;
      levelNumber = ctxDataDescF2.LEVEL_NUMBER_66().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF2.dataName());
    } else {
      CobolPreprocessorParser.DataDescriptionEntryFormat3Context ctxDataDescF3 =
          (CobolPreprocessorParser.DataDescriptionEntryFormat3Context) ctx;
      levelNumber = ctxDataDescF3.LEVEL_NUMBER_88().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF3.dataName());
    }
  }

  private void defineVariableIfPresent(
      String levelNumber, CobolPreprocessorParser.DataNameContext dataName) {
    Optional.ofNullable(dataName)
        .ifPresent(
            variable ->
                semanticContext
                    .getVariables()
                    .define(
                        new Variable(levelNumber, variable.getText()), retrievePosition(dataName)));
  }

  private Position retrievePosition(ParserRuleContext token) {
    return new Position(
        token.getStart().getTokenIndex(),
        token.getStart().getStartIndex(),
        token.getStop().getStopIndex(),
        token.getStart().getLine(),
        token.getStart().getCharPositionInLine());
  }

  @Override
  public void exitCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {

    /*
     * replacement phrase
     */
    //    for (final ReplacingPhraseContext replacingPhrase : ctx.replacingPhrase()) {
    //      context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause());
    //    }
    // TODO: implement replacement logic
    /*
     * copy the copy book
     */
    final CopySourceContext copySource = ctx.copySource();
    String copybookName = retrieveCopybookName(copySource);
    if (copybookName != null) {
      semanticContext.getCopybooks().define(copybookName, retrievePosition(copySource));
    }
    // TODO: exclude statement from the text

    //    semanticContext.merge(copybookSemanticContext);
    preprocessorCleanerService.excludeStatementFromText(ctx, COMMENT_TAG, tokens, format);
  }

  @Override
  public void exitReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
    /*
     * replacement phrase
     */
    //    final List<ReplaceClauseContext> replaceClauses =
    // ctx.replaceByStatement().replaceClause();
    //    context().storeReplaceablesAndReplacements(replaceClauses);
    //
    //    context().replaceReplaceablesByReplacements(tokens);
    //    final String content = context().read();

    preprocessorCleanerService.pop();
    //    context().write(content);
  }

  @Override
  public void exitReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
    // throw away terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitReplaceOffStatement(
      final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
    // throw away REPLACE OFF terminals
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
    // throw away skip statement
    preprocessorCleanerService.pop();
  }

  @Override
  public void exitTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
    // throw away title statement
    preprocessorCleanerService.pop();
  }

  private String retrieveCopybookName(final CopySourceContext copySource) {
    final String copybookName;
    if (copySource.cobolWord() != null) {
      copybookName = copySource.cobolWord().getText();
    } else if (copySource.literal() != null) {
      copybookName =
          PreprocessorStringUtils.trimQuotes(copySource.literal().getText()).replace("\\", "/");
    } else {
      LOG.warn("Unknown copy book reference type {}", copySource);
      copybookName = null;
    }

    return copybookName;
  }

  @Override
  public void visitTerminal(final TerminalNode node) {
    final int tokPos = node.getSourceInterval().a;
    context().write(TokenUtils.getHiddenTokensToLeft(tokPos, tokens));

    if (!TokenUtils.isEOF(node)) {
      final String text = node.getText();
      context().write(text);
    }
  }
}
