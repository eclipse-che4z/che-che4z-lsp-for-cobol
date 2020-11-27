/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.cobol.core.strategy;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Collections;
import java.util.MissingResourceException;

import static org.mockito.Mockito.*;

/**
 * Testing that the errors that are recognized at the end of file analysis are showing messages as
 * intended
 */
class CobolErrorStrategyTest {
  private MessageService messageService = mock(MessageService.class);

  @Test
  void noViableAltExceptionTest() {
    Parser recognizer = mock(Parser.class);
    TokenStream stream = mock(TokenStream.class);
    Token token = mock(Token.class);

    NoViableAltException error =
        new NoViableAltException(recognizer, stream, token, token, null, null);
    CobolErrorStrategy strategy = new CobolErrorStrategy(messageService);
    when(messageService.getMessage(
            matches("ErrorStrategy.rulereportNoViableAlternative"), anyString()))
        .thenThrow(MissingResourceException.class);
    when(messageService.getMessage(matches("ErrorStrategy.reportNoViableAlternative"), anyString()))
        .thenReturn("No viable alternative at input text");

    when(recognizer.getInputStream()).thenReturn(stream);
    when(stream.getText(token, token)).thenReturn("text");
    when(recognizer.getRuleInvocationStack()).thenReturn(Collections.singletonList("rule"));

    strategy.reportError(recognizer, error);

    verify(recognizer).notifyErrorListeners(token, "No viable alternative at input text", error);
  }

  @Test
  void inputMismatchExceptionTest() {
    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    InputMismatchException errorMock = mock(InputMismatchException.class);
    IntervalSet intervalSet = mock(IntervalSet.class);

    String[] vocabString = new String[] {"text", "to", "test"};
    VocabularyImpl vocab = new VocabularyImpl(vocabString, vocabString);
    CobolErrorStrategy strategy = new CobolErrorStrategy(messageService);

    when(recognizer.getRuleInvocationStack()).thenReturn(Collections.singletonList("rule"));
    when(recognizer.getVocabulary()).thenReturn(vocab);
    when(intervalSet.toString(vocab)).thenReturn("text");
    when(errorMock.getExpectedTokens()).thenReturn(intervalSet);
    when(errorMock.getOffendingToken()).thenReturn(token);
    when(messageService.getMessage(
            matches("ErrorStrategy.rulereportInputMismatch"), anyString(), anyString()))
        .thenThrow(MissingResourceException.class);
    when(messageService.getMessage(
            matches("ErrorStrategy.reportInputMismatch"), anyString(), anyString()))
        .thenReturn("Syntax error on '<0>' expected text");
    strategy.reportError(recognizer, errorMock);
    verify(recognizer)
        .notifyErrorListeners(token, "Syntax error on '<0>' expected text", errorMock);
  }

  @Test
  void failedPredicateExceptionTest() throws NullPointerException {
    Assertions.assertThrows(
        NullPointerException.class,
        () -> {
          Parser recognizer = mock(Parser.class);
          FailedPredicateException errorMock = mock(FailedPredicateException.class);

          CobolErrorStrategy strategy = new CobolErrorStrategy(messageService);

          strategy.reportError(recognizer, errorMock);
        });
  }

  @Test
  void unknownErrorTest() {
    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    RecognitionException errorMock = mock(RecognitionException.class);

    CobolErrorStrategy strategy = new CobolErrorStrategy(messageService);

    strategy.reportError(recognizer, errorMock);

    verify(recognizer).notifyErrorListeners(null, null, errorMock);
  }
}
