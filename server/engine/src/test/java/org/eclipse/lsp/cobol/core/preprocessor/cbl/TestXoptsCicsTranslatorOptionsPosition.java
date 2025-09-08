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

import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSDialect;
import org.eclipse.lsp.cobol.implicitDialects.cics.TranslatorOptionsUtils;
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
    DialectProcessingContext context = makeContext("000123 CBL XOPTS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("", context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 17, 20, result.get(0));
  }

  @Test
  void test2() {
    DialectProcessingContext context = makeContext("000123 CBL XOPTS(DLI), NOADATA, XOPTS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL             NOADATA            ",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 17, 20, result.get(0));
    assertDirectiveNode("DLI", 0, 38, 41, result.get(1));
  }

  @Test
  void test3() {
    DialectProcessingContext context = makeContext("000123 CBL XOPTS(DLI), NOADATA\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL             NOADATA",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 17, 20, result.get(0));
  }

  @Test
  void test4() {
    DialectProcessingContext context = makeContext("000123 CBL NOADATA, XOPTS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA            ",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 26, 29, result.get(0));
  }

  @Test
  void test5() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, XOPTS(DLI)\n000123 CBL DATA, XOPTS(DLI)");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA            \n" + "000123 CBL DATA            ",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 26, 29, result.get(0));
    assertDirectiveNode("DLI", 1, 23, 26, result.get(1));
  }

  @Test
  void test6() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, XOPTS(DLI)\n000124*COMMENT\n000123 CBL DATA, XOPTS(DLI)");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA            \n" + "000124*COMMENT\n" + "000123 CBL DATA, XOPTS(DLI)",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 26, 29, result.get(0));
  }

  @Test
  void test7() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, XOPTS(DLI), NOADATA, XOPTS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA,             NOADATA            ",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 26, 29, result.get(0));
    assertDirectiveNode("DLI", 0, 47, 50, result.get(1));
  }

  @Test
  void test8() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(DLI), NOADATA, XOPTS(DLI)                       123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,             NOADATA                                   123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 26, 29, result.get(0));
    assertDirectiveNode("DLI", 0, 47, 50, result.get(1));
  }

  @Test
  void test9() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(SPACE( 1)), NOADATA, XOPTS(LINECOUNT(32))            123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                   NOADATA                                  123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("SPACE(1)", 0, 26, 35, result.get(0));
    assertDirectiveNode("LINECOUNT(32)", 0, 53, 66, result.get(1));
  }

  @Test
  void test10() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(FLAG(I)), NOADATA                                      "
                + " 123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                 NOADATA                                       123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I)", 0, 26, 33, result.get(0));
  }

  @Test
  void test11() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(FLAG(I) LC(10)), NOADATA                                    "
                + "     123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                        NOADATA                                        "
            + " 123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("FLAG(I)", 0, 26, 33, result.get(0));
    assertDirectiveNode("LC(10)", 0, 34, 40, result.get(1));
  }

  @Test
  void test12() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(FLAG(I), DLI), NOADATA                                      "
                + "   123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                      NOADATA                                        "
            + " 123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("FLAG(I)", 0, 26, 33, result.get(0));
    assertDirectiveNode("DLI", 0, 35, 38, result.get(1));
  }

  @Test
  void test13() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, XOPTS(FLAG(I), LC(12) DLI), NOADATA                               "
                + "        123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                             NOADATA                                   "
            + "    123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(3, result.size());
    assertDirectiveNode("FLAG(I)", 0, 26, 33, result.get(0));
    assertDirectiveNode("LC(12)", 0, 35, 41, result.get(1));
    assertDirectiveNode("DLI", 0, 42, 45, result.get(2));
  }

  @Test
  void test14() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL XOPTS(FLAG(I), LC(12) DLI), NOADATA                                      "
                + " 123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL                             NOADATA                                      "
            + " 123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(3, result.size());
    assertDirectiveNode("FLAG(I)", 0, 17, 24, result.get(0));
    assertDirectiveNode("LC(12)", 0, 26, 32, result.get(1));
    assertDirectiveNode("DLI", 0, 33, 36, result.get(2));
  }

  @Test
  void test15() {
    DialectProcessingContext context =
        makeContext(
            "\n"
                + "123456 CBL XOPTS(FLAG(I) SQL, DLI),  NOADATA                                    "
                + "    123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "\n"
            + "123456 CBL XOPTS(        SQL     ),  NOADATA                                       "
            + " 123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("FLAG(I)", 1, 17, 24, result.get(0));
    assertDirectiveNode("DLI", 1, 30, 33, result.get(1));
  }

  @Test
  void test16() {
    DialectProcessingContext context =
        makeContext("123456 CBL XOPTS(), NOADATA                                     123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL          NOADATA                                     123456",
        context.getExtendedDocument().getCurrentText().toString());
    assertTrue(result.isEmpty());
  }

  @Test
  void test17() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL XOPTS(FLAG(I), DLI)                                                      "
                + " 123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("", context.getExtendedDocument().getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("FLAG(I)", 0, 17, 24, result.get(0));
    assertDirectiveNode("DLI", 0, 26, 29, result.get(1));
  }

  @Test
  void test18() {
    DialectProcessingContext context =
        makeContext("123456 CBL XOPT(COBOL2)\n" + "123457 CBL APOST");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("123457 CBL APOST", context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("COBOL2", 0, 16, 22, result.get(0));
  }

  private static void assertDirectiveNode(
      String text, int line, int start, int end, CompilerDirectiveNode node) {
    Position startPos = new Position(line, start);
    Position endPos = new Position(line, end);
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
