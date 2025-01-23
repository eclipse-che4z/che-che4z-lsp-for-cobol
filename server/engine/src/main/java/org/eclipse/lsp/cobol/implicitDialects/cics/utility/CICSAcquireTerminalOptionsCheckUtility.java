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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_acquire_terminal_body;


/** Checks CICS ACQUIRE TERMINAL System Command rules for required and invalid options */
public class CICSAcquireTerminalOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = CICSParser.RULE_cics_acquire_terminal;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS = new HashMap<Integer, ErrorSeverity>() {
        {
            put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
            put(CICSLexer.NOQUEUE, ErrorSeverity.WARNING);
            put(CICSLexer.QALL, ErrorSeverity.WARNING);
            put(CICSLexer.RELREQ, ErrorSeverity.WARNING);
            put(CICSLexer.QNOTENAB, ErrorSeverity.WARNING);
            put(CICSLexer.QSESSLIM, ErrorSeverity.WARNING);
            put(CICSLexer.USERDATA, ErrorSeverity.ERROR);
            put(CICSLexer.USERDATALEN, ErrorSeverity.ERROR);
        }
    };

    public CICSAcquireTerminalOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /** Entrypoint to check CICS Acquire Terminal rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == RULE_cics_acquire_terminal_body) {
            checkAcquireTerminal((CICSParser.Cics_acquire_terminal_bodyContext) ctx);
        }
        checkDuplicates(ctx);
    }

    private void checkAcquireTerminal(CICSParser.Cics_acquire_terminal_bodyContext ctx) {
        checkHasMandatoryOptions(ctx.TERMINAL(), ctx, "TERMINAL");
        checkHasMutuallyExclusiveOptions("NOQUEUE or QALL or QNOTENAB or QSESSLIM",
                ctx.NOQUEUE(), ctx.QALL(), ctx.QNOTENAB(), ctx.QSESSLIM());

        if (ctx.QALL().isEmpty() && ctx.QSESSLIM().isEmpty()) {
            checkHasIllegalOptions(ctx.RELREQ(), "RELREQ without QALL or QSESSLIM");
        }

        if (ctx.USERDATA().isEmpty()) {
            checkHasIllegalOptions(ctx.USERDATALEN(), "USERDATALEN without USERDATA");
        }
    }
}
