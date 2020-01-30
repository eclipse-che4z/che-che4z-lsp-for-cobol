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
 */
package com.ca.lsp.core.cobol.strategy;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Collections;
import org.antlr.v4.runtime.FailedPredicateException;
import org.antlr.v4.runtime.InputMismatchException;
import org.antlr.v4.runtime.NoViableAltException;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.VocabularyImpl;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.junit.Test;

public class CobolErrorStrategyTest {
  @Test
  public void noViableAltExceptionTest() {
    Parser recognizer = mock(Parser.class);
    TokenStream stream = mock(TokenStream.class);
    Token token = mock(Token.class);

    NoViableAltException error =
        new NoViableAltException(recognizer, stream, token, token, null, null);
    CobolErrorStrategy strategy = new CobolErrorStrategy();

    when(recognizer.getInputStream()).thenReturn(stream);
    when(stream.getText(token, token)).thenReturn("text");
    when(recognizer.getRuleInvocationStack()).thenReturn(Collections.singletonList("rule"));

    strategy.reportError(recognizer, error);

    verify(recognizer).notifyErrorListeners(token, "No viable alternative at input text", error);
  }

  @Test
  public void inputMismatchExceptionTest() {
    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    InputMismatchException errorMock = mock(InputMismatchException.class);
    IntervalSet intervalSet = mock(IntervalSet.class);

    String[] vocabString = new String[] {"text", "to", "test"};
    VocabularyImpl vocab = new VocabularyImpl(vocabString, vocabString);
    CobolErrorStrategy strategy = new CobolErrorStrategy();

    when(recognizer.getRuleInvocationStack()).thenReturn(Collections.singletonList("rule"));
    when(recognizer.getVocabulary()).thenReturn(vocab);
    when(intervalSet.toString(vocab)).thenReturn("text");
    when(errorMock.getExpectedTokens()).thenReturn(intervalSet);
    when(errorMock.getOffendingToken()).thenReturn(token);

    strategy.reportError(recognizer, errorMock);
    verify(recognizer)
        .notifyErrorListeners(token, "Syntax error on '<0>' expected text", errorMock);
  }

  @Test(expected = NullPointerException.class)
  public void failedPredicateExceptionTest() {
    Parser recognizer = mock(Parser.class);
    FailedPredicateException errorMock = mock(FailedPredicateException.class);

    CobolErrorStrategy strategy = new CobolErrorStrategy();

    strategy.reportError(recognizer, errorMock);
  }

  @Test
  public void unknownErrorTest() {
    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    RecognitionException errorMock = mock(RecognitionException.class);

    CobolErrorStrategy strategy = new CobolErrorStrategy();

    strategy.reportError(recognizer, errorMock);

    verify(recognizer).notifyErrorListeners(null, null, errorMock);
  }
}
