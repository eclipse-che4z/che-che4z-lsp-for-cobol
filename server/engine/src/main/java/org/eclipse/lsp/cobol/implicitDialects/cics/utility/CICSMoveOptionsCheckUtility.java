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

package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_move;

/** Checks CICS Move rules for required and invalid options */
public class CICSMoveOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_move;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.MOVE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.AS, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMPROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TOPROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.TOACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TOCHANNEL, ErrorSeverity.ERROR);
                }
            };

    public CICSMoveOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS MOVE rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    @Override
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (RULE_cics_move == (ctx.getParent().getRuleIndex())) {
            checkMoveOptions((CICSParser.Cics_moveContext) ctx.getParent());
        }
        checkDuplicates(ctx.getParent());
    }

    private void checkMoveOptions(CICSParser.Cics_moveContext ctx) {
        checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
        checkHasMandatoryOptions(ctx.AS(), ctx, "AS");
        checkHasMutuallyExclusiveOptions("FROMPROCESS or FROMACTIVITY or CHANNEL", ctx.FROMPROCESS(), ctx.FROMACTIVITY(), ctx.CHANNEL());
        checkHasMutuallyExclusiveOptions("TOPROCESS or TOACTIVITY or TOCHANNEL", ctx.TOPROCESS(), ctx.TOACTIVITY(), ctx.TOCHANNEL());
        if (!ctx.CHANNEL().isEmpty()) {
            checkHasIllegalOptions(ctx.TOPROCESS(), "TOPROCESS with CHANNEL");
            checkHasIllegalOptions(ctx.TOACTIVITY(), "TOACTIVITY with CHANNEL");
        }
        if (!ctx.FROMPROCESS().isEmpty() || !ctx.FROMACTIVITY().isEmpty()) {
            checkHasIllegalOptions(ctx.TOCHANNEL(), "TOCHANNEL without CHANNEL");
        }
    }

}
