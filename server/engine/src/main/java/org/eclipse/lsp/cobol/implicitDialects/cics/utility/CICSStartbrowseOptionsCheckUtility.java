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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_startbrowse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS Startbrowse rules for required and invalid options */
public class CICSStartbrowseOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_startbrowse;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
          put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITY, ErrorSeverity.WARNING);
          put(CICSLexer.BROWSETOKEN, ErrorSeverity.WARNING);
          put(CICSLexer.CONTAINER, ErrorSeverity.WARNING);
          put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.EVENT, ErrorSeverity.ERROR);
          put(CICSLexer.TIMER, ErrorSeverity.WARNING);
        }
      };

  /**
   * Checks CICS Startbrowse rules for required and invalid options
   *
   * @param dialectProcessingContext
   * @param errors
   * @param params
   */
  public CICSStartbrowseOptionsCheckUtility(
      DialectProcessingContext dialectProcessingContext,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(dialectProcessingContext, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS STARTBROWSE rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == CICSParser.RULE_cics_startbrowse_body) {
      checkBody((CICSParser.Cics_startbrowse_bodyContext) ctx);
    }
  }

  private void checkBody(CICSParser.Cics_startbrowse_bodyContext ctx) {
    if (!ctx.ACTIVITY().isEmpty()) {
      checkAllOptionsArePresentOrAbsent(
          "PROCESS and PROCESSTYPE",
          ctx,
          ctx.cics_startbrowse_processWithValue_subrule(),
          ctx.PROCESSTYPE());

      checkHasIllegalOptions(ctx.PROCESS(), "PROCESS, in this context, requires a value");
      checkMutuallyExclusiveOptions(
          "ACTIVITYID or PROCESS",
          ctx.ACTIVITYID(),
          ctx.cics_startbrowse_processWithValue_subrule());
    } else if (!ctx.CONTAINER().isEmpty() || !ctx.CHANNEL().isEmpty()) {
      if (!ctx.CHANNEL().isEmpty()) {
        checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
        checkHasIllegalOptions(ctx.PROCESS(), "PROCESS");
        checkHasIllegalOptions(ctx.PROCESSTYPE(), "PROCESSTYPE");
      } else {
        checkAllOptionsArePresentOrAbsent(
            "PROCESS and PROCESSTYPE",
            ctx,
            ctx.cics_startbrowse_processWithValue_subrule(),
            ctx.PROCESSTYPE());
      }

      checkHasIllegalOptions(ctx.PROCESS(), "PROCESS, in this context, requires a value");
      checkMutuallyExclusiveOptions(
          "ACTIVITYID, PROCESS or CHANNEL",
          ctx.ACTIVITYID(),
          ctx.PROCESS(),
          ctx.cics_startbrowse_processWithValue_subrule(),
          ctx.CHANNEL());
    } else if (!ctx.EVENT().isEmpty()) {
      checkHasIllegalOptions(ctx.CHANNEL(), "CHANNEL");
      checkHasIllegalOptions(ctx.PROCESS(), "PROCESS");
      checkHasIllegalOptions(ctx.cics_startbrowse_processWithValue_subrule(), "PROCESS");
      checkHasIllegalOptions(ctx.PROCESSTYPE(), "PROCESSTYPE");
    } else if (!ctx.PROCESS().isEmpty()) {
      checkHasMandatoryOptions(ctx.PROCESSTYPE(), ctx, "PROCESSTYPE");

      checkHasIllegalOptions(
          ctx.cics_startbrowse_processWithValue_subrule(),
          "PROCESS, in this context, cannot have a value");
      checkHasIllegalOptions(ctx.ACTIVITYID(), "ACTIVITYID");
      checkHasIllegalOptions(ctx.ACTIVITY(), "ACTIVITY");
      checkHasIllegalOptions(ctx.CONTAINER(), "CONTAINER");
      checkHasIllegalOptions(ctx.EVENT(), "EVENT");
      checkHasIllegalOptions(ctx.CHANNEL(), "CHANNEL");
      checkHasIllegalOptions(ctx.TIMER(), "TIMER");
    } else if (!ctx.TIMER().isEmpty()) {
      checkHasIllegalOptions(ctx.CHANNEL(), "CHANNEL");
      checkHasIllegalOptions(ctx.PROCESS(), "PROCESS");
      checkHasIllegalOptions(ctx.cics_startbrowse_processWithValue_subrule(), "PROCESS");
      checkHasIllegalOptions(ctx.PROCESSTYPE(), "PROCESSTYPE");
    }

    checkPrerequisiteIsMet(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CHANNEL without CONTAINER");
    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");

    checkHasExactlyOneOption(
        "ACTIVITY, CONTAINER, PROCESS, EVENT or TIMER",
        ctx,
        ctx.ACTIVITY(),
        ctx.CONTAINER(),
        ctx.PROCESS(),
        ctx.EVENT(),
        ctx.TIMER());
  }

  private void checkProcessSubrule(
      CICSParser.Cics_startbrowse_processWithValue_subruleContext ctx) {}
}
