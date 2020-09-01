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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.DocumentMapping;
import com.google.common.collect.Maps;
import org.antlr.v4.runtime.Token;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.parser.CobolLexer.COPYENTRY;
import static com.ca.lsp.core.cobol.parser.CobolLexer.COPYEXIT;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of {@link PositionMappingUtils}, including different document levels
 * and position shifts
 */
class PositionMappingUtilsTest {

  @Test
  void testEmptyMapping() {
    String uri = "doc.cbl";
    List<Token> tokens = List.of();
    List<Position> positions = List.of();
    Map<Integer, Integer> shifts = Map.of();
    Map<String, DocumentMapping> mappings = Map.of(uri, new DocumentMapping(positions, shifts));

    Map<Token, Position> positionMapping =
        PositionMappingUtils.createPositionMapping(tokens, mappings, uri);

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
    Position positionToShift = new Position(copybook, null, 0, 0, 0, 0, "PROCESS");
    Position position0 = new Position(copybook, null, 0, 0, 0, 0, "token0");
    // dot should match trimmed tokens with dots
    Position position1 = new Position(copybook, null, 0, 0, 0, 0, ".");
    // two non-matching tokens to test lookahead works for more than one position
    Position positionNoMatch1 = new Position(copybook, null, 0, 0, 0, 0, "nomatch1");
    Position positionNoMatch2 = new Position(copybook, null, 0, 0, 0, 0, "nomatch2");
    Position position2 = new Position(copybook, null, 0, 0, 0, 0, "token1");
    // EOF should match a blank token
    Position positionEOF = new Position(copybook, null, 0, 0, 0, 0, "<EOF>");

    // COPYENTRY should move the processing to the next document level
    when(enter.getType()).thenReturn(COPYENTRY);
    when(enter.getText()).thenReturn(CPY_ENTER_TAG + CPY_URI_OPEN + copybook + CPY_URI_CLOSE);
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

    List<Token> tokens = List.of(enter, token0, token1, token2, tokenEOF, exit);
    List<Position> positions = List.of();
    List<Position> cpyPositions =
        List.of(
            positionToShift,
            position0,
            position1,
            positionNoMatch1,
            positionNoMatch2,
            position2,
            positionEOF);
    // Shift to skip compiler directive
    Map<Integer, Integer> shifts = Map.of(0, 1);
    Map<String, DocumentMapping> mappings =
        Map.of(
            uri,
            new DocumentMapping(positions, shifts),
            copybook,
            new DocumentMapping(cpyPositions, shifts));

    Map<Token, Position> expected =
        Map.of(token0, position0, token1, position1, token2, position2, tokenEOF, positionEOF);
    Map<Token, Position> actual = PositionMappingUtils.createPositionMapping(tokens, mappings, uri);

    assertTrue(Maps.difference(expected, actual).areEqual());
  }
}
