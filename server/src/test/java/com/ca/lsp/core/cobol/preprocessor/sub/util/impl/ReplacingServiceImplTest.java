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

package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.parser.CobolPreprocessor.*;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** This test checks the logic of {@link ReplacingServiceImpl} */
class ReplacingServiceImplTest {

  @Test
  void applyReplacingPseudoText() {
    String original = " A    1 ";
    String expected = " B 2 ";

    BufferedTokenStream tokenStream = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);

    ReplaceClauseContext aToB = mock(ReplaceClauseContext.class);

    ReplacePseudoTextContext aToBLiteral = mock(ReplacePseudoTextContext.class);

    PseudoReplaceableContext aReplaceable = mock(PseudoReplaceableContext.class);
    PseudoReplacementContext bReplacement = mock(PseudoReplacementContext.class);

    List<ReplaceClauseContext> replaceClauses = List.of(aToB);

    when(aToB.replacePseudoText()).thenReturn(aToBLiteral);
    when(aToBLiteral.pseudoReplaceable()).thenReturn(aReplaceable);
    when(aToBLiteral.pseudoReplacement()).thenReturn(bReplacement);
    when(tokenUtils.retrieveTextIncludingHiddenTokens(aReplaceable, tokenStream))
        .thenReturn("==A 1 ==");
    when(tokenUtils.retrieveTextIncludingHiddenTokens(bReplacement, tokenStream))
        .thenReturn("== B    2 ==");

    ReplacingService replacingService = new ReplacingServiceImpl(tokenUtils);
    String actual = replacingService.applyReplacing(original, replaceClauses, tokenStream);

