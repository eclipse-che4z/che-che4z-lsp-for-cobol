/*
 * Copyright (c) 2026 Broadcom.
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
import { Parser, Token } from "antlr4ng";
import { MessageService } from "../engine/services/MessageService";

export abstract class MessageServiceParser extends Parser {
  private static readonly ALPHANUMERIC: RegExp = /[a-zA-Z0-9]+/;
  private messageService?: MessageService;

  public setMessageService(messageService: MessageService) {
    this.messageService = messageService;
  }

  protected getMessageService(): MessageService {
    if (!this.messageService) {
      throw new Error("Message service is not set");
    }
    return this.messageService;
  }

  private notifyError(
    template: string,
    param1: string,
    param2?: string,
  ): string {
    const message = "";
    super.notifyErrorListeners(message, this.getCurrentToken(), null);
    return message;
  }

  private notifyErrorEx(template: string, token?: Token): string {
    const message = this.getMessageService().get(template, token?.text ?? "");
    super.notifyErrorListeners(message, token || this.getCurrentToken(), null);
    return message;
  }

  protected validateValue(actual: string | undefined, expected: string) {
    if (actual != undefined && actual !== expected) {
      this.notifyError("parsers.validValueMsg", actual, expected);
    }
  }

  /**
   * Validate that the subschema name is 16 or 18
   *
   * @param input string to check
   */
  protected validateSubSchemaNameLength(input: string | undefined) {
    if (input != undefined && !/16|18/.exec(input)) {
      this.notifyError("cobolParser.subSchemaNameLength", input);
    }
  }

  /**
   * Validate a string length and throw an error if it is incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   * @param validLength expected length for this input
   */
  protected validateLength(
    input: string | undefined,
    objectType: string,
    validLength: number,
  ) {
    if (input != undefined && input.length > validLength) {
      this.notifyError("parsers.maxLength", validLength.toString(), objectType);
    }
  }

  /**
   * Validate a string for alphanumeric characters and throw an error if it is incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   */
  protected validateAlphaNumericPattern(
    input: string | undefined,
    objectType: string,
  ) {
    if (input != undefined && !MessageServiceParser.ALPHANUMERIC.test(input)) {
      this.notifyError("parsers.alphaNumeric", objectType);
    }
  }

  /**
   * Validate exact string length and throw an error if it is incorrect
   *
   * @param input string to check
   * @param objectType type of the object to be passed as a message argument
   * @param validLength expected length for this input
   */
  protected validateExactLength(
    input: string | undefined,
    objectType: string,
    validLength: number,
  ) {
    if (input != undefined && input.length != validLength) {
      this.notifyError(
        "parsers.exactLength",
        objectType,
        validLength.toString(),
      );
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
  protected validateLengthTrimBorders(
    input: string | undefined,
    objectType: string,
    validLength: number,
  ) {
    this.validateLength(
      input?.substring(1, input.length - 1),
      objectType,
      validLength,
    );
  }

  protected validateTokenWithRegex(
    token: Token,
    regex: RegExp,
    template: string,
  ) {
    if (!token || !regex.test(token.text ?? "")) {
      this.notifyErrorEx(template, token);
    }
  }

  /**
   * Validate integer value against range and throw an error if it is incorrect
   *
   * @param input integer to check
   * @param minValue allowed integer value
   * @param maxValue allowed integer value
   */
  protected validateIntegerRange(
    input: string | undefined,
    minValue: number,
    maxValue: number,
  ) {
    const intInputValue = this.tryParseInt(input);
    if (
      intInputValue != undefined &&
      !(intInputValue >= minValue && intInputValue <= maxValue)
    ) {
      this.notifyError(
        "parsers.intRangeValue",
        minValue.toString(),
        maxValue.toString(),
      );
    }
  }

  /**
   * Validate a string value if it is an integer between 0 and 32767 and throw an error if it is
   * incorrect
   *
   * @param input string to check
   */
  protected validateDb2MaxInt(input: string | undefined) {
    const value = Number.parseInt(input ?? "");
    if (!(value > 0 && value <= 32767)) {
      this.notifyError("db2SqlParser.maxIntValue", input ?? "");
    }
  }

  /**
   * Validate string value for starts with substrings
   *
   * @param input string to check
   * @param startsWith arrays of allowed starting string values for Input parameter
   */
  protected validateStartsWith(
    input: string | undefined,
    ...startsWith: string[]
  ) {
    if (input != undefined && !this.checkStartsWith(input, startsWith)) {
      this.notifyError("parsers.startsWith", startsWith.join(" or "));
    }
  }

  /**
   * Validate a string value if it is an integer between -2 and 99 and throw an error if it is
   * incorrect
   *
   * @param input string to check
   */
  protected validateTextInRange(
    input: string | undefined,
    min: number,
    max: number,
  ) {
    const value = Number.parseInt(input ?? "");
    if (!(value > min && value < max)) {
      this.notifyError(
        "parsers.validValueMsg",
        input ?? "",
        `in range ${min + 1} to ${max - 1}`,
      );
    }
  }

  /**
   * Validate string length against range and throw an error if it is incorrect
   *
   * @param input string to check
   * @param minLength allowed minimum length
   * @param maxLength allowed maximum length
   */
  protected validateStringLengthRange(
    input: string | undefined,
    minLength: number,
    maxLength: number,
  ) {
    if (
      input != undefined &&
      !(input.length >= minLength && input.length <= maxLength)
    ) {
      this.notifyError(
        "parsers.stringLengthRange",
        minLength.toString(),
        maxLength.toString(),
      );
    }
  }

  /**
   * Validate a string value if it is an integer 34 or 16 and throw an error if it is incorrect
   *
   * @param input string to check
   */
  protected validate34or16(input: string | undefined) {
    const value = Number.parseInt(input ?? "");
    if (!(value == 34 || value == 16)) {
      this.notifyError("parsers.validValueMsg", input ?? "", "34 or 16");
    }
  }

  /**
   * Validate allowed string values and throw an error if it is incorrect
   *
   * @param input string to check
   * @param allowedValues arrays of allowed starting string values for Input parameter
   */
  protected validateAllowedValues(
    input: string | undefined,
    ...allowedValues: string[]
  ) {
    if (
      input != undefined &&
      !this.checkInputInAllowedValues(input, allowedValues)
    ) {
      this.notifyError("parsers.allowedStringValues", allowedValues.join(", "));
    }
  }

  /**
   * Validate a string value if it is a level number
   *
   * @param input string to check
   */
  protected validateLevel(input: string | undefined) {
    if (input !== "1" && input !== "ANY") {
      this.notifyError("parsers.validValueMsg", input ?? "", "1 or ANY");
    }
  }

  /**
   * Remove quotes from string literal
   *
   * @param input string to trim quotes
   */
  protected trimQuotes(input: string | undefined): string {
    if (input !== undefined) {
      return input.replace(/^"(.*)"$/, "$1");
    }
    return "";
  }

  /**
   * Validate database and table names
   *
   * @param input string to check
   */
  protected validateDbNames(input: string | undefined) {
    const names = (input ?? "").split(String.raw`\.`);
    if (names.length > 1) {
      this.validateLength(names[0], "database name", 8);
      this.validateLength(names[1], "table space name", 8);
    } else {
      this.validateLength(input, "table space name", 8);
    }
  }

  private tryParseInt(input: string | undefined): number | undefined {
    if (input === undefined) {
      return undefined;
    }
    const value = Number.parseInt(input, 10);
    return Number.isNaN(value) ? undefined : value;
  }

  private checkStartsWith(
    input: string | undefined,
    startsWith: string[],
  ): boolean {
    for (const item of startsWith) {
      if (input?.startsWith(item)) return true;
    }
    return false;
  }

  private checkInputInAllowedValues(
    input: string | undefined,
    allowedValues: string[],
  ): boolean {
    input = input?.toUpperCase();
    for (const item of allowedValues) {
      if (input === item.toUpperCase()) return true;
    }
    return false;
  }
}
