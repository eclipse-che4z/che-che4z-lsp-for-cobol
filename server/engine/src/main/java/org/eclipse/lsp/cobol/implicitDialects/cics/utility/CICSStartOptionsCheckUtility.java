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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS START rules for required and invalid options */
public class CICSStartOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_start;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.AFTER, ErrorSeverity.WARNING);
          put(CICSLexer.AT, ErrorSeverity.WARNING);
          put(CICSLexer.ATTACH, ErrorSeverity.WARNING);
          put(CICSLexer.BRDATA, ErrorSeverity.ERROR);
          put(CICSLexer.BRDATALENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.BREXIT, ErrorSeverity.WARNING);
          put(CICSLexer.CHANNEL, ErrorSeverity.WARNING);
          put(CICSLexer.FMH, ErrorSeverity.WARNING);
          put(CICSLexer.FROM, ErrorSeverity.ERROR);
          put(CICSLexer.HOURS, ErrorSeverity.ERROR);
          put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.MINUTES, ErrorSeverity.ERROR);
          put(CICSLexer.NOCHECK, ErrorSeverity.WARNING);
          put(CICSLexer.PROTECT, ErrorSeverity.WARNING);
          put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.RTERMID, ErrorSeverity.ERROR);
          put(CICSLexer.RTRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.SECONDS, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.TERMID, ErrorSeverity.ERROR);
          put(CICSLexer.TIME, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
        }
      };

  public CICSStartOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS START rules for required and invalid options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case RULE_cics_start_transid:
        checkStartTransid((CICSParser.Cics_start_transidContext) ctx);
        break;
      case RULE_cics_start_attach:
        checkStartAttach((CICSParser.Cics_start_attachContext) ctx);
        break;
      case RULE_cics_start_brexit:
        checkStartBrexit((CICSParser.Cics_start_brexitContext) ctx);
        break;
      case RULE_cics_start_channel:
        checkStartChannel((CICSParser.Cics_start_channelContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkStartTransid(CICSParser.Cics_start_transidContext ctx) {
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");

    checkMutuallyExclusiveOptions(
        "INTERVAL, AFTER, AT or TIME", ctx.INTERVAL(), ctx.AFTER(), ctx.AT(), ctx.TIME());
    checkMutuallyExclusiveOptions("TERMID or USERID", ctx.TERMID(), ctx.USERID());

    if (!ctx.HOURS().isEmpty()
        || !ctx.MINUTES().isEmpty()
        || !ctx.SECONDS().isEmpty()
        || !ctx.AFTER().isEmpty()
        || !ctx.AT().isEmpty()) {
      checkHasExactlyOneOption("AFTER or AT", ctx, ctx.AFTER(), ctx.AT());
      checkHasAtLeastOneOption(
          "HOURS, MINUTES or SECONDS", ctx, ctx.HOURS(), ctx.MINUTES(), ctx.SECONDS());
    }

    checkPrerequisiteIsMet(ctx.FROM(), ctx.LENGTH(), ctx, "LENGTH without FROM");
    checkPrerequisiteIsMet(ctx.LENGTH(), ctx.FMH(), ctx, "FMH without LENGTH");
  }

  private void checkStartAttach(CICSParser.Cics_start_attachContext ctx) {
    checkHasMandatoryOptions(ctx.ATTACH(), ctx, "ATTACH");
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");

    checkPrerequisiteIsMet(ctx.FROM(), ctx.LENGTH(), ctx, "LENGTH without FROM");
  }

  private void checkStartBrexit(CICSParser.Cics_start_brexitContext ctx) {
    checkHasMandatoryOptions(ctx.BREXIT(), ctx, "BREXIT");
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");

    checkPrerequisiteIsMet(ctx.BRDATA(), ctx.BRDATALENGTH(), ctx, "BRDATALENGTH without BRDATA");
  }

  private void checkStartChannel(CICSParser.Cics_start_channelContext ctx) {
    checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
    checkHasMandatoryOptions(ctx.TRANSID(), ctx, "TRANSID");

    checkMutuallyExclusiveOptions("TERMID or USERID", ctx.TERMID(), ctx.USERID());
  }
}
