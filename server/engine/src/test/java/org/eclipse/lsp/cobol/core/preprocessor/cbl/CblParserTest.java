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

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** CBL parser test */
public class CblParserTest {
  @Test
  void testXOpts() {
    CblLexer cblLexer = new CblLexer("      CBL XOPTS(DLI), NOADATA, XOPT(DLI)\n");
    CblParser cblParser = new CblParser(cblLexer);
    CblNode cbl = cblParser.cbl();
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
  CblLexer cblLexer = new CblLexer("CBL XOPTS(FLAG(I,W))\n");
  CblParser cblParser = new CblParser(cblLexer);
  CblNode cbl = cblParser.cbl();
  assertNode(cbl, 0, 20, 2);
  CblNode xopts = cbl.getChildren().get(1);
  // XOPTS(FLAG(I,W))
  assertNode(xopts, 4, 20, 4);

  // TODO: FLAG(I,W)
  assertNode(xopts.getChildren().get(2), 10, 19, 6);
}

  @Test
  void testCics() {
    CblLexer cblLexer = new CblLexer("CBL CICS(DLI)\n");
    CblParser cblParser = new CblParser(cblLexer);
    CblNode cbl = cblParser.cbl();
    assertNode(cbl, 0, 13, 2);
    CblNode cics = cbl.getChildren().get(1);
    // CBL CICS(DLI)
    assertNode(cics, 4, 13, 4);
    assertNode(cics.getChildren().get(2), 9, 12, 1);
  }

  private void assertNode(CblNode node, int startPos, int end, int childrenCount) {
    assertEquals(startPos, node.getStart(), "Start pos");
    assertEquals(end, node.getEnd(), "End pos");
    assertEquals(childrenCount, node.getChildren().size(), "Children count");
  }
}
