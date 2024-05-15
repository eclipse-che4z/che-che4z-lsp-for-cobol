/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.migration;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Parser Test Utilities
 */
public class Utils {
  /**
   * Recursively compare positions of nodes
   * @param node1 the first node
   * @param node2 the second node
   */
  public static void compareAll(ParseTree node1, ParseTree node2) {
    compareStartStopPositions(node1, node2);
    for (int i = 0; i < node1.getChildCount(); i++) {
      compareAll(node1.getChild(i), node2.getChild(i));
    }
  }

  /**
   * Compares Start and Stop Positions
   * @param node1 the first node
   * @param node2 the second node
   */
  public static void compareStartStopPositions(ParseTree node1, ParseTree node2) {
    if (node1 instanceof TerminalNodeImpl || node2 instanceof TerminalNodeImpl) {
      return;
    }
    ParserRuleContext a = (ParserRuleContext) node1;
    ParserRuleContext m = (ParserRuleContext) node2;
    String prefix = "[" + a.getClass() + "] ";
    assertEquals(a.getStart().getStartIndex(), m.getStart().getStartIndex(), prefix + "Start: StartIndex");
    assertEquals(a.getStart().getLine(), m.getStart().getLine(), prefix + "Start: Line");
    assertEquals(a.getStart().getCharPositionInLine(), m.getStart().getCharPositionInLine(), prefix + "Start: CharPositionInLine");
    assertEquals(a.getStop().getStartIndex(), m.getStop().getStartIndex(), prefix + "Stop: StartIndex");
    assertEquals(a.getStop().getLine(), m.getStop().getLine(), prefix + "Stop: Line");
    assertEquals(a.getStop().getCharPositionInLine(), m.getStop().getCharPositionInLine(), prefix + "Stop: CharPositionInLine");
  }
}
