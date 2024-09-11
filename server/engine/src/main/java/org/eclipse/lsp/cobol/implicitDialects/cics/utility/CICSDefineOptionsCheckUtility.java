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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_define;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Checks CICS Define rules for required and invalid options */
public class CICSDefineOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_define;

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("DEFINE", ErrorSeverity.ERROR);
          put("ACTIVITY", ErrorSeverity.ERROR);
          put("EVENT", ErrorSeverity.ERROR);
          put("TRANSID", ErrorSeverity.ERROR);
          put("PROGRAM", ErrorSeverity.ERROR);
          put("USERID", ErrorSeverity.ERROR);
          put("ACTIVITYID", ErrorSeverity.ERROR);
          put("COMPOSITE", ErrorSeverity.ERROR);
          put("AND", ErrorSeverity.ERROR);
          put("OR", ErrorSeverity.ERROR);
          put("SUBEVENT1", ErrorSeverity.ERROR);
          put("SUBEVENT2", ErrorSeverity.ERROR);
          put("SUBEVENT3", ErrorSeverity.ERROR);
          put("SUBEVENT4", ErrorSeverity.ERROR);
          put("SUBEVENT5", ErrorSeverity.ERROR);
          put("SUBEVENT6", ErrorSeverity.ERROR);
          put("SUBEVENT7", ErrorSeverity.ERROR);
          put("SUBEVENT8", ErrorSeverity.ERROR);
          put("COUNTER", ErrorSeverity.ERROR);
          put("DCOUNTER", ErrorSeverity.ERROR);
          put("POOL", ErrorSeverity.ERROR);
          put("VALUE", ErrorSeverity.ERROR);
          put("MINIMUM", ErrorSeverity.ERROR);
          put("MAXIMUM", ErrorSeverity.ERROR);
          put("NOSUSPEND", ErrorSeverity.WARNING);
          put("INPUT", ErrorSeverity.ERROR);
          put("PROCESS", ErrorSeverity.ERROR);
          put("PROCESSTYPE", ErrorSeverity.ERROR);
          put("NOCHECK", ErrorSeverity.WARNING);
          put("TIMER", ErrorSeverity.ERROR);
          put("DAYS", ErrorSeverity.ERROR);
          put("HOURS", ErrorSeverity.ERROR);
          put("MINUTES", ErrorSeverity.ERROR);
          put("SECONDS", ErrorSeverity.ERROR);
          put("YEAR", ErrorSeverity.ERROR);
          put("MONTH", ErrorSeverity.ERROR);
          put("DAYOFMONTH", ErrorSeverity.ERROR);
          put("DAYOFYEAR", ErrorSeverity.ERROR);
          put("AFTER", ErrorSeverity.ERROR);
          put("AT", ErrorSeverity.ERROR);
          put("0N", ErrorSeverity.ERROR);
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
    if (ctx.getClass() == CICSParser.Cics_define_activityContext.class) {
      checkActivity((CICSParser.Cics_define_activityContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_define_composite_eventContext.class) {
      checkCompositeEvent((CICSParser.Cics_define_composite_eventContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_define_counter_dcounterContext.class) {
      checkCounter((CICSParser.Cics_define_counter_dcounterContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_define_input_eventContext.class) {
      checkInputEvent((CICSParser.Cics_define_input_eventContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_define_processContext.class) {
      checkDefineProcess((CICSParser.Cics_define_processContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_define_timerContext.class) {
      checkDefineTimer((CICSParser.Cics_define_timerContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkActivity(CICSParser.Cics_define_activityContext ctx) {
    checkHasMandatoryOptions(ctx.ACTIVITY(), ctx, "ACTIVITY");
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");
  }

  private void checkCompositeEvent(CICSParser.Cics_define_composite_eventContext ctx) {
    checkHasMandatoryOptions(ctx.COMPOSITE(), ctx, "COMPOSITE");
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
    if (!ctx.OR().isEmpty()) checkHasIllegalOptions(ctx.AND(), "AND");
    else checkHasMandatoryOptions(ctx.AND(), ctx, "AND or OR");
  }

  private void checkCounter(CICSParser.Cics_define_counter_dcounterContext ctx) {
    if (ctx.COUNTER().isEmpty()) checkHasMandatoryOptions(ctx.DCOUNTER(), ctx, "DCOUNTER");
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
    checkHasMandatoryOptions(ctx.TIMER(), ctx, "TIMER");
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
        // Neither AT or AND
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
