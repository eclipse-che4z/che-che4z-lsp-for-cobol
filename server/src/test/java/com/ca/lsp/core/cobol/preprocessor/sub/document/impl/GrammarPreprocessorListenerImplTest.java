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
import com.ca.lsp.core.cobol.model.*;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.utils.CustomToken;
import com.google.inject.Provider;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.parser.CobolPreprocessor.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Ths test checks the logic of the {@link GrammarPreprocessorListenerImpl} */
@SuppressWarnings("unchecked")
class GrammarPreprocessorListenerImplTest {
  private static final String DOCUMENT_URI = "document.cbl";
  private static final String CPY_MODE_ENABLED = "ENABLED";
  private static final String CPY_MODE_DISABLED = "DISABLED";

  @BeforeAll
  static void setMocks() {}

  @Test
  void testCopyStatementNoReplacing() {
    // given
    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    Token hidden = mock(Token.class);
    CopyStatementContext context = mock(CopyStatementContext.class);
    CopySourceContext copySourceContext = mock(CopySourceContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);
    CopybookResolution resolution = mock(CopybookResolution.class);
    ReplacingService replacingService = mock(ReplacingService.class);
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);

    Provider<CopybookResolution> resolutions = () -> resolution;

    String content = "             10 CHILD1 PIC 9.";
    String copyUri = "file://COPYNAME.CPY";
    String copyNameCapitalized = "COPYBOOKNAME";
    String copyNameOriginal = "copybookname";

