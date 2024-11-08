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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_issue;

/** Checks CICS Issue rules for required and invalid options */
public class CICSIssueOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_issue;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ABEND, ErrorSeverity.ERROR);
          put(CICSLexer.CONVID, ErrorSeverity.ERROR);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
          put(CICSLexer.ABORT, ErrorSeverity.ERROR);
          put(CICSLexer.DESTID, ErrorSeverity.ERROR);
          put(CICSLexer.DESTIDLENG, ErrorSeverity.ERROR);
          put(CICSLexer.SUBADDR, ErrorSeverity.ERROR);
          put(CICSLexer.VOLUME, ErrorSeverity.ERROR);
          put(CICSLexer.VOLUMELENG, ErrorSeverity.ERROR);
          put(CICSLexer.CONSOLE, ErrorSeverity.ERROR);
          put(CICSLexer.PRINT, ErrorSeverity.ERROR);
          put(CICSLexer.CARD, ErrorSeverity.ERROR);
          put(CICSLexer.WPMEDIA1, ErrorSeverity.ERROR);
          put(CICSLexer.WPMEDIA2, ErrorSeverity.ERROR);
          put(CICSLexer.WPMEDIA3, ErrorSeverity.ERROR);
          put(CICSLexer.WPMEDIA4, ErrorSeverity.ERROR);
          put(CICSLexer.ADD, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.NUMREC, ErrorSeverity.ERROR);
          put(CICSLexer.FROM, ErrorSeverity.ERROR);
          put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
          put(CICSLexer.CONFIRMATION, ErrorSeverity.ERROR);
          put(CICSLexer.COPY, ErrorSeverity.ERROR);
          put(CICSLexer.TERMID, ErrorSeverity.ERROR);
          put(CICSLexer.CTLCHAR, ErrorSeverity.ERROR);
          put(CICSLexer.DISCONNECT, ErrorSeverity.ERROR);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.END, ErrorSeverity.ERROR);
          put(CICSLexer.ENDFILE, ErrorSeverity.ERROR);
          put(CICSLexer.ENDOUTPUT, ErrorSeverity.ERROR);
          put(CICSLexer.ERASE, ErrorSeverity.ERROR);
          put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.KEYNUMBER, ErrorSeverity.ERROR);
          put(CICSLexer.ERASEAUP, ErrorSeverity.ERROR);
          put(CICSLexer.ERROR, ErrorSeverity.ERROR);
          put(CICSLexer.LOAD, ErrorSeverity.ERROR);
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.CONVERSE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTE, ErrorSeverity.ERROR);
          put(CICSLexer.PASS, ErrorSeverity.ERROR);
          put(CICSLexer.LUNAME, ErrorSeverity.ERROR);
          put(CICSLexer.LOGMODE, ErrorSeverity.ERROR);
          put(CICSLexer.LOGONLOGMODE, ErrorSeverity.ERROR);
          put(CICSLexer.NOQUIESCE, ErrorSeverity.ERROR);
          put(CICSLexer.PREPARE, ErrorSeverity.ERROR);
          put(CICSLexer.QUERY, ErrorSeverity.ERROR);
          put(CICSLexer.RECEIVE, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.REPLACE, ErrorSeverity.ERROR);
          put(CICSLexer.SEND, ErrorSeverity.ERROR);
          put(CICSLexer.SIGNAL, ErrorSeverity.ERROR);
          put(CICSLexer.WAIT, ErrorSeverity.ERROR);
          put(CICSLexer.EODS, ErrorSeverity.ERROR);

          put(CICSLexer.DEFRESP, ErrorSeverity.WARNING);
          put(CICSLexer.NOWAIT, ErrorSeverity.WARNING);
          put(CICSLexer.RRN, ErrorSeverity.WARNING);
          put(CICSLexer.NOQUEUE, ErrorSeverity.WARNING);
          put(CICSLexer.TERMINAL, ErrorSeverity.WARNING);
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
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_issue_abend:
        checkAbend((CICSParser.Cics_issue_abendContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_abort:
        checkAbort((CICSParser.Cics_issue_abortContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_add:
        checkAdd((CICSParser.Cics_issue_addContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_confirmation:
        checkConfirmation((CICSParser.Cics_issue_confirmationContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_copy:
        checkCopy((CICSParser.Cics_issue_copyContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_disconnect:
        checkDisconnect((CICSParser.Cics_issue_disconnectContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_end:
        checkEnd((CICSParser.Cics_issue_endContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_eods:
        checkEODS((CICSParser.Cics_issue_eodsContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_erase:
        checkErase((CICSParser.Cics_issue_eraseContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_error:
        checkError((CICSParser.Cics_issue_errorContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_load:
        checkLoad((CICSParser.Cics_issue_loadContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_note:
        checkNote((CICSParser.Cics_issue_noteContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_pass:
        checkPass((CICSParser.Cics_issue_passContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_prepare:
        checkPrepare((CICSParser.Cics_issue_prepareContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_print:
        checkPrint((CICSParser.Cics_issue_printContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_query:
        checkQuery((CICSParser.Cics_issue_queryContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_receive:
        checkReceive((CICSParser.Cics_issue_receiveContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_replace:
        checkReplace((CICSParser.Cics_issue_replaceContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_send:
        checkSend((CICSParser.Cics_issue_sendContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_signal:
        checkSignal((CICSParser.Cics_issue_signalContext) ctx);
        break;
      case CICSParser.RULE_cics_issue_wait:
        checkWait((CICSParser.Cics_issue_waitContext) ctx);
        break;
      default:
        break;
    }
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

  void checkEODS(CICSParser.Cics_issue_eodsContext ctx) {
    checkHasMandatoryOptions(ctx.EODS(), ctx, "EODS");
  }

  void checkErase(CICSParser.Cics_issue_eraseContext ctx) {
    checkHasMandatoryOptions(ctx.ERASE(), ctx, "ERASE");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    checkHasExactlyOneOption("RRN or KEYLENGTH", ctx, ctx.RRN(), ctx.KEYLENGTH());

    if (ctx.KEYLENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.KEYNUMBER(), "KEYNUMBER without KEYLENGTH");
    }
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
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
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
    checkIssueCommon(ctx.cics_issue_common());
  }

  void checkIssueCommon(List<CICSParser.Cics_issue_commonContext> ctx) {
    List<TerminalNode> destIds =
        ctx.stream().flatMap(context -> context.DESTID().stream()).collect(Collectors.toList());

    List<TerminalNode> subAddrs =
        ctx.stream().flatMap(context -> context.SUBADDR().stream()).collect(Collectors.toList());

    checkHasMutuallyExclusiveOptions("SUBADDR or DESTID", destIds, subAddrs);

    boolean hasVolume = !(ctx.stream().mapToInt(context -> context.VOLUME().size()).sum() == 0);

    ctx.forEach(
        context -> {
          if (destIds.isEmpty() && subAddrs.isEmpty()) {
            checkHasIllegalOptions(context.DESTIDLENG(), "DESTIDLENG without DESTID");
            checkHasIllegalOptions(context.CONSOLE(), "CONSOLE without SUBADDR");
            checkHasIllegalOptions(context.PRINT(), "PRINT without SUBADDR");
            checkHasIllegalOptions(context.CARD(), "CARD without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
            checkHasIllegalOptions(context.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
          } else if (!destIds.isEmpty()) {
            checkHasIllegalOptions(context.CONSOLE(), "CONSOLE with DESTID");
            checkHasIllegalOptions(context.PRINT(), "PRINT with DESTID");
            checkHasIllegalOptions(context.CARD(), "CARD with DESTID");
            checkHasIllegalOptions(context.WPMEDIA1(), "WPMEDIA1 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA2(), "WPMEDIA2 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA3(), "WPMEDIA3 with DESTID");
            checkHasIllegalOptions(context.WPMEDIA4(), "WPMEDIA4 with DESTID");
          } else {
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
