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
import org.antlr.v4.runtime.CommonToken;

import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test class for testing the utility methods in AntlrRangeUtils.
 */
public class AntlrRangeUtilsTest {
    @Test
    void testConstructRangeFromValidParserRuleContext() {
        ParserRuleContext ctx = new ParserRuleContext();
        CommonToken startToken = new CommonToken(0, "start");
        startToken.setLine(1);
        startToken.setCharPositionInLine(0);
        CommonToken stopToken = new CommonToken(0, "stop");
        stopToken.setLine(1);
        stopToken.setCharPositionInLine(5);
        ctx.start = startToken;
        ctx.stop = stopToken;

        Range range = AntlrRangeUtils.constructRange(ctx);

        assertEquals(new Position(0, 0), range.getStart());
        assertEquals(new Position(0, 6), range.getEnd());
    }

    // Construct a range from a valid Token with correct line and position
    @Test
    void testConstructRangeFromValidToken() {
        CommonToken token = new CommonToken(0, "test_token");
        token.setLine(2);
        token.setCharPositionInLine(3);
        token.setStartIndex(5);
        token.setStopIndex(10);

        Range range = AntlrRangeUtils.constructRange(token);

        assertEquals(new Position(1, 3), range.getStart());
        assertEquals(new Position(1, 9), range.getEnd());
    }
}
