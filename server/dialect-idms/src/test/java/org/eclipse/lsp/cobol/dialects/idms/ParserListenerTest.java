/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms;

import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.mock;

/**
 * Test for ParserListener
 */
class ParserListenerTest {
  @Test
  void test() {
    ParserListener parserListener = new ParserListener();
    parserListener.syntaxError(mock(Recognizer.class), new Object(), 5, 10, "message",
        mock(RecognitionException.class));
    List<SyntaxError> errors = parserListener.getErrors();

    assertEquals(1, errors.size());
    assertEquals(ErrorSource.PARSING, errors.get(0).getErrorSource());
    assertEquals("message", errors.get(0).getSuggestion());
    assertEquals(ErrorSeverity.ERROR, errors.get(0).getSeverity());
    assertNull(errors.get(0).getLocation());
  }
}
