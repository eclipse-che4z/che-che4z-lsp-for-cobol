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

        import org.antlr.v4.runtime.tree.TerminalNode;
        import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
        import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
        import org.eclipse.lsp.cobol.common.error.SyntaxError;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
        import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

/** Checks CICS Readq rules for required and invalid options */
public class CICSReadqOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_readq;
    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.TD, ErrorSeverity.WARNING);
                    put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.INTO, ErrorSeverity.ERROR);
                    put(CICSLexer.SET, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.TS, ErrorSeverity.WARNING);
                    put(CICSLexer.QNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMITEMS, ErrorSeverity.ERROR);
                    put(CICSLexer.ITEM, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
                }
            };
    public CICSReadqOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Readq rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_readq_ts_td) {
            checkOpts((CICSParser.Cics_readq_ts_tdContext) ctx);
        }

        checkDuplicates(ctx);
    }

    private void checkOpts(CICSParser.Cics_readq_ts_tdContext ctx) {
       final List<TerminalNode> tds = ctx.TD();
       final List<TerminalNode> tss = ctx.TS();
       checkHasMutuallyExclusiveOptions("TD or TS", tds, tss);
       if (tds.isEmpty())
           checkTs(ctx);
       else if (tss.isEmpty())
           checkTd(ctx);
    }
    private void checkTd(CICSParser.Cics_readq_ts_tdContext ctx) {
        checkHasMandatoryOptions(ctx.QUEUE(), ctx, "QUEUE");
        checkHasExactlyOneOption("INTO or SET", ctx, ctx.cics_into_set());
        checkHasIllegalOptions(ctx.ITEM(), "ITEM");
        checkHasIllegalOptions(ctx.NEXT(), "NEXT");
        checkHasIllegalOptions(ctx.NUMITEMS(), "NUMITEMS");
        checkHasIllegalOptions(ctx.QNAME(), "QNAME");

    }
    private void checkTs(CICSParser.Cics_readq_ts_tdContext ctx) {
        if (!ctx.cics_into_set().isEmpty())
            checkSetTs(ctx.cics_into_set().listIterator().next());

        checkHasExactlyOneOption("QUEUE or QNAME", ctx, ctx.QUEUE(), ctx.QNAME());
        checkHasExactlyOneOption("INTO or SET", ctx, ctx.cics_into_set());
        checkHasMutuallyExclusiveOptions("NEXT or ITEM", ctx.NEXT(), ctx.ITEM());
        checkHasIllegalOptions(ctx.NOSUSPEND(), "NOSUSPEND");
    }
    private void checkSetTs(CICSParser.Cics_into_setContext ctx) {
        if (ctx.SET() != null) checkHasMandatoryOptions(((Cics_readq_ts_tdContext) ctx.getParent().getRuleContext()).LENGTH(), ctx, "LENGTH");
    }
}
