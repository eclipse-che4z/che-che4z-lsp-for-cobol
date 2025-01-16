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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

/** Checks CICS SOAPFAULT rules for required and invalid options */
public class CICSSoapfaultOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_soapfault;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.FAULTCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.CLIENT, ErrorSeverity.ERROR);
                    put(CICSLexer.SERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.SENDER, ErrorSeverity.ERROR);
                    put(CICSLexer.RECEIVER, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTCODESTR, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTCODELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTSTRING, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTSTRLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.NATLANG, ErrorSeverity.ERROR);
                    put(CICSLexer.ROLE, ErrorSeverity.ERROR);
                    put(CICSLexer.ROLELENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTACTOR, ErrorSeverity.ERROR);
                    put(CICSLexer.FAULTACTLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.DETAIL, ErrorSeverity.ERROR);
                    put(CICSLexer.DETAILLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FROMCCSID, ErrorSeverity.ERROR);

                    put(CICSLexer.DELETE, ErrorSeverity.WARNING);
                    put(CICSLexer.CREATE, ErrorSeverity.WARNING);
                    put(CICSLexer.ADD, ErrorSeverity.WARNING);
                }
            };

    public CICSSoapfaultOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS SOAPFAULT CREATE rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case RULE_cics_soapfault_create:
                checkCreate((CICSParser.Cics_soapfault_createContext) ctx);
                break;
            case RULE_cics_soapfault_add:
                checkAdd((CICSParser.Cics_soapfault_addContext) ctx);
                break;
            case RULE_cics_soapfault_delete:
                checkDelete((CICSParser.Cics_soapfault_deleteContext) ctx);
                break;
            default:
                break;
        }

        checkDuplicates(ctx);
    }

    private void checkCreate(CICSParser.Cics_soapfault_createContext ctx) {
        checkHasExactlyOneOption("FAULTCODE, FAULTCODESTR, CLIENT, SERVER, SENDER or RECEIVER", ctx, ctx.FAULTCODE(), ctx.FAULTCODESTR(), ctx.CLIENT(), ctx.SERVER(), ctx.SENDER(), ctx.RECEIVER());

        checkHasMandatoryOptions(ctx.FAULTSTRING(), ctx, "FAULTSTRING");

        checkPrerequisiteIsMet(ctx.FAULTCODESTR(), ctx.FAULTCODELEN(), ctx, "FAULTCODELEN without FAULTCODESTR");

        checkPrerequisiteIsMet(ctx.ROLE(), ctx.ROLELENGTH(), ctx, "ROLELENGTH without ROLE");

        checkPrerequisiteIsMet(ctx.FAULTACTOR(), ctx.FAULTACTLEN(), ctx, "FAULTACTLEN without FAULTACTOR");

        checkPrerequisiteIsMet(ctx.DETAIL(), ctx.DETAILLENGTH(), ctx, "DETAILLENGTH without DETAIL");

        checkPrerequisiteIsMet(ctx.FAULTCODE(), ctx.FAULTCODELEN(), ctx, "FAULTCODELEN without FAULTCODE");

        checkPrerequisiteIsMet(ctx.FAULTSTRING(), ctx.FAULTSTRLEN(), ctx, "FAULTSTRLEN without FAULTSTRING");
    }

    private void checkAdd(CICSParser.Cics_soapfault_addContext ctx) {
        checkPrerequisiteIsMet(ctx.FAULTSTRING(), ctx.FAULTSTRLEN(), ctx, "FAULTSTRLEN without FAULTSTRING");

        checkPrerequisiteIsMet(ctx.SUBCODESTR(), ctx.SUBCODELEN(), ctx, "SUBCODELEN without SUBCODESTR");

        checkHasExactlyOneOption("FAULTSTRING or SUBCODESTR", ctx, ctx.FAULTSTRING(), ctx.SUBCODESTR());
    }

    private void checkDelete(CICSParser.Cics_soapfault_deleteContext ctx) {
        checkHasMandatoryOptions(ctx.DELETE(), ctx, "DELETE");
    }

}
