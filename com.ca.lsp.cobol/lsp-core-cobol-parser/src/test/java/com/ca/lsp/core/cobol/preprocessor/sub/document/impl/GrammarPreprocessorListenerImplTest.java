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

package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.CopybookModel;
import com.ca.lsp.core.cobol.model.DocumentMapping;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.utils.CustomToken;
import com.google.inject.Provider;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.parser.CobolPreprocessor.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Ths test checks the logic of the {@link GrammarPreprocessorListenerImpl} */
class GrammarPreprocessorListenerImplTest {
  private static final String DOCUMENT_URI = "document.cbl";
  private static final String SYNC_TYPE = "DID_OPEN";

  @Test
  void testCopyStatementNoReplacingPositive() {
    // given
    CopyStatementContext context = mock(CopyStatementContext.class);
    CopySourceContext copySourceContext = mock(CopySourceContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);
    CopybookResolution resolution = mock(CopybookResolution.class);
    Provider<CopybookResolution> resolutions = () -> resolution;
    String content = "             10 CHILD1 PIC 9.";
    String copyUri = "file://COPYNAME.CPY";
    String copyNameCapitalized = "COPYNAME";
    String copyNameOriginal = "copyname";
    Token copybookNameToken = new CustomToken(10, 20, copyNameOriginal, 100, 101);
    CopybookModel model = new CopybookModel(copyNameCapitalized, copyUri, content);

    when(context.copySource()).thenReturn(copySourceContext);
    when(copySourceContext.cobolWord()).thenReturn(cobolWordContext);
    when(copySourceContext.getStart()).thenReturn(copybookNameToken);
    when(copySourceContext.getStop()).thenReturn(copybookNameToken);
    when(cobolWordContext.getText()).thenReturn(copyNameOriginal);
    when(context.replacingPhrase()).thenReturn(null);
    when(resolution.resolve(copyNameCapitalized, DOCUMENT_URI, SYNC_TYPE)).thenReturn(model);

    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);
    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    when(tokenUtils.retrieveHiddenTextToLeft(ArgumentMatchers.anyInt(), eq(tokens)))
        .thenReturn(" ");

    when(tokenUtils.notEOF(any(TerminalNode.class))).thenReturn(true);

