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

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_force;
        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_force_opts;

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

/** Checks CICS Force Timer rules for required and invalid options */
public class CICSForceOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_force;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.FORCE, ErrorSeverity.ERROR);
                    put(CICSLexer.TIMER, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.ACQPROCESS, ErrorSeverity.WARNING);
                }
            };

    public CICSForceOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Force Timer rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_force_opts)
            checkOpts((CICSParser.Cics_force_optsContext) ctx);

        checkDuplicates(ctx);
    }

    private void checkOpts(CICSParser.Cics_force_optsContext ctx) {
        checkHasMandatoryOptions(ctx.TIMER(), ctx, "TIMER");

        checkHasMutuallyExclusiveOptions("ACQACTIVITY or ACQPROCESS",
                ctx.ACQACTIVITY(), ctx.ACQPROCESS());
    }

}
