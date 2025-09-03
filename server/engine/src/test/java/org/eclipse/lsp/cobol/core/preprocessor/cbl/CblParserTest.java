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
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

/** CBL parser test */
public class CblParserTest {
  static final String URI = "file://document.cbl";

  @Test
  void testXOpts() {
    CblParser cblParser = parserFor("      CBL XOPTS(DLI), NOADATA, XOPT(DLI)\n");
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertEquals(6, cbl.getStart(), "Start pos");
    assertEquals(30, cbl.getEnd(), "End pos");
    assertEquals(2, cbl.getChildren().size(), "Children count");
    // NOADATA,
    CblNode node = cbl.getChildren().get(1);
    assertEquals(22, node.getStart(), "Start pos");
    assertEquals(30, node.getEnd(), "End pos");
    assertEquals(2, node.getChildren().size(), "Children count");
  }

  @Test
  void testXOpts2() {
    CblParser cblParser = parserFor("CBL XOPTS(FLAG(I))\n");
    assertTrue(cblParser.cbl().getChildren().isEmpty());
  }

  @Test
  void testCics() {
    CblParser cblParser = parserFor("CBL CICS(DLI)\n");
    assertTrue(cblParser.cbl().getChildren().isEmpty());
  }

  @Test
  void testCicsSpace() {
    CblParser cblParser = parserFor("CBL CICS(SPACE(4))\n");
    assertTrue(cblParser.cbl().getChildren().isEmpty());
  }

  /**
   * Utility method to create CBL parser
   *
   * @param text CBL text
   * @return CBL parser
   */
  public static CblParser parserFor(String text) {
    String[] segments = text.split("(?<=[(),'\"]|\\w\\b)|(?=[(),'\"]|\\b\\w+)");
    CblToken[] tokens = new CblToken[segments.length];
    for (int i = 0; i < segments.length; ++i) {
      int start = i == 0 ? 0 : tokens[i - 1].getEnd();
      int end = i == 0 ? segments[i].length() : start + segments[i].length();
      tokens[i] = new CblToken(URI, segments[i], 0, start, end);
    }

    return new CblParser(tokens);
  }
}
