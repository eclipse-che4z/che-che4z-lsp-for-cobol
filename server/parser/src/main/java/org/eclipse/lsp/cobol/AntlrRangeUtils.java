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
    public static Range constructRange(ParserRuleContext ctx) {
      Token start = ctx.start;
      Token end = ctx.stop;

      // FIXME: why its possible?
      if (start.getLine() > end.getLine()) {
        start = ctx.stop;
        end = ctx.start;
      }

      return new Range(
              new Position(start.getLine() - 1, start.getCharPositionInLine()),
              new Position(end.getLine() - 1,
                      end.getCharPositionInLine() + end.getStopIndex() - end.getStartIndex() + 1)
      );
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
        boolean eof = token.getStopIndex() < token.getStartIndex();
        Position end = eof
                ? new Position(line, position)
                : new Position(line, position + token.getStopIndex() - token.getStartIndex() + 1);
        return new Range(start, end);
    }
}
