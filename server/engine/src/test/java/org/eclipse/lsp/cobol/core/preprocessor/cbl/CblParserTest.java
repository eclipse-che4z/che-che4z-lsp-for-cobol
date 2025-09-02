/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.junit.jupiter.api.Test;

/** CBL parser test */
public class CblParserTest {
  static final String URI = "file://document.cbl";

  @Test
  void testXOpts() {
    CblParser cblParser =
        parserFor("      CBL XOPTS(DLI), NOADATA, XOPT(DLI)\n", new ArrayList<>());
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertNode(cbl, 6, 40, 4);
    CblNode xOpt1 = cbl.getChildren().get(1);
    // XOPTS(DLI),
    assertNode(xOpt1, 10, 21, 5);
    assertNode(xOpt1.getChildren().get(2), 16, 19, 1);
    // NOADATA,
    assertNode(cbl.getChildren().get(2), 22, 30, 2);
    // XOPTS(DLI)
    CblNode xOpt2 = cbl.getChildren().get(3);
    assertNode(xOpt2, 31, 40, 4);
    assertNode(xOpt2.getChildren().get(2), 36, 39, 1);
  }

  @Test
  void testXOpts2() {
    CblParser cblParser = parserFor("CBL XOPTS(FLAG(I))\n", new ArrayList<>());
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertNode(cbl, 0, 18, 2);
    CblNode xopts = cbl.getChildren().get(1);
    // XOPTS(FLAG(I))
    assertNode(xopts, 4, 18, 4);
    assertNode(xopts.getChildren().get(2), 10, 17, 4);
  }

  @Test
  void testCics() {
    CblParser cblParser = parserFor("CBL CICS(DLI)\n", new ArrayList<>());
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertNode(cbl, 0, 13, 2);
    CblNode cics = cbl.getChildren().get(1);
    // CBL CICS(DLI)
    assertEquals(CblNodeTypes.CICS_CONTAINER, cics.getType());
    assertNode(cics, 4, 13, 4);
    assertNode(cics.getChildren().get(2), 9, 12, 1);
  }

  @Test
  void testCicsSpace() {
    List<SyntaxError> diagnostics = new ArrayList<>();
    CblParser cblParser = parserFor("CBL CICS(SPACE(4))\n", diagnostics);
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertEquals(1, diagnostics.size());
    assertNode(cbl, 0, 18, 2);
    CblNode cics = cbl.getChildren().get(1);
    // CICS(SPACE(4))
    assertNode(cics, 4, 18, 4);
    assertNode(cics.getChildren().get(2), 9, 17, 4);
  }

  private void assertNode(CblNode node, int startPos, int end, int childrenCount) {
    assertEquals(startPos, node.getStart(), "Start pos");
    assertEquals(end, node.getEnd(), "End pos");
    assertEquals(childrenCount, node.getChildren().size(), "Children count");
  }

  /**
   * Utility method to create CBL parser
   * @param text CBL text
   * @param diagnostics list of syntax errors
   * @return CBL parser
   */
  public static CblParser parserFor(String text, List<SyntaxError> diagnostics) {
    String[] segments = text.split("(?<=[(),'\"]|\\w\\b)|(?=[(),'\"]|\\b\\w+)");
    CblToken[] tokens = new CblToken[segments.length];
    for (int i = 0; i < segments.length; ++i) {
      int start = i == 0 ? 0 : tokens[i - 1].getEnd();
      int end = i == 0 ? segments[i].length() : start + segments[i].length();
      tokens[i] = new CblToken(URI, segments[i], 0, start, end);
    }

    return new CblParser(tokens, diagnostics);
  }
}
