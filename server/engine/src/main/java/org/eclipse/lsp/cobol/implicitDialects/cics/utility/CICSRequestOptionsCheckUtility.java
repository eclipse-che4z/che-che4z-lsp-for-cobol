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

/** Checks CICS REQUEST rules for required and invalid options */
public class CICSRequestOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_request;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
        new HashMap<Integer, ErrorSeverity>() {
            {
                put(CICSLexer.REQUEST, ErrorSeverity.ERROR);
                put(CICSLexer.ENCRYPTPTKT, ErrorSeverity.ERROR);
                put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
                put(CICSLexer.ENCRYPTKEY, ErrorSeverity.ERROR);
                put(CICSLexer.ESMAPPNAME, ErrorSeverity.ERROR);
                put(CICSLexer.ESMREASON, ErrorSeverity.ERROR);
                put(CICSLexer.ESMRESP, ErrorSeverity.ERROR);
            }
        };

    public CICSRequestOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS REQUEST ENCRYPTPTKT rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_request_body) {
            checkRequestBody((CICSParser.Cics_request_bodyContext) ctx);
        }

        checkDuplicates(ctx);
    }

    private void checkRequestBody(CICSParser.Cics_request_bodyContext ctx) {
        if (!ctx.ENCRYPTPTKT().isEmpty()) {
            checkHasMandatoryOptions(ctx.FLENGTH(), ctx, "FLENGTH");
            checkHasMandatoryOptions(ctx.ENCRYPTKEY(), ctx, "ENCRYPTKEY");
            checkHasMandatoryOptions(ctx.ESMAPPNAME(), ctx, "ESMAPPNAME");
        }

        if (!ctx.PASSTICKET().isEmpty()) {
            checkHasMandatoryOptions(ctx.ESMAPPNAME(), ctx, "ESMAPPNAME");
        }

        checkHasExactlyOneOption("ENCRYPTPTKT or PASSTICKET", ctx, ctx.ENCRYPTPTKT(), ctx.PASSTICKET());
    }

}
