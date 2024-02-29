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

package org.eclipse.lsp.cobol.core.preprocessor;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.junit.jupiter.api.Test;

/** This test checks line concatenation */
class TestLinesConcatenation {
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.                                         NC2054.2\n"
          + "000200 PROGRAM-ID.                                                      NC2054.2\n"
          + "000300     NC205A.                                                      NC2054.2\n"
          + "003800 DATA DIVISION.                                                   NC2054.2\n"
          + "004300 WORKING-STORAGE SECTION.                                         NC2054.2\n"
          + "005400 77  CONT-B                       PICTURE S9(5)V9(5) VALUE ZERO.  NC2054.2\n"
          + "028300 PROCEDURE DIVISION.                                              NC2054.2\n"
          + "040700     MOVE     4                                                   NC2054.2\n"
          + "040800-             5                                                   NC2054.2\n"
          + "040900-             6                                                   NC2054.2\n"
          + "041000-             7                                                   NC2054.2\n"
          + "041100-             8 TO CONT-B.                                        NC2054.2";

  private static final String EXPECTED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.\n"
          + "           NC205A.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77  CONT-B                       PICTURE S9(5)V9(5) VALUE ZERO.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE     45678 TO CONT-B.\n";

  @Test
  void test() {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    MessageService messageService = mock(MessageService.class);
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
    when(layoutStore.updateCodeLayout()).thenReturn(l -> {});

    CobolLineReader reader = new CobolLineReaderImpl(messageService, layoutStore);
    CobolLineWriter writer = new CobolLineWriterImpl(layoutStore);
    CobolLinesTransformation transformation = new ContinuationLineTransformation(messageService, layoutStore);
    CobolLineReWriter indicatorProcessor = new CobolLineIndicatorProcessorImpl(layoutStore);

    TextPreprocessor textPreprocessor = new TextPreprocessorImpl(reader, writer, transformation, indicatorProcessor);
    ExtendedText extendedText = textPreprocessor.cleanUpCode(DOCUMENT_URI, TEXT).unwrap(accumulatedErrors::addAll);
    assertEquals(EXPECTED, extendedText.toString());
    assertTrue(accumulatedErrors.isEmpty());
  }
}
