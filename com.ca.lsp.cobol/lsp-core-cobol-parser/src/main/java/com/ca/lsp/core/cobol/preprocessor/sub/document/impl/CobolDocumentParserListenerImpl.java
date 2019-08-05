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

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.EXEC_CICS_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.EXEC_END_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.EXEC_SQLIMS_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.EXEC_SQL_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.NEWLINE;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;

import java.io.File;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;
import java.util.Scanner;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.CopySourceContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplacingPhraseContext;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor.CobolSourceFormatEnum;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.CobolWordCopyBookFinder;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.FilenameCopyBookFinder;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.LiteralCopyBookFinder;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.impl.CobolWordCopyBookFinderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.impl.FilenameCopyBookFinderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.impl.LiteralCopyBookFinderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolDocumentParserListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;

/**
 * ANTLR visitor, which preprocesses a given COBOL program by executing COPY and REPLACE statements.
 */
public class CobolDocumentParserListenerImpl extends CobolPreprocessorBaseListener
    implements CobolDocumentParserListener {

  private static final Logger LOG = LoggerFactory.getLogger(CobolDocumentParserListenerImpl.class);

  private final Deque<CobolDocumentContext> contexts = new ArrayDeque<>();

  private final CobolSourceFormatEnum format;

  private final CobolParserParams params;

  private final BufferedTokenStream tokens;

  public CobolDocumentParserListenerImpl(
      final CobolSourceFormatEnum format,
      final CobolParserParams params,
      final BufferedTokenStream tokens) {
    this.params = params;
    this.tokens = tokens;
    this.format = format;

    contexts.push(new CobolDocumentContext());
  }

  protected String buildLines(final String text, final String linePrefix) {
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

  @Override
  public CobolDocumentContext context() {
    return contexts.peek();
  }

  protected CobolWordCopyBookFinder createCobolWordCopyBookFinder() {
    return new CobolWordCopyBookFinderImpl();
  }

  protected FilenameCopyBookFinder createFilenameCopyBookFinder() {
    return new FilenameCopyBookFinderImpl();
  }

  protected LiteralCopyBookFinder createLiteralCopyBookFinder() {
    return new LiteralCopyBookFinderImpl();
  }

  @Override
  public void enterCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
    // push a new context for COMPILER OPTIONS terminals
    push();
  }

  @Override
  public void enterCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
    // push a new context for COPY terminals
    push();
  }

  @Override
  public void enterEjectStatement(final CobolPreprocessorParser.EjectStatementContext ctx) {
    push();
  }

  @Override
  public void enterExecCicsStatement(final CobolPreprocessorParser.ExecCicsStatementContext ctx) {
    // push a new context for SQL terminals
    push();
  }

  @Override
  public void enterExecSqlImsStatement(
      final CobolPreprocessorParser.ExecSqlImsStatementContext ctx) {
    // push a new context for SQL IMS terminals
    push();
  }

  @Override
  public void enterExecSqlStatement(final CobolPreprocessorParser.ExecSqlStatementContext ctx) {
    // push a new context for SQL terminals
    push();
  }

  @Override
  public void enterReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
    push();
  }

  @Override
  public void enterReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
    push();
  }

  @Override
  public void enterReplaceOffStatement(
      final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
    push();
  }

  @Override
  public void enterSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
    push();
  }

  @Override
  public void enterTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
    push();
  }

  @Override
  public void exitCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    pop();
  }

  @Override
  public void exitCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
    // throw away COPY terminals
    pop();

    // a new context for the copy book content
    push();

    /*
     * replacement phrase
     */
    for (final ReplacingPhraseContext replacingPhrase : ctx.replacingPhrase()) {
      context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause());
    }

    /*
     * copy the copy book
     */
    final CopySourceContext copySource = ctx.copySource();
    final String copyBookContent = getCopyBookContent(copySource, format, params);

    if (copyBookContent != null) {
      context().write(copyBookContent + NEWLINE);
      context().replaceReplaceablesByReplacements(tokens);
    }

    final String content = context().read();
    pop();

    context().write(content);
  }

  @Override
  public void exitEjectStatement(final CobolPreprocessorParser.EjectStatementContext ctx) {
    // throw away eject statement
    pop();
  }

  @Override
  public void exitExecCicsStatement(final CobolPreprocessorParser.ExecCicsStatementContext ctx) {
    // throw away EXEC CICS terminals
    pop();

    // a new context for the CICS statement
    push();

    /*
     * text
     */
    final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    final String linePrefix = CobolLine.createBlankSequenceArea(format) + EXEC_CICS_TAG;
    final String lines = buildLines(text, linePrefix);

    context().write(lines);

    final String content = context().read();
    pop();

    context().write(content);
  }

  @Override
  public void exitExecSqlImsStatement(
      final CobolPreprocessorParser.ExecSqlImsStatementContext ctx) {
    // throw away EXEC SQLIMS terminals
    pop();

    // a new context for the SQLIMS statement
    push();

    /*
     * text
     */
    final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    final String linePrefix = CobolLine.createBlankSequenceArea(format) + EXEC_SQLIMS_TAG;
    final String lines = buildLines(text, linePrefix);

    context().write(lines);

    final String content = context().read();
    pop();

    context().write(content);
  }

  @Override
  public void exitExecSqlStatement(final CobolPreprocessorParser.ExecSqlStatementContext ctx) {
    // throw away EXEC SQL terminals
    pop();

    // a new context for the SQL statement
    push();

    /*
     * text
     */
    final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    final String linePrefix = CobolLine.createBlankSequenceArea(format) + EXEC_SQL_TAG;
    final String lines = buildLines(text, linePrefix);

    context().write(lines);

    final String content = context().read();
    pop();

    context().write(content);
  }

  @Override
  public void exitReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
    /*
     * replacement phrase
     */
    final List<ReplaceClauseContext> replaceClauses = ctx.replaceByStatement().replaceClause();
    context().storeReplaceablesAndReplacements(replaceClauses);

    context().replaceReplaceablesByReplacements(tokens);
    final String content = context().read();

    pop();
    context().write(content);
  }

  @Override
  public void exitReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
    // throw away terminals
    pop();
  }

  @Override
  public void exitReplaceOffStatement(
      final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
    // throw away REPLACE OFF terminals
    pop();
  }

  @Override
  public void exitSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
    // throw away skip statement
    pop();
  }

  @Override
  public void exitTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
    // throw away title statement
    pop();
  }

  protected File findCopyBook(final CopySourceContext copySource, final CobolParserParams params) {
    final File result;

    if (copySource.cobolWord() != null) {
      result = createCobolWordCopyBookFinder().findCopyBook(params, copySource.cobolWord());
    } else if (copySource.literal() != null) {
      result = createLiteralCopyBookFinder().findCopyBook(params, copySource.literal());
    } else if (copySource.filename() != null) {
      result = createFilenameCopyBookFinder().findCopyBook(params, copySource.filename());
    } else {
      LOG.warn("unknown copy book reference type {}", copySource);
      result = null;
    }

    return result;
  }

  protected String getCopyBookContent(
      final CopySourceContext copySource,
      final CobolSourceFormatEnum format,
      final CobolParserParams params) {
    final File copyBook = findCopyBook(copySource, params);
    String result;

    if (copyBook == null) {
      LOG.warn(
          "Could not find copy book {} in directory of COBOL input file or copy books param object.",
          copySource.getText());
      result = null;
    } else {
      try {
        result = new CobolPreprocessorImpl().process(copyBook, format, params);
      } catch (final IOException e) {
        result = null;
        LOG.warn(e.getMessage());
      }
    }

    return result;
  }

  /** Pops the current preprocessing context from the stack. */
  protected CobolDocumentContext pop() {
    return contexts.pop();
  }

  /** Pushes a new preprocessing context onto the stack. */
  protected CobolDocumentContext push() {
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
