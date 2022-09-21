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

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.CobolLinesTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;

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
          + "           MOVE     45678 TO CONT-B.";

  @Test
  void test() {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    GrammarPreprocessor grammarPreprocessor = mock(GrammarPreprocessor.class);
    MessageService messageService = mock(MessageService.class);
    CobolLineReader reader = new CobolLineReaderImpl(messageService);
    CobolLineWriter writer = new CobolLineWriterImpl();
    CobolLinesTransformation transformation = new ContinuationLineTransformation(messageService);
    CobolLineReWriter indicatorProcessor = new CobolLineIndicatorProcessorImpl();

    TextPreprocessor textPreprocessor = new TextPreprocessorImpl(grammarPreprocessor, reader, writer, transformation, indicatorProcessor);
    TextTransformations textTransformations = textPreprocessor.cleanUpCode(DOCUMENT_URI, TEXT).unwrap(accumulatedErrors::addAll);
    assertEquals(EXPECTED, textTransformations.calculateExtendedText());
    assertTrue(accumulatedErrors.isEmpty());
    assertEquals(1, textTransformations.getReplacements().size());
  }
}
