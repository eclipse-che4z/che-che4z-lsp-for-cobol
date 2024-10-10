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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_define;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Checks CICS Define rules for required and invalid options */
public class CICSDefineOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_define;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.DEFINE, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
          put(CICSLexer.EVENT, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
          put(CICSLexer.COMPOSITE, ErrorSeverity.ERROR);
          put(CICSLexer.AND, ErrorSeverity.ERROR);
          put(CICSLexer.OR, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT1, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT2, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT3, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT4, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT5, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT6, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT7, ErrorSeverity.ERROR);
          put(CICSLexer.SUBEVENT8, ErrorSeverity.ERROR);
          put(CICSLexer.COUNTER, ErrorSeverity.ERROR);
          put(CICSLexer.DCOUNTER, ErrorSeverity.ERROR);
          put(CICSLexer.POOL, ErrorSeverity.ERROR);
          put(CICSLexer.VALUE, ErrorSeverity.ERROR);
          put(CICSLexer.MINIMUM, ErrorSeverity.ERROR);
          put(CICSLexer.MAXIMUM, ErrorSeverity.ERROR);
          put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
          put(CICSLexer.INPUT, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.NOCHECK, ErrorSeverity.WARNING);
          put(CICSLexer.TIMER, ErrorSeverity.ERROR);
          put(CICSLexer.DAYS, ErrorSeverity.ERROR);
          put(CICSLexer.HOURS, ErrorSeverity.ERROR);
          put(CICSLexer.MINUTES, ErrorSeverity.ERROR);
          put(CICSLexer.SECONDS, ErrorSeverity.ERROR);
          put(CICSLexer.YEAR, ErrorSeverity.ERROR);
          put(CICSLexer.MONTH, ErrorSeverity.ERROR);
          put(CICSLexer.DAYOFMONTH, ErrorSeverity.ERROR);
          put(CICSLexer.DAYOFYEAR, ErrorSeverity.ERROR);
          put(CICSLexer.AFTER, ErrorSeverity.ERROR);
          put(CICSLexer.AT, ErrorSeverity.ERROR);
          put(CICSLexer.ON, ErrorSeverity.ERROR);
        }
      };

  public CICSDefineOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Define rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_define_activity:
        checkActivity((CICSParser.Cics_define_activityContext) ctx);
        break;
      case CICSParser.RULE_cics_define_composite_event:
        checkCompositeEvent((CICSParser.Cics_define_composite_eventContext) ctx);
        break;
      case CICSParser.RULE_cics_define_counter_dcounter:
        checkCounter((CICSParser.Cics_define_counter_dcounterContext) ctx);
        break;
      case CICSParser.RULE_cics_define_input_event:
        checkInputEvent((CICSParser.Cics_define_input_eventContext) ctx);
        break;
      case CICSParser.RULE_cics_define_process:
        checkDefineProcess((CICSParser.Cics_define_processContext) ctx);
        break;
      case CICSParser.RULE_cics_define_timer:
        checkDefineTimer((CICSParser.Cics_define_timerContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkActivity(CICSParser.Cics_define_activityContext ctx) {
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");
  }

  private void checkCompositeEvent(CICSParser.Cics_define_composite_eventContext ctx) {
    checkHasMandatoryOptions(ctx.COMPOSITE(), ctx, "COMPOSITE");
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
    checkHasExactlyOneOption("AND or OR", ctx, ctx.AND(), ctx.OR());
  }

  private void checkCounter(CICSParser.Cics_define_counter_dcounterContext ctx) {
    checkHasExactlyOneOption("COUNTER or DCOUNTER", ctx, ctx.COUNTER(), ctx.DCOUNTER());
    if (ctx.VALUE().isEmpty()) checkHasIllegalOptions(ctx.MINIMUM(), "MINIMUM");
  }

  private void checkInputEvent(CICSParser.Cics_define_input_eventContext ctx) {
    checkHasMandatoryOptions(ctx.INPUT(), ctx, "INPUT");
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
  }

  private void checkDefineProcess(CICSParser.Cics_define_processContext ctx) {
    checkHasMandatoryOptions(ctx.PROCESS(), ctx, "PROCESS");
    checkHasMandatoryOptions(ctx.PROCESSTYPE(), ctx, "PROCESSTYPE");
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");
  }

  private void checkDefineTimer(CICSParser.Cics_define_timerContext ctx) {
    if (ctx.AFTER().isEmpty()) {
      checkHasIllegalOptions(ctx.DAYS(), "DAYS");
      if (checkHasMandatoryOptions(ctx.AT(), ctx, "AT")) {
        // AT CASE
        if (ctx.HOURS().size() + ctx.MINUTES().size() + ctx.SECONDS().size() == 0) {
          checkHasMandatoryOptions(ctx.HOURS(), ctx, "HOURS or MINUTES or SECONDS");
        }
        if (ctx.ON().isEmpty()) {
          // ON
          checkHasIllegalOptions(ctx.YEAR(), "YEAR without ON");
          checkHasIllegalOptions(ctx.MONTH(), "MONTH without ON");
          checkHasIllegalOptions(ctx.DAYOFYEAR(), "DAYOFYEAR without ON");
          checkHasIllegalOptions(ctx.DAYOFMONTH(), "DAYOFMONTH without ON");
        } else if (ctx.YEAR().isEmpty()) {
          // YEAR
          checkHasIllegalOptions(ctx.MONTH(), "MONTH without YEAR");
          checkHasIllegalOptions(ctx.DAYOFYEAR(), "DAYOFYEAR without YEAR");
          checkHasIllegalOptions(ctx.DAYOFMONTH(), "DAYOFMONTH without YEAR");
        } else if (!ctx.DAYOFYEAR().isEmpty()) {
          // DAYOFYEAR
          checkHasIllegalOptions(ctx.MONTH(), "MONTH without DAYOFYEAR");
          checkHasIllegalOptions(ctx.DAYOFMONTH(), "DAYOFMONTH without DAYOFYEAR");
        } else {
          // MONTH and DAYOFMONTH
          checkHasIllegalOptions(ctx.DAYOFYEAR(), "DAYOFYEAR with MONTH");
          checkHasMandatoryOptions(ctx.MONTH(), ctx, "MONTH");
          checkHasMandatoryOptions(ctx.DAYOFMONTH(), ctx, "DAYOFMONTH");
        }
      } else {
        // Neither AT nor AND
        checkHasMandatoryOptions(ctx.AFTER(), ctx, "AFTER");
      }
    } else if (ctx.AT().isEmpty() && checkHasMandatoryOptions(ctx.AFTER(), ctx, "AFTER")) {
      // AFTER CASE
      checkHasIllegalOptions(ctx.ON(), "ON");
      checkHasIllegalOptions(ctx.YEAR(), "YEAR");
      checkHasIllegalOptions(ctx.MONTH(), "MONTH");
      checkHasIllegalOptions(ctx.DAYOFYEAR(), "DAYOFYEAR");
      checkHasIllegalOptions(ctx.DAYOFMONTH(), "DAYOFMONTH");
      if (ctx.DAYS().size() + ctx.HOURS().size() + ctx.MINUTES().size() + ctx.SECONDS().size()
          == 0) {
        checkHasMandatoryOptions(ctx.DAYS(), ctx, "DAYS or HOURS or MINUTES or SECONDS");
      }
    } else {
      // Both AT and AFTER
      checkHasIllegalOptions(ctx.AFTER(), "AFTER with AT");
      checkHasIllegalOptions(ctx.AT(), "AT with AFTER");
      checkHasIllegalOptions(ctx.ON(), "ON");
      checkHasIllegalOptions(ctx.YEAR(), "YEAR");
      checkHasIllegalOptions(ctx.MONTH(), "MONTH");
      checkHasIllegalOptions(ctx.DAYOFYEAR(), "DAYOFYEAR");
      checkHasIllegalOptions(ctx.DAYOFMONTH(), "DAYOFMONTH");
      checkHasIllegalOptions(ctx.DAYS(), "DAYS");
    }
  }
}
