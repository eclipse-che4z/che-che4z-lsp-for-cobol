/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableSet;
import org.antlr.v4.runtime.InputMismatchException;
import org.antlr.v4.runtime.NoViableAltException;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.eclipse.lsp.cobol.common.message.MessageService;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Recognizer.EOF;

/** This is a utility class to fetch error messages encountered while parsing COBOL file. */
class ErrorMessageHelper {
  private final MessageService messageService;
  static final String END_OF_FILE_MESSAGE = "ErrorStrategy.endOfFile";
  static final String REPORT_INPUT_MISMATCH = "ErrorStrategy.reportInputMismatch";
  static final String REPORT_UNWANTED_TOKEN = "ErrorStrategy.reportUnwantedToken";
  private static final String MSG_DELIMITER = ", ";
  private static final String MSG_PREFIX = "{";
  private static final String MSG_SUFFIX = "}";

  ErrorMessageHelper(MessageService messageService) {
    this.messageService = messageService;
  }

  /**
   * Returns an input mismatch error message for a {@link InputMismatchException}
   *
   * @param recognizer parser reference
   * @param e {@link InputMismatchException}
   * @param token token
   * @param offendingTokens offending token string
   * @return error message string
   */
  public String getInputMismatchMessage(
      Parser recognizer, InputMismatchException e, Token token, String offendingTokens) {
    return token.getType() == EOF
        ? messageService.getMessage(END_OF_FILE_MESSAGE)
        : messageService.getMessage(
            REPORT_INPUT_MISMATCH, offendingTokens, getExpectedText(recognizer, e));
  }

  /**
   * Returns a message in case unwanted token found while parsing.
   *
   * @param recognizer Parser reference
   * @param currentToken current token
   * @return error message string
   */
  public String getUnwantedTokenMessage(Parser recognizer, Token currentToken) {
    return currentToken.getType() == EOF
        ? messageService.getMessage(END_OF_FILE_MESSAGE)
        : createMessage(recognizer, currentToken);
  }

  /**
   * Returns an expected text, in case {@link InputMismatchException} is encountered while parsing.
   *
   * @param recognizer Parser ref
   * @return an expected text
   */
  public String getExpectedText(Parser recognizer) {
    return getExpectedText(recognizer, recognizer.getExpectedTokens());
  }

  /**
   * Returns the last invocation rule while parsing.
   *
   * @param recognizer parser ref
   * @return last invocation rule
   */
  public static String getRule(Parser recognizer) {
    return recognizer.getRuleInvocationStack().get(0);
  }

  /**
   * Returns input string which resulted in {@link NoViableAltException}
   *
   * @param recognizer parser ref
   * @param e {@link NoViableAltException}
   * @return input string
   */
  public String retrieveInputForNoViableException(Parser recognizer, NoViableAltException e) {
    return Optional.ofNullable(recognizer.getInputStream())
        .map(it -> it.getText(e.getStartToken(), e.getOffendingToken()))
        .orElse("<unknown input>");
  }

  private String getExpectedText(Parser recognizer, InputMismatchException e) {
    return getExpectedText(recognizer, e.getExpectedTokens());
  }

  private String getExpectedText(Parser recognizer, IntervalSet interval) {
    final String newMessage =
        buildErrorMessage(
            removeIdentifierTokens(collectErrorTokens(recognizer, interval)));
    return interval.size() > 1 ? String.format("{%s}", newMessage) : newMessage;
  }

  private String createMessage(Parser recognizer, Token t) {
    String tokenName = t.getText();
    return messageService.getMessage(REPORT_UNWANTED_TOKEN, tokenName);
  }

  private String buildErrorMessage(List<String> tokens) {
    return tokens.stream()
        .filter(it -> !it.isEmpty())
        .map(it -> it.replace("_", "-"))
        .distinct()
        .collect(joining(MSG_DELIMITER));
  }

  private List<String> removeIdentifierTokens(List<String> tokens) {
    final Set<String> identifierTokens = ImmutableSet.of();
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
}
