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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_inquire;

/** Checks CICS Inquire rules for required and invalid options */
public class CICSInquireOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_inquire;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ABCODE, ErrorSeverity.ERROR);
          put(CICSLexer.ABPROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.ABSTIME, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
          put(CICSLexer.COMPOSITE, ErrorSeverity.ERROR);
          put(CICSLexer.COMPSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
          put(CICSLexer.DATALENTH, ErrorSeverity.ERROR);
          put(CICSLexer.EVENT, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.FIRESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.MODE, ErrorSeverity.ERROR);
          put(CICSLexer.PREDICATE, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.SUSPSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.TIMER, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
        }
      };

  public CICSInquireOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Inquire rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_inquire_activityid:
        checkHasMandatoryOptions(
            ((CICSParser.Cics_inquire_activityidContext) ctx).ACTIVITYID(), ctx, "ACTIVITYID");
        break;
      case CICSParser.RULE_cics_inquire_container:
        CICSParser.Cics_inquire_containerContext containerContext =
            (CICSParser.Cics_inquire_containerContext) ctx;
        checkHasMandatoryOptions(containerContext.CONTAINER(), ctx, "CONTAINER");
        checkHasMutuallyExclusiveOptions(
            "ACTIVITYID and PROCESS", containerContext.ACTIVITYID(), containerContext.PROCESS());
        if (containerContext.PROCESS().isEmpty())
          checkHasIllegalOptions(containerContext.PROCESSTYPE(), "PROCESSTYPE without PROCESS");
        break;
      case CICSParser.RULE_cics_inquire_event:
        checkHasMandatoryOptions(
            ((CICSParser.Cics_inquire_eventContext) ctx).EVENT(), ctx, "EVENT");
        break;
      case CICSParser.RULE_cics_inquire_process:
        CICSParser.Cics_inquire_processContext processContext =
            (CICSParser.Cics_inquire_processContext) ctx;
        checkHasMandatoryOptions(processContext.PROCESSTYPE(), ctx, "PROCESSTYPE");
        break;
      case CICSParser.RULE_cics_inquire_timer:
        checkHasMandatoryOptions(
            ((CICSParser.Cics_inquire_timerContext) ctx).TIMER(), ctx, "TIMER");
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }
}
