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
import org.eclipse.lsp.cobol.core.model.CopyStatementModifier;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;

import java.util.ArrayDeque;
import java.util.Deque;

import static org.eclipse.lsp.cobol.core.CobolParser.EntryNameContext;
import static org.eclipse.lsp.cobol.core.CobolParser.LevelNumberContext;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.FILLER_VARIABLE_NAME;

/** This listener adjusts the variable level numbers and apply other modifications of copybooks */
public class CopybookModificationListener extends CobolParserBaseListener
    implements PreprocessorStack {
  private final Deque<StringBuilder> accumulator = new ArrayDeque<>();
  private final BufferedTokenStream tokens;
  private final CopyStatementModifier modifier;
  private final String suffix;
  private int difference = Integer.MIN_VALUE;

  public CopybookModificationListener(
      CopyStatementModifier modifier, String suffix, BufferedTokenStream tokens) {
    this.modifier = modifier;
    this.tokens = tokens;
    this.suffix = suffix;
    accumulator.add(new StringBuilder());
  }

  @Override
  public void exitLevelNumber(LevelNumberContext ctx) {
    int number = Integer.parseInt(pop());
    if (difference == Integer.MIN_VALUE) difference = modifier.getLevelNumber() - number;
    write(String.format("%02d", number + difference));
  }

  @Override
  public void enterEntryName(EntryNameContext ctx) {
    push();
  }

  @Override
  public void exitEntryName(EntryNameContext ctx) {
    final String name = pop().trim();
    write(TokenUtils.retrieveHiddenTextToLeft(ctx.getSourceInterval().a, tokens));
    write(nameShouldRemain(name) ? name : replaceSuffix(name));
  }

  private boolean nameShouldRemain(String name) {
    return suffix.isEmpty() || FILLER_VARIABLE_NAME.equalsIgnoreCase(name);
  }

  private String replaceSuffix(String name) {
    return (name.length() > 1 ? name.substring(0, name.length() - 2) : "") + suffix;
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
