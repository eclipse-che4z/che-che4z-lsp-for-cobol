/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.ATN;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Test for {@link CICSErrorStrategy}
 */
@ExtendWith(MockitoExtension.class)
class CICSErrorStrategyTest {

    @Mock
    private MessageService messageService;
    private CICSErrorStrategy service;

    private InputMismatchException prepareInputMismatchException(Parser parser) {
        InputMismatchException exception = mock(InputMismatchException.class);
        Token token = mock(Token.class);

        IntervalSet intervalSet = mock(IntervalSet.class);

        when(exception.getOffendingToken()).thenReturn(token);
        when(exception.getExpectedTokens()).thenReturn(intervalSet);

        Vocabulary vocabulary = mock(Vocabulary.class);
        when(parser.getVocabulary()).thenReturn(vocabulary);
        when(intervalSet.toString(vocabulary)).thenReturn("");
        return exception;
    }

    @BeforeEach
    void init() {
        service = new CICSErrorStrategy(messageService);
    }

    @Test
    void testGetMessageService() {
        assertEquals(messageService, service.getMessageService());
    }

    @Test
    void testReportErrorUnrecognized() {
        Parser parser = mock(Parser.class);
        RecognitionException exception = mock(RecognitionException.class);

        service.reportError(parser, exception);
        verify(parser, times(1)).notifyErrorListeners(any(), any(), any());
    }

    @Test
    void testReportErrorNoViableAltException() {
        Parser parser = mock(Parser.class);
        RecognitionException exception = mock(NoViableAltException.class);

        service.reportError(parser, exception);
        verify(messageService, times(1)).getMessage(any(), any());
    }

    @Test
    void testReportErrorInputMismatchException() {
        Parser parser = mock(Parser.class);

        service.reportError(parser, prepareInputMismatchException(parser));
        verify(messageService, times(1)).getMessage(any(), any(), any());
    }

    @Test
    void testReportErrorFailedPredicateException() {
        Parser parser = new Parser(mock(TokenStream.class)) {
            @Override
            public String[] getTokenNames() {
                return new String[0];
            }

            @Override
            public String[] getRuleNames() {
                return new String[] {""};
            }

            @Override
            public String getGrammarFileName() {
                return null;
            }

            @Override
            public ATN getATN() {
                return null;
            }
        };
        FailedPredicateException exception = mock(FailedPredicateException.class);
        when(exception.getOffendingToken()).thenReturn(mock(Token.class));

        ParserRuleContext ctx = mock(ParserRuleContext.class);
        parser.setContext(ctx);

        service.reportError(parser, exception);
        verify(messageService, times(0)).getMessage(any(), any());
    }

    @Test
    void testReportInputMismatch() {
        Parser parser = mock(Parser.class);
        service.reportInputMismatch(parser, prepareInputMismatchException(parser));

        verify(messageService, times(1)).getMessage(any(), any(), any());
    }

    @Test
    void testReportNoViableAlternative() {
        Parser parser = mock(Parser.class);
        service.reportNoViableAlternative(parser, mock(NoViableAltException.class));

        verify(messageService, times(1)).getMessage(any(), any());
    }

    @Test
    void testReportUnwantedToken() {
        Parser parser = mock(Parser.class);
        Token token = mock(Token.class);
        when(parser.getCurrentToken()).thenReturn(token);
        when(token.getType()).thenReturn(Recognizer.EOF);
        service.reportUnwantedToken(parser);

        verify(messageService, times(1)).getMessage(any());
    }

    @Test
    void testReportMissingToken() {
        Parser parser = mock(Parser.class);
        Vocabulary vocabulary = mock(Vocabulary.class);
        IntervalSet intervalSet = mock(IntervalSet.class);

        when(parser.getExpectedTokens()).thenReturn(intervalSet);
        when(parser.getVocabulary()).thenReturn(vocabulary);
        when(intervalSet.toString(vocabulary)).thenReturn("");
        when(parser.getRuleInvocationStack()).thenReturn(ImmutableList.of(""));

        service.reportMissingToken(parser);

        verify(messageService, times(1)).getMessage(any(), any(), any());
    }

}
