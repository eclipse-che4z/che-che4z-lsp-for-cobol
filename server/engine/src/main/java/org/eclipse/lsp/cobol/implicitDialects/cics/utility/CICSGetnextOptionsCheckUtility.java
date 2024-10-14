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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_getnext;


/** Checks CICS GetNext rules for required and invalid options */
public class CICSGetnextOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_getnext;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS = new HashMap<Integer, ErrorSeverity>() {
        {
            put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
            put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
            put(CICSLexer.LEVEL, ErrorSeverity.ERROR);
            put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
            put(CICSLexer.COMPOSITE, ErrorSeverity.ERROR);
            put(CICSLexer.TIMER, ErrorSeverity.ERROR);
            put(CICSLexer.EVENT, ErrorSeverity.ERROR);
            put(CICSLexer.ABSTIME, ErrorSeverity.ERROR);
            put(CICSLexer.BROWSETOKEN, ErrorSeverity.ERROR);
            put(CICSLexer.EVENTTYPE, ErrorSeverity.ERROR);
            put(CICSLexer.FIRESTATUS, ErrorSeverity.ERROR);
            put(CICSLexer.PREDICATE, ErrorSeverity.ERROR);
            put(CICSLexer.STATUS, ErrorSeverity.ERROR);
        }
    };

    public CICSGetnextOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS GETNEXT rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == CICSParser.RULE_cics_getnext) {
            checkGetNext((CICSParser.Cics_getnextContext) ctx);
        }
    }

    private void checkGetNext(CICSParser.Cics_getnextContext ctx) {
        checkMutuallyExclusiveOptions("ACTIVITY, CONTAINER, EVENT, PROCESS, TIMER", ctx.ACTIVITY(), ctx.CONTAINER(), ctx.EVENT(), ctx.PROCESS(), ctx.TIMER());

        // Distinct elements for a given command subset:
        checkHasRequiredOption(ctx, "ACTIVITY", ctx.ACTIVITY(), ctx.LEVEL());

        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");

        checkHasRequiredOption(ctx, "EVENT", ctx.EVENT(), ctx.COMPOSITE(), ctx.EVENTTYPE(), ctx.FIRESTATUS(), ctx.PREDICATE());
        checkHasRequiredOption(ctx, "TIMER", ctx.TIMER(), ctx.ABSTIME());
    }
}
