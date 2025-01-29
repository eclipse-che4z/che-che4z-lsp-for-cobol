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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_disable;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_disable_program;


/** Checks CICS DISABLE PROGRAM rules for required and invalid options */
public class CICSDisableProgramOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_disable;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.ENTRYNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.EXIT, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITALL, ErrorSeverity.WARNING);
                    put(CICSLexer.FORMATEDF, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.WARNING);
                    put(CICSLexer.SPI, ErrorSeverity.WARNING);
                    put(CICSLexer.STOP, ErrorSeverity.WARNING);
                    put(CICSLexer.TASKSTART, ErrorSeverity.WARNING);
                }
            };

    public CICSDisableProgramOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS DISABLE PROGRAM rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_disable_program) {
            checkDisableProgram((CICSParser.Cics_disable_programContext) ctx);
        }
        checkDuplicates(ctx);
    }

    private void checkDisableProgram(CICSParser.Cics_disable_programContext ctx) {
        checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
        checkHasMutuallyExclusiveOptions("EXIT or EXITALL", ctx.EXIT(), ctx.EXITALL());
    }
}
