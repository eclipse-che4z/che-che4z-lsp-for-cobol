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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_issue;

/** Checks CICS Issue rules for required and invalid options */
public class CICSIssueOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_issue;

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("ABEND", ErrorSeverity.ERROR);
          put("CONVID", ErrorSeverity.ERROR);
          put("STATE", ErrorSeverity.ERROR);
          put("ABORT", ErrorSeverity.ERROR);
          put("DESTID", ErrorSeverity.ERROR);
          put("DESTIDLENG", ErrorSeverity.ERROR);
          put("SUBADDR", ErrorSeverity.ERROR);
          put("VOLUME", ErrorSeverity.ERROR);
          put("VOLUMELENG", ErrorSeverity.ERROR);
          put("CONSOLE", ErrorSeverity.ERROR);
          put("PRINT", ErrorSeverity.ERROR);
          put("CARD", ErrorSeverity.ERROR);
          put("WPMEDIA1", ErrorSeverity.ERROR);
          put("WPMEDIA2", ErrorSeverity.ERROR);
          put("WPMEDIA3", ErrorSeverity.ERROR);
          put("WPMEDIA4", ErrorSeverity.ERROR);
          put("ADD", ErrorSeverity.ERROR);
          put("LENGTH", ErrorSeverity.ERROR);
          put("NUMREC", ErrorSeverity.ERROR);
          put("FROM", ErrorSeverity.ERROR);
          put("RIDFLD", ErrorSeverity.ERROR);
          put("CONFIRMATION", ErrorSeverity.ERROR);
          put("COPY", ErrorSeverity.ERROR);
          put("TERMID", ErrorSeverity.ERROR);
          put("CTLCHAR", ErrorSeverity.ERROR);
          put("DISCONNECT", ErrorSeverity.ERROR);
          put("SESSION", ErrorSeverity.ERROR);
          put("END", ErrorSeverity.ERROR);
          put("ENDFILE", ErrorSeverity.ERROR);
          put("ENDOUTPUT", ErrorSeverity.ERROR);
          put("ERASE", ErrorSeverity.ERROR);
          put("KEYLENGTH", ErrorSeverity.ERROR);
          put("KEYNUMBER", ErrorSeverity.ERROR);
          put("ERASEAUP", ErrorSeverity.ERROR);
          put("ERROR", ErrorSeverity.ERROR);
          put("LOAD", ErrorSeverity.ERROR);
          put("PROGRAM", ErrorSeverity.ERROR);
          put("CONVERSE", ErrorSeverity.ERROR);
          put("NOTE", ErrorSeverity.ERROR);
          put("PASS", ErrorSeverity.ERROR);
          put("LUNAME", ErrorSeverity.ERROR);
          put("LOGMODE", ErrorSeverity.ERROR);
          put("LOGONLOGMODE", ErrorSeverity.ERROR);
          put("NOQUIESCE", ErrorSeverity.ERROR);
          put("PREPARE", ErrorSeverity.ERROR);
          put("QUERY", ErrorSeverity.ERROR);
          put("RECEIVE", ErrorSeverity.ERROR);
          put("INTO", ErrorSeverity.ERROR);
          put("SET", ErrorSeverity.ERROR);
          put("REPLACE", ErrorSeverity.ERROR);
          put("SEND", ErrorSeverity.ERROR);
          put("SIGNAL", ErrorSeverity.ERROR);
          put("WAIT", ErrorSeverity.ERROR);
          put("EODS", ErrorSeverity.ERROR);

          put("DEFRESP", ErrorSeverity.WARNING);
          put("NOWAIT", ErrorSeverity.WARNING);
          put("RRN", ErrorSeverity.WARNING);
          put("NOQUEUE", ErrorSeverity.WARNING);
          put("TERMINAL", ErrorSeverity.WARNING);
        }
      };

  public CICSIssueOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Issue rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_issue_abendContext.class)
      checkAbend((CICSParser.Cics_issue_abendContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_abortContext.class)
      checkAbort((CICSParser.Cics_issue_abortContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_addContext.class)
      checkAdd((CICSParser.Cics_issue_addContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_confirmationContext.class)
      checkConfirmation((CICSParser.Cics_issue_confirmationContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_copyContext.class)
      checkCopy((CICSParser.Cics_issue_copyContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_disconnectContext.class)
      checkDisconnect((CICSParser.Cics_issue_disconnectContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_endContext.class)
      checkEnd((CICSParser.Cics_issue_endContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_endfile_endoutputContext.class)
      checkEndFileOutput((CICSParser.Cics_issue_endfile_endoutputContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_eodsContext.class)
      checkEODS((CICSParser.Cics_issue_eodsContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_eraseContext.class)
      checkErase((CICSParser.Cics_issue_eraseContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_erase_aupContext.class)
      checkEraseAUP((CICSParser.Cics_issue_erase_aupContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_errorContext.class)
      checkError((CICSParser.Cics_issue_errorContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_loadContext.class)
      checkLoad((CICSParser.Cics_issue_loadContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_noteContext.class)
      checkNote((CICSParser.Cics_issue_noteContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_passContext.class)
      checkPass((CICSParser.Cics_issue_passContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_prepareContext.class)
      checkPrepare((CICSParser.Cics_issue_prepareContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_printContext.class)
      checkPrint((CICSParser.Cics_issue_printContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_queryContext.class)
      checkQuery((CICSParser.Cics_issue_queryContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_receiveContext.class)
      checkReceive((CICSParser.Cics_issue_receiveContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_replaceContext.class)
      checkReplace((CICSParser.Cics_issue_replaceContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_sendContext.class)
      checkSend((CICSParser.Cics_issue_sendContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_signalContext.class)
      checkSignal((CICSParser.Cics_issue_signalContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_waitContext.class)
      checkWait((CICSParser.Cics_issue_waitContext) ctx);
    checkDuplicates(ctx);
  }

  private void checkAbend(CICSParser.Cics_issue_abendContext ctx) {
    checkHasMandatoryOptions(ctx.ABEND(), ctx, "ABEND");
  }

  private void checkAbort(CICSParser.Cics_issue_abortContext ctx) {
    checkHasMandatoryOptions(ctx.ABORT(), ctx, "ABORT");
    checkIssueCommon(ctx.cics_issue_common());
  }

  private void checkAdd(CICSParser.Cics_issue_addContext ctx) {
    checkHasMandatoryOptions(ctx.ADD(), ctx, "ADD");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    if (ctx.RIDFLD().isEmpty()) checkHasIllegalOptions(ctx.RRN(), "RRN without RIDFLD");
  }

  private void checkConfirmation(CICSParser.Cics_issue_confirmationContext ctx) {
    checkHasMandatoryOptions(ctx.CONFIRMATION(), ctx, "CONFIRMATION");
  }

  private void checkCopy(CICSParser.Cics_issue_copyContext ctx) {
    checkHasMandatoryOptions(ctx.COPY(), ctx, "COPY");
    checkHasMandatoryOptions(ctx.TERMID(), ctx, "TERMID");
  }

  private void checkDisconnect(CICSParser.Cics_issue_disconnectContext ctx) {
    checkHasMandatoryOptions(ctx.DISCONNECT(), ctx, "DISCONNECT");
  }

  private void checkEnd(CICSParser.Cics_issue_endContext ctx) {
    checkHasMandatoryOptions(ctx.END(), ctx, "END");
    checkIssueCommon(ctx.cics_issue_common());
  }

  void checkEndFileOutput(CICSParser.Cics_issue_endfile_endoutputContext ctx) {
    if (ctx.ENDFILE().isEmpty()) checkHasMandatoryOptions(ctx.ENDOUTPUT(), ctx, "ENDOUTPUT");
  }

  void checkEODS(CICSParser.Cics_issue_eodsContext ctx) {
    checkHasMandatoryOptions(ctx.EODS(), ctx, "EODS");
  }

  void checkErase(CICSParser.Cics_issue_eraseContext ctx) {
    checkHasMandatoryOptions(ctx.ERASE(), ctx, "ERASE");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    checkHasExactlyOneOption("RRN or KEYLENGTH", ctx, ctx.RRN(), ctx.KEYLENGTH());

    if (ctx.KEYLENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.KEYNUMBER(), "KEYNUMBER without KEYLENGTH");
    }
  }

  void checkEraseAUP(CICSParser.Cics_issue_erase_aupContext ctx) {
    checkHasMandatoryOptions(ctx.ERASEAUP(), ctx, "ERASEAUP");
  }

  void checkError(CICSParser.Cics_issue_errorContext ctx) {
    checkHasMandatoryOptions(ctx.ERROR(), ctx, "ERROR");
  }

  void checkLoad(CICSParser.Cics_issue_loadContext ctx) {
    checkHasMandatoryOptions(ctx.LOAD(), ctx, "LOAD");
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
  }

  void checkNote(CICSParser.Cics_issue_noteContext ctx) {
    checkHasMandatoryOptions(ctx.NOTE(), ctx, "NOTE");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasMandatoryOptions(ctx.RRN(), ctx, "RRN");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");
  }

  void checkPass(CICSParser.Cics_issue_passContext ctx) {
    checkHasMandatoryOptions(ctx.PASS(), ctx, "PASS");
    checkHasMandatoryOptions(ctx.LUNAME(), ctx, "LUNAME");

    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH without FROM");
    if (!ctx.LOGMODE().isEmpty())
      checkHasIllegalOptions(ctx.LOGONLOGMODE(), "LOGONLOGMODE without LOGMODE");
  }

  void checkPrepare(CICSParser.Cics_issue_prepareContext ctx) {
    checkHasMandatoryOptions(ctx.PREPARE(), ctx, "PREPARE");
  }

  void checkPrint(CICSParser.Cics_issue_printContext ctx) {
    checkHasMandatoryOptions(ctx.PRINT(), ctx, "PRINT");
  }

  void checkQuery(CICSParser.Cics_issue_queryContext ctx) {
    checkHasMandatoryOptions(ctx.QUERY(), ctx, "QUERY");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");

    if (ctx.DESTID().isEmpty())
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");
  }

  void checkReceive(CICSParser.Cics_issue_receiveContext ctx) {
    checkHasMandatoryOptions(ctx.RECEIVE(), ctx, "RECEIVE");
    if (ctx.INTO().isEmpty()) checkHasMandatoryOptions(ctx.SET(), ctx, "INTO or SET");
  }

  void checkReplace(CICSParser.Cics_issue_replaceContext ctx) {
    checkHasMandatoryOptions(ctx.REPLACE(), ctx, "REPLACE");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    if (ctx.KEYLENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.KEYNUMBER(), "KEYNUMBER without KEYLENGTTH");
      checkHasMandatoryOptions(ctx.RRN(), ctx, "RRN");
    } else checkHasIllegalOptions(ctx.RRN(), "RRN with KEYLENGTH");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");
  }

  void checkSend(CICSParser.Cics_issue_sendContext ctx) {
    checkHasMandatoryOptions(ctx.SEND(), ctx, "SEND");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    if (ctx.cics_issue_common().isEmpty())
      checkHasMandatoryOptions(ctx.cics_issue_common(), ctx, "DESTID or SUBADDR branches");
    checkIssueCommon(ctx.cics_issue_common());
  }

  void checkSignal(CICSParser.Cics_issue_signalContext ctx) {
    checkHasMandatoryOptions(ctx.SIGNAL(), ctx, "SIGNAL");

    if (!ctx.CONVID().isEmpty()) checkHasIllegalOptions(ctx.SESSION(), "SESSION with CONVID");
  }

  void checkWait(CICSParser.Cics_issue_waitContext ctx) {
    checkHasMandatoryOptions(ctx.WAIT(), ctx, "WAIT");
    if (ctx.cics_issue_common().isEmpty())
      checkHasMandatoryOptions(ctx.cics_issue_common(), ctx, "DESTID or SUBADDR branches");
    checkIssueCommon(ctx.cics_issue_common());
  }

  void checkIssueCommon(List<CICSParser.Cics_issue_commonContext> ctx) {
    TerminalNode exclusiveOption =
        checkHasMutuallyExclusiveOptions(
            "SUBARR or DESIT",
            ctx.stream()
                .map(CICSParser.Cics_issue_commonContext::SUBADDR)
                .collect(Collectors.toList())
                .stream()
                .flatMap(Collection::stream)
                .collect(Collectors.toList()),
            ctx.stream()
                .map(CICSParser.Cics_issue_commonContext::DESTID)
                .collect(Collectors.toList())
                .stream()
                .flatMap(Collection::stream)
                .collect(Collectors.toList()));

    boolean hasVolume =
        !(ctx.stream()
                .map(CICSParser.Cics_issue_commonContext::VOLUME)
                .flatMap(Collection::stream).count() == 0);

    ctx.forEach(
        context -> {
          if (exclusiveOption == null) {
            checkHasIllegalOptions(context.DESTIDLENG(), "DESTIDLENG without DESTID");
            checkHasIllegalOptions(context.CONSOLE(), "CONSOLE without SUBADDR");
            checkHasIllegalOptions(context.PRINT(), "PRINT without SUBADDR");
            checkHasIllegalOptions(context.CARD(), "CARD without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
          } else if (CICSLexer.DESTID == exclusiveOption.getSymbol().getType()) {
            checkHasIllegalOptions(context.SUBADDR(), "SUBADDR with DESTID");
            checkHasIllegalOptions(context.CONSOLE(), "CONSOLE with DESTID");
            checkHasIllegalOptions(context.PRINT(), "PRINT with DESTID");
            checkHasIllegalOptions(context.CARD(), "CARD with DESTID");
            checkHasIllegalOptions(context.WPMEDIA1(), "WPMEDIA1 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA2(), "WPMEDIA2 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA3(), "WPMEDIA3 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA4(), "WPMEDIA4 with DESTID");
          } else if (CICSLexer.SUBADDR == exclusiveOption.getSymbol().getType()) {
            checkHasIllegalOptions(context.DESTIDLENG(), "DESTIDLENG with SUBADDR");
            checkHasMutuallyExclusiveOptions(
                "CONSOLE or PRINT or CARD or WPMEDIA1 or WPMEDIA2 or WPMEDIA3 or WPMEDIA4",
                context.CONSOLE(),
                context.PRINT(),
                context.CARD(),
                context.WPMEDIA1(),
                context.WPMEDIA2(),
                context.WPMEDIA3(),
                context.WPMEDIA4());
          }

          if (!hasVolume) checkHasIllegalOptions(context.VOLUMELENG(), "VOLUMELENG without VOLUME");
        });
  }
}
