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

/** Checks CICS Dump Transaction for required and invalid options */
public class CICSDumpTransactionOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_dump;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.DUMP, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.WARNING);
                    put(CICSLexer.FROM, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPLETE, ErrorSeverity.WARNING);
                    put(CICSLexer.TRT, ErrorSeverity.WARNING);
                    put(CICSLexer.SEGMENTLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTHLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMSEGMENTS, ErrorSeverity.ERROR);
                    put(CICSLexer.TASK, ErrorSeverity.WARNING);
                    put(CICSLexer.STORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.PROGRAM, ErrorSeverity.WARNING);
                    put(CICSLexer.TERMINAL, ErrorSeverity.WARNING);
                    put(CICSLexer.TABLES, ErrorSeverity.WARNING);
                    put(CICSLexer.FCT, ErrorSeverity.WARNING);
                    put(CICSLexer.PCT, ErrorSeverity.WARNING);
                    put(CICSLexer.PPT, ErrorSeverity.WARNING);
                    put(CICSLexer.SIT, ErrorSeverity.WARNING);
                    put(CICSLexer.TCT, ErrorSeverity.WARNING);
                    put(CICSLexer.DUMPID, ErrorSeverity.ERROR);
                }
            };

    public CICSDumpTransactionOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Dump Transaction rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
          if (ctx.getRuleIndex() == RULE_cics_dump_transaction_from) {
              checkDumpTransactionFrom((CICSParser.Cics_dump_transaction_fromContext) ctx);
              checkDumpTransaction((CICSParser.Cics_dumpContext) ctx.getParent());
          } else if (ctx.getRuleIndex() == RULE_cics_dump_transaction_segmentlist) {
              checkDumpTransactionSegmentList((CICSParser.Cics_dump_transaction_segmentlistContext) ctx);
              checkDumpTransaction((CICSParser.Cics_dumpContext) ctx.getParent());
         }

        checkDuplicates(ctx);
    }

    private void checkDumpTransaction(CICSParser.Cics_dumpContext ctx) {
        checkHasMandatoryOptions(ctx.DUMPCODE(), ctx, "DUMPCODE");
    }

    private void checkDumpTransactionFrom(CICSParser.Cics_dump_transaction_fromContext ctx) {
        if (!ctx.FROM().isEmpty())
            checkHasExactlyOneOption("LENGTH or FLENGTH", ctx, ctx.cics_length_flength());

        checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
    private void checkDumpTransactionSegmentList(CICSParser.Cics_dump_transaction_segmentlistContext ctx) {
        checkHasMandatoryOptions(ctx.LENGTHLIST(), ctx, "LENGTHLIST");
        checkHasMandatoryOptions(ctx.NUMSEGMENTS(), ctx, "NUMSEGMENTS");
        checkHasMandatoryOptions(ctx.SEGMENTLIST(), ctx, "SEGMENTLIST");
    }
}