    ReplacingService replacingService = mock(ReplacingService.class);
    when(replacingService.applyReplacing(any(String.class), any(List.class), eq(tokens)))
        .thenReturn(content);

    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    when(preprocessor.process(eq(copyUri), any(String.class), any(ArrayDeque.class), eq(SYNC_TYPE)))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedDocument(
                    content,
                    new NamedSubContext(),
                    Map.of(copyUri, new DocumentMapping(List.of(), Map.of()))),
                List.of()));
    NamedSubContext expectedCopybooks = new NamedSubContext();
    expectedCopybooks.define(copyNameCapitalized, new Position(copyUri, 0, -1, 1, 0, null));
    expectedCopybooks.addUsage(
        copyNameCapitalized, new Position(DOCUMENT_URI, 100, 101, 10, 20, copyNameOriginal));
    ExtendedDocument expected =
        new ExtendedDocument(
            " 01 PARENT .*>CPYENTER<URI>" + copyUri + "</URI>" + content + "\r\n*>CPYEXIT\r\n",
            expectedCopybooks,
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(List.of(), Map.of(2, 4)),
                copyUri,
                new DocumentMapping(List.of(), Map.of())));

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            new ArrayDeque<>(),
            SYNC_TYPE,
            tokenUtils,
            preprocessor,
            resolutions,
            replacingService);

    listener.visitTerminal(node("01", 0));
    listener.visitTerminal(node("PARENT", 1));
    listener.visitTerminal(node(".", 2));
    listener.enterCopyStatement(context);
    listener.visitTerminal(node("COPY", 3));
    listener.visitTerminal(node(copyNameOriginal, 4));
    listener.visitTerminal(node(".\r\n", 5));
    listener.exitCopyStatement(context);

    ExtendedDocument actual = listener.getResult();
    // then
    assertEquals(expected, actual);
    assertTrue(listener.getErrors().isEmpty());
    listener.getResult();
  }

  @Test
  void testCompilerOptionsExcluded() {
    CompilerOptionsContext context = mock(CompilerOptionsContext.class);

    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);
    when(context.getSourceInterval()).thenReturn(new Interval(1, 4));

    when(tokenUtils.retrieveHiddenTextToLeft(ArgumentMatchers.anyInt(), eq(tokens))).thenReturn("");
    when(tokenUtils.retrieveHiddenTextToLeft(eq(7), eq(tokens))).thenReturn(" ");

    when(tokenUtils.notEOF(any(TerminalNode.class))).thenReturn(true);

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI, tokens, null, null, tokenUtils, null, null, null);

    listener.enterCompilerOptions(context);
    listener.visitTerminal(node("PROCESS", 1));
    listener.visitTerminal(node("NODYNAM", 3));
    listener.visitTerminal(node("\r\n", 4));
    listener.exitCompilerOptions(context);
    listener.visitTerminal(node("IDENTIFICATION", 5));
    listener.visitTerminal(node("DIVISION", 7));
    listener.visitTerminal(node(".", 8));

    ExtendedDocument expected =
        new ExtendedDocument(
            "IDENTIFICATION DIVISION.",
            new NamedSubContext(),
            Map.of(DOCUMENT_URI, new DocumentMapping(List.of(), Map.of(0, 5))));
    ExtendedDocument actual = listener.getResult();

    assertEquals(expected, actual);
    assertTrue(listener.getErrors().isEmpty());
    listener.getResult();
  }

  /**
   * Check the entire logic of BufferedTokenStream#visitTerminal with all the conditional statement
   */
  @Test
  void testVisitTerminal() {

    TerminalNode node1 = node("IDENTIFICATION", 0);
    TerminalNode node2 = node(" ", 1);
    TerminalNode node3 = node("DIVISION", 2);
    TerminalNode node4 = node(".\r\n", 3);
    TerminalNode node5 = node("<EOF>", 5);

    Token token1 = new CustomToken(0, 0, "IDENTIFICATION", 0, 14);
    Token token2 = new CustomToken(0, 15, "DIVISION", 15, 23);

    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    when(tokens.getTokens()).thenReturn(List.of(token1, token2));

    TokenUtils tokenUtils = mock(TokenUtils.class);

    when(tokenUtils.retrieveHiddenTextToLeft(0, tokens)).thenReturn("");
    when(tokenUtils.retrieveHiddenTextToLeft(2, tokens)).thenReturn(" ");
    when(tokenUtils.retrieveHiddenTextToLeft(3, tokens)).thenReturn("");
    when(tokenUtils.retrieveHiddenTextToLeft(5, tokens)).thenReturn("");

    when(tokenUtils.notEOF(node1)).thenReturn(true);
    when(tokenUtils.notEOF(node2)).thenReturn(true);
    when(tokenUtils.notEOF(node3)).thenReturn(true);
    when(tokenUtils.notEOF(node4)).thenReturn(true);
    when(tokenUtils.notEOF(node5)).thenReturn(false);

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI, tokens, null, null, tokenUtils, null, null, null);

    listener.visitTerminal(node1);
    // token2 is going to be treated as hidden, so it won't be passed to visitTerminal directly and
    // should be retrieved from node2 as a hidden token to left
    listener.visitTerminal(node3);
    listener.visitTerminal(node4);
    listener.visitTerminal(node5);

    ExtendedDocument expected =
        new ExtendedDocument(
            "IDENTIFICATION DIVISION.\r\n",
            new NamedSubContext(),
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(
                    List.of(
                        new Position(DOCUMENT_URI, 0, 14, 0, 0, "IDENTIFICATION"),
                        new Position(DOCUMENT_URI, 15, 23, 0, 15, "DIVISION")),
                    Map.of())));
    ExtendedDocument actual = listener.getResult();

    assertEquals(expected, actual);
    assertTrue(listener.getErrors().isEmpty());
  }

  private TerminalNode node(String text, int index) {
    TerminalNode node = mock(TerminalNode.class);
    when(node.getSourceInterval()).thenReturn(new Interval(index, index));
    when(node.getText()).thenReturn(text);
    return node;
  }
}
