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

package org.eclipse.lsp.cobol.core;

import com.google.common.annotations.VisibleForTesting;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.TokenStream;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;

/**
 * Provide the support of message externalization for Parser.
 *
 * <p>Usage: options { superClass = MessageServiceParser;}
 */
public abstract class MessageServiceParser extends Parser {

  /** @param input {@link TokenStream} */
  MessageServiceParser(TokenStream input) {
    super(input);
  }

  /**
   * Extend the functionality of {@link org.eclipse.lsp.cobol.core.messages.MessageService} for
   * {@link CobolParser}
   *
   * <p>Example: notifyError("db2SqlParser.validValueMsg", input, value); would notify errorListener
   * with the externalized messages.
   *
   * @param messageId Unique ID for each message in externalized message file.
   * @param parameters Arguments referenced by the format specifiers in the format string in
   *     externalized message file.
   */
  public void notifyError(String messageId, String... parameters) {
    String message = getMessageForParser(messageId, parameters);
    notifyListeners(message);
  }

  /**
   * @param message Message string which needs to be passed to {@link
   *     org.antlr.v4.runtime.ANTLRErrorListener}
   *     <p>NOTE: This method is for testing only. Advised to use notifyErrorListeners instead.
   */
  @VisibleForTesting
  public void notifyListeners(String message) {
    super.notifyErrorListeners(message);
  }

  /**
   * Validate a string and throw an error if it is not equal to the expected value
   *
   * @param actual string to check
   * @param expected expected value of the string
   */
  protected void validateValue(String actual, String expected) {
    if (actual != null && !actual.equals(expected)) {
      notifyError("parsers.validValueMsg", actual, expected);
    }
  }

  /**
   * Validate that the subschema name is 16 or 18
   *
   * @param input string to check
   */
  protected void validateSubSchemaNameLength(String input) {
    if (input != null && !input.matches("16|18")) {
      notifyError("cobolParser.subSchemaNameLength", input);
    }
  }

  /**
   * Validate a string length and throw an error if it is incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   * @param validLength expected length for this input
   */
  protected void validateLength(String input, String objectType, Integer validLength) {
    if (input != null && input.length() > validLength) {
      notifyError("parsers.maxLength", validLength.toString(), objectType);
    }
  }

  /**
   * Validate a string length without first and the last symbol and throw an error if it is incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   * @param validLength expected length for this input
   */
  protected void validateLengthTrimBorders(String input, String objectType, Integer validLength) {
    validateLength(input.substring(1, input.length() - 1), objectType, validLength);
  }

  /**
   * Validate a string with a regex and throw an error if it is incorrect
   *
   * @param input string to check
   * @param regex regex string
   * @param error error code name
   */
  @VisibleForTesting
  protected void validateTokenWithRegex(String input, String regex, String error) {
    if (!input.matches(regex)) {
      notifyError(error, input);
    }
  }

  /**
   * Validate a string value if it is an integer between 0 and 32767
   * and throw an error if it is incorrect
   *
   * @param input string to check
   */
  @VisibleForTesting
  protected void validateDb2MaxInt(String input) {
    int value = Integer.parseInt(input);
    if (!(value > 0 &&  value <= 32767)) {
      notifyError("db2SqlParser.maxIntValue", input);
    }
  }

  /**
   * Validate a string value if it is an integer between -2 and 99
   * and throw an error if it is incorrect
   *
   * @param input string to check
   */
  @VisibleForTesting
  protected void validateTextInRange(String input, int min, int max) {
    int value = Integer.parseInt(input);
    if (!(value > min && value < max)) {
      notifyError("paser.validValueMsg", input,
          String.format("in range %d to %d", min + 1, max - 1));
    }
  }

  /**
   * Validate a string value if it is an integer 34 or 16
   * and throw an error if it is incorrect
   *
   * @param input string to check
   */
  @VisibleForTesting
  protected void validate34or16(String input) {
    int value = Integer.parseInt(input);
    if (!(value == 34 || value == 16)) {
      notifyError("paser.validValueMsg", input, "34 or 16");
    }
  }

  /**
   * Validate a string value if it is a level number
   *
   * @param input string to check
   */
  @VisibleForTesting
  protected void validateLevel(String input) {
    if (!(input.equals("1") || input.equals("ANY"))) {
      notifyError("paser.validValueMsg", input, "1 or ANY");
    }
  }

  /**
   * Validate database and table names
   *
   * @param input string to check
   */
  @VisibleForTesting
  protected void validateDbNames(String input) {
    String[] names = input.split("\\.");
    if (names.length > 1) {
      validateLength(names[0], "database name", 8);
      validateLength(names[1], "table space name", 8);
    } else {
      validateLength(input, "table space name", 8);
    }
  }

  private String getMessageForParser(String messageKey, String... parameters) {
    return ((CobolErrorStrategy) this.getErrorHandler())
        .getMessageService()
        .getMessage(messageKey, parameters);
  }
}
