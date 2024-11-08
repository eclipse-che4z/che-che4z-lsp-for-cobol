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

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_build;
        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_build_attach;

/** Checks CICS Build rules for required and invalid options */
public class CICSBuildOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_build;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.BUILD, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTACH, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTACHID, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.RESOURCE, ErrorSeverity.ERROR);
                    put(CICSLexer.RPROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.RRESOURCE, ErrorSeverity.ERROR);
                    put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.IUTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.DATASTR, ErrorSeverity.ERROR);
                    put(CICSLexer.RECFM, ErrorSeverity.ERROR);
                }
            };

    public CICSBuildOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS Build rule options
     *
     * @param ctx ParserRuleContext subclass containging options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_build_attach) {
        checkAttachIdOptions((CICSParser.Cics_build_attachContext) ctx);
        }
        checkDuplicates(ctx);
    }

    private void checkAttachIdOptions(CICSParser.Cics_build_attachContext ctx) {
        checkHasMandatoryOptions(ctx.ATTACH(), ctx, "ATTACH");
        checkHasMandatoryOptions(ctx.ATTACHID(), ctx, "ATTACHID");
    }
}

