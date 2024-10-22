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

/** Checks CICS Change rules for required and invalid options */
public class CICSChangeOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_change;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.CHANGE, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANGETIME, ErrorSeverity.ERROR);
                    put(CICSLexer.DAYSLEFT, ErrorSeverity.ERROR);
                    put(CICSLexer.ESMREASON, ErrorSeverity.ERROR);
                    put(CICSLexer.ESMRESP, ErrorSeverity.ERROR);
                    put(CICSLexer.EXPIRYTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.INVALIDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTUSETIME, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWPHRASE, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWPHRASELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.PHRASELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.USERID, ErrorSeverity.ERROR);
                    put(CICSLexer.PASSWORD, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWPASSWORD, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIORITY, ErrorSeverity.ERROR);
                }
            };

    public CICSChangeOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Change rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_change_phrase) {
            checkChangePhrase((CICSParser.Cics_change_phraseContext) ctx);
        }
        if (ctx.getRuleIndex() == RULE_cics_change_password) {
            checkChangePassword((CICSParser.Cics_change_passwordContext) ctx);
        }
        checkDuplicates(ctx);
    }

    private void checkChangePhrase(CICSParser.Cics_change_phraseContext ctx) {
        checkHasMandatoryOptions(ctx.NEWPHRASE(), ctx, "NEWPHRASE");
        checkHasMandatoryOptions(ctx.NEWPHRASELEN(), ctx, "NEWPHRASELEN");
        checkHasMandatoryOptions(ctx.PHRASELEN(), ctx, "PHRASELEN");
        checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
    }
    private void checkChangePassword(CICSParser.Cics_change_passwordContext ctx) {
        checkHasMandatoryOptions(ctx.NEWPASSWORD(), ctx, "NEWPASSWORD");
        checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
    }
}
