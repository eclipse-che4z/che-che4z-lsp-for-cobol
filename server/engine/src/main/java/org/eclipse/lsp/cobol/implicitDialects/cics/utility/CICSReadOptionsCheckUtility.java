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

import java.util.*;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_read;

/** Checks CICS READ rules for required and invalid options */
public class CICSReadOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_read;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
        new HashMap<Integer, ErrorSeverity>() {
            {
                put(CICSLexer.FILE, ErrorSeverity.ERROR);
                put(CICSLexer.UNCOMMITTED, ErrorSeverity.ERROR);
                put(CICSLexer.CONSISTENT, ErrorSeverity.ERROR);
                put(CICSLexer.REPEATABLE, ErrorSeverity.ERROR);
                put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
                put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
                put(CICSLexer.INTO, ErrorSeverity.ERROR);
                put(CICSLexer.SET, ErrorSeverity.ERROR);
                put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
                put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
                put(CICSLexer.GENERIC, ErrorSeverity.ERROR);
                put(CICSLexer.SYSID, ErrorSeverity.ERROR);
                put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
                put(CICSLexer.DEBKEY, ErrorSeverity.ERROR);
                put(CICSLexer.DEBREC, ErrorSeverity.ERROR);
                put(CICSLexer.RBA, ErrorSeverity.ERROR);
                put(CICSLexer.RRN, ErrorSeverity.ERROR);
                put(CICSLexer.XRBA, ErrorSeverity.ERROR);
                put(CICSLexer.EQUAL, ErrorSeverity.ERROR);
                put(CICSLexer.GTEQ, ErrorSeverity.ERROR);
                put(CICSLexer.NOSUSPEND, ErrorSeverity.ERROR);
            }
        };

    public CICSReadOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS READ rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        if (ctx.getRuleIndex() == CICSParser.RULE_cics_read_body)
            checkRule((CICSParser.Cics_read_bodyContext) ctx);
    }

    private void checkRule(CICSParser.Cics_read_bodyContext ctx) {
        checkHasMandatoryOptions(ctx.FILE(), ctx, "FILE");
        checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");

        checkMutuallyExclusiveOptions("UNCOMMITTED, CONSISTENT, REPEATABLE or UPDATE", ctx.UNCOMMITTED(), ctx.CONSISTENT(), ctx.REPEATABLE(), ctx.UPDATE());

        checkPrerequisiteIsMet(ctx.UPDATE(), ctx.TOKEN(), ctx, "TOKEN without UPDATE");

        checkMutuallyExclusiveOptions("INTO or SET", ctx.INTO(), ctx.SET());

        checkPrerequisiteIsMet(ctx.KEYLENGTH(), ctx.GENERIC(), ctx, "GENERIC without KEYLENGTH");

        checkMutuallyExclusiveOptions("DEBKEY, DEBREC, RBA, RRN or XRBA", ctx.DEBKEY(), ctx.DEBREC(), ctx.RBA(), ctx.RRN(), ctx.XRBA());

        checkMutuallyExclusiveOptions("EQUAL or GTEQ", ctx.EQUAL(), ctx.GTEQ());

    checkDuplicates(ctx);
    }

}