    assertEquals(expected, actual);
  }

  @Test
  void applyReplacingTwoCobolWords() {
    String original = " A A 1 ";
    String expected = " B B 2 ";

    BufferedTokenStream tokenStream = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);

    ReplaceClauseContext aToB = mock(ReplaceClauseContext.class);
    ReplaceClauseContext oneTo2 = mock(ReplaceClauseContext.class);

    ReplaceliteralContext aToBLiteral = mock(ReplaceliteralContext.class);
    ReplaceliteralContext oneTo2Literal = mock(ReplaceliteralContext.class);

    ReplaceableContext aReplaceable = mock(ReplaceableContext.class);
    ReplacementContext bReplacement = mock(ReplacementContext.class);

    ReplaceableContext oneReplaceable = mock(ReplaceableContext.class);
    ReplacementContext twoReplacement = mock(ReplacementContext.class);

    ReplaceSameElementContext aReplaceableElement = mock(ReplaceSameElementContext.class);
    ReplaceSameElementContext bReplacementElement = mock(ReplaceSameElementContext.class);

    ReplaceSameElementContext oneReplaceableElement = mock(ReplaceSameElementContext.class);
    ReplaceSameElementContext twoReplacementElement = mock(ReplaceSameElementContext.class);
    CobolWordContext cobolWordContext = mock(CobolWordContext.class);

    List<ReplaceClauseContext> replaceClauses = List.of(aToB, oneTo2);

    when(aToB.replaceliteral()).thenReturn(aToBLiteral);
    when(oneTo2.replaceliteral()).thenReturn(oneTo2Literal);
    when(aToBLiteral.replaceable()).thenReturn(aReplaceable);
    when(aToBLiteral.replacement()).thenReturn(bReplacement);
    when(oneTo2Literal.replaceable()).thenReturn(oneReplaceable);
    when(oneTo2Literal.replacement()).thenReturn(twoReplacement);
    when(aReplaceable.replaceSameElement()).thenReturn(aReplaceableElement);
    when(bReplacement.replaceSameElement()).thenReturn(bReplacementElement);
    when(oneReplaceable.replaceSameElement()).thenReturn(oneReplaceableElement);
    when(twoReplacement.replaceSameElement()).thenReturn(twoReplacementElement);
    when(aReplaceableElement.cobolWord()).thenReturn(cobolWordContext);
    when(bReplacementElement.cobolWord()).thenReturn(cobolWordContext);
    when(oneReplaceableElement.cobolWord()).thenReturn(cobolWordContext);
    when(twoReplacementElement.cobolWord()).thenReturn(cobolWordContext);
    when(aReplaceableElement.getText()).thenReturn("A");
    when(bReplacementElement.getText()).thenReturn("B");
    when(oneReplaceableElement.getText()).thenReturn("1");
    when(twoReplacementElement.getText()).thenReturn("2");

    ReplacingService replacingService = new ReplacingServiceImpl(tokenUtils);
    String actual = replacingService.applyReplacing(original, replaceClauses, tokenStream);

    assertEquals(expected, actual);
  }

  @Test
  void applyReplacingLiteral() {
    String original = " TAG-ID 1 ";
    String expected = " ABC-ID 1 ";

    BufferedTokenStream tokenStream = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);

    ReplaceClauseContext clauseContext = mock(ReplaceClauseContext.class);

    ReplaceliteralContext literalContext = mock(ReplaceliteralContext.class);

    ReplaceableContext replaceable = mock(ReplaceableContext.class);
    ReplacementContext replacement = mock(ReplacementContext.class);

    ReplaceSameElementContext replaceableElement = mock(ReplaceSameElementContext.class);
    ReplaceSameElementContext replacementElement = mock(ReplaceSameElementContext.class);

    LiteralContext replaceableLiteralContext = mock(LiteralContext.class);
    LiteralContext replacementLiteralContext = mock(LiteralContext.class);

    List<ReplaceClauseContext> replaceClauses = List.of(clauseContext);

    when(clauseContext.replaceliteral()).thenReturn(literalContext);
    when(literalContext.replaceable()).thenReturn(replaceable);
    when(literalContext.replacement()).thenReturn(replacement);
    when(replaceable.replaceSameElement()).thenReturn(replaceableElement);
    when(replacement.replaceSameElement()).thenReturn(replacementElement);
    when(replaceableElement.literal()).thenReturn(replaceableLiteralContext);
    when(replacementElement.literal()).thenReturn(replacementLiteralContext);
    when(replaceableLiteralContext.getText()).thenReturn("TAG-ID");
    when(replacementLiteralContext.getText()).thenReturn("ABC-ID");

    ReplacingService replacingService = new ReplacingServiceImpl(tokenUtils);
    String actual = replacingService.applyReplacing(original, replaceClauses, tokenStream);

    assertEquals(expected, actual);
  }

  @Test
  void applyReplacingDifferentLiteralTypes() {
    String original = " ADATA ";
    String expected = " EXPECTED ";

    BufferedTokenStream tokenStream = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);

    ReplaceClauseContext clauseContext = mock(ReplaceClauseContext.class);

    ReplaceliteralContext literalContext = mock(ReplaceliteralContext.class);

    ReplaceableContext replaceable = mock(ReplaceableContext.class);
    ReplacementContext replacement = mock(ReplacementContext.class);

    ReplaceSameElementContext replaceableElement = mock(ReplaceSameElementContext.class);
    ReplaceSameElementContext replacementElement = mock(ReplaceSameElementContext.class);

    CharDataLineContext replaceableCharDataContext = mock(CharDataLineContext.class);
    LiteralContext replacementLiteralContext = mock(LiteralContext.class);

    List<ReplaceClauseContext> replaceClauses = List.of(clauseContext);

    when(clauseContext.replaceliteral()).thenReturn(literalContext);
    when(literalContext.replaceable()).thenReturn(replaceable);
    when(literalContext.replacement()).thenReturn(replacement);
    when(replaceable.replaceSameElement()).thenReturn(replaceableElement);
    when(replacement.replaceSameElement()).thenReturn(replacementElement);
    when(replaceableElement.charDataLine()).thenReturn(replaceableCharDataContext);
    when(replacementElement.literal()).thenReturn(replacementLiteralContext);
    when(tokenUtils.retrieveTextIncludingHiddenTokens(replaceableElement, tokenStream))
        .thenReturn("ADATA");
    when(replacementLiteralContext.getText()).thenReturn("EXPECTED");

    ReplacingService replacingService = new ReplacingServiceImpl(tokenUtils);
    String actual = replacingService.applyReplacing(original, replaceClauses, tokenStream);

    assertEquals(expected, actual);
  }

  @Test
  void applyReplacingCorruptedContextNotProduceNPE() {
    String original = "original";
    String expected = "original";

    BufferedTokenStream tokenStream = mock(BufferedTokenStream.class);
    TokenUtils tokenUtils = mock(TokenUtils.class);

    ReplaceClauseContext clauseContext = mock(ReplaceClauseContext.class);

    ReplaceliteralContext literalContext = mock(ReplaceliteralContext.class);

    ReplaceableContext replaceable = mock(ReplaceableContext.class);
    ReplacementContext replacement = mock(ReplacementContext.class);

    ReplaceSameElementContext replaceableElement = mock(ReplaceSameElementContext.class);
    ReplaceSameElementContext replacementElement = mock(ReplaceSameElementContext.class);

    List<ReplaceClauseContext> replaceClauses = List.of(clauseContext);

    when(clauseContext.replaceliteral()).thenReturn(literalContext);
    when(literalContext.replaceable()).thenReturn(replaceable);
    when(literalContext.replacement()).thenReturn(replacement);
    when(replaceable.replaceSameElement()).thenReturn(replaceableElement);
    when(replacement.replaceSameElement()).thenReturn(replacementElement);

    ReplacingService replacingService = new ReplacingServiceImpl(tokenUtils);
    String actual = replacingService.applyReplacing(original, replaceClauses, tokenStream);

    assertEquals(expected, actual);
  }
}
