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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util.impl;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityMappingUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.core.CobolLexer.COPYENTRY;
import static org.eclipse.lsp.cobol.core.CobolLexer.COPYEXIT;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of {@link LocalityMappingUtils}, including different document levels
 * and position shifts
 */
class LocalityMappingUtilsTest {

  @Test
  void testEmptyMapping() {
    String uri = "doc.cbl";
    List<Token> tokens = ImmutableList.of();
    List<Locality> localities = ImmutableList.of();
    Map<Integer, Integer> shifts = ImmutableMap.of();
    Map<String, DocumentMapping> mappings =
        ImmutableMap.of(uri, new DocumentMapping(localities, shifts));

    Map<Token, Locality> positionMapping =
        LocalityMappingUtils.createPositionMapping(tokens, mappings, uri, ImmutableMap.of());

    assertTrue(positionMapping.isEmpty());
  }

  @Test
  void testMappingWithCopybook() {
    String uri = "doc.cbl";
    String copybook = "copybook.cpy";

    Token enter = mock(Token.class);
    Token token0 = mock(Token.class);
    Token token1 = mock(Token.class);
    Token token2 = mock(Token.class);
    Token tokenEOF = mock(Token.class);
    Token exit = mock(Token.class);

    // Compiler directives should be skipped by predefined shift
    Range range = new Range(new Position(0, 0), new Position(0, 0));
    Locality localityToShift =
        Locality.builder().uri(copybook).range(range).token("PROCESS").build();
    Locality locality0 = Locality.builder().uri(copybook).range(range).token("token0").build();
    // dot should match trimmed tokens with dots
    Locality locality1 = Locality.builder().uri(copybook).range(range).token(".").build();
    // two non-matching tokens to test lookahead works for more than one position
    Locality localityNoMatch1 =
        Locality.builder().uri(copybook).range(range).token("nomatch1").build();
    Locality localityNoMatch2 =
        Locality.builder().uri(copybook).range(range).token("nomatch2").build();
    Locality locality2 = Locality.builder().uri(copybook).range(range).token("token1").build();
    // EOF should match a blank token
    Locality localityEOF = Locality.builder().uri(copybook).range(range).token("<EOF>").build();

    // COPYENTRY should move the processing to the next document level
    when(enter.getType()).thenReturn(COPYENTRY);
    when(enter.getText())
        .thenReturn(
            ProcessingConstants.CPY_ENTER_TAG
                + copybook
                + ProcessingConstants.CPY_URI_CLOSE);
    when(enter.getTokenSource()).thenReturn(new CobolLexer(null));
    // COPYEXIT should move the previous to the previous document level
    when(exit.getType()).thenReturn(COPYEXIT);

    when(token0.getType()).thenReturn(0);
    when(token0.getText()).thenReturn("token0");
    when(token1.getType()).thenReturn(1);
    when(token1.getText()).thenReturn(".   ");
    when(token2.getType()).thenReturn(2);
    when(token2.getText()).thenReturn("token1");
    when(tokenEOF.getType()).thenReturn(3);
    when(tokenEOF.getText()).thenReturn("\r\n");

    List<Token> tokens = ImmutableList.of(enter, token0, token1, token2, tokenEOF, exit);
    List<Locality> localities = ImmutableList.of();
    List<Locality> cpyLocalities =
        ImmutableList.of(
            localityToShift,
            locality0,
            locality1,
            localityNoMatch1,
            localityNoMatch2,
            locality2,
            localityEOF);
    // Shift to skip compiler directive
    Map<Integer, Integer> shifts = ImmutableMap.of(0, 1);
    Map<String, DocumentMapping> mappings =
        ImmutableMap.of(
            uri,
            new DocumentMapping(localities, shifts),
            copybook,
            new DocumentMapping(cpyLocalities, shifts));

    Map<Token, Locality> expected =
        ImmutableMap.of(
            token0, locality0, token1, locality1, token2, locality2, tokenEOF, localityEOF);
    Map<Token, Locality> actual =
        LocalityMappingUtils.createPositionMapping(tokens, mappings, uri, ImmutableMap.of());

    assertTrue(Maps.difference(expected, actual).areEqual());
  }
}
