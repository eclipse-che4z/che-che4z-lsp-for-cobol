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
import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_converse;

/** Checks CICS Converse rules for required and invalid options */
public class CICSConverseOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_converse;

    public CICSConverseOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors);
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

        List<RuleContextData> contexts = new ArrayList<>();
        contexts.add(new RuleContextData(ctx.cics_into(), "INTO"));
        contexts.add(new RuleContextData(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
        contexts.add(new RuleContextData(ctx.ASIS(), "ASIS", ErrorSeverity.WARNING));
        contexts.add(new RuleContextData(ctx.DEFRESP(), "BUFFER", ErrorSeverity.WARNING));
        contexts.add(new RuleContextData(ctx.NOTRUNCATE(), "NOTRUNCATE", ErrorSeverity.WARNING));
        contexts.add(new RuleContextData(ctx.LEAVEKB(), "LEAVEKB", ErrorSeverity.WARNING));
        contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
        harvestResponseHandlers(ctx.cics_handle_response(), contexts);
        checkDuplicates(contexts);
    }

    private void checkGroupTwo(CICSParser.Cics_converse_group_twoContext ctx) {
        checkHasMandatoryOptions(ctx.cics_converse_from(), ctx, "FROM");
        checkHasMandatoryOptions(ctx.cics_into(), ctx, "INTO");

        List<RuleContextData> contexts = new ArrayList<>();
        contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
        contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
        contexts.add(new RuleContextData(ctx.cics_into(), "INTO"));
        contexts.add(new RuleContextData(ctx.cics_converse_to(), "TOLENGTH or TOFLENGTH"));
        contexts.add(new RuleContextData(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
        contexts.add(new RuleContextData(ctx.NOTRUNCATE(), "NOTRUNCATE", ErrorSeverity.WARNING));
        contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
        contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
        harvestResponseHandlers(ctx.cics_handle_response(), contexts);
        checkDuplicates(contexts);
    }

}
