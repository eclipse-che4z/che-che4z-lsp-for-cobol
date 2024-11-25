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

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

/** Checks CICS Check rules for required and invalid options */
public class CICSCheckOptionsUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_check;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.CHECK, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.COMPSTATUS, ErrorSeverity.WARNING);
                    put(CICSLexer.ABCODE, ErrorSeverity.WARNING);
                    put(CICSLexer.ABPROGRAM, ErrorSeverity.WARNING);
                    put(CICSLexer.MODE, ErrorSeverity.WARNING);
                    put(CICSLexer.SUSPSTATUS, ErrorSeverity.WARNING);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.TIMER, ErrorSeverity.WARNING);
                    put(CICSLexer.STATUS, ErrorSeverity.WARNING);
                }
            };

    public CICSCheckOptionsUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Check rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_check_activity)
            checkActivity((CICSParser.Cics_check_activityContext) ctx);
        else if (ctx.getRuleIndex() == RULE_cics_check_timer)
            checkTimer((CICSParser.Cics_check_timerContext) ctx);

        checkDuplicates(ctx);
    }
    private void checkActivity(CICSParser.Cics_check_activityContext ctx) {
        checkHasExactlyOneOption("ACTIVITY or ACQACTIVITY or ACQPROCESS", ctx,  ctx.ACTIVITY(), ctx.ACQACTIVITY(), ctx.ACQPROCESS());
        checkHasMandatoryOptions(ctx.COMPSTATUS(), ctx, "COMPSTATUS");
    }
    private void checkTimer(CICSParser.Cics_check_timerContext ctx) {
        checkHasMandatoryOptions(ctx.STATUS(), ctx, "STATUS");
        checkHasMandatoryOptions(ctx.TIMER(), ctx, "TIMER");
    }
}
