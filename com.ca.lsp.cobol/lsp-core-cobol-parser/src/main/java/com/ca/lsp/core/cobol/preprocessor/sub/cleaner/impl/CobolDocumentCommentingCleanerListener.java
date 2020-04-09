/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.preprocessor.sub.cleaner.impl;

import com.ca.lsp.core.cobol.parser.CobolCleanerBaseListener;
import com.ca.lsp.core.cobol.preprocessor.sub.cleaner.CobolDocumentCleanerListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;

import static com.ca.lsp.core.cobol.parser.CobolCleanerParser.*;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

/**
 * This implementation of {@link CobolDocumentCleanerListener} performs unwanted token elimination
 * by commenting the out in ANTLR notation
 */
public class CobolDocumentCommentingCleanerListener extends CobolCleanerBaseListener
    implements CobolDocumentCleanerListener {
  private BufferedTokenStream tokens;
  private PreprocessorCleanerServiceImpl preprocessorCleanerService;

  CobolDocumentCommentingCleanerListener(@Nonnull BufferedTokenStream tokens) {
    this.tokens = tokens;
    preprocessorCleanerService = new PreprocessorCleanerServiceImpl();
  }

  @Override
  public CobolDocumentContext context() {
    return preprocessorCleanerService.context();
  }

  @Override
  public void enterExecCicsStatement(@Nonnull ExecCicsStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitExecCicsStatement(@Nonnull ExecCicsStatementContext ctx) {
    preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_CICS_TAG, tokens);
  }

  @Override
  public void enterExecSqlStatement(@Nonnull ExecSqlStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitExecSqlStatement(@Nonnull ExecSqlStatementContext ctx) {
    preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_SQL_TAG, tokens);
  }

  @Override
  public void enterExecSqlImsStatement(@Nonnull ExecSqlImsStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitExecSqlImsStatement(@Nonnull ExecSqlImsStatementContext ctx) {
    preprocessorCleanerService.excludeStatementFromText(ctx, EXEC_SQLIMS_TAG, tokens);
  }

  @Override
  public void enterEjectStatement(@Nonnull EjectStatementContext ctx) {
    preprocessorCleanerService.push();
  }

  @Override
  public void exitEjectStatement(@Nonnull EjectStatementContext ctx) {
    preprocessorCleanerService.excludeStatementFromText(ctx, COMMENT_TAG, tokens);
  }

  @Override
  public void visitTerminal(@Nonnull TerminalNode node) {
    preprocessorCleanerService.visitTerminal(node, tokens);
  }
}