    Token copybookNameToken = new CustomToken(10, 20, copyNameOriginal, 100, 101);
    CopybookModel model = new CopybookModel(copyNameCapitalized, copyUri, content);
    Position copybookPosition = new Position(DOCUMENT_URI, 100, 101, 10, 20, copyNameOriginal);

    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));

    when(context.copySource()).thenReturn(copySourceContext);
    when(context.replacingPhrase()).thenReturn(null);
    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    when(copySourceContext.cobolWord()).thenReturn(cobolWordContext);
    when(copySourceContext.getStart()).thenReturn(copybookNameToken);
    when(copySourceContext.getStop()).thenReturn(copybookNameToken);
    when(cobolWordContext.getText()).thenReturn(copyNameOriginal);

    when(resolution.resolve(copyNameCapitalized, DOCUMENT_URI, CPY_MODE_ENABLED)).thenReturn(model);
    when(replacingService.applyReplacing(any(String.class), any(List.class))).thenReturn(content);

    when(preprocessor.process(
            eq(copyUri), any(String.class), any(ArrayDeque.class), eq(CPY_MODE_ENABLED)))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedDocument(
                    content,
                    new NamedSubContext(),
                    Map.of(copyUri, new DocumentMapping(List.of(), Map.of()))),
                List.of()));

    NamedSubContext expectedCopybooks = new NamedSubContext();
    expectedCopybooks.define(copyNameCapitalized, new Position(copyUri, 0, -1, 1, 0, null));
    expectedCopybooks.addUsage(copyNameCapitalized, copybookPosition);

    // when
    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            new ArrayDeque<>(),
            CPY_MODE_ENABLED,
            preprocessor,
            resolutions,
            replacingService);

    listener.visitTerminal(node("01", 0, false));
    listener.visitTerminal(node("PARENT", 1, false));
    listener.visitTerminal(node(".", 2, false));
    listener.enterCopyStatement(context);
    listener.visitTerminal(node("COPY", 3, false));
    listener.visitTerminal(node(copyNameOriginal, 4, false));
    listener.visitTerminal(node(".\r\n", 5, false));
    listener.exitCopyStatement(context);

    // then
    assertEquals(
        new ExtendedDocument(
            " 01 PARENT .*>CPYENTER<URI>" + copyUri + "</URI>" + content + "\r\n*>CPYEXIT\r\n",
            expectedCopybooks,
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(List.of(), Map.of(2, 4)),
                copyUri,
                new DocumentMapping(List.of(), Map.of()))),
        listener.getResult());

    assertEquals(
        List.of(
            SyntaxError.syntaxError()
                .severity(INFO)
                .suggestion(
                    "Copybook declaration has more than 8 characters for: " + copyNameCapitalized)
                .position(copybookPosition)
                .build()),
        listener.getErrors());
  }

  @Test
  void testCopyStatementWithReplacing() {
    // given
    CopyStatementContext context = mock(CopyStatementContext.class);
    CopySourceContext copySourceContext = mock(CopySourceContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);
    CopybookResolution resolution = mock(CopybookResolution.class);
    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    ReplacingService replacingService = mock(ReplacingService.class);
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    ReplacePseudoTextContext replacePseudoText = mock(ReplacePseudoTextContext.class);
    ReplaceLiteralContext replaceLiteral = mock(ReplaceLiteralContext.class);
    Provider<CopybookResolution> resolutions = () -> resolution;

    String content = "             10 CHILD1 PIC 9.";
    String replacedContent = "             05 CHILD2 PIC 9.";
    String copyUri = "file://COPYNAME.CPY";
    String copyId = copyUri + "1005CHILD1CHILD2";
    String copyName = "COPYNAME";

    Token copybookNameToken = new CustomToken(10, 20, copyName, 100, 101);
    CopybookModel model = new CopybookModel(copyName, copyUri, content);
    Position copybookPosition = new Position(DOCUMENT_URI, 100, 101, 10, 20, copyName);

    when(context.copySource()).thenReturn(copySourceContext);
    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    when(copySourceContext.cobolWord()).thenReturn(cobolWordContext);
    when(copySourceContext.getStart()).thenReturn(copybookNameToken);
    when(copySourceContext.getStop()).thenReturn(copybookNameToken);

    when(cobolWordContext.getText()).thenReturn(copyName);

    when(replacingService.applyReplacing(
            content, List.of(Pair.of("==10==", "==05=="), Pair.of("CHILD1", "CHILD2"))))
        .thenReturn(replacedContent);
    when(replacingService.retrievePseudoTextReplacingPattern("==10==BY==05=="))
        .thenReturn(Pair.of("==10==", "==05=="));
    when(replacingService.retrieveTokenReplacingPattern("CHILD1byCHILD2"))
        .thenReturn(Pair.of("CHILD1", "CHILD2"));

    when(resolution.resolve(copyName, DOCUMENT_URI, CPY_MODE_ENABLED)).thenReturn(model);

    when(preprocessor.process(
            eq(copyUri), eq(replacedContent), any(ArrayDeque.class), eq(CPY_MODE_ENABLED)))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedDocument(
                    replacedContent,
                    new NamedSubContext(),
                    Map.of(copyUri, new DocumentMapping(List.of(), Map.of()))),
                List.of()));

    NamedSubContext expectedCopybooks = new NamedSubContext();
    expectedCopybooks.define(copyName, new Position(copyUri, 0, -1, 1, 0, null));
    expectedCopybooks.addUsage(copyName, copybookPosition);

    ExtendedDocument expected =
        new ExtendedDocument(
            "*>CPYENTER<URI>"
                + copyUri
                + "1005CHILD1CHILD2"
                + "</URI>"
                + replacedContent
                + "\r\n*>CPYEXIT\r\n",
            expectedCopybooks,
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(List.of(), Map.of(2, 4)),
                copyUri,
                new DocumentMapping(List.of(), Map.of()),
                copyId,
                new DocumentMapping(List.of(), Map.of())));
    // when
    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            new ArrayDeque<>(),
            CPY_MODE_ENABLED,
            preprocessor,
            resolutions,
            replacingService);

    listener.enterCopyStatement(context);
    listener.enterReplacePseudoText(replacePseudoText);
    listener.visitTerminal(node("==10==", 10, false));
    listener.visitTerminal(node("BY", 12, false));
    listener.visitTerminal(node("==05==", 14, false));
    listener.exitReplacePseudoText(replacePseudoText);
    listener.enterReplaceLiteral(replaceLiteral);
    listener.visitTerminal(node("CHILD1", 16, false));
    listener.visitTerminal(node("by", 18, false));
    listener.visitTerminal(node("CHILD2", 20, false));
    listener.exitReplaceLiteral(replaceLiteral);
    listener.exitCopyStatement(context);

    ExtendedDocument actual = listener.getResult();
    // then
    assertEquals(expected, actual);
    assertTrue(listener.getErrors().isEmpty());
  }

  @Test
  void testRecursiveCopybookFound() {
    // given
    CopyStatementContext context = mock(CopyStatementContext.class);
    CopySourceContext copySourceContext = mock(CopySourceContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);
    CopybookResolution resolution = mock(CopybookResolution.class);
    ReplacingService replacingService = mock(ReplacingService.class);
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);

    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    Token hidden = mock(Token.class);
    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));
    Provider<CopybookResolution> resolutions = () -> resolution;
    String copyName = "COPYNAME";
    Token copybookNameToken = new CustomToken(10, 20, copyName, 100, 101);

    ArrayDeque<CopybookUsage> copybookStack = new ArrayDeque<>();
    copybookStack.add(new CopybookUsage(copyName, new Position(DOCUMENT_URI, 0, -1, 1, 0, null)));

    when(context.copySource()).thenReturn(copySourceContext);
    when(context.replacingPhrase()).thenReturn(null);
    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    when(copySourceContext.cobolWord()).thenReturn(cobolWordContext);
    when(copySourceContext.getStart()).thenReturn(copybookNameToken);
    when(copySourceContext.getStop()).thenReturn(copybookNameToken);

    when(cobolWordContext.getText()).thenReturn(copyName);

    when(replacingService.applyReplacing(any(String.class), any(List.class))).thenReturn("");

    when(preprocessor.process(eq(""), eq(""), any(ArrayDeque.class), eq(CPY_MODE_ENABLED)))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedDocument(
                    "",
                    new NamedSubContext(),
                    Map.of("", new DocumentMapping(List.of(), Map.of()))),
                List.of()));

    NamedSubContext expectedCopybooks = new NamedSubContext();
    expectedCopybooks.addUsage(copyName, new Position(DOCUMENT_URI, 100, 101, 10, 20, copyName));

    // when
    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            copybookStack,
            CPY_MODE_ENABLED,
            preprocessor,
            resolutions,
            replacingService);

    listener.visitTerminal(node("01", 0, false));
    listener.visitTerminal(node("PARENT", 1, false));
    listener.visitTerminal(node(".", 2, false));
    listener.enterCopyStatement(context);
    listener.visitTerminal(node("COPY", 3, false));
    listener.visitTerminal(node(copyName, 4, false));
    listener.visitTerminal(node(".\r\n", 5, false));
    listener.exitCopyStatement(context);

    // then
    assertEquals(
        new ExtendedDocument(
            " 01 PARENT .*>CPYENTER<URI></URI>\r\n*>CPYEXIT\r\n",
            expectedCopybooks,
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(List.of(), Map.of(2, 4)),
                "",
                new DocumentMapping(List.of(), Map.of()))),
        listener.getResult());
    assertEquals(
        List.of(
            SyntaxError.syntaxError()
                .position(new Position(DOCUMENT_URI, 0, -1, 1, 0, null))
                .severity(ERROR)
                .suggestion("Recursive copybook declaration for: " + copyName)
                .build()),
        listener.getErrors());
  }

  @Test
  void testMissingCopybook() {
    // given
    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    CopyStatementContext context = mock(CopyStatementContext.class);
    CopySourceContext copySourceContext = mock(CopySourceContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);
    CopybookResolution resolution = mock(CopybookResolution.class);
    Provider<CopybookResolution> resolutions = () -> resolution;
    String copyName = "COPYNAME";
    Token copybookNameToken = new CustomToken(10, 20, copyName, 100, 101);
    Position copybookPosition = new Position(DOCUMENT_URI, 100, 101, 10, 20, copyName);

    when(context.copySource()).thenReturn(copySourceContext);
    when(copySourceContext.cobolWord()).thenReturn(cobolWordContext);
    when(copySourceContext.getStart()).thenReturn(copybookNameToken);
    when(copySourceContext.getStop()).thenReturn(copybookNameToken);
    when(cobolWordContext.getText()).thenReturn(copyName);
    when(context.replacingPhrase()).thenReturn(null);

    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    Token hidden = mock(Token.class);
    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));
    when(resolution.resolve(copyName, DOCUMENT_URI, CPY_MODE_ENABLED)).thenReturn(null);

    ReplacingService replacingService = mock(ReplacingService.class);
    when(replacingService.applyReplacing(any(String.class), any(List.class))).thenReturn("");

    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    when(preprocessor.process(eq(""), eq(""), any(ArrayDeque.class), eq(CPY_MODE_ENABLED)))
        .thenReturn(
            new ResultWithErrors<>(
                new ExtendedDocument(
                    "",
                    new NamedSubContext(),
                    Map.of("", new DocumentMapping(List.of(), Map.of()))),
                List.of()));
    NamedSubContext expectedCopybooks = new NamedSubContext();
    expectedCopybooks.addUsage(copyName, copybookPosition);
    ExtendedDocument expected =
        new ExtendedDocument(
            " 01 PARENT .*>CPYENTER<URI></URI>\r\n*>CPYEXIT\r\n",
            expectedCopybooks,
            Map.of(
                DOCUMENT_URI,
                new DocumentMapping(List.of(), Map.of(2, 4)),
                "",
                new DocumentMapping(List.of(), Map.of())));
    List<SyntaxError> expectedErrors =
        List.of(
            SyntaxError.syntaxError()
                .position(copybookPosition)
                .severity(ERROR)
                .errorCode(MISSING_COPYBOOK)
                .suggestion(copyName + ": Copybook not found")
                .build());

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            new ArrayDeque<>(),
            CPY_MODE_ENABLED,
            preprocessor,
            resolutions,
            replacingService);

    listener.visitTerminal(node("01", 0, false));
    listener.visitTerminal(node("PARENT", 1, false));
    listener.visitTerminal(node(".", 2, false));
    listener.enterCopyStatement(context);
    listener.visitTerminal(node("COPY", 3, false));
    listener.visitTerminal(node(copyName, 4, false));
    listener.visitTerminal(node(".\r\n", 5, false));
    listener.exitCopyStatement(context);

    ExtendedDocument actual = listener.getResult();
    // then
    assertEquals(expected, actual);
    assertEquals(expectedErrors, listener.getErrors());
  }

  @Test
  void testCopybookProcessingDisabled() {
    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    Token hidden = mock(Token.class);
    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));
    CopyStatementContext context = mock(CopyStatementContext.class);
    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI, tokens, null, CPY_MODE_DISABLED, null, null, null);

    when(context.getSourceInterval()).thenReturn(new Interval(3, 6));

    listener.visitTerminal(node("smth", 1, false));
    listener.enterCopyStatement(context);
    listener.visitTerminal(node("COPY", 3, false));
    listener.visitTerminal(node("copyname", 4, false));
    listener.visitTerminal(node(".\r\n", 5, false));
    listener.exitCopyStatement(context);

    ExtendedDocument expected =
        new ExtendedDocument(
            " smth",
            new NamedSubContext(),
            Map.of(DOCUMENT_URI, new DocumentMapping(List.of(), Map.of())));
    ExtendedDocument actual = listener.getResult();

    assertEquals(expected, actual);
    assertEquals(0, listener.getErrors().size());
  }

  @Test
  void testCompilerOptionsExcluded() {
    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    Token hidden = mock(Token.class);
    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));
    CompilerOptionsContext context = mock(CompilerOptionsContext.class);
    when(context.getSourceInterval()).thenReturn(new Interval(1, 4));

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(
            DOCUMENT_URI,
            tokens,
            null,
            null,
            null,
            null,
            null);

    listener.enterCompilerOptions(context);
    listener.visitTerminal(node("PROCESS", 1, false));
    listener.visitTerminal(node("NODYNAM", 3, false));
    listener.visitTerminal(node("\r\n", 4, false));
    listener.exitCompilerOptions(context);
    listener.visitTerminal(node("IDENTIFICATION", 5, false));
    listener.visitTerminal(node("DIVISION", 7, false));
    listener.visitTerminal(node(".", 8, false));

    ExtendedDocument expected =
        new ExtendedDocument(
            " IDENTIFICATION DIVISION .",
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

    TerminalNode node1 = node("IDENTIFICATION", 0, false);
    TerminalNode node3 = node("DIVISION", 2, false);
    TerminalNode node4 = node(".\r\n", 3, false);
    TerminalNode node5 = node("<EOF>", 5, true);

    Token hidden = mock(Token.class);
    Token token1 = new CustomToken(0, 0, "IDENTIFICATION", 0, 14);
    Token token2 = new CustomToken(0, 15, "DIVISION", 15, 23);

    BufferedTokenStream tokens = mock(BufferedTokenStream.class);
    when(hidden.getText()).thenReturn(" ");
    when(tokens.getHiddenTokensToLeft(anyInt(), anyInt())).thenReturn(List.of(hidden));
    when(tokens.getTokens()).thenReturn(List.of(token1, token2));

    GrammarPreprocessorListenerImpl listener =
        new GrammarPreprocessorListenerImpl(DOCUMENT_URI, tokens, null, null, null, null, null);

    listener.visitTerminal(node1);
    // token2 is going to be treated as hidden, so it won't be passed to visitTerminal directly and
    // should be retrieved from node2 as a hidden token to left
    listener.visitTerminal(node3);
    listener.visitTerminal(node4);
    listener.visitTerminal(node5);

    ExtendedDocument expected =
        new ExtendedDocument(
            " IDENTIFICATION DIVISION .\r\n ",
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

  private TerminalNode node(String text, int index, boolean eof) {
    TerminalNode node = mock(TerminalNode.class);
    Token token = mock(Token.class);
    when(node.getSourceInterval()).thenReturn(new Interval(index, index));
    when(node.getText()).thenReturn(text);
    when(node.getSymbol()).thenReturn(token);
    when(token.getType()).thenReturn(eof ? EOF : 0);
    return node;
  }
}
