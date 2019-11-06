package com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl;

import com.ca.lsp.core.cobol.parser.CobolCleanerBaseListener;
import com.ca.lsp.core.cobol.parser.CobolCleanerParser;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleanerListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

/**
 * This implementation of CobolDocumentCleanerListener performs unwanted tokens elimination by
 * commenting the out in ANTLR notation
 */
public class CobolDocumentCommentingCleanerListener extends CobolCleanerBaseListener
    implements CobolDocumentCleanerListener {
  private final Deque<CobolDocumentContext> contexts = new ArrayDeque<>();
  private final CobolPreprocessor.CobolSourceFormatEnum format;
  private final BufferedTokenStream tokens;

  CobolDocumentCommentingCleanerListener(
      final CobolPreprocessor.CobolSourceFormatEnum format, final BufferedTokenStream tokens) {
    this.tokens = tokens;
    this.format = format;

    contexts.push(new CobolDocumentContext());
  }

  private final PreprocessorCleanerServiceImpl preprocessorCleanerService =
      new PreprocessorCleanerServiceImpl(contexts);

  public CobolDocumentContext context() {
    return contexts.peek();
  }

  @Override
  public void enterExecCicsStatement(CobolCleanerParser.ExecCicsStatementContext ctx) {
    this.preprocessorCleanerService.push();
  }

  @Override
  public void exitExecCicsStatement(CobolCleanerParser.ExecCicsStatementContext ctx) {
    this.preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_CICS_TAG, tokens, format);
  }

  @Override
  public void enterExecSqlStatement(CobolCleanerParser.ExecSqlStatementContext ctx) {
    this.preprocessorCleanerService.push();
  }

  @Override
  public void exitExecSqlStatement(CobolCleanerParser.ExecSqlStatementContext ctx) {
    this.preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_SQL_TAG, tokens, format);
  }

  @Override
  public void enterExecSqlImsStatement(CobolCleanerParser.ExecSqlImsStatementContext ctx) {
    this.preprocessorCleanerService.push();
  }

  @Override
  public void exitExecSqlImsStatement(CobolCleanerParser.ExecSqlImsStatementContext ctx) {
    this.preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_SQLIMS_TAG, tokens, format);
  }

  @Override
  public void enterEjectStatement(CobolCleanerParser.EjectStatementContext ctx) {
    this.preprocessorCleanerService.push();
  }

  @Override
  public void exitEjectStatement(CobolCleanerParser.EjectStatementContext ctx) {
    this.preprocessorCleanerService.excludeStatementFromText(ctx, COMMENT_TAG, tokens, format);
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
