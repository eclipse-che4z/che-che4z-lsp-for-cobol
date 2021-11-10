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
package org.eclipse.lsp.cobol.core.strategy;

import com.google.common.collect.ImmutableSet;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.InputMismatchException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.messages.MessageService;

import java.util.*;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.CobolLexer.EOF;

/**
 * This implementation of the error strategy customizes error messages that are extracted from the
 * parsing exceptions
 */
@Slf4j
@Singleton
// for test
@NoArgsConstructor
public class CobolErrorStrategy extends DefaultErrorStrategy {
  private static final String REPORT_INPUT_MISMATCH = "ErrorStrategy.reportInputMismatch";
  private static final String REPORT_NO_VIABLE_ALTERNATIVE =
      "ErrorStrategy.reportNoViableAlternative";
  private static final String REPORT_UNWANTED_TOKEN = "ErrorStrategy.reportUnwantedToken";
  private static final String REPORT_MISSING_TOKEN = "ErrorStrategy.reportMissingToken";
  private static final String END_OF_FILE_MESSAGE = "ErrorStrategy.endOfFile";
  private static final String PERFORM_MISSING_END = "ErrorStrategy.performMissingEnd";
  private static final String MSG_DELIMITER = ", ";
  private static final String MSG_PREFIX = "{";
  private static final String MSG_SUFFIX = "}";

  private static final Map<String, String> SPECIAL_TOKEN_MAPPING =
      SpecialTokenReplacing.loadSpecialTokenMapping();
  private static final Map<Class<? extends Parser>, Set<String>> IDENTIFIER_TOKENS =
      IdentifierReplacing.retrieveTokenToRemove();

  @Getter @Setter private MessageService messageService;

  @Inject
  public CobolErrorStrategy(MessageService messageService) {
    this.messageService = messageService;
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
        token.getType() == EOF
            ? parseCustomMessage(END_OF_FILE_MESSAGE)
            : parseCustomMessage(
                REPORT_INPUT_MISMATCH, getOffendingToken(e), getExpectedText(recognizer, e));
    recognizer.notifyErrorListeners(token, msg, e);
  }

  @Override
  protected void reportNoViableAlternative(Parser recognizer, NoViableAltException e) {
    String msg = parseCustomMessage(REPORT_NO_VIABLE_ALTERNATIVE, retrieveInput(recognizer, e));
    recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e);
  }

  @Override
  protected void reportUnwantedToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    Token currentToken = recognizer.getCurrentToken();

    String msg =
        currentToken.getType() == EOF
            ? parseCustomMessage(END_OF_FILE_MESSAGE)
            : createMessage(recognizer, currentToken);

    recognizer.notifyErrorListeners(currentToken, msg, null);
  }

  @Override
  protected void reportMissingToken(Parser recognizer) {
    if (inErrorRecoveryMode(recognizer)) {
      return;
    }
    beginErrorCondition(recognizer);
    String msg =
        parseCustomMessage(REPORT_MISSING_TOKEN, getExpectedText(recognizer), getRule(recognizer));
    recognizer.notifyErrorListeners(recognizer.getCurrentToken(), msg, null);
  }

  private String createMessage(Parser recognizer, Token t) {
    String tokenName = SPECIAL_TOKEN_MAPPING.getOrDefault(t.getText(), t.getText());
    return recognizer.getContext().getRuleIndex() == CobolParser.RULE_performInlineStatement
        ? parseCustomMessage(PERFORM_MISSING_END, tokenName)
        : parseCustomMessage(REPORT_UNWANTED_TOKEN, tokenName, getExpectedText(recognizer));
  }

  private String retrieveInput(Parser recognizer, NoViableAltException e) {
    return Optional.ofNullable(recognizer.getInputStream())
        .map(it -> it.getText(e.getStartToken(), e.getOffendingToken()))
        .orElse("<unknown input>");
  }

  private String getExpectedText(Parser recognizer) {
    return getExpectedText(recognizer, getExpectedTokens(recognizer));
  }

  private String getExpectedText(Parser recognizer, InputMismatchException e) {
    return getExpectedText(recognizer, e.getExpectedTokens());
  }

  private String getExpectedText(Parser recognizer, IntervalSet interval) {
    final String newMessage =
        buildErrorMessage(
            removeIdentifierTokens(recognizer, collectErrorTokens(recognizer, interval)));
    return interval.size() > 1 ? String.format("{%s}", newMessage) : newMessage;
  }

  private String buildErrorMessage(List<String> tokens) {
    return tokens.stream()
        .map(it -> SPECIAL_TOKEN_MAPPING.getOrDefault(it, it))
        .filter(it -> !it.isEmpty())
        .map(it -> it.replace("_", "-"))
        .collect(joining(MSG_DELIMITER));
  }

  private List<String> removeIdentifierTokens(Parser recognizer, List<String> tokens) {
    final Set<String> identifierTokens =
        IDENTIFIER_TOKENS.getOrDefault(recognizer.getClass(), ImmutableSet.of());
    if (tokens.containsAll(identifierTokens)) tokens.removeAll(identifierTokens);
    return tokens;
  }

  private List<String> collectErrorTokens(Parser recognizer, IntervalSet interval) {
    return Arrays.stream(
            interval
                .toString(recognizer.getVocabulary())
                .replace(MSG_PREFIX, "")
                .replace(MSG_SUFFIX, "")
                .split(MSG_DELIMITER))
        .collect(toList());
  }

  private static String getRule(Parser recognizer) {
    return recognizer.getRuleInvocationStack().get(0);
  }

  private String parseCustomMessage(String methodName, Object... params) {
    return messageService.getMessage(methodName, params);
  }

  private String getOffendingToken(InputMismatchException e) {
    return getTokenErrorDisplay(e.getOffendingToken());
  }
}
