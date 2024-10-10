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

import java.util.*;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_converse;

/** Checks CICS Converse rules for required and invalid options */
public class CICSConverseOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_converse;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.FROM, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMFLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.INTO, ErrorSeverity.ERROR);
                    put(CICSLexer.SET, ErrorSeverity.ERROR);
                    put(CICSLexer.TOLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.TOFLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXFLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.NOTRUNCATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFRESP, ErrorSeverity.ERROR);
                    put(CICSLexer.STRFIELD, ErrorSeverity.ERROR);
                    put(CICSLexer.CTLCHAR, ErrorSeverity.ERROR);
                    put(CICSLexer.LINEADDR, ErrorSeverity.ERROR);
                    put(CICSLexer.LDC, ErrorSeverity.ERROR);
                    put(CICSLexer.FMH, ErrorSeverity.ERROR);
                    put(CICSLexer.LEAVEKB, ErrorSeverity.ERROR);
                    put(CICSLexer.ASIS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONVID, ErrorSeverity.ERROR);
                    put(CICSLexer.SESSION, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTACHID, ErrorSeverity.ERROR);
                    put(CICSLexer.STATE, ErrorSeverity.ERROR);
                    put(CICSLexer.ERASE, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFAULT, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTERNATE, ErrorSeverity.ERROR);
                }
            };

    private static final Map<Integer, String> DUPLICATE_RULES_CHECK = new HashMap<Integer, String>() {
        {
            put(CICSParser.RULE_cics_converse_fromlength, "FROMLENGTH or FROMFLENGTH");
            put(CICSParser.RULE_cics_converse_tolength, "TOLENGTH or TOFLENGTH");
            put(CICSParser.RULE_cics_maxlength, "MAXLENGTH or MAXFLENGTH");
        }
    };

    public CICSConverseOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS, DUPLICATE_RULES_CHECK);
    }

    /**
     * Entrypoint to check CICS CONVERSE rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        int currIndex = ctx.getRuleIndex();
        switch (currIndex) {
            case CICSParser.RULE_cics_converse_group_one:
                checkGroupOne((CICSParser.Cics_converse_group_oneContext) ctx);
                break;
            case CICSParser.RULE_cics_converse_group_two:
                checkGroupTwo((CICSParser.Cics_converse_group_twoContext) ctx);
                break;
            default:
                break;
        }
    }

    private void checkGroupOne(CICSParser.Cics_converse_group_oneContext ctx) {
        if (!ctx.ASIS().isEmpty()) {
            checkHasIllegalOptions(ctx.LEAVEKB(), "LEAVEKB");
        }
        checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
        checkHasMandatoryOptions(ctx.cics_into(), ctx, "INTO or SET");

        checkDuplicates(ctx);
    }

    private void checkGroupTwo(CICSParser.Cics_converse_group_twoContext ctx) {
        checkHasMandatoryOptions(ctx.cics_into(), ctx, "INTO or SET");

        checkDuplicates(ctx);
    }

}
