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

import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;

/**
 * ANTLR listener, which collects visible as well as hidden tokens for a given parse tree in a
 * string buffer.
 */
public class CobolHiddenTokenCollectorListenerImpl extends CobolPreprocessorBaseListener {

  private final StringBuilder outputBuffer = new StringBuilder();

  private final BufferedTokenStream tokens;
  private final TokenUtils tokenUtils;

  public CobolHiddenTokenCollectorListenerImpl(TokenUtils tokenUtils, BufferedTokenStream tokens) {
    this.tokenUtils = tokenUtils;
    this.tokens = tokens;
  }

  public String read() {
    return outputBuffer.toString();
  }

  @Override
  public void visitTerminal(TerminalNode node) {
    if (outputBuffer.length() > 0) {
      int tokPos = node.getSourceInterval().a;
      outputBuffer.append(tokenUtils.retrieveHiddenTextToLeft(tokPos, tokens));
    }

    if (tokenUtils.notEOF(node)) {
      outputBuffer.append(node.getText());
    }
  }
}
