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
import com.google.common.annotations.VisibleForTesting;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.InputMismatchException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Singleton
// for test
@NoArgsConstructor
public class CobolErrorStrategy extends DefaultErrorStrategy {

  private static final String REPORT_INPUT_MISMATCH = "reportInputMismatch";
  private static final String REPORT_NO_VIABLE_ALTERNATIVE = "reportNoViableAlternative";
  private static final String REPORT_UNWANTED_TOKEN = "reportUnwantedToken";
  private static final String REPORT_MISSING_TOKEN = "reportMissingToken";
  private static final String SPECIAL_TOKEN_HANDLING_FILEPATH = "SpecialTokenHandling.properties";
  private static final LinkedHashMap<String, String> SPECIAL_TOKEN_HANDLING_MAP;
  private static final String MSG_DELIMITER = ", ";
  private static final String MSG_PREFIX = "{";
  private static final String MSG_SUFFIX = "}";

  static {
    Properties props = new Properties();
    try (InputStream ins =
        CobolErrorStrategy.class.getResourceAsStream(SPECIAL_TOKEN_HANDLING_FILEPATH)) {
      props.load(ins);
    } catch (IOException exception) {
      LOG.error("SpecialTokenHandling didn't load.", exception);
      props.setProperty("_", "-");
    }
    SPECIAL_TOKEN_HANDLING_MAP =
        props.entrySet().stream()
            .collect(
                Collectors.toMap(
                    ele -> (String) ele.getKey(),
                    ele -> (String) ele.getValue(),
                    (a, b) -> b,
                    LinkedHashMap::new));
  }

  private MessageService messageService;

  @Inject
  public CobolErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
  }

  private static String getRule(Parser recognizer) {
    return recognizer.getRuleInvocationStack().get(0);
  }

  private String parseCustomMessage(String methodName, String rule, Object... params) {
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

  public MessageService getMessageService() {
    return messageService;
  }

  // for test
  @VisibleForTesting
  public void setMessageService(MessageService messageService) {
    this.messageService = messageService;
  }

  private String getExpectedToken(@NonNull Parser recognizer, InputMismatchException e) {
    IntervalSet expecting =
        Optional.ofNullable(e)
            .map(RecognitionException::getExpectedTokens)
            .orElseGet(() -> getExpectedTokens(recognizer));

    String expectedTokens =
        Optional.ofNullable(expecting)
            .map(exp -> exp.toString(recognizer.getVocabulary()))
            .orElse("");

    for (Map.Entry<String, String> entry : SPECIAL_TOKEN_HANDLING_MAP.entrySet()) {
      expectedTokens = expectedTokens.replace(entry.getKey(), entry.getValue());
    }

    return fixEmptyTokens(expectedTokens);
  }

  private String fixEmptyTokens(String expectedTokens) {
    return expectedTokens
        .replace(", ,", MSG_DELIMITER)
        .replace("{ ,", MSG_PREFIX)
        .replace(", }", MSG_SUFFIX);
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
    String erroneousToken = getTokenErrorDisplay(t);
    String msg;
    if (erroneousToken.equals("'<EOF>'")) {
      msg = messageService.getMessage("ErrorStrategy.endOfFile");
    } else {
      String tokenName =
          SPECIAL_TOKEN_HANDLING_MAP.getOrDefault(
              erroneousToken.substring(1, erroneousToken.length() - 1), getTokenErrorDisplay(t));
      msg =
          parseCustomMessage(
              REPORT_UNWANTED_TOKEN,
              getRule(recognizer),
              tokenName,
              getExpectedToken(recognizer, null));
    }
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
