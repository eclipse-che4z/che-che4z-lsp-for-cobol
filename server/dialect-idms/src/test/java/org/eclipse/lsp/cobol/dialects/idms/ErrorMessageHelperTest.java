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

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for {@link ErrorMessageHelper}
 */
class ErrorMessageHelperTest {

  @Test
  void testRetrieveInputForNoViableException() {
    TokenStream inputStream = mock(TokenStream.class);
    when(inputStream.getText(any(), any())).thenReturn("message");

    Parser recognizer = mock(Parser.class);
    when(recognizer.getInputStream()).thenReturn(inputStream);

    MessageService messageService = mock(MessageService.class);
    ErrorMessageHelper helper = new ErrorMessageHelper(messageService);

    String result = helper.retrieveInputForNoViableException(recognizer, mock(NoViableAltException.class));
    assertEquals("message", result);
  }

  @Test
  void testGetRule() {
    Parser recognizer = mock(Parser.class);
    when(recognizer.getRuleInvocationStack()).thenReturn(ImmutableList.of("rule"));
    String result = ErrorMessageHelper.getRule(recognizer);

    assertEquals("rule", result);
  }

  @Test
  void testGetExpectedText() {
    Parser recognizer = mock(Parser.class);
    IntervalSet intervalSet = mock(IntervalSet.class);

    when(recognizer.getVocabulary()).thenReturn(mock(Vocabulary.class));
    when(intervalSet.toString(any(Vocabulary.class))).thenReturn("message");
    when(recognizer.getExpectedTokens()).thenReturn(intervalSet);

    MessageService messageService = mock(MessageService.class);
    ErrorMessageHelper helper = new ErrorMessageHelper(messageService);

    String result = helper.getExpectedText(recognizer);
    assertEquals("message", result);
  }

  @Test
  void testGetUnwantedTokenMessage() {
    Parser recognizer = mock(Parser.class);
    IntervalSet intervalSet = mock(IntervalSet.class);

    when(recognizer.getVocabulary()).thenReturn(mock(Vocabulary.class));
    when(intervalSet.toString(any(Vocabulary.class))).thenReturn("tokens");
    when(recognizer.getExpectedTokens()).thenReturn(intervalSet);

    MessageService messageService = mock(MessageService.class);
    when(messageService.getMessage(any(), any(), any())).thenReturn("message");
    ErrorMessageHelper helper = new ErrorMessageHelper(messageService);
  }

  @Test
  void testGetInputMismatchMessage1() {
    MessageService messageService = mock(MessageService.class);
    Token token = mock(Token.class);
    when(messageService.getMessage(any(), any(), any())).thenReturn("message");

    checkMessage(messageService, token, "message");
  }

  @Test
  void testGetInputMismatchMessage2() {
    MessageService messageService = mock(MessageService.class);
    Token token = mock(Token.class);

    when(token.getType()).thenReturn(Recognizer.EOF);
    when(messageService.getMessage(any())).thenReturn("EOF message");

    checkMessage(messageService, token, "EOF message");

  }

  private void checkMessage(MessageService messageService, Token token, String message) {
    Parser recognizer = mock(Parser.class);
    IntervalSet intervalSet = mock(IntervalSet.class);

    when(recognizer.getVocabulary()).thenReturn(mock(Vocabulary.class));
    when(intervalSet.toString(any(Vocabulary.class))).thenReturn("tokens");

    InputMismatchException exception = mock(InputMismatchException.class);
    when(exception.getExpectedTokens()).thenReturn(intervalSet);

    String offendingTokens = "";
    ErrorMessageHelper helper = new ErrorMessageHelper(messageService);

    String result = helper.getInputMismatchMessage(recognizer, exception, token, offendingTokens);
    assertEquals(message, result);
  }

}
