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

/** Checks CICS GET64 CONTAINER rules for required and invalid options */
public class CICSGet64ContainerOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_get64;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
        new HashMap<Integer, ErrorSeverity>() {
            {
                put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
                put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
                put(CICSLexer.INTO, ErrorSeverity.ERROR);
                put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
                put(CICSLexer.BYTEOFFSET, ErrorSeverity.ERROR);
                put(CICSLexer.SET, ErrorSeverity.ERROR);
                put(CICSLexer.NODATA, ErrorSeverity.ERROR);
                put(CICSLexer.INTOCCSID, ErrorSeverity.ERROR);
                put(CICSLexer.INTOCODEPAGE, ErrorSeverity.ERROR);
                put(CICSLexer.CONVERTST, ErrorSeverity.ERROR);
                put(CICSLexer.CCSID, ErrorSeverity.ERROR);
            }
        };

    public CICSGet64ContainerOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS GET64 CONTAINER rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_get64_body) {
            checkContainerBody((CICSParser.Cics_get64_bodyContext) ctx);
            checkDuplicates(ctx);
        }
    }

    private void checkContainerBody(CICSParser.Cics_get64_bodyContext ctx) {
        checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");

        checkMutuallyExclusiveOptions("INTO, SET or NODATA", ctx.INTO(), ctx.SET(), ctx.NODATA());

        checkMutuallyExclusiveOptions("INTOCCSID, INTOCODEPAGE or CONVERTST", ctx.INTOCCSID(), ctx.INTOCODEPAGE(), ctx.CONVERTST());

        checkPrerequisiteIsMet(ctx.CONVERTST(), ctx.CCSID(), ctx, "CCSID without CONVERTST");

        if (ctx.INTO().isEmpty()) {
            checkHasMandatoryOptions(ctx.FLENGTH(), ctx, "FLENGTH");
        }

        if (ctx.NODATA().isEmpty()) {
            checkPrerequisiteIsMet(ctx.FLENGTH(), ctx.BYTEOFFSET(), ctx, "BYTEOFFSET without FLENGTH");
        } else {
            checkHasIllegalOptions(ctx.BYTEOFFSET(), "BYTEOFFSET");
        }
    }

}
