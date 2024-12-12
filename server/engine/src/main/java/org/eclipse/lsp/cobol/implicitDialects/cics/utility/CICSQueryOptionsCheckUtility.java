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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_query;

/** Checks CICS Query rules for required and invalid options */
public class CICSQueryOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_query;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CONTAINERCNT, ErrorSeverity.ERROR);
                    put(CICSLexer.RETCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.COUNTER, ErrorSeverity.ERROR);
                    put(CICSLexer.DCOUNTER, ErrorSeverity.ERROR);
                    put(CICSLexer.POOL, ErrorSeverity.ERROR);
                    put(CICSLexer.VALUE, ErrorSeverity.ERROR);
                    put(CICSLexer.MINIMUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXIMUM, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITY, ErrorSeverity.WARNING);
                    put(CICSLexer.RESTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.RESIDLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.RESID, ErrorSeverity.ERROR);
                    put(CICSLexer.LOGMESSAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.READ, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONTROL, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTER, ErrorSeverity.ERROR);
                    put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
                }
            };

    public CICSQueryOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS QUERY rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    @Override
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_query_channel:
                checkQueryChannel((CICSParser.Cics_query_channelContext) ctx);
                break;
            case CICSParser.RULE_cics_query_counter:
                checkQueryCounter((CICSParser.Cics_query_counterContext) ctx);
                break;
            case CICSParser.RULE_cics_query_security:
                checkQuerySecurity((CICSParser.Cics_query_securityContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    private void checkQueryChannel(CICSParser.Cics_query_channelContext ctx) {
        checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
    }

    private void checkQueryCounter(CICSParser.Cics_query_counterContext ctx) {
        checkHasExactlyOneOption("COUNTER or DCOUNTER", ctx, ctx.cics_counter_dcounter());
    }

    private void checkQuerySecurity(CICSParser.Cics_query_securityContext ctx) {
        checkHasMandatoryOptions(ctx.SECURITY(), ctx, "SECURITY");
        checkHasExactlyOneOption("RESTYPE or RESCLASS", ctx, ctx.RESTYPE(), ctx.RESCLASS());
        if (!ctx.RESCLASS().isEmpty()) {
            checkHasMandatoryOptions(ctx.RESIDLENGTH(), ctx, "RESIDLENGTH");
        }
        if (!ctx.RESIDLENGTH().isEmpty()) {
            checkHasMandatoryOptions(ctx.RESCLASS(), ctx, "RESCLASS");
        }
        checkHasMandatoryOptions(ctx.RESID(), ctx, "RESID");
    }

}
