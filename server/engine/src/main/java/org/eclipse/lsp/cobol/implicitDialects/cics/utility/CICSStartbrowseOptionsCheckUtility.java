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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_startbrowse;

/** Checks CICS Startbrowse rules for required and invalid options */
public class CICSStartbrowseOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_startbrowse;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS = new HashMap<>();

    /**
     * Checks CICS Startbrowse rules for required and invalid options
     * @param dialectProcessingContext
     * @param errors
     */
    public CICSStartbrowseOptionsCheckUtility(
        DialectProcessingContext dialectProcessingContext,
        List<SyntaxError> errors) {
      super(dialectProcessingContext, errors, DUPLICATE_CHECK_OPTIONS);
    }

    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_startbrowse_activity:
                checkActivity((CICSParser.Cics_startbrowse_activityContext) ctx);
                break;
            case CICSParser.RULE_cics_startbrowse_container:
                checkContainer((CICSParser.Cics_startbrowse_containerContext) ctx);
                break;
            case CICSParser.RULE_cics_startbrowse_event:
                checkEvent((CICSParser.Cics_startbrowse_eventContext) ctx);
                break;
            case CICSParser.RULE_cics_startbrowse_process:
                checkProcess((CICSParser.Cics_startbrowse_processContext) ctx);
                break;
            case CICSParser.RULE_cics_startbrowse_timer:
                checkTimer((CICSParser.Cics_startbrowse_timerContext) ctx);
                break;
            case CICSParser.RULE_cics_startbrowse_activityid_process:
                checkActivityIdProcess((CICSParser.Cics_startbrowse_activityid_processContext) ctx);
                break;
        }
    }

    private void checkActivity(CICSParser.Cics_startbrowse_activityContext ctx) {
        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
    }

    private void checkContainer(CICSParser.Cics_startbrowse_containerContext ctx) {
        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
        if(!ctx.CHANNEL().isEmpty())
        {
            checkHasIllegalOptions(ctx.cics_startbrowse_activityid_process(), "ACTIVITYID or PROCESS");
        }
    }

    private void checkEvent(CICSParser.Cics_startbrowse_eventContext ctx) {
        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
    }

    private void checkProcess(CICSParser.Cics_startbrowse_processContext ctx) {
        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
        checkHasMandatoryOptions(ctx.PROCESSTYPE(), ctx, "PROCESSTYPE");
    }

    private void checkTimer(CICSParser.Cics_startbrowse_timerContext ctx) {
        checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
    }

    private void checkActivityIdProcess(CICSParser.Cics_startbrowse_activityid_processContext ctx) {
        checkMutuallyExclusiveOptions("ACTIVITYID or PROCESS", ctx.ACTIVITYID(), ctx.PROCESS());
    }
}
