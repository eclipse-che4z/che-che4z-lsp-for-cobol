package com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl;

import com.ca.lsp.core.cobol.parser.CobolCleanerBaseListener;
import com.ca.lsp.core.cobol.parser.CobolCleanerParser;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleanerListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

public class CobolDocumentCleanerListenerImpl extends CobolCleanerBaseListener
    implements CobolDocumentCleanerListener {
  private final Deque<CobolDocumentContext> contexts = new ArrayDeque<>();

  private final CobolPreprocessor.CobolSourceFormatEnum format;

  private final BufferedTokenStream tokens;

  public CobolDocumentCleanerListenerImpl(
      final CobolPreprocessor.CobolSourceFormatEnum format, final BufferedTokenStream tokens) {
    this.tokens = tokens;
    this.format = format;

    contexts.push(new CobolDocumentContext());
  }

  public CobolDocumentContext context() {
    return contexts.peek();
  }

  @Override
  public void enterExecCicsStatement(CobolCleanerParser.ExecCicsStatementContext ctx) {
    push();
  }

  @Override
  public void exitExecCicsStatement(CobolCleanerParser.ExecCicsStatementContext ctx) {
    excludeStatementFromText(ctx, EXEC_CICS_TAG);
  }

  @Override
  public void enterExecSqlStatement(CobolCleanerParser.ExecSqlStatementContext ctx) {
    push();
  }

  @Override
  public void exitExecSqlStatement(CobolCleanerParser.ExecSqlStatementContext ctx) {
    excludeStatementFromText(ctx, EXEC_SQL_TAG);
  }

  @Override
  public void enterExecSqlImsStatement(CobolCleanerParser.ExecSqlImsStatementContext ctx) {
    push();
  }

  @Override
  public void exitExecSqlImsStatement(CobolCleanerParser.ExecSqlImsStatementContext ctx) {
    excludeStatementFromText(ctx, EXEC_SQLIMS_TAG);
  }

  @Override
  public void enterEjectStatement(CobolCleanerParser.EjectStatementContext ctx) {
    push();
  }

  @Override
  public void exitEjectStatement(CobolCleanerParser.EjectStatementContext ctx) {
    excludeStatementFromText(ctx, COMMENT_TAG);
  }

  private void excludeStatementFromText(ParserRuleContext ctx, String tag) {
    // throw away EXEC SQL terminals
    pop();

    // a new context for the SQL statement
    push();

    final String textLeft = TokenUtils.getHiddenTokensToLeft(ctx.start.getTokenIndex(), tokens);
    context().write(textLeft);

    /*
     * text
     */
    final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    final String linePrefix = CobolLine.createBlankSequenceArea(format) + tag;
    final String lines = buildLines(text, linePrefix);

    context().write(lines);

    final String content = context().read();
    pop();

    context().write(content);
  }

  private String buildLines(final String text, final String linePrefix) {
    final StringBuilder sb = new StringBuilder(text.length());
    final Scanner scanner = new Scanner(text);
    boolean firstLine = true;

    while (scanner.hasNextLine()) {
      if (!firstLine) {
        sb.append(NEWLINE);
      }

      final String line = scanner.nextLine();
      final String trimmedLine = line.trim();
      final String prefixedLine = linePrefix + WS + trimmedLine;
      final String suffixedLine = prefixedLine.replaceAll("(?i)(end-exec)", "$1 " + EXEC_END_TAG);

      sb.append(suffixedLine);
      firstLine = false;
    }

    scanner.close();
    return sb.toString();
  }

  /** Pops the current preprocessing context from the stack. */
  private CobolDocumentContext pop() {
    return contexts.pop();
  }

  /** Pushes a new preprocessing context onto the stack. */
  private CobolDocumentContext push() {
    CobolDocumentContext cobolDocumentContext = new CobolDocumentContext();
    contexts.push(new CobolDocumentContext());
    return cobolDocumentContext;
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
