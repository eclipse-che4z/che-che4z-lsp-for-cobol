/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.strategy;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.core.strategy.ErrorMessageHelper.*;
import static org.mockito.Mockito.*;

/** Tests {@link ErrorMessageHelper} class. */
class ErrorMessageHelperTest {
  private final MessageService messageService = mock(MessageService.class);

  @Test
  void getInputMismatchMessage_whenTokenTypeNotEOF() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    InputMismatchException mockInputMismatchExp = mock(InputMismatchException.class);
    Vocabulary vocabulary = mock(Vocabulary.class);
    IntervalSet interval = mock(IntervalSet.class);
    Token token = mock(Token.class);

    when(token.getType()).thenReturn(2);
    when(recognizer.getVocabulary()).thenReturn(vocabulary);
    when(mockInputMismatchExp.getExpectedTokens()).thenReturn(interval);
    when(interval.toString(any(Vocabulary.class))).thenReturn("INTERVAL");

    errorMessageHelper.getInputMismatchMessage(
        recognizer, mockInputMismatchExp, token, "OFFENDING_TOKEN");
    verify(messageService).getMessage(REPORT_INPUT_MISMATCH, "OFFENDING_TOKEN", "INTERVAL");
  }

  @Test
  void getInputMismatchMessage_whenTokenTypeIsEOF() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    InputMismatchException mockInputMismatchExp = mock(InputMismatchException.class);
    Token token = mock(Token.class);

    when(token.getType()).thenReturn(-1);

    errorMessageHelper.getInputMismatchMessage(
        recognizer, mockInputMismatchExp, token, "OFFENDING_TOKEN");
    verify(messageService).getMessage(END_OF_FILE_MESSAGE);
  }

  @Test
  void getUnwantedTokenMessage_whenTokenTypeIsEOF() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);

    when(token.getType()).thenReturn(-1);

    errorMessageHelper.getUnwantedTokenMessage(recognizer, token);
    verify(messageService).getMessage(END_OF_FILE_MESSAGE);
  }

  @Test
  void getUnwantedTokenMessage_whenTokenTypeNotEOF_andTokenInSpecialToken_andInlineStatement() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    ParserRuleContext parserRuleContext = mock(ParserRuleContext.class);

    when(token.getType()).thenReturn(2);
    when(token.getText()).thenReturn("EXEC_SQL");
    when(recognizer.getContext()).thenReturn(parserRuleContext);
    when(parserRuleContext.getRuleIndex()).thenReturn(CobolParser.RULE_performInlineStatement);

    errorMessageHelper.getUnwantedTokenMessage(recognizer, token);
    verify(messageService).getMessage(PERFORM_MISSING_END, "'EXEC SQL'");
  }

  @Test
  void getUnwantedTokenMessage_whenTokenTypeNotEOF_andTokenInSpecialToken() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    Token token = mock(Token.class);
    ParserRuleContext parserRuleContext = mock(ParserRuleContext.class);
    Vocabulary vocabulary = mock(Vocabulary.class);
    IntervalSet interval = mock(IntervalSet.class);

    when(token.getType()).thenReturn(2);
    when(token.getText()).thenReturn("EXEC_SQL");
    when(recognizer.getContext()).thenReturn(parserRuleContext);
    when(parserRuleContext.getRuleIndex()).thenReturn(CobolParser.RULE_modifyMapFieldOptionsClause);
    when(recognizer.getVocabulary()).thenReturn(vocabulary);
    when(recognizer.getExpectedTokens()).thenReturn(interval);
    when(interval.toString(any(Vocabulary.class))).thenReturn("INTERVAL");

    errorMessageHelper.getUnwantedTokenMessage(recognizer, token);
    verify(messageService).getMessage(REPORT_UNWANTED_TOKEN, "'EXEC SQL'", "INTERVAL");
  }

  @Test
  void getExpectedText() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    IntervalSet interval = mock(IntervalSet.class);
    Vocabulary vocabulary = mock(Vocabulary.class);

    when(recognizer.getExpectedTokens()).thenReturn(interval);
    when(recognizer.getVocabulary()).thenReturn(vocabulary);
    when(interval.toString(any(Vocabulary.class))).thenReturn("INTERVAL");

    String expectedText = errorMessageHelper.getExpectedText(recognizer);
    Assertions.assertEquals("INTERVAL", expectedText);
  }

  @Test
  void getRule() {
    Parser recognizer = mock(Parser.class);
    when(recognizer.getRuleInvocationStack()).thenReturn(ImmutableList.of("TEST"));
    String rule = ErrorMessageHelper.getRule(recognizer);
    Assertions.assertEquals("TEST", rule);
  }

  @Test
  void retrieveInputForNoViableException_whenTokenStreamIsNull() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    NoViableAltException mockException = mock(NoViableAltException.class);
    String returnedStr =
        errorMessageHelper.retrieveInputForNoViableException(recognizer, mockException);
    Assertions.assertEquals("<unknown input>", returnedStr);
  }

  @Test
  void retrieveInputForNoViableException_whenTokenStreamIsNotNull() {
    ErrorMessageHelper errorMessageHelper = new ErrorMessageHelper(messageService);

    Parser recognizer = mock(Parser.class);
    TokenStream tokenStream = mock(TokenStream.class);
    NoViableAltException mockException = mock(NoViableAltException.class);

    when(recognizer.getInputStream()).thenReturn(tokenStream);
    when(mockException.getStartToken()).thenReturn(mock(Token.class));
    when(mockException.getOffendingToken()).thenReturn(mock(Token.class));
    when(tokenStream.getText(any(Token.class), any(Token.class))).thenReturn("INPUT TEXT");
    String returnedStr =
        errorMessageHelper.retrieveInputForNoViableException(recognizer, mockException);

    Assertions.assertEquals("INPUT TEXT", returnedStr);
  }
}
