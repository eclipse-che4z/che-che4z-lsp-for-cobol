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

/** This test checks multiple comment entries are parsed and cleaned up correctly */
class TestCommentLines {
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
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
    GrammarPreprocessor grammarPreprocessor = mock(GrammarPreprocessor.class);
    MessageService messageService = mock(MessageService.class);
    CobolLineReader reader = new CobolLineReaderImpl(messageService);
    CobolLineWriter writer = new CobolLineWriterImpl();
    CobolLinesTransformation transformation = new ContinuationLineTransformation(messageService);
    CobolLineReWriter indicatorProcessor = new CobolLineIndicatorProcessorImpl();

    TextPreprocessor textPreprocessor =
        new TextPreprocessorImpl(
            grammarPreprocessor, reader, writer, transformation, indicatorProcessor);
    String actual =
        textPreprocessor.cleanUpCode(DOCUMENT_URI, TEXT).unwrap(accumulatedErrors::addAll).calculateExtendedText();
    assertEquals(EXPECTED, actual);
    assertTrue(accumulatedErrors.isEmpty());
  }
}
