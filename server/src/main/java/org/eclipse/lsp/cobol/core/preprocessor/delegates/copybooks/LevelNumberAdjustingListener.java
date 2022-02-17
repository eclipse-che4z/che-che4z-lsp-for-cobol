/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.CobolParserBaseListener;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;

import java.util.ArrayDeque;
import java.util.Deque;

import static org.eclipse.lsp.cobol.core.CobolParser.LevelNumberContext;

/** This listener adjusts the variable level numbers of copybooks */
public class LevelNumberAdjustingListener extends CobolParserBaseListener
    implements PreprocessorStack {
  private final Deque<StringBuilder> accumulator = new ArrayDeque<>();
  private final BufferedTokenStream tokens;
  private final int copybookNumber;
  private int difference = Integer.MIN_VALUE;

  public LevelNumberAdjustingListener(int copybookNumber, BufferedTokenStream tokens) {
    this.copybookNumber = copybookNumber;
    this.tokens = tokens;
    accumulator.add(new StringBuilder());
  }

  @Override
  public void exitLevelNumber(LevelNumberContext ctx) {
    int number = Integer.parseInt(pop());
    if (difference == Integer.MIN_VALUE) difference = copybookNumber - number;
    write(String.format("%02d", number + difference));
  }

  @Override
  public void visitTerminal(TerminalNode node) {
    if (node.getParent() instanceof LevelNumberContext) {
      write(TokenUtils.retrieveHiddenTextToLeft(node.getSourceInterval().a, tokens));
      push();
      write(node.getText());
    } else TokenUtils.writeHiddenTokens(tokens, this::write).accept(node);
  }

  @Override
  public Deque<StringBuilder> getTextAccumulator() {
    return accumulator;
  }
}
