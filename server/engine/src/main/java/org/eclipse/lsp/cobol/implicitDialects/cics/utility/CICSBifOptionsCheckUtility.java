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

/** Checks CICS Bif rules for required and invalid options */
public class CICSBifOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_bif;
    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.BIF, ErrorSeverity.ERROR);
                    put(CICSLexer.DEEDIT, ErrorSeverity.ERROR);
                    put(CICSLexer.FIELD, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.DIGEST, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORD, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.HEX, ErrorSeverity.ERROR);
                    put(CICSLexer.BINARY, ErrorSeverity.ERROR);
                    put(CICSLexer.BASE64, ErrorSeverity.ERROR);
                    put(CICSLexer.DIGESTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESULT, ErrorSeverity.ERROR);
                }
            };
    public CICSBifOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Bif rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_bif_deedit)
            checkDeedit((CICSParser.Cics_bif_deeditContext) ctx);
        else if (ctx.getRuleIndex() == RULE_cics_bif_digest)
            checkDigest((CICSParser.Cics_bif_digestContext) ctx);

        checkDuplicates(ctx);
    }

    private void checkDeedit(CICSParser.Cics_bif_deeditContext ctx) {
        checkHasMandatoryOptions(ctx.DEEDIT(), ctx, "DEEDIT");
        checkHasMandatoryOptions(ctx.FIELD(), ctx, "FIELD");
    }
    private void checkDigest(CICSParser.Cics_bif_digestContext ctx) {
        checkHasMandatoryOptions(ctx.DIGEST(), ctx, "DIGEST");
        checkHasMandatoryOptions(ctx.RECORD(), ctx, "RECORD");
        checkHasMandatoryOptions(ctx.RESULT(), ctx, "RESULT");
        checkHasMutuallyExclusiveOptions("HEX or BINARY or BASE64 or DIGESTTYPE", ctx.HEX(), ctx.BINARY(), ctx.BASE64(),ctx.DIGESTTYPE());
    }

}
