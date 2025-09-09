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

import static org.eclipse.lsp.cobol.core.preprocessor.cbl.TestCicsTranslatorOptionsPosition.assertDirectiveNode;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.TranslatorOptionsUtils;
import org.junit.jupiter.api.Test;

/** Test for TranslatorOptionsUtils */
public class TestTranslatorOptionsUtils {
  private static final String URI = "file://doc.cbl";

  @Test
  void testTou1() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(new ExtendedDocument("000123 CBL CICS(DLI)\n", URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
    TranslatorOptionsUtils.extractCompilerDirectives(context, new ArrayList<>());
    assertEquals("", context.getExtendedDocument().getCurrentText().toString());
  }

  @Test
  void testTou2() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument("000123 CBL CICS(DLI), NOADATA, CICS(DLI)\n", URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
    TranslatorOptionsUtils.extractCompilerDirectives(context, new ArrayList<>());
    assertEquals(
        "000123 CBL            NOADATA           ", context.getExtendedDocument().toString());
  }

  @Test
  void testTou5() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument(
                    "000123 CBL NOADATA, CICS(DLI)\n000123 CBL DATA, CICS(DLI)", URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
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
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument(
                    "000123 CBL NOADATA, CICS(DLI)\n000124*COMMENT\n000123 CBL DATA, CICS(DLI)",
                    URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
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
  void test5() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument(
                    "000123 CBL NOADATA, XOPTS(DLI)\n000123 CBL DATA, XOPTS(DLI)", URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
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
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument(
                    "000123 CBL NOADATA, XOPTS(DLI)\n000124*COMMENT\n000123 CBL DATA, XOPTS(DLI)",
                    URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
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
  void test18() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument("123456 CBL XOPT(COBOL2)\n" + "123457 CBL APOST", URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
    List<SyntaxError> diagnostics = new ArrayList<>();
    List<CompilerDirectiveNode> result =
        TranslatorOptionsUtils.extractCompilerDirectives(context, diagnostics);
    assertEquals(0, diagnostics.size());
    assertEquals("123457 CBL APOST", context.getExtendedDocument().getCurrentText().toString());
    assertEquals(1, result.size());
    assertDirectiveNode("COBOL2", 0, 16, 22, result.get(0));
  }

  @Test
  void test15() {
    DialectProcessingContext context =
        DialectProcessingContext.builder()
            .extendedDocument(
                new ExtendedDocument(
                    "\n"
                        + "123456 CBL XOPTS(FLAG(I) SQL, DLI),  NOADATA                                    "
                        + "    123456",
                    URI))
            .programDocumentUri(URI)
            .languageId(CobolLanguageId.COBOL.getId())
            .build();
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
}
