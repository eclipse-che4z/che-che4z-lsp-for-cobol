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

/** Checks CICS Delay rules for required and invalid options */
public class CICSDelayOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_delay;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.DELAY, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.TIME, ErrorSeverity.ERROR);
                    put(CICSLexer.FOR, ErrorSeverity.WARNING);
                    put(CICSLexer.HOURS, ErrorSeverity.ERROR);
                    put(CICSLexer.MINUTES, ErrorSeverity.ERROR);
                    put(CICSLexer.SECONDS, ErrorSeverity.ERROR);
                    put(CICSLexer.MILLISECS, ErrorSeverity.ERROR);
                    put(CICSLexer.UNTIL, ErrorSeverity.WARNING);
                    put(CICSLexer.REQID, ErrorSeverity.ERROR);
                }
            };

    public CICSDelayOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Delay rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_delay_opts) {
            checkOpts((CICSParser.Cics_delay_optsContext) ctx);

            checkDuplicates(ctx);
        }
    }

    private void checkOpts(CICSParser.Cics_delay_optsContext ctx) {

        if (!ctx.UNTIL().isEmpty()) {
            checkHasIllegalOptions(ctx.MILLISECS(), "MILLISECS");
            if (ctx.HOURS().isEmpty() && ctx.MINUTES().isEmpty() && ctx.SECONDS().isEmpty())
                checkHasMandatoryOptions(ctx.HOURS(), ctx, "HOURS or MINUTES or SECONDS");
        }

        checkHasMutuallyExclusiveOptions("INTERVAL, TIME, UNTIL, FOR", ctx.INTERVAL(),
                    ctx.TIME(), ctx.UNTIL(), ctx.FOR());

        if (!ctx.INTERVAL().isEmpty() || !ctx.TIME().isEmpty()) {
            checkHasIllegalOptions(ctx.HOURS(), "HOURS");
            checkHasIllegalOptions(ctx.MINUTES(), "MINUTES");
            checkHasIllegalOptions(ctx.SECONDS(), "SECONDS");
            checkHasIllegalOptions(ctx.MILLISECS(), "MILLISECS");
        }
        if (!ctx.FOR().isEmpty() && ctx.HOURS().isEmpty() && ctx.MINUTES().isEmpty() && ctx.SECONDS().isEmpty()
        && ctx.MILLISECS().isEmpty())
            checkHasMandatoryOptions(ctx.HOURS(), ctx, "HOURS or MINUTES or SECONDS or MILLISECS");
    }
    }
