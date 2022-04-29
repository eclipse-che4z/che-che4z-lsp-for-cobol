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
import org.eclipse.lsp.cobol.core.CobolParser.DataNameContext;
import org.eclipse.lsp.cobol.core.CobolParserBaseListener;
import org.eclipse.lsp.cobol.core.model.CopyStatementModifier;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.core.CobolParser.LevelNumberContext;

/** This listener adjusts the variable level numbers and apply other modifications of copybooks */
public class CopybookModificationListener extends CobolParserBaseListener
    implements PreprocessorStack {
  private final Deque<StringBuilder> accumulator = new ArrayDeque<>();
  private final BufferedTokenStream tokens;
  private final CopyStatementModifier modifier;
  private final String suffix;
  private int difference = Integer.MIN_VALUE;
  private static final Pattern REPLACEABLE_NAME = Pattern.compile("(?i).*?-[A-Z0-9]{3}$");

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
  public void enterDataName(DataNameContext ctx) {
    push();
  }

  @Override
  public void exitDataName(DataNameContext ctx) {
    final String name = pop();
    write(shouldReplaceName(name) ? replaceSuffix(name) : appendSuffix(name));
  }

  private boolean shouldReplaceName(String name) {
    return !suffix.isEmpty() && REPLACEABLE_NAME.matcher(name).matches();
  }

  private String replaceSuffix(String name) {
    return (name.length() > 1 ? name.substring(0, name.length() - 2) : "") + suffix;
  }

  private String appendSuffix(String name) {
    return name + suffix;
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
