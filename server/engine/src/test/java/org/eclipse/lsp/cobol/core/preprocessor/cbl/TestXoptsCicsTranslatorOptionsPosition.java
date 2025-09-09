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

import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
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
class TestXoptsCicsTranslatorOptionsPosition {
  public static final String URI = "file:///doc.cbl";

  @Test
  void test1() {
    CblParser parser = new CblParser("XOPTS(DLI)", URI, 0, 0);
    assertEquals("          ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 6, 9, parser.getDirectiveNodes().get(0));
  }

  @Test
  void test2() {
    CblParser parser = new CblParser("XOPTS(DLI), NOADATA, XOPTS(DLI)", URI, 0, 0);
    assertEquals("            NOADATA            ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 6, 9, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 27, 30, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test3() {
    CblParser parser = new CblParser("XOPTS(DLI), NOADATA", URI, 0, 0);
    assertEquals("            NOADATA", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 6, 9, parser.getDirectiveNodes().get(0));
  }

  @Test
  void test4() {
    CblParser parser = new CblParser("NOADATA, XOPTS(DLI)", URI, 0, 0);
    assertEquals("NOADATA            ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 15, 18, parser.getDirectiveNodes().get(0));
  }

  @Test
  void test7() {
    CblParser parser = new CblParser("NOADATA, XOPTS(DLI), NOADATA, XOPTS(DLI)", URI, 0, 0);
    assertEquals("NOADATA,             NOADATA            ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 15, 18, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 36, 39, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test8() {
    CblParser parser =
        new CblParser("NOADATA, XOPTS(DLI), NOADATA, XOPTS(DLI)                       ", URI, 0, 0);
    assertEquals(
        "NOADATA,             NOADATA                                   ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("DLI", 15, 18, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 36, 39, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test9() {
    CblParser parser =
        new CblParser(
            "NOADATA, XOPTS(SPACE( 1)), NOADATA, XOPTS(LINECOUNT(32))            ", URI, 0, 0);
    assertEquals(
        "NOADATA,                   NOADATA                                  ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("SPACE(1)", 15, 24, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("LINECOUNT(32)", 42, 55, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test10() {
    CblParser parser =
        new CblParser(
            "NOADATA, XOPTS(FLAG(I)), NOADATA                                       ", URI, 0, 0);
    assertEquals(
        "NOADATA,                 NOADATA                                       ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(1, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 15, 22, parser.getDirectiveNodes().get(0));
  }

  @Test
  void test11() {
    CblParser parser =
        new CblParser(
            "NOADATA, XOPTS(FLAG(I) LC(10)), NOADATA                                         ",
            URI,
            0,
            0);
    assertEquals(
        "NOADATA,                        NOADATA                                         ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 15, 22, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("LC(10)", 23, 29, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test12() {
    CblParser parser =
        new CblParser(
            "NOADATA, XOPTS(FLAG(I), DLI), NOADATA                                         ",
            URI,
            0,
            0);
    assertEquals(
        "NOADATA,                      NOADATA                                         ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 15, 22, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 24, 27, parser.getDirectiveNodes().get(1));
  }

  @Test
  void test13() {
    CblParser parser =
        new CblParser(
            "NOADATA, XOPTS(FLAG(I), LC(12) DLI), NOADATA                                       ",
            URI,
            0,
            0);
    assertEquals(
        "NOADATA,                             NOADATA                                       ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(3, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 15, 22, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("LC(12)", 24, 30, parser.getDirectiveNodes().get(1));
    assertDirectiveNode("DLI", 31, 34, parser.getDirectiveNodes().get(2));
  }

  @Test
  void test14() {
    CblParser parser =
        new CblParser(
            "XOPTS(FLAG(I), LC(12) DLI), NOADATA                                       ",
            URI,
            0,
            0);
    assertEquals(
        "                            NOADATA                                       ",
        parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(3, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 6, 13, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("LC(12)", 15, 21, parser.getDirectiveNodes().get(1));
    assertDirectiveNode("DLI", 22, 25, parser.getDirectiveNodes().get(2));
  }

  @Test
  void test16() {
    CblParser parser =
        new CblParser("XOPTS(), NOADATA                                     ", URI, 0, 0);
    assertEquals(
        "         NOADATA                                     ", parser.extractCicsOptions());
    assertEquals(0, parser.getDiagnostics().size());
    assertTrue(parser.getDirectiveNodes().isEmpty());
  }

  @Test
  void test17() {
    CblParser parser =
        new CblParser(
            "XOPTS(FLAG(I), DLI)                                                       ",
            URI,
            0,
            0);
    assertEquals("", parser.extractCicsOptions().trim());
    assertEquals(0, parser.getDiagnostics().size());
    assertEquals(2, parser.getDirectiveNodes().size());
    assertDirectiveNode("FLAG(I)", 6, 13, parser.getDirectiveNodes().get(0));
    assertDirectiveNode("DLI", 15, 18, parser.getDirectiveNodes().get(1));
  }

  private static void assertDirectiveNode(
      String text, int start, int end, CompilerDirectiveNode node) {
    Position startPos = new Position(0, start);
    Position endPos = new Position(0, end);
    Locality locality = Locality.builder().uri(URI).range(new Range(startPos, endPos)).build();
    assertEquals(locality, node.getLocality());
    assertEquals(CICSDialect.DIALECT_NAME, node.getDialect());
    assertEquals(text, node.getDirectiveText());
  }

  private static DialectProcessingContext makeContext(String text) {
    return DialectProcessingContext.builder()
        .extendedDocument(new ExtendedDocument(text, URI))
        .programDocumentUri(URI)
        .languageId(CobolLanguageId.COBOL.getId())
        .build();
  }
}
