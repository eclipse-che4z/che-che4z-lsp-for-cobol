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
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
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
    ExtendedDocument extDoc = new ExtendedDocument("000123 CBL CICS(DLI)\n", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("", extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    CompilerDirectiveNode node = result.get(0);
    assertDirectiveNode("DLI", 0, 16, 19, node);
  }

  @Test
  void testTou2() {
    ExtendedDocument extDoc =
        new ExtendedDocument("000123 CBL CICS(DLI), NOADATA, CICS(DLI)\n", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("000123 CBL            NOADATA           ", extDoc.getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 16, 19, result.get(0));
    assertDirectiveNode("DLI", 0, 36, 39, result.get(1));
  }

  @Test
  void testTou3() {
    ExtendedDocument extDoc = new ExtendedDocument("000123 CBL CICS(DLI), NOADATA\n", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("000123 CBL            NOADATA", extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 16, 19, result.get(0));
  }

  @Test
  void testTou4() {
    ExtendedDocument extDoc = new ExtendedDocument("000123 CBL NOADATA, CICS(DLI)\n", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("000123 CBL NOADATA           ", extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
  }

  @Test
  void testTou5() {
    ExtendedDocument extDoc =
        new ExtendedDocument("000123 CBL NOADATA, CICS(DLI)\n" + "000123 CBL DATA, CICS(DLI)", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA           \n" + "000123 CBL DATA           ",
        extDoc.getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 1, 22, 25, result.get(1));
  }

  @Test
  void testTou6() {
    ExtendedDocument extDoc =
        new ExtendedDocument(
            "000123 CBL NOADATA, CICS(DLI)\n" + "000124*COMMENT\n" + "000123 CBL DATA, CICS(DLI)",
            URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA           \n" + "000124*COMMENT\n" + "000123 CBL DATA, CICS(DLI)",
        extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
  }

  @Test
  void testTou7() {
    ExtendedDocument extDoc =
        new ExtendedDocument("000123 CBL NOADATA, CICS(DLI), NOADATA, CICS(DLI)\n", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "000123 CBL NOADATA,            NOADATA           ", extDoc.getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 0, 45, 48, result.get(1));
  }

  @Test
  void testTou8() {
    ExtendedDocument extDoc =
        new ExtendedDocument(
            "123456 CBL NOADATA, CICS(DLI), NOADATA, CICS(DLI)                       123456", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,            NOADATA                                  123456",
        extDoc.getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("DLI", 0, 25, 28, result.get(0));
    assertDirectiveNode("DLI", 0, 45, 48, result.get(1));
  }

  @Test
  void testTou9() {
    ExtendedDocument extDoc =
        new ExtendedDocument(
            "123456 CBL NOADATA, CICS(SPACE(2)), NOADATA, CICS(LINECOUNT(32))            123456",
            URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                 NOADATA                                 123456",
        extDoc.getCurrentText().toString());
    assertEquals(2, result.size());
    assertDirectiveNode("SPACE(2)", 0, 25, 33, result.get(0));
    assertDirectiveNode("LINECOUNT(32)", 0, 50, 63, result.get(1));
  }

  @Test
  void testTou10() {
    ExtendedDocument extDoc =
        new ExtendedDocument(
            "123456 CBL NOADATA, CICS(FLAG(I,W)), NOADATA                                    "
                + " 123456",
            URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 CBL NOADATA,                  NOADATA                                     123456",
        extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I,W)", 0, 25, 34, result.get(0));
  }

  @Test
  void testTou11() {
    ExtendedDocument extDoc =
        new ExtendedDocument(
            "123456 PROCESS NOADATA, CICS(FLAG(I,W)), NOADATA                                "
                + " 123456",
            URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals(
        "123456 PROCESS NOADATA,                  NOADATA                                 123456",
        extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I,W)", 0, 29, 38, result.get(0));
  }

  @Test
  void testTou12() {
    ExtendedDocument extDoc =
        new ExtendedDocument("123456 PROCESS CICS('FLAG(I,W)'), NOADATA", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("123456 PROCESS                    NOADATA", extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I,W)", 0, 21, 30, result.get(0));
  }

  @Test
  void testTou13() {
    ExtendedDocument extDoc =
        new ExtendedDocument("123456 PROCESS CICS(\"FLAG(I,W)), NOADATA", URI);
    DialectProcessingContext context = mockContext();
    when(context.getExtendedDocument()).thenReturn(extDoc);
    when(context.getProgramDocumentUri()).thenReturn(URI);
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("123456 PROCESS                   NOADATA", extDoc.getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("FLAG(I,W)", 0, 21, 30, result.get(0));
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

  private static DialectProcessingContext mockContext() {
    DialectProcessingContext ctx = mock(DialectProcessingContext.class);
    when(ctx.getLanguageId()).thenReturn("cobol");
    return ctx;
  }
}
