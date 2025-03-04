/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.directives;

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
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.implicitDialects.cics.ErrorMessageHelper;

/** Compiler Directives error strategy class */
@Setter
@Getter
@Slf4j
@NoArgsConstructor
public class CompilerDirectivesErrorStrategy extends DefaultErrorStrategy implements MessageServiceProvider {
  private static final String REPORT_NO_VIABLE_ALTERNATIVE = "ErrorStrategy.reportNoViableAlternative";
  private static final String REPORT_MISSING_TOKEN = "ErrorStrategy.reportMissingToken";

  private MessageService messageService;
  private ErrorMessageHelper errorMessageHelper;

  private static final IntervalSet BLOCK_END_TOKENS = new IntervalSet(CompilerDirectivesLexer.JAVA_SHAREABLE_OFF, CompilerDirectivesLexer.DOT);
  private static final IntervalSet JAVA_SHAREABLE_OFF_ONLY = new IntervalSet(CompilerDirectivesLexer.JAVA_SHAREABLE_OFF);

  public CompilerDirectivesErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
    this.errorMessageHelper = new ErrorMessageHelper(messageService);
  }

  @Override
  public void reportError(Parser recognizer, RecognitionException e) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
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
    if (ctx instanceof CompilerDirectivesParser.JavaShareableOnOffContext) {
      TokenStream input = recognizer.getInputStream();
      int m = input.mark();
      int index = input.index();
      if (index == ctx.start.getTokenIndex())
        input.consume();
      consumeUntil(recognizer, BLOCK_END_TOKENS);
      Token next = input.LT(1);
      if (next != null && next.getType() == CompilerDirectivesLexer.JAVA_SHAREABLE_OFF) {
        input.consume();
      } else {
        input.seek(index);
      }
      input.release(m);
      return;
    } else {
      for (ParserRuleContext p = ctx.getParent(); p != null; p = p.getParent()) {
        if (p instanceof CompilerDirectivesParser.JavaShareableOnOffContext) {
          throw e;
        }
      }
    }
    super.recover(recognizer, e);
  }

  @Override
  public Token recoverInline(Parser recognizer) {
    ParserRuleContext ctx = recognizer.getContext();
    if (ctx instanceof CompilerDirectivesParser.JavaShareableOnOffContext) {
      ATN atn = recognizer.getInterpreter().atn;
      ATNState state = atn.states.get(recognizer.getState());
      IntervalSet next = atn.nextTokens(state, recognizer.getContext());
      if (next.size() == 1 && next.contains(CompilerDirectivesLexer.JAVA_SHAREABLE_OFF)) {
        TokenStream input = recognizer.getInputStream();
        int m = input.mark();
        int index = input.index();
        consumeUntil(recognizer, JAVA_SHAREABLE_OFF_ONLY);
        Token t = input.LT(1);
        if (t != null && t.getType() == CompilerDirectivesLexer.JAVA_SHAREABLE_OFF) {
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
