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

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_issue;

/** Checks CICS Issue rules for required and invalid options */
public class CICSIssueOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_issue;

  public CICSIssueOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors);
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
  }

  private void checkAbend(CICSParser.Cics_issue_abendContext ctx) {
    checkHasMandatoryOptions(ctx.ABEND(), ctx, "ABEND");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ABEND(), "ABEND"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkAbort(CICSParser.Cics_issue_abortContext ctx) {
    checkHasMandatoryOptions(ctx.ABORT(), ctx, "ABORT");
    if (!ctx.DESTID().isEmpty()) {
      checkHasIllegalOptions(ctx.SUBADDR(), "SUBADDR with DESTID");
      checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE with DESTID");
      checkHasIllegalOptions(ctx.PRINT(), "PRINT with DESTID");
      checkHasIllegalOptions(ctx.CARD(), "CARD with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 with DESTID");
    } else {
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
      int subArgCount =
          ctx.CONSOLE().size()
              + ctx.PRINT().size()
              + ctx.CARD().size()
              + ctx.WPMEDIA1().size()
              + ctx.WPMEDIA2().size()
              + ctx.WPMEDIA3().size()
              + ctx.WPMEDIA4().size();
      if (subArgCount > 1 || (ctx.SUBADDR().isEmpty() && subArgCount > 0)) {
        checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE without SUBADDR");
        checkHasIllegalOptions(ctx.PRINT(), "PRINT without SUBADDR");
        checkHasIllegalOptions(ctx.CARD(), "CARD without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
      }
    }
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ABORT(), "ABORT"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.SUBADDR(), "SUBADDR"));
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT"));
    contexts.add(new RuleContextData(ctx.CARD(), "CARD"));
    contexts.add(new RuleContextData(ctx.CONSOLE(), "CONSOLE"));
    contexts.add(new RuleContextData(ctx.WPMEDIA1(), "WPMEDIA1"));
    contexts.add(new RuleContextData(ctx.WPMEDIA2(), "WPMEDIA2"));
    contexts.add(new RuleContextData(ctx.WPMEDIA3(), "WPMEDIA3"));
    contexts.add(new RuleContextData(ctx.WPMEDIA4(), "WPMEDIA4"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkAdd(CICSParser.Cics_issue_addContext ctx) {
    checkHasMandatoryOptions(ctx.ADD(), ctx, "ADD");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    if (ctx.RIDFLD().isEmpty()) checkHasIllegalOptions(ctx.RRN(), "RRN without RIDFLD");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ADD(), "ADD"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.NUMREC(), "NUMREC"));
    contexts.add(new RuleContextData(ctx.DEFRESP(), "DEFRESP", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.NOWAIT(), "NOWAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.RIDFLD(), "RIDFLD"));
    contexts.add(new RuleContextData(ctx.RRN(), "RRN", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkConfirmation(CICSParser.Cics_issue_confirmationContext ctx) {
    checkHasMandatoryOptions(ctx.CONFIRMATION(), ctx, "CONFIRMATION");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.CONFIRMATION(), "CONFIRMATION"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkCopy(CICSParser.Cics_issue_copyContext ctx) {
    checkHasMandatoryOptions(ctx.COPY(), ctx, "COPY");
    checkHasMandatoryOptions(ctx.TERMID(), ctx, "TERMID");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.COPY(), "COPY"));
    contexts.add(new RuleContextData(ctx.TERMID(), "TERMID"));
    contexts.add(new RuleContextData(ctx.CTLCHAR(), "CTLCHAR"));
    contexts.add(new RuleContextData(ctx.WAIT(), "WAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkDisconnect(CICSParser.Cics_issue_disconnectContext ctx) {
    checkHasMandatoryOptions(ctx.DISCONNECT(), ctx, "DISCONNECT");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.DISCONNECT(), "DISCONNECT"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkEnd(CICSParser.Cics_issue_endContext ctx) {
    checkHasMandatoryOptions(ctx.END(), ctx, "END");
    if (!ctx.DESTID().isEmpty()) {
      checkHasIllegalOptions(ctx.SUBADDR(), "SUBADDR with DESTID");
      checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE with DESTID");
      checkHasIllegalOptions(ctx.PRINT(), "PRINT with DESTID");
      checkHasIllegalOptions(ctx.CARD(), "CARD with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 with DESTID");
    } else {
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
      int subArgCount =
          ctx.CONSOLE().size()
              + ctx.PRINT().size()
              + ctx.CARD().size()
              + ctx.WPMEDIA1().size()
              + ctx.WPMEDIA2().size()
              + ctx.WPMEDIA3().size()
              + ctx.WPMEDIA4().size();
      if (subArgCount > 1 || (ctx.SUBADDR().isEmpty() && subArgCount > 0)) {
        checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE without SUBADDR");
        checkHasIllegalOptions(ctx.PRINT(), "PRINT without SUBADDR");
        checkHasIllegalOptions(ctx.CARD(), "CARD without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
      }
    }
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.END(), "END"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.SUBADDR(), "SUBADDR"));
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT"));
    contexts.add(new RuleContextData(ctx.CARD(), "CARD"));
    contexts.add(new RuleContextData(ctx.CONSOLE(), "CONSOLE"));
    contexts.add(new RuleContextData(ctx.WPMEDIA1(), "WPMEDIA1"));
    contexts.add(new RuleContextData(ctx.WPMEDIA2(), "WPMEDIA2"));
    contexts.add(new RuleContextData(ctx.WPMEDIA3(), "WPMEDIA3"));
    contexts.add(new RuleContextData(ctx.WPMEDIA4(), "WPMEDIA4"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkEndFileOutput(CICSParser.Cics_issue_endfile_endoutputContext ctx) {
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ENDFILE(), "ENDFILE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.ENDOUTPUT(), "ENDOUTPUT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkEODS(CICSParser.Cics_issue_eodsContext ctx) {
    checkHasMandatoryOptions(ctx.EODS(), ctx, "EODS");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.EODS(), "EODS", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkErase(CICSParser.Cics_issue_eraseContext ctx) {
    checkHasMandatoryOptions(ctx.ERASE(), ctx, "ERASE");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    if (ctx.KEYLENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.KEYNUMBER(), "KEYNUMBER without KEYLENGTH");
      checkHasMandatoryOptions(ctx.RRN(), ctx, "RRN");
    } else checkHasIllegalOptions(ctx.RRN(), "RRN with KEYLENGTH");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ERASE(), "ERASE"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.RIDFLD(), "RIDFLD"));
    contexts.add(new RuleContextData(ctx.RRN(), "RRN", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.KEYLENGTH(), "KEYLENGTH"));
    contexts.add(new RuleContextData(ctx.KEYNUMBER(), "KEYNUMBER"));
    contexts.add(new RuleContextData(ctx.NUMREC(), "NUMREC"));
    contexts.add(new RuleContextData(ctx.DEFRESP(), "DEFRESP", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.NOWAIT(), "NOWAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkEraseAUP(CICSParser.Cics_issue_erase_aupContext ctx) {
    checkHasMandatoryOptions(ctx.ERASEAUP(), ctx, "ERASEAUP");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ERASEAUP(), "ERASEAUP"));
    contexts.add(new RuleContextData(ctx.WAIT(), "WAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkError(CICSParser.Cics_issue_errorContext ctx) {
    checkHasMandatoryOptions(ctx.ERROR(), ctx, "ERROR");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ERROR(), "ERROR"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkLoad(CICSParser.Cics_issue_loadContext ctx) {
    checkHasMandatoryOptions(ctx.LOAD(), ctx, "LOAD");
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.LOAD(), "LOAD"));
    contexts.add(new RuleContextData(ctx.PROGRAM(), "PROGRAM"));
    contexts.add(new RuleContextData(ctx.CONVERSE(), "CONVERSE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkNote(CICSParser.Cics_issue_noteContext ctx) {
    checkHasMandatoryOptions(ctx.NOTE(), ctx, "NOTE");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasMandatoryOptions(ctx.RRN(), ctx, "RRN");

    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.NOTE(), "NOTE"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.RIDFLD(), "RIDFLD"));
    contexts.add(new RuleContextData(ctx.RRN(), "RRN", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkPass(CICSParser.Cics_issue_passContext ctx) {
    checkHasMandatoryOptions(ctx.PASS(), ctx, "PASS");
    checkHasMandatoryOptions(ctx.LUNAME(), ctx, "LUNAME");

    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH without FROM");
    if (!ctx.LOGMODE().isEmpty())
      checkHasIllegalOptions(ctx.LOGONLOGMODE(), "LOGONLOGMODE without LOGMODE");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PASS(), "PASS"));
    contexts.add(new RuleContextData(ctx.LUNAME(), "LUNAME"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.LOGMODE(), "LOGMODE"));
    contexts.add(new RuleContextData(ctx.LOGONLOGMODE(), "LOGONLOGMODE"));
    contexts.add(new RuleContextData(ctx.NOQUIESCE(), "NOQUIESCE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkPrepare(CICSParser.Cics_issue_prepareContext ctx) {
    checkHasMandatoryOptions(ctx.PREPARE(), ctx, "PREPARE");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PREPARE(), "PREPARE"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkPrint(CICSParser.Cics_issue_printContext ctx) {
    checkHasMandatoryOptions(ctx.PRINT(), ctx, "PRINT");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkQuery(CICSParser.Cics_issue_queryContext ctx) {
    checkHasMandatoryOptions(ctx.QUERY(), ctx, "QUERY");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");

    if (ctx.DESTID().isEmpty())
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.QUERY(), "QUERY"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkReceive(CICSParser.Cics_issue_receiveContext ctx) {
    checkHasMandatoryOptions(ctx.RECEIVE(), ctx, "RECEIVE");
    if (ctx.INTO().isEmpty()) checkHasMandatoryOptions(ctx.SET(), ctx, "INTO or SET");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.RECEIVE(), "RECEIVE"));
    contexts.add(new RuleContextData(ctx.SET(), "SET"));
    contexts.add(new RuleContextData(ctx.INTO(), "INTO"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
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

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.REPLACE(), "REPLACE"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.KEYLENGTH(), "KEYLENGTH"));
    contexts.add(new RuleContextData(ctx.KEYNUMBER(), "KEYNUMBER"));
    contexts.add(new RuleContextData(ctx.RRN(), "RRN", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.DEFRESP(), "DEFRESP", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.NOWAIT(), "NOWAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkSend(CICSParser.Cics_issue_sendContext ctx) {
    checkHasMandatoryOptions(ctx.SEND(), ctx, "SEND");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    if (!ctx.DESTID().isEmpty()) {
      checkHasIllegalOptions(ctx.SUBADDR(), "SUBADDR with DESTID");
      checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE with DESTID");
      checkHasIllegalOptions(ctx.PRINT(), "PRINT with DESTID");
      checkHasIllegalOptions(ctx.CARD(), "CARD with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 with DESTID");
    } else {
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
      int subArgCount =
          ctx.CONSOLE().size()
              + ctx.PRINT().size()
              + ctx.CARD().size()
              + ctx.WPMEDIA1().size()
              + ctx.WPMEDIA2().size()
              + ctx.WPMEDIA3().size()
              + ctx.WPMEDIA4().size();
      if (subArgCount > 1 || (ctx.SUBADDR().isEmpty() && subArgCount > 0)) {
        checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE without SUBADDR");
        checkHasIllegalOptions(ctx.PRINT(), "PRINT without SUBADDR");
        checkHasIllegalOptions(ctx.CARD(), "CARD without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
      }
    }
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.SEND(), "SEND"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.SUBADDR(), "SUBADDR"));
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT"));
    contexts.add(new RuleContextData(ctx.CARD(), "CARD"));
    contexts.add(new RuleContextData(ctx.CONSOLE(), "CONSOLE"));
    contexts.add(new RuleContextData(ctx.WPMEDIA1(), "WPMEDIA1"));
    contexts.add(new RuleContextData(ctx.WPMEDIA2(), "WPMEDIA2"));
    contexts.add(new RuleContextData(ctx.WPMEDIA3(), "WPMEDIA3"));
    contexts.add(new RuleContextData(ctx.WPMEDIA4(), "WPMEDIA4"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.NOWAIT(), "NOWAIT", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.DEFRESP(), "DEFRESP", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkSignal(CICSParser.Cics_issue_signalContext ctx) {
    checkHasMandatoryOptions(ctx.SIGNAL(), ctx, "SIGNAL");

    if (!ctx.CONVID().isEmpty()) checkHasIllegalOptions(ctx.SESSION(), "SESSION with CONVID");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.SIGNAL(), "SIGNAL"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  void checkWait(CICSParser.Cics_issue_waitContext ctx) {
    checkHasMandatoryOptions(ctx.WAIT(), ctx, "WAIT");

    if (!ctx.DESTID().isEmpty()) {
      checkHasIllegalOptions(ctx.SUBADDR(), "SUBADDR with DESTID");
      checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE with DESTID");
      checkHasIllegalOptions(ctx.PRINT(), "PRINT with DESTID");
      checkHasIllegalOptions(ctx.CARD(), "CARD with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 with DESTID");
    } else {
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
      int subArgCount =
          ctx.CONSOLE().size()
              + ctx.PRINT().size()
              + ctx.CARD().size()
              + ctx.WPMEDIA1().size()
              + ctx.WPMEDIA2().size()
              + ctx.WPMEDIA3().size()
              + ctx.WPMEDIA4().size();
      if (subArgCount > 1 || (ctx.SUBADDR().isEmpty() && subArgCount > 0)) {
        checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE without SUBADDR");
        checkHasIllegalOptions(ctx.PRINT(), "PRINT without SUBADDR");
        checkHasIllegalOptions(ctx.CARD(), "CARD without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 without SUBADDR");
        checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 without SUBADDR");
      }
    }
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.WAIT(), "WAIT"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.SUBADDR(), "SUBADDR"));
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT"));
    contexts.add(new RuleContextData(ctx.CARD(), "CARD"));
    contexts.add(new RuleContextData(ctx.CONSOLE(), "CONSOLE"));
    contexts.add(new RuleContextData(ctx.WPMEDIA1(), "WPMEDIA1"));
    contexts.add(new RuleContextData(ctx.WPMEDIA2(), "WPMEDIA2"));
    contexts.add(new RuleContextData(ctx.WPMEDIA3(), "WPMEDIA3"));
    contexts.add(new RuleContextData(ctx.WPMEDIA4(), "WPMEDIA4"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    checkDuplicates(contexts);
  }
}
