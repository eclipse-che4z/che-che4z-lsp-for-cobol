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
//import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

//import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_getnext;


/** Checks CICS GetNext rules for required and invalid options */
public class CICSGetnextOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_getnext;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS = new HashMap<String, ErrorSeverity>() {
        {
            put("ACTIVITY", ErrorSeverity.ERROR);
            put("ACTIVITYID", ErrorSeverity.ERROR);
            put("LEVEL", ErrorSeverity.ERROR);
            put("CONTAINER", ErrorSeverity.ERROR);
            put("COMPOSITE", ErrorSeverity.ERROR);
            put("TIMER", ErrorSeverity.ERROR);
            put("EVENT", ErrorSeverity.ERROR);
            put("ABSTIME", ErrorSeverity.ERROR);
            put("BROWSETOKEN", ErrorSeverity.ERROR);
            put("EVENTTYPE", ErrorSeverity.ERROR);
            put("FIRESTATUS", ErrorSeverity.ERROR);
            put("PREDICATE", ErrorSeverity.ERROR);
            put("STATUS", ErrorSeverity.ERROR);
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
        Class<?> ruleClass = ctx.getClass();
        if (ruleClass == CICSParser.Cics_getnextContext.class) {
            checkGetNext((CICSParser.Cics_getnextContext) ctx);
        }
    }

    private void checkGetNext(CICSParser.Cics_getnextContext ctx) {
        checkMutuallyExclusiveOptions("ACTIVITY, CONTAINER, EVENT, PROCESS, TIMER", ctx.ACTIVITY(), ctx.CONTAINER(), ctx.EVENT(), ctx.PROCESS(), ctx.TIMER());


        // Distinct elements for a given command subset:
        checkHasRequiredOption(ctx.ACTIVITY(), ctx.LEVEL(), ctx, "ACTIVITY");

        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");

        checkHasRequiredOption(ctx.EVENT(), ctx.COMPOSITE(), ctx, "EVENT");
        checkHasRequiredOption(ctx.EVENT(), ctx.EVENTTYPE(), ctx, "EVENT");
        checkHasRequiredOption(ctx.EVENT(), ctx.FIRESTATUS(), ctx, "EVENT");
        checkHasRequiredOption(ctx.EVENT(), ctx.PREDICATE(), ctx, "EVENT");

        checkHasRequiredOption(ctx.TIMER(), ctx.ABSTIME(), ctx, "TIMER");
    }
}
