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
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.core.visitor;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.engine.ThreadInterruptionUtil;

/**
 * This class used to implicitly check if the current interrupted while the parsing by the main
 * grammar.
 */
public class InterruptingTreeListener implements ParseTreeListener {

  @Override
  public void visitTerminal(TerminalNode node) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    // Implicitly checks if the thread interrupted
  }

  @Override
  public void visitErrorNode(ErrorNode node) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    // Implicitly checks if the thread interrupted
  }

  @Override
  public void enterEveryRule(ParserRuleContext ctx) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    // Implicitly checks if the thread interrupted
  }

  @Override
  public void exitEveryRule(ParserRuleContext ctx) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    // Implicitly checks if the thread interrupted
  }
}
