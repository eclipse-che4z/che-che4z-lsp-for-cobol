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
import org.eclipse.lsp.cobol.core.annotation.CheckThreadInterruption;
import org.eclipse.lsp.cobol.domain.modules.ProxyEngineProviders;

/**
 * This class used to implicitly check if the current interrupted while the parsing by the main
 * grammar.
 *
 * <p>NOTE: Guice binding is done through {@link com.google.inject.Provides}.<br>
 * <br>
 * Check {@link ProxyEngineProviders#getParseTreeListener()}
 */
public class InterruptingTreeListener implements ParseTreeListener {

  @Override
  @CheckThreadInterruption
  public void visitTerminal(TerminalNode node) {
    // Implicitly checks if the thread interrupted
  }

  @Override
  @CheckThreadInterruption
  public void visitErrorNode(ErrorNode node) {
    // Implicitly checks if the thread interrupted
  }

  @Override
  @CheckThreadInterruption
  public void enterEveryRule(ParserRuleContext ctx) {
    // Implicitly checks if the thread interrupted
  }

  @Override
  @CheckThreadInterruption
  public void exitEveryRule(ParserRuleContext ctx) {
    // Implicitly checks if the thread interrupted
  }
}
