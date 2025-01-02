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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_run;

/** Checks CICS RUN rules for required and invalid options */
public class CICSRunOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_run;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.RUN, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.ACQPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.SYNCHRONOUS, ErrorSeverity.WARNING);
                    put(CICSLexer.ASYNCHRONOUS, ErrorSeverity.WARNING);
                    put(CICSLexer.FACILITYTOKN, ErrorSeverity.ERROR);
                    put(CICSLexer.INPUTEVENT, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CHILD, ErrorSeverity.ERROR);
                }
            };

    public CICSRunOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }


    /**
     * Entrypoint to check CICS RUN rule options
     *
     * @param ctx ParserRuleContext subclass containging options
     * @param <E> A subclass of ParserRuleContext
     */
    @Override
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_run_default:
                checkDefaultRun((CICSParser.Cics_run_defaultContext) ctx);
                break;
            case CICSParser.RULE_cics_run_transid:
                checkTransidRun((CICSParser.Cics_run_transidContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    private void checkDefaultRun(CICSParser.Cics_run_defaultContext ctx) {
        checkHasExactlyOneOption("ACTIVITY or ACQACTIVITY or ACQPROCESS", ctx, ctx.ACTIVITY(), ctx.ACQACTIVITY(), ctx.ACQPROCESS());
        checkMutuallyExclusiveOptions("SYNCHRONOUS or ASYNCHRONOUS", ctx.SYNCHRONOUS(), ctx.ASYNCHRONOUS());
        checkMutuallyExclusiveOptions("SYNCHRONOUS or FACILITYTOKN", ctx.SYNCHRONOUS(), ctx.FACILITYTOKN());

        List<TerminalNode> requiredOptions = new ArrayList<>();
        requiredOptions.addAll(ctx.SYNCHRONOUS());
        requiredOptions.addAll(ctx.ASYNCHRONOUS());
        requiredOptions.addAll(ctx.FACILITYTOKN());
        checkHasMandatoryOptions(requiredOptions, ctx, "SYNCHRONOUS or ASYNCHRONOUS or FACILITYTOKN");

    }

    private void checkTransidRun(CICSParser.Cics_run_transidContext ctx) {
        checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");
        checkHasMandatoryOptions(ctx.CHILD(), ctx, "CHILD");
    }
}
