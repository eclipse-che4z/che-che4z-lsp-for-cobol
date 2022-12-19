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
package org.eclipse.lsp.cobol.dialects.idms.utils;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test utility
 */
@UtilityClass
public class TestUtils {

  /**
   * Add range
   * @param ctx ctx
   * @param startLine startLine
   * @param startPos startPos
   * @param stopLine stopLine
   * @param stopPos stopPos
   */
  public void addRange(ParserRuleContext ctx, int startLine, int startPos, int stopLine, int stopPos) {
    Token start = mock(Token.class);
    when(start.getLine()).thenReturn(startLine);
    when(start.getCharPositionInLine()).thenReturn(startPos);

    Token stop = mock(Token.class);
    when(stop.getLine()).thenReturn(stopLine);
    when(stop.getCharPositionInLine()).thenReturn(stopPos);

    when(ctx.getStart()).thenReturn(start);
    when(ctx.getStop()).thenReturn(stop);
  }

  /**
   * Add range
   * @param ctx ctx
   * @param startLine startLine
   * @param startPos startPos
   * @param stopLine stopLine
   */
  public void addRange(ParserRuleContext ctx, int startLine, int startPos, int stopLine) {
    Token start = mock(Token.class);
    when(start.getLine()).thenReturn(startLine);
    when(start.getCharPositionInLine()).thenReturn(startPos);

    Token stop = mock(Token.class);
    when(stop.getLine()).thenReturn(stopLine);

    when(ctx.getStart()).thenReturn(start);
    when(ctx.getStop()).thenReturn(stop);
  }

}
