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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */

package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.annotations.VisibleForTesting;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.TokenStream;
import org.eclipse.lsp.cobol.common.message.MessageServiceProvider;

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
   * Extend the functionality of {@link org.eclipse.lsp.cobol.common.message.MessageService}
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
   * Validate a string length without first and the last symbol and throw an error if it is
   * incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   * @param validLength expected length for this input
   */
  protected void validateLengthTrimBorders(String input, String objectType, Integer validLength) {
    validateLength(input.substring(1, input.length() - 1), objectType, validLength);
  }

  /**
   * Validate integer value against range and throw an error if it is incorrect
   *
   * @param input integer to check
   * @param minValue allowed integer value
   * @param maxValue allowed integer value
   */
  protected void validateIntegerRange(String input, Integer minValue, Integer maxValue) {
    Integer intInputValue = tryParseInt(input);
    if (intInputValue != null && !(intInputValue >= minValue && intInputValue <= maxValue)) {
      notifyError("parsers.intRangeValue", minValue.toString(), maxValue.toString());
    }
  }

  /**
   * Validate string length against range and throw an error if it is incorrect
   *
   * @param input string to check
   * @param minLength allowed minimum length
   * @param maxLength allowed maximum length
   */
  protected void validateStringLengthRange(String input, Integer minLength, Integer maxLength) {
    if (input != null && !(input.length() >= minLength && input.length() <= maxLength)) {
      notifyError("parsers.stringLengthRange", minLength.toString(), maxLength.toString());
    }
  }

  private String getMessageForParser(String messageKey, String... parameters) {
    return ((MessageServiceProvider) this.getErrorHandler())
        .getMessageService()
        .getMessage(messageKey, parameters);
  }

  private Integer tryParseInt(String input) {
    Integer parsedValue;
    try {
      parsedValue = Integer.parseInt(input);
    } catch (Exception ex) {
      parsedValue = null;
    }
    return parsedValue;
  }
}
