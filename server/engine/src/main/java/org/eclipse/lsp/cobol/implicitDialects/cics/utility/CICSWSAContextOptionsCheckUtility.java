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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_wsacontext;

/** Checks CICS WSAContext rules for duplicates */
public class CICSWSAContextOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_wsacontext;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.BUILD, ErrorSeverity.ERROR);
                    put(CICSLexer.DELETE, ErrorSeverity.ERROR);
                    put(CICSLexer.GET, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANNEL, ErrorSeverity.WARNING);
                    put(CICSLexer.ACTION, ErrorSeverity.WARNING);
                    put(CICSLexer.MESSAGEID, ErrorSeverity.WARNING);
                    put(CICSLexer.RELATESURI, ErrorSeverity.WARNING);
                    put(CICSLexer.RELATESTYPE, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRTYPE, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRFIELD, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRFROM, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRLENGTH, ErrorSeverity.WARNING);
                    put(CICSLexer.FROMCCSID, ErrorSeverity.WARNING);
                    put(CICSLexer.FROMCODEPAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.CONTEXTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RELATESINDEX, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRINTO, ErrorSeverity.WARNING);
                    put(CICSLexer.EPRSET, ErrorSeverity.WARNING);
                    put(CICSLexer.INTOCCSID, ErrorSeverity.WARNING);
                    put(CICSLexer.INTOCODEPAGE, ErrorSeverity.WARNING);
                }
            };

    public CICSWSAContextOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS WSAContext rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_wsacontext_build:
                checkWSAContextBuild((CICSParser.Cics_wsacontext_buildContext) ctx);
                break;
            case CICSParser.RULE_cics_wsacontext_delete:
                checkWSAContextDelete((CICSParser.Cics_wsacontext_deleteContext) ctx);
                break;
            case CICSParser.RULE_cics_wsacontext_get:
                checkWSAContextGet((CICSParser.Cics_wsacontext_getContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    @SuppressWarnings("unchecked")
    private void checkWSAContextBuild(CICSParser.Cics_wsacontext_buildContext ctx) {
        checkHasMandatoryOptions(ctx.BUILD(), ctx, "BUILD");
        checkHasExactlyOneOption("ACTION or MESSAGEID or RELATESURI or EPRTYPE", ctx,
                ctx.ACTION(), ctx.MESSAGEID(), ctx.RELATESURI(), ctx.EPRTYPE());
        if (!ctx.RELATESTYPE().isEmpty()) {
            checkHasMandatoryOptions(ctx.RELATESURI(), ctx, "RELATESURI");
        }
        checkAllOptionsArePresentOrAbsent("EPRTYPE, EPRFIELD, EPRFROM and EPRLENGTH", ctx,
                ctx.EPRTYPE(), ctx.EPRFIELD(), ctx.EPRFROM(), ctx.EPRLENGTH());
        checkHasMutuallyExclusiveOptions("FROMCCSID or FROMCODEPAGE", ctx.FROMCCSID(), ctx.FROMCODEPAGE());
    }

    private void checkWSAContextDelete(CICSParser.Cics_wsacontext_deleteContext ctx) {
        checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
    }

    @SuppressWarnings("unchecked")
    private void checkWSAContextGet(CICSParser.Cics_wsacontext_getContext ctx) {
        checkHasMandatoryOptions(ctx.CONTEXTTYPE(), ctx, "CONTEXTTYPE");
        checkHasExactlyOneOption("ACTION or MESSAGEID or RELATESURI or EPRTYPE", ctx,
                ctx.ACTION(), ctx.MESSAGEID(), ctx.RELATESURI(), ctx.EPRTYPE());
        if (!ctx.RELATESTYPE().isEmpty() || !ctx.RELATESINDEX().isEmpty()) {
            checkHasMandatoryOptions(ctx.RELATESURI(), ctx, "RELATESURI");
        }
        checkAllOptionsArePresentOrAbsent("EPRTYPE, EPRFIELD, EPRINTO and EPRLENGTH", ctx,
                ctx.EPRTYPE(), ctx.EPRFIELD(), ctx.EPRINTO(), ctx.EPRLENGTH());
        checkHasMutuallyExclusiveOptions("EPRINTO or EPRSET", ctx.EPRINTO(), ctx.EPRSET());
        checkHasMutuallyExclusiveOptions("INTOCCSID or INTOCODEPAGE", ctx.INTOCCSID(), ctx.INTOCODEPAGE());
    }
}
