/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.cobol.core.strategy;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;

import java.util.MissingResourceException;

@Slf4j
@Singleton
public class CobolErrorStrategy extends DefaultErrorStrategy {

  private static final String REPORT_INPUT_MISMATCH = "reportInputMismatch";
  private static final String REPORT_NO_VIABLE_ALTERNATIVE = "reportNoViableAlternative";
  private static final String REPORT_UNWANTED_TOKEN = "reportUnwantedToken";
  private static final String REPORT_MISSING_TOKEN = "reportMissingToken";

  private MessageService messageService;

  @Inject
  public CobolErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
  }

  // for test
  public CobolErrorStrategy() {}

  private static String getRule(Parser recognizer) {
    return recognizer.getRuleInvocationStack().get(0);
  }

  private String parseCustomMessage(String methodName, String rule, String... params) {
    String messageKey = "ErrorStrategy.".concat(rule.concat(methodName));
    try {
      return messageService.getMessage(messageKey, params);
    } catch (MissingResourceException e1) {
      return messageService.getMessage("ErrorStrategy.".concat(methodName), params);
    }
  }

  private String getOffendingToken(InputMismatchException e) {
    return getTokenErrorDisplay(e.getOffendingToken());
  }

  // for test
  public void setMessageService(MessageService messageService) {
    this.messageService = messageService;
  }

  private String getExpectedToken(Parser recognizer, InputMismatchException e) {
    if (e == null) {
      IntervalSet expecting = getExpectedTokens(recognizer);
      return expecting.toString(recognizer.getVocabulary());
    } else {
      return e.getExpectedTokens().toString(recognizer.getVocabulary());
    }
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
      LOG.error("unknown recognition error type: " + e.getClass().getName());
      recognizer.notifyErrorListeners(e.getOffendingToken(), e.getMessage(), e);
    }
  }

  @Override
  protected void reportInputMismatch(Parser recognizer, InputMismatchException e) {
    String msg =
        parseCustomMessage(
            REPORT_INPUT_MISMATCH,
            getRule(recognizer),
            getOffendingToken(e),
            getExpectedToken(recognizer, e));
    recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e);
  }

  @Override
  protected void reportNoViableAlternative(Parser recognizer, NoViableAltException e) {
    TokenStream tokens = recognizer.getInputStream();
    String input;
    if (tokens != null) {
      if (e.getStartToken().getType() == Token.EOF) input = "<EOF>";
      else input = tokens.getText(e.getStartToken(), e.getOffendingToken());
    } else {
      input = "<unknown input>";
    }

    String msg = parseCustomMessage(REPORT_NO_VIABLE_ALTERNATIVE, getRule(recognizer), input);
    recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e);
  }

  @Override
  protected void reportUnwantedToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    Token t = recognizer.getCurrentToken();
    String tokenName = getTokenErrorDisplay(t);
    String msg =
        parseCustomMessage(
            REPORT_UNWANTED_TOKEN,
            getRule(recognizer),
            tokenName,
            getExpectedToken(recognizer, null));
    recognizer.notifyErrorListeners(t, msg, null);
  }

  @Override
  protected void reportMissingToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    Token t = recognizer.getCurrentToken();
    String rule = getRule(recognizer);
    String msg =
        parseCustomMessage(REPORT_MISSING_TOKEN, rule, getExpectedToken(recognizer, null), rule);
    recognizer.notifyErrorListeners(t, msg, null);
  }
}
