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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.strategy;

import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.FailedPredicateException;
import org.antlr.v4.runtime.InputMismatchException;
import org.antlr.v4.runtime.NoViableAltException;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.misc.IntervalSet;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CobolErrorStrategy extends DefaultErrorStrategy {

  private static final Messages customMessages = new Messages();
  private static final String REPORT_INPUT_MISMATCH = "reportInputMismatch";
  private static final String REPORT_NO_VIABLE_ALTERNATIVE = "reportNoViableAlternative";
  private static final String REPORT_UNWANTED_TOKEN = "reportUnwantedToken";
  private static final String REPORT_MISSING_TOKEN = "reportMissingToken";

  private static String parseCustomMessage(String standardMsg, String methodName, String rule) {
    String customMsg = customMessages.getValueForKey(rule.concat(methodName));
    return checkIfMessageExist(standardMsg, customMsg);
  }

  private static String checkIfMessageExist(String standardMsg, String customMsg) {
    return (customMsg == null) ? standardMsg : customMsg;
  }

  private String getOffendingToken(InputMismatchException e) {
    return getTokenErrorDisplay(e.getOffendingToken());
  }

  private String getExpectedToken(Parser recognizer, InputMismatchException e) {
    if (e == null) {
      IntervalSet expecting = getExpectedTokens(recognizer);
      return expecting.toString(recognizer.getVocabulary());
    } else {
      return e.getExpectedTokens().toString(recognizer.getVocabulary());
    }
  }

  private static String getStandardMessage(String exceptionName) {
    return customMessages.getValueForKey(exceptionName);
  }

  private static String getRule(Parser recognizer) {
    return recognizer.getRuleInvocationStack().get(0);
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
        String.format(
            parseCustomMessage(
                getStandardMessage(REPORT_INPUT_MISMATCH), REPORT_INPUT_MISMATCH, getRule(recognizer)),
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
    String msg =
        String.format(
            parseCustomMessage(
                getStandardMessage(REPORT_NO_VIABLE_ALTERNATIVE),
                    REPORT_NO_VIABLE_ALTERNATIVE,
                getRule(recognizer)),
            input,
            null);
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
        String.format(
            parseCustomMessage(
                getStandardMessage(REPORT_UNWANTED_TOKEN), REPORT_UNWANTED_TOKEN, getRule(recognizer)),
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
        String.format(
            parseCustomMessage(getStandardMessage(REPORT_MISSING_TOKEN), REPORT_MISSING_TOKEN, rule),
            getExpectedToken(recognizer, null),
            rule);
    recognizer.notifyErrorListeners(t, msg, null);
  }
}
