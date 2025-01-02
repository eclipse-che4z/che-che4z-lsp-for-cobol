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
package org.eclipse.lsp.cobol;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
/**
 * The AntlrRangeUtils class provides a utility method to construct Range objects.
 */
public class AntlrRangeUtils {
    /**
     * Construct the range from ANTLR context
     *
     * @param ctx the ANTLR context
     * @return the range
     */
    public static Range constructRange(ParseTree ctx) {
        if (ctx instanceof ParserRuleContext) {
            return constructRange((ParserRuleContext) ctx);
        }
        if (ctx instanceof TerminalNode) {
            return constructRange(((TerminalNode) ctx).getSymbol());
        }
        throw new AssertionError("Unexpected token: " + ctx.getText());
    }

    /**Ï
     * Construct the range from ANTLR context
     *
     * @param ctx the ANTLR context
     * @return the range
     */
    public static Range constructRange(ParserRuleContext ctx) {
      Token start = ctx.start;
      Token stop = ctx.stop;
      Position startPosition = new Position(start.getLine() - 1, start.getCharPositionInLine());
      Position stopPosition = ctx.stop == null || start.getStartIndex() > stop.getStopIndex()
              ? startPosition
              : new Position(stop.getLine() - 1, stop.getCharPositionInLine() + stop.getStopIndex() - stop.getStartIndex() + 1);
      return new Range(startPosition, stopPosition);
    }

    /**
     * Construct the range from ANTLR token
     *
     * @param token the ANTLR token
     * @return the range
     */
    public static Range constructRange(Token token) {
        int line = token.getLine() - 1;
        int position = token.getCharPositionInLine();

        Position start = new Position(line, position);
        boolean zeroSize = token.getStopIndex() == -1 || token.getStopIndex() < token.getStartIndex();
        Position end = zeroSize
                ? start
                : new Position(line, position + token.getStopIndex() - token.getStartIndex() + 1);
        return new Range(start, end);
    }
}
