/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.dialects.ibm;

import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.analyze;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This test checks multiple comment entries are parsed and cleaned up correctly */
class TestCommentLines {
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
  public static final String FLOATING_COMMENT_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.     \n"
          + "           DISPLAY 'scn 1 *>'*> is this valid comment but with warning\n"
          + "           DISPLAY 'scn 1 *>' *> is this valid comment without warning\n"
          + "           DISPLAY 'scn 2 *>'*> is this valid comment but with warning\n"
          + "           DISPLAY 'scn 2 *>' *> is this valid comment without warning\n"
          + "           STOP RUN.";
  private static final String TEXT =
      "      * Copyright (c) 2021 Broadcom.\n"
          + "      * The term Broadcom  refers to Broadcom Inc. and/or its subsidiaries.\n"
          + "000010 IDENTIFICATION DIVISION.                                         qweasdzx\n"
          + "000020*    Comment line                                                 qweasdzx\n"
          + "\n"
          + "000022*> Floating comment                                               qweasdzx\n"
          + "000025 *> 25 Floating comment  w/o space      qweasdzx\n"
          + "000030 PROGRAM-ID. comments.    *> Floating comment\n";
  private static final String EXPECTED =
      "       \n"
          + "       \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       PROGRAM-ID. comments.    ";

  @Test
  void test() {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    MessageService messageService = mock(MessageService.class);
    CodeLayoutStore store = mock(CodeLayoutStore.class);
    when(store.getCodeLayout()).thenReturn(Optional.empty());

    CleanerPreprocessor textPreprocessor = new IbmTextPreprocessor(messageService, store);
    String actual =
        textPreprocessor
            .cleanUpCode(DOCUMENT_URI, TEXT)
            .unwrap(accumulatedErrors::addAll)
            .toString();
    assertEquals(EXPECTED, actual);
    assertTrue(accumulatedErrors.isEmpty());
  }

  @Test
  void testFloatingComment() {
    AnalysisResult actual =
        analyze(
            UseCase.builder()
                .documentUri(DOCUMENT_URI)
                .text(FLOATING_COMMENT_TEXT)
                .cicsTranslator(true)
                .dialects(Collections.emptyList())
                .sqlBackend(SQLBackend.DB2_SERVER)
                .build(),
            CobolLanguageId.COBOL);
    List<Diagnostic> diagnostics = actual.getDiagnostics().get(DOCUMENT_URI);
    assertEquals(diagnostics.size(), 2);
    Diagnostic expectedFirstDiagnostics =
        new Diagnostic(
            new Range(new Position(6, 28), new Position(6, 29)),
            "Missing blank before inline comment",
            DiagnosticSeverity.Warning,
            ErrorSource.PREPROCESSING.getText(),
            "inlineComment.missingBlank");
    Diagnostic expectedLastDiagnostics =
        new Diagnostic(
            new Range(new Position(8, 28), new Position(8, 29)),
            "Missing blank before inline comment",
            DiagnosticSeverity.Warning,
            ErrorSource.PREPROCESSING.getText(),
            "inlineComment.missingBlank");

    assertEquals(expectedFirstDiagnostics, diagnostics.get(0));
    assertEquals(expectedLastDiagnostics, diagnostics.get(1));
  }
}
