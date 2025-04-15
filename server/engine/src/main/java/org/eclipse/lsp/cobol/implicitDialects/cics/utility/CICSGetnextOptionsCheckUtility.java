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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_getnext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS GetNext rules for required and invalid options */
public class CICSGetnextOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_getnext;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
          put(CICSLexer.LEVEL, ErrorSeverity.ERROR);
          put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
          put(CICSLexer.COMPOSITE, ErrorSeverity.ERROR);
          put(CICSLexer.TIMER, ErrorSeverity.ERROR);
          put(CICSLexer.EVENT, ErrorSeverity.ERROR);
          put(CICSLexer.ABSTIME, ErrorSeverity.ERROR);
          put(CICSLexer.BROWSETOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.FIRESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.PREDICATE, ErrorSeverity.ERROR);
          put(CICSLexer.STATUS, ErrorSeverity.ERROR);
        }
      };

  public CICSGetnextOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS GETNEXT rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_getnext_activity:
        checkActivity((CICSParser.Cics_getnext_activityContext) ctx);
        break;
      case CICSParser.RULE_cics_getnext_container:
        checkContainer((CICSParser.Cics_getnext_containerContext) ctx);
        break;
      case CICSParser.RULE_cics_getnext_event:
        checkEvent((CICSParser.Cics_getnext_eventContext) ctx);
        break;
      case CICSParser.RULE_cics_getnext_process:
        checkProcess((CICSParser.Cics_getnext_processContext) ctx);
        break;
      case CICSParser.RULE_cics_getnext_timer:
        checkTimer((CICSParser.Cics_getnext_timerContext) ctx);
        break;
      default:
        break;
    }
  }

  private void checkActivity(CICSParser.Cics_getnext_activityContext ctx) {
    checkHasMandatoryOptions(ctx.ACTIVITY(), ctx, "ACTIVITY");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
  }

  private void checkContainer(CICSParser.Cics_getnext_containerContext ctx) {
    checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
  }

  private void checkEvent(CICSParser.Cics_getnext_eventContext ctx) {
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
  }

  private void checkProcess(CICSParser.Cics_getnext_processContext ctx) {
    checkHasMandatoryOptions(ctx.PROCESS(), ctx, "PROCESS");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
  }

  private void checkTimer(CICSParser.Cics_getnext_timerContext ctx) {
    checkHasMandatoryOptions(ctx.TIMER(), ctx, "TIMER");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
  }
}
