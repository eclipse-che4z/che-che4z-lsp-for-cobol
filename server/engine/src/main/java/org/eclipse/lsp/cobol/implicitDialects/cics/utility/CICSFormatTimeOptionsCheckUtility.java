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

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_formattime;
        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_formattime_opts;


/** Checks CICS Add rules for required and invalid options */
public class CICSFormatTimeOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_formattime;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.FORMATTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.ABSTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.DATE, ErrorSeverity.WARNING);
                    put(CICSLexer.FULLDATE, ErrorSeverity.WARNING);
                    put(CICSLexer.DATEFORM, ErrorSeverity.WARNING);
                    put(CICSLexer.DATESEP, ErrorSeverity.WARNING);
                    put(CICSLexer.DATESTRING, ErrorSeverity.WARNING);
                    put(CICSLexer.STRINGZONE, ErrorSeverity.WARNING);
                    put(CICSLexer.DAYCOUNT, ErrorSeverity.WARNING);
                    put(CICSLexer.DAYOFWEEK, ErrorSeverity.WARNING);
                    put(CICSLexer.DAYOFMONTH, ErrorSeverity.WARNING);
                    put(CICSLexer.DDMMYY, ErrorSeverity.WARNING);
                    put(CICSLexer.DDMMYYYY, ErrorSeverity.WARNING);
                    put(CICSLexer.MILLISECONDS, ErrorSeverity.WARNING);
                    put(CICSLexer.MMDDYY, ErrorSeverity.WARNING);
                    put(CICSLexer.MMDDYYYY, ErrorSeverity.WARNING);
                    put(CICSLexer.MONTHOFYEAR, ErrorSeverity.WARNING);
                    put(CICSLexer.STRINGFORMAT, ErrorSeverity.WARNING);
                    put(CICSLexer.TIME, ErrorSeverity.WARNING);
                    put(CICSLexer.TIMESEP, ErrorSeverity.WARNING);
                    put(CICSLexer.YEAR, ErrorSeverity.WARNING);
                    put(CICSLexer.YYDDD, ErrorSeverity.WARNING);
                    put(CICSLexer.YYDDMM, ErrorSeverity.WARNING);
                    put(CICSLexer.YYMMDD, ErrorSeverity.WARNING);
                    put(CICSLexer.YYYYDDD, ErrorSeverity.WARNING);
                    put(CICSLexer.YYYYDDMM, ErrorSeverity.WARNING);
                    put(CICSLexer.YYYYMMDD, ErrorSeverity.WARNING);
                }
            };

    public CICSFormatTimeOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Add rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_formattime_opts)
            checkOpts((CICSParser.Cics_formattime_optsContext) ctx);

        checkDuplicates(ctx);
    }
    private void checkOpts(CICSParser.Cics_formattime_optsContext ctx) {
        checkHasMandatoryOptions(ctx.ABSTIME(), ctx, "ABSTIME");

        if (!ctx.STRINGZONE().isEmpty())
            checkHasMandatoryOptions(ctx.DATESTRING(), ctx, "DATESTRING");
        if (!ctx.TIMESEP().isEmpty())
            checkHasMandatoryOptions(ctx.TIME(), ctx, "TIME");
    }
}
