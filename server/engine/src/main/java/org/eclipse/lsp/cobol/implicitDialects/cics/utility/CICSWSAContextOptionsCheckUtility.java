/*
 * Copyright (c) 2025 Broadcom.
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
                    put(CICSLexer.BUILD, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETE, ErrorSeverity.WARNING);
                    put(CICSLexer.GET, ErrorSeverity.WARNING);
                    put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.MESSAGEID, ErrorSeverity.ERROR);
                    put(CICSLexer.RELATESURI, ErrorSeverity.ERROR);
                    put(CICSLexer.RELATESTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRFIELD, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRFROM, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMCCSID, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMCODEPAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONTEXTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RELATESINDEX, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRINTO, ErrorSeverity.ERROR);
                    put(CICSLexer.EPRSET, ErrorSeverity.ERROR);
                    put(CICSLexer.INTOCCSID, ErrorSeverity.ERROR);
                    put(CICSLexer.INTOCODEPAGE, ErrorSeverity.ERROR);
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
        checkPrerequisiteIsMet(ctx.RELATESURI(), ctx.RELATESTYPE(), ctx, "RELATESTYPE");
        checkAllOptionsArePresentOrAbsent("EPRTYPE, EPRFIELD, EPRFROM and EPRLENGTH", ctx,
                ctx.EPRTYPE(), ctx.EPRFIELD(), ctx.EPRFROM(), ctx.EPRLENGTH());
        checkHasMutuallyExclusiveOptions("FROMCCSID or FROMCODEPAGE", ctx.FROMCCSID(), ctx.FROMCODEPAGE());
    }

    private void checkWSAContextDelete(CICSParser.Cics_wsacontext_deleteContext ctx) {
        checkHasMandatoryOptions(ctx.DELETE(), ctx, "DELETE");
        checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
    }

    @SuppressWarnings("unchecked")
    private void checkWSAContextGet(CICSParser.Cics_wsacontext_getContext ctx) {
        checkHasMandatoryOptions(ctx.GET(), ctx, "GET");
        checkHasMandatoryOptions(ctx.CONTEXTTYPE(), ctx, "CONTEXTTYPE");
        if (!ctx.RELATESTYPE().isEmpty() || !ctx.RELATESINDEX().isEmpty()) {
            checkHasMandatoryOptions(ctx.RELATESURI(), ctx, "RELATESURI");
        }
        validateEPRParameters(ctx);
        checkHasMutuallyExclusiveOptions("INTOCCSID or INTOCODEPAGE", ctx.INTOCCSID(), ctx.INTOCODEPAGE());
    }

    @SuppressWarnings("unchecked")
    private void validateEPRParameters(CICSParser.Cics_wsacontext_getContext ctx) {
        if (!ctx.EPRTYPE().isEmpty() || !ctx.EPRFIELD().isEmpty() || !ctx.EPRLENGTH().isEmpty()
                || !ctx.EPRINTO().isEmpty() || !ctx.EPRSET().isEmpty()) {
            boolean mandatoryParamsPresent = (!ctx.EPRTYPE().isEmpty() && !ctx.EPRFIELD().isEmpty() && !ctx.EPRLENGTH().isEmpty());
            boolean exclusiveParamsValid = (!ctx.EPRINTO().isEmpty() ^ !ctx.EPRSET().isEmpty());
            if (!(mandatoryParamsPresent && exclusiveParamsValid)) {
                throwException(
                        ErrorSeverity.ERROR,
                        getLocality(ctx),
                        "Invalid parameters combination. Valid combination is: ",
                        "EPRTYPE, EPRFIELD, (EPRINTO or EPRSET) and EPRLENGTH");
            }
            checkHasMutuallyExclusiveOptions("EPRINTO or EPRSET", ctx.EPRINTO(), ctx.EPRSET());
        }
    }
}
