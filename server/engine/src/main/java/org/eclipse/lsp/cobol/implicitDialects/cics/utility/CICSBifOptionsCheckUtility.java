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

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

        import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_bif;

/** Checks CICS Bif rules for required and invalid options */
public class CICSBifOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_bif;
    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("BIF", ErrorSeverity.ERROR);
                    put("DEEDIT", ErrorSeverity.ERROR);
                    put("FIELD", ErrorSeverity.ERROR);
                    put("LENGTH", ErrorSeverity.ERROR);
                    put("DIGEST", ErrorSeverity.ERROR);
                    put("RECORD", ErrorSeverity.ERROR);
                    put("RECORDLEN", ErrorSeverity.ERROR);
                    put("HEX", ErrorSeverity.ERROR);
                    put("BINARY", ErrorSeverity.ERROR);
                    put("BASE64", ErrorSeverity.ERROR);
                    put("DIGESTTYPE", ErrorSeverity.ERROR);
                    put("RESULT", ErrorSeverity.ERROR);
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
        checkDuplicates(ctx);
    }

}
