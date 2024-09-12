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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_converse;

/** Checks CICS Converse rules for required and invalid options */
public class CICSConverseOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_converse;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("FROM", ErrorSeverity.ERROR);
                    put("FROMLENGTH", ErrorSeverity.ERROR);
                    put("FROMFLENGTH", ErrorSeverity.ERROR);
                    put("INTO", ErrorSeverity.ERROR);
                    put("SET", ErrorSeverity.ERROR);
                    put("TOLENGTH", ErrorSeverity.ERROR);
                    put("TOFLENGTH", ErrorSeverity.ERROR);
                    put("MAXLENGTH", ErrorSeverity.ERROR);
                    put("MAXFLENGTH", ErrorSeverity.ERROR);
                    put("NOTRUNCATE", ErrorSeverity.ERROR);
                    put("DEFRESP", ErrorSeverity.ERROR);
                    put("STRFIELD", ErrorSeverity.ERROR);
                    put("CTLCHAR", ErrorSeverity.ERROR);
                    put("LINEADDR", ErrorSeverity.ERROR);
                    put("LDC", ErrorSeverity.ERROR);
                    put("FMH", ErrorSeverity.ERROR);
                    put("LEAVEKB", ErrorSeverity.ERROR);
                    put("ASIS", ErrorSeverity.ERROR);
                    put("CONVID", ErrorSeverity.ERROR);
                    put("SESSION", ErrorSeverity.ERROR);
                    put("ATTACHID", ErrorSeverity.ERROR);
                    put("STATE", ErrorSeverity.ERROR);
                    put("ERASE", ErrorSeverity.ERROR);
                    put("DEFAULT", ErrorSeverity.ERROR);
                    put("ALTERNATE", ErrorSeverity.ERROR);
                }
            };

    public CICSConverseOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS CONVERSE rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getClass() == CICSParser.Cics_converse_group_oneContext.class) {
            checkGroupOne((CICSParser.Cics_converse_group_oneContext) ctx);
        } else if (ctx.getClass() == CICSParser.Cics_converse_group_twoContext.class) {
            checkGroupTwo((CICSParser.Cics_converse_group_twoContext) ctx);
        }
    }

    private void checkGroupOne(CICSParser.Cics_converse_group_oneContext ctx) {
        checkHasMandatoryOptions(ctx.cics_converse_from(), ctx, "FROM");
        if (!ctx.ASIS().isEmpty()) {
            checkHasIllegalOptions(ctx.LEAVEKB(), "LEAVEKB");
        }

        checkDuplicates(ctx);
    }

    private void checkGroupTwo(CICSParser.Cics_converse_group_twoContext ctx) {
        checkHasMandatoryOptions(ctx.cics_converse_from(), ctx, "FROM");
        checkHasMandatoryOptions(ctx.cics_into(), ctx, "INTO");

        checkDuplicates(ctx);
    }

}
