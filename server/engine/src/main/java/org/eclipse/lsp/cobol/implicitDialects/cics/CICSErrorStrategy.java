/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.ATN;
import org.antlr.v4.runtime.atn.ATNState;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageServiceProvider;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.AllCicsRuleContext;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.CicsExecBlockContext;

/** CICS parser error strategy class */
@Slf4j
@NoArgsConstructor
public class CICSErrorStrategy extends DefaultErrorStrategy implements MessageServiceProvider {
  private static final String REPORT_NO_VIABLE_ALTERNATIVE =
      "ErrorStrategy.reportNoViableAlternative";
  private static final String REPORT_MISSING_TOKEN = "ErrorStrategy.reportMissingToken";

  @Getter @Setter private MessageService messageService;
  @Getter @Setter private ErrorMessageHelper errorMessageHelper;

  private static final IntervalSet RESTART_OPTIONS = new IntervalSet(
      CICSLexer.ABEND, CICSLexer.ADD, CICSLexer.ADDRESS, CICSLexer.ALLOCATE, CICSLexer.ASKTIME, CICSLexer.ASSIGN,
      CICSLexer.BIF, CICSLexer.BUILD, CICSLexer.CANCEL, CICSLexer.CHANGE, CICSLexer.CHECK, CICSLexer.CONNECT,
      CICSLexer.CONVERSE, CICSLexer.CONVERTTIME, CICSLexer.DEFINE, CICSLexer.DELAY, CICSLexer.DELETE,
      CICSLexer.DELETEQ, CICSLexer.DEQ, CICSLexer.DOCUMENT, CICSLexer.DUMP, CICSLexer.ENDBR, CICSLexer.ENDBROWSE,
      CICSLexer.ENQ, CICSLexer.ENTER, CICSLexer.EXTRACT, CICSLexer.FORCE, CICSLexer.FORMATTIME, CICSLexer.FREE,
      CICSLexer.FREEMAIN, CICSLexer.GDS, CICSLexer.GET, CICSLexer.GETMAIN, CICSLexer.GETNEXT, CICSLexer.HANDLE,
      CICSLexer.IGNORE, CICSLexer.INQUIRE, CICSLexer.INVOKE, CICSLexer.ISSUE, CICSLexer.LINK, CICSLexer.LOAD,
      CICSLexer.MONITOR, CICSLexer.MOVE, CICSLexer.POINT, CICSLexer.POP, CICSLexer.POST, CICSLexer.PURGE,
      CICSLexer.PUSH, CICSLexer.PUT, CICSLexer.QUERY, CICSLexer.READ, CICSLexer.READNEXT, CICSLexer.READQ,
      CICSLexer.RECEIVE, CICSLexer.RELEASE, CICSLexer.REMOVE, CICSLexer.RESET, CICSLexer.RESETBR, CICSLexer.RESUME,
      CICSLexer.RETRIEVE, CICSLexer.RETURN, CICSLexer.REWIND, CICSLexer.REWRITE, CICSLexer.ROUTE, CICSLexer.RUN,
      CICSLexer.SEND, CICSLexer.SET, CICSLexer.SIGNAL, CICSLexer.SIGNOFF, CICSLexer.SIGNON, CICSLexer.SOAPFAULT,
      CICSLexer.SPOOLCLOSE, CICSLexer.SPOOLOPEN, CICSLexer.SPOOLREAD, CICSLexer.SPOOLWRITE, CICSLexer.START,
      CICSLexer.STARTBR, CICSLexer.STARTBROWSE, CICSLexer.SUSPEND, CICSLexer.SYNCPOINT, CICSLexer.TEST,
      CICSLexer.TRANSFORM, CICSLexer.UNLOCK, CICSLexer.UPDATE, CICSLexer.VERIFY, CICSLexer.WAIT,
      CICSLexer.WAITCICS, CICSLexer.WEB, CICSLexer.WRITE, CICSLexer.WRITEQ, CICSLexer.WSACONTEXT,
      CICSLexer.WSAEPR, CICSLexer.XCTL, CICSLexer.END_EXEC, CICSLexer.DOT);
  private static final IntervalSet BLOCK_END_TOKENS = new IntervalSet(CICSLexer.END_EXEC, CICSLexer.DOT);
  private static final IntervalSet END_EXEC_ONLY = new IntervalSet(CICSLexer.END_EXEC);

  CICSErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
    this.errorMessageHelper = new ErrorMessageHelper(messageService);
  }

  @Override
  public void reportError(Parser recognizer, RecognitionException e) {
    // if we've already reported an error and have not matched a token
    // yet successfully, don't report any errors.
    if (inErrorRecoveryMode(recognizer)) {
      return; // don't report spurious errors
    }
    beginErrorCondition(recognizer);

    if (e instanceof NoViableAltException) {
      reportNoViableAlternative(recognizer, (NoViableAltException) e);
    } else if (e instanceof InputMismatchException) {
      reportInputMismatch(recognizer, (InputMismatchException) e);
    } else if (e instanceof FailedPredicateException) {
      reportFailedPredicate(recognizer, (FailedPredicateException) e);
    } else {
      reportUnrecognizedException(recognizer, e);
    }
  }

  private void reportUnrecognizedException(Parser recognizer, RecognitionException e) {
    LOG.error("unknown recognition error type: " + e.getClass().getName());
    recognizer.notifyErrorListeners(e.getOffendingToken(), e.getMessage(), e);
  }

  @Override
  protected void reportInputMismatch(Parser recognizer, InputMismatchException e) {
    Token token = e.getOffendingToken();
    String msg =
        errorMessageHelper.getInputMismatchMessage(recognizer, e, token, getOffendingToken(e));
    recognizer.notifyErrorListeners(token, msg, e);
  }

  @Override
  public void recover(Parser recognizer, RecognitionException e) {
    ParserRuleContext ctx = recognizer.getContext();
    if (ctx instanceof AllCicsRuleContext) {
      TokenStream input = recognizer.getInputStream();
      int m = input.mark();
      int index = input.index();
      if (index == ctx.start.getTokenIndex())
        input.consume();
      consumeUntil(recognizer, RESTART_OPTIONS);
      int next = input.LA(1);
      if (next == CICSLexer.DOT || next == CICSLexer.EOF) {
        input.seek(index);
      }
      input.release(m);
      return;
    } else if (ctx instanceof CicsExecBlockContext) {
      TokenStream input = recognizer.getInputStream();
      int m = input.mark();
      int index = input.index();
      if (index == ctx.start.getTokenIndex())
        input.consume();
      consumeUntil(recognizer, BLOCK_END_TOKENS);
      Token next = input.LT(1);
      if (next != null && next.getType() == CICSLexer.END_EXEC) {
        input.consume();
      } else {
        input.seek(index);
      }
      input.release(m);
      return;
    } else {
      for (ParserRuleContext p = ctx.getParent(); p != null; p = p.getParent()) {
        if (p instanceof CicsExecBlockContext) {
          throw e;
        }
      }
    }
    super.recover(recognizer, e);
  }

  @Override
  public Token recoverInline(Parser recognizer) {
    ParserRuleContext ctx = recognizer.getContext();
    if (ctx instanceof CicsExecBlockContext) {
      ATN atn = recognizer.getInterpreter().atn;
      ATNState state = atn.states.get(recognizer.getState());
      IntervalSet next = atn.nextTokens(state, recognizer.getContext());
      if (next.size() == 1 && next.contains(CICSLexer.END_EXEC)) {
        TokenStream input = recognizer.getInputStream();
        int m = input.mark();
        int index = input.index();
        consumeUntil(recognizer, END_EXEC_ONLY);
        Token t = input.LT(1);
        if (t != null && t.getType() == CICSLexer.END_EXEC) {
          input.release(m);
          input.consume();
          return t;
        }
        input.seek(index);
        input.release(m);
      }
    }

    return super.recoverInline(recognizer);
  }

  @Override
  protected void reportNoViableAlternative(Parser recognizer, NoViableAltException e) {
    String messageParams = errorMessageHelper.retrieveInputForNoViableException(recognizer, e);
    String msg = messageService.getMessage(REPORT_NO_VIABLE_ALTERNATIVE, messageParams);
    recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e);
  }

  @Override
  protected void reportUnwantedToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    Token currentToken = recognizer.getCurrentToken();
    String msg = errorMessageHelper.getUnwantedTokenMessage(recognizer, currentToken);
    recognizer.notifyErrorListeners(currentToken, msg, null);
  }

  @Override
  protected void reportMissingToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    String msg =
        messageService.getMessage(
            REPORT_MISSING_TOKEN,
            errorMessageHelper.getExpectedText(recognizer),
            ErrorMessageHelper.getRule(recognizer));
    recognizer.notifyErrorListeners(recognizer.getCurrentToken(), msg, null);
  }

  private String getOffendingToken(InputMismatchException e) {
    return getTokenErrorDisplay(e.getOffendingToken());
  }
}
