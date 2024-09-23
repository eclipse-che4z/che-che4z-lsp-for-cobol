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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_wait;

/** Checks CICS Wait rules for required and invalid options */
public class CICSWaitOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_wait;

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("WAIT", ErrorSeverity.ERROR);
          put("CONVID", ErrorSeverity.ERROR);
          put("STATE", ErrorSeverity.ERROR);
          put("EVENT", ErrorSeverity.ERROR);
          put("ECADDR", ErrorSeverity.ERROR);
          put("NAME", ErrorSeverity.ERROR);
          put("EXTERNAL", ErrorSeverity.ERROR);
          put("ECBLIST", ErrorSeverity.ERROR);
          put("NUMEVENTS", ErrorSeverity.ERROR);
          put("PURGEABILITY", ErrorSeverity.ERROR);
          put("PURGEABLE", ErrorSeverity.ERROR);
          put("NOTPURGEABLE", ErrorSeverity.ERROR);
          put("JOURNALNAME", ErrorSeverity.ERROR);
          put("JOURNALNUM", ErrorSeverity.ERROR);
          put("REQID", ErrorSeverity.ERROR);
          put("SIGNAL", ErrorSeverity.ERROR);
          put("SESSION", ErrorSeverity.ERROR);
          put("TERMINAL", ErrorSeverity.ERROR);
        }
      };

  public CICSWaitOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Wait rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_wait_convidContext.class)
      checkConvid((CICSParser.Cics_wait_convidContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_wait_eventContext.class)
      checkEvent((CICSParser.Cics_wait_eventContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_wait_externalContext.class)
      checkExternal((CICSParser.Cics_wait_externalContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_wait_journalnameContext.class)
      checkJournalName((CICSParser.Cics_wait_journalnameContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_wait_signalContext.class)
      checkSignal((CICSParser.Cics_wait_signalContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_wait_terminalContext.class)
      checkTerminal((CICSParser.Cics_wait_terminalContext) ctx);
    checkDuplicates(ctx);
  }

  private void checkConvid(CICSParser.Cics_wait_convidContext ctx) {
    checkHasMandatoryOptions(ctx.CONVID(), ctx, "CONVID");
  }

  private void checkEvent(CICSParser.Cics_wait_eventContext ctx) {
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
    checkHasMandatoryOptions(ctx.ECADDR(), ctx, "ECADDR");
  }

  private void checkExternal(CICSParser.Cics_wait_externalContext ctx) {
    checkHasMandatoryOptions(ctx.EXTERNAL(), ctx, "EXTERNAL");
    checkHasMandatoryOptions(ctx.ECBLIST(), ctx, "ECBLIST");
    checkHasMandatoryOptions(ctx.NUMEVENTS(), ctx, "NUMEVENTS");

    if (!ctx.PURGEABLE().isEmpty()) {
      checkHasIllegalOptions(ctx.PURGEABILITY(), "PURGEABILITY with PURGEABLE");
      checkHasIllegalOptions(ctx.NOTPURGEABLE(), "NOTPURGEABLE with PURGEABLE");
    } else if (!ctx.PURGEABILITY().isEmpty()) {
      checkHasIllegalOptions(ctx.NOTPURGEABLE(), "NOTPURGEABLE with PURGEABILITY");
      checkHasIllegalOptions(ctx.PURGEABLE(), "PURGEABLE with PURGEABILITY");
    }
  }

  private void checkJournalName(CICSParser.Cics_wait_journalnameContext ctx) {
    if (!ctx.JOURNALNUM().isEmpty())
      checkHasIllegalOptions(ctx.JOURNALNAME(), "JOURNALNAME with JOURNALNUM");
    else checkHasMandatoryOptions(ctx.JOURNALNAME(), ctx, "JOURNALNAME");
  }

  private void checkSignal(CICSParser.Cics_wait_signalContext ctx) {
    checkHasMandatoryOptions(ctx.SIGNAL(), ctx, "SIGNAL");
  }

  private void checkTerminal(CICSParser.Cics_wait_terminalContext ctx) {
    checkHasMandatoryOptions(ctx.TERMINAL(), ctx, "TERMINAL");
    if (!ctx.CONVID().isEmpty()) checkHasIllegalOptions(ctx.SESSION(), "SESSION with CONVID");
  }
}
