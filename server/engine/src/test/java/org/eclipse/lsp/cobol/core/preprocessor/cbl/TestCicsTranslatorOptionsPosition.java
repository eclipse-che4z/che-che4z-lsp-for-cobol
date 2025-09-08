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
class TestCicsTranslatorOptionsPosition {
  public static final String URI = "file:///doc.cbl";

  @Test
  void testTou1() {
    DialectProcessingContext context = makeContext("000123 CBL CICS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("", context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    CompilerDirectiveNode node = result.get(0);
    assertDirectiveNode("DLI", 0, 16, 19, node);
  }

  @Test
  void testTou2() {
    DialectProcessingContext context = makeContext("000123 CBL CICS(DLI), NOADATA, CICS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL            NOADATA           ", context.getExtendedDocument().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 16, 19, result.get(0));
    assertDirectiveNode("DLI", 0, 36, 39, result.get(1));
  }

  @Test
  void testTou3() {
    DialectProcessingContext context = makeContext("000123 CBL CICS(DLI), NOADATA\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("000123 CBL            NOADATA", context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 16, 19, result.get(0));
  }

  @Test
  void testTou4() {
    DialectProcessingContext context = makeContext("000123 CBL NOADATA, CICS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("000123 CBL NOADATA           ", context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
  }

  @Test
  void testTou5() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, CICS(DLI)\n000123 CBL DATA, CICS(DLI)");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA           \n" + "000123 CBL DATA           ",
        context.getExtendedDocument().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 1, 22, 25, result.get(1));
  }

  @Test
  void testTou6() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, CICS(DLI)\n000124*COMMENT\n000123 CBL DATA, CICS(DLI)");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA           \n000124*COMMENT\n000123 CBL DATA, CICS(DLI)",
        context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
  }

  @Test
  void testTou7() {
    DialectProcessingContext context =
        makeContext("000123 CBL NOADATA, CICS(DLI), NOADATA, CICS(DLI)\n");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA,            NOADATA           ",
        context.getExtendedDocument().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 0, 45, 48, result.get(1));
  }

  @Test
  void testTou8() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, CICS(DLI), NOADATA, CICS(DLI)                       123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,            NOADATA                                  123456",
        context.getExtendedDocument().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 0, 45, 48, result.get(1));
  }

  @Test
  void testTou9() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, CICS(SPACE(2)), NOADATA, CICS(LINECOUNT(32))            123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                 NOADATA                                 123456",
        context.getExtendedDocument().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("SPACE(2)", 0, 25, 33, result.get(0));
    assertDirectiveNode("LINECOUNT(32)", 0, 50, 63, result.get(1));
  }

  @Test
  void testTou10() {
    DialectProcessingContext context =
        makeContext(
            "123456 CBL NOADATA, CICS(FLAG(I)), NOADATA                                    "
                + " 123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                NOADATA                                     123456",
        context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I)", 0, 25, 32, result.get(0));
  }

  @Test
  void testTou11() {
    DialectProcessingContext context =
        makeContext(
            "123456 PROCESS NOADATA, CICS(FLAG(I)), NOADATA                                  "
                + " 123456");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 PROCESS NOADATA,                NOADATA                                   123456",
        context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I)", 0, 29, 36, result.get(0));
  }

  @Test
  void testTou12() {
    DialectProcessingContext context = makeContext("123456 PROCESS CICS('FLAG(I)'), NOADATA");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 PROCESS                  NOADATA",
        context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I)", 0, 21, 28, result.get(0));
  }

  @Test
  void testTou13() {
    DialectProcessingContext context = makeContext("123456 PROCESS CICS(\"FLAG(I)), NOADATA");
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(1, diagnostics.size());
    assertEquals("\" expected.", diagnostics.get(0).getSuggestion());
    assertEquals(
        "123456 PROCESS                 NOADATA", context.getExtendedDocument().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I)", 0, 21, 28, result.get(0));
  }

  @Test
  void testTou14() {
    DialectProcessingContext context = makeContext("123456 CBL CICS (SP, 'EXCI')");
    List<SyntaxError> diagnostics = new ArrayList<>();
    TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(1, diagnostics.size());
    assertEquals("123456 CBL CICS (    'EXCI')", context.getExtendedDocument().toString());
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
