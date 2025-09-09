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

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSDialect;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS translator options position.
 * https://www.ibm.com/docs/en/cobol-zos/6.5.0?topic=statements-processcbl-statement
 */
class TestCicsTranslatorOptionsPosition {
  public static final String URI = "file://doc.cbl";

  @Test
  void testTou1() {
    CblParser parser = new CblParser("CICS(DLI)", URI, 0, 0);
    assertEquals("         ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    CompilerDirectiveNode node = parser.getDirectiveNodes().get(0);
    assertDirectiveNode("DLI", 0, 5, 8, node);
  }

  @Test
  void testTou2() {
    CblParser parser = new CblParser("CICS(DLI), NOADATA, CICS(DLI)", URI, 0, 0);
    assertEquals("           NOADATA           ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 0, 5, 8, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 0, 25, 28, parser.getDirectiveNodes().get(1));
  }

  @Test
  void testTou3() {
    CblParser parser = new CblParser("CICS(DLI), NOADATA", URI, 0, 0);
    assertEquals("           NOADATA", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 0, 5, 8, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou4() {
    CblParser parser = new CblParser("NOADATA, CICS(DLI)", URI, 0, 0);
    assertEquals("NOADATA           ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 0, 14, 17, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou7() {
    CblParser parser = new CblParser("NOADATA, CICS(DLI), NOADATA, CICS(DLI)", URI, 0, 0);
    assertEquals("NOADATA,            NOADATA           ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 0, 14, 17, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 0, 34, 37, parser.getDirectiveNodes().get(1));
  }

  @Test
  void testTou8() {
    CblParser parser =
        new CblParser("NOADATA, CICS(DLI), NOADATA, CICS(DLI)                       ", URI, 0, 0);
    assertEquals(
        "NOADATA,            NOADATA                                  ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 0, 14, 17, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 0, 34, 37, parser.getDirectiveNodes().get(1));
  }

  @Test
  void testTou9() {
    CblParser parser =
        new CblParser(
            "NOADATA, CICS(SPACE(2)), NOADATA, CICS(LINECOUNT(32))            ", URI, 0, 0);
    assertEquals(
        "NOADATA,                 NOADATA                                 ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("SPACE(2)", 0, 14, 22, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("LINECOUNT(32)", 0, 39, 52, parser.getDirectiveNodes().get(1));
  }

  @Test
  void testTou10() {
    CblParser parser =
        new CblParser(
            "NOADATA, CICS(FLAG(I)), NOADATA                                     ", URI, 0, 0);
    assertEquals(
        "NOADATA,                NOADATA                                     ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 0, 14, 21, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou11() {
    CblParser parser =
        new CblParser(
            "NOADATA, CICS(FLAG(I)), NOADATA                                   ", URI, 0, 0);
    assertEquals(
        "NOADATA,                NOADATA                                   ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 0, 14, 21, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou12() {
    CblParser parser = new CblParser("CICS('FLAG(I)'), NOADATA", URI, 0, 0);
    assertEquals("                 NOADATA", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 0, 6, 13, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou13() {
    CblParser parser = new CblParser("CICS(\"FLAG(I)), NOADATA", URI, 0, 0);
    assertEquals("                NOADATA", parser.extractCicsOptions());
    assertEquals(1, parser.getDiagnostics().size());
    assertEquals("\" expected.", parser.getDiagnostics().get(0).getSuggestion());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 0, 6, 13, parser.getDirectiveNodes().get(0));
  }

  @Test
  void testTou14() {
    CblParser parser = new CblParser("CICS (SP, 'EXCI')", URI, 0, 0);
    assertEquals("CICS (    'EXCI')", parser.extractCicsOptions());
    assertEquals(1, parser.getDiagnostics().size());
  }

  /**
   * Assert DirectiveNode
   *
   * @param text text
   * @param line line
   * @param start start
   * @param end end
   * @param node node
   */
  public static void assertDirectiveNode(
      String text, int line, int start, int end, CompilerDirectiveNode node) {
    Position startPos = new Position(line, start);
    Position endPos = new Position(line, end);
    Locality locality = Locality.builder().uri(URI).range(new Range(startPos, endPos)).build();
    assertEquals(locality, node.getLocality());
    assertEquals(CICSDialect.DIALECT_NAME, node.getDialect());
    assertEquals(text, node.getDirectiveText());
  }
}
