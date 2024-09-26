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

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_build;
        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_build_attach;

/** Checks CICS Build rules for required and invalid options */
public class CICSBuildOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_build;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("BUILD", ErrorSeverity.ERROR);
                    put("ATTACH", ErrorSeverity.ERROR);
                    put("ATTACHID", ErrorSeverity.ERROR);
                    put("PROCESS", ErrorSeverity.ERROR);
                    put("RESOURCE", ErrorSeverity.ERROR);
                    put("RPROCESS", ErrorSeverity.ERROR);
                    put("RRESOURCE", ErrorSeverity.ERROR);
                    put("QUEUE", ErrorSeverity.ERROR);
                    put("IUTYPE", ErrorSeverity.ERROR);
                    put("DATASTR", ErrorSeverity.ERROR);
                    put("RECFM", ErrorSeverity.ERROR);
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

