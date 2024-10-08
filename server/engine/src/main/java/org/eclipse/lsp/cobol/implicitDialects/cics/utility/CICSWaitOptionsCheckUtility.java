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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_wait;

/** Checks CICS Wait rules for required and invalid options */
public class CICSWaitOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_wait;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.WAIT, ErrorSeverity.ERROR);
          put(CICSLexer.CONVID, ErrorSeverity.ERROR);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
          put(CICSLexer.EVENT, ErrorSeverity.ERROR);
          put(CICSLexer.ECADDR, ErrorSeverity.ERROR);
          put(CICSLexer.NAME, ErrorSeverity.ERROR);
          put(CICSLexer.EXTERNAL, ErrorSeverity.ERROR);
          put(CICSLexer.ECBLIST, ErrorSeverity.ERROR);
          put(CICSLexer.NUMEVENTS, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABILITY, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTPURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNUM, ErrorSeverity.ERROR);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.SIGNAL, ErrorSeverity.ERROR);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
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
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_wait_convid:
        checkConvid((CICSParser.Cics_wait_convidContext) ctx);
        break;
      case CICSParser.RULE_cics_wait_event:
        checkEvent((CICSParser.Cics_wait_eventContext) ctx);
        break;
      case CICSParser.RULE_cics_wait_external:
        checkExternal((CICSParser.Cics_wait_externalContext) ctx);
        break;
      case CICSParser.RULE_cics_wait_journalname:
        checkJournalName((CICSParser.Cics_wait_journalnameContext) ctx);
        break;
      case CICSParser.RULE_cics_wait_terminal:
        checkTerminal((CICSParser.Cics_wait_terminalContext) ctx);
        break;
      default:
        break;
    }
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

    checkHasMutuallyExclusiveOptions(
        "PURGEABLE or PURGEABILITY or NOTPURGEABLE",
        ctx.PURGEABLE(),
        ctx.PURGEABILITY(),
        ctx.NOTPURGEABLE());
  }

  private void checkJournalName(CICSParser.Cics_wait_journalnameContext ctx) {
    checkHasExactlyOneOption("JOURNALNAME or JORUNALNUM", ctx, ctx.JOURNALNAME(), ctx.JOURNALNUM());
  }

  private void checkTerminal(CICSParser.Cics_wait_terminalContext ctx) {
    checkHasMandatoryOptions(ctx.TERMINAL(), ctx, "TERMINAL");
    checkHasMutuallyExclusiveOptions("SESSION or CONVID", ctx.SESSION(), ctx.CONVID());
  }
}
