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
package org.eclipse.lsp.cobol.dialects.idms;

import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * Test for {@link DialectParserListener}
 */
@ExtendWith(MockitoExtension.class)
class DialectParserListenerTest {

  private DialectParserListener service;

  @BeforeEach
  void init() {
    service = new DialectParserListener("uri");
  }

  @Test
  void testSyntaxError() {
    CommonToken offendedSymbol = mock(CommonToken.class);
    RecognitionException exception = mock(RecognitionException.class);
    Recognizer recognizer = mock(Recognizer.class);

    service.syntaxError(recognizer, offendedSymbol, 1, 2, "msg", exception);
    List<SyntaxError> result = service.getErrors();
    assertEquals(1, result.size());
  }

}
