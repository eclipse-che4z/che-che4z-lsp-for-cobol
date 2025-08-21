import { Parser } from "antlr4ts/Parser";

export abstract class MessageServiceParser extends Parser {
  private static ALPHANUMERIC: RegExp = new RegExp("[a-zA-Z0-9]+");

  private notifyError(
    template: string,
    param1: string,
    param2?: string,
  ): string {
    const message = "";
    super.notifyErrorListeners(message);
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
    if (input != undefined && !input.match("16|18")) {
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
  protected validateAlphaNumericPattern(input: string | undefined, objectType: string) {
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
    input: string,
    objectType: string,
    validLength: number,
  ) {
    this.validateLength(
      input.substring(1, input.length - 1),
      objectType,
      validLength,
    );
  }

  /**
   * Validate a string with a regex and throw an error if it is incorrect
   *
   * @param input string to check
   * @param regex regex string
   * @param error error code name
   */
  protected validateTokenWithRegex(
    input: string,
    regex: string,
    error: string,
  ) {
    if (!input.match(regex)) {
      this.notifyError(error, input);
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
  protected validateDb2MaxInt(input: string) {
    let value = Number.parseInt(input);
    if (!(value > 0 && value <= 32767)) {
      this.notifyError("db2SqlParser.maxIntValue", input);
    }
  }

  /**
   * Validate string value for starts with substrings
   *
   * @param input string to check
   * @param startsWith arrays of allowed starting string values for Input parameter
   */
  protected validateStartsWith(input: string | undefined, ...startsWith: string[]) {
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
  protected validateTextInRange(input: string, min: number, max: number) {
    let value = Number.parseInt(input);
    if (!(value > min && value < max)) {
      this.notifyError(
        "parsers.validValueMsg",
        input,
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
  protected validate34or16(input: string) {
    let value = Number.parseInt(input);
    if (!(value == 34 || value == 16)) {
      this.notifyError("parsers.validValueMsg", input, "34 or 16");
    }
  }

  /**
   * Validate allowed string values and throw an error if it is incorrect
   *
   * @param input string to check
   * @param allowedValues arrays of allowed starting string values for Input parameter
   */
  protected validateAllowedValues(input: string | undefined, ...allowedValues: string[]) {
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
  protected validateLevel(input: string) {
    if (input !== "1" && input !== "ANY") {
      this.notifyError("parsers.validValueMsg", input, "1 or ANY");
    }
  }

  /**
   * Remove quotes from string literal
   *
   * @param input string to trim quotes
   */
  protected trimQuotes(input?: string): string {
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
  protected validateDbNames(input: string) {
    let names = input.split("\\.");
    if (names.length > 1) {
      this.validateLength(names[0], "database name", 8);
      this.validateLength(names[1], "table space name", 8);
    } else {
      this.validateLength(input, "table space name", 8);
    }
  }

  private tryParseInt(input: string | undefined): number | undefined {
    let parsedValue: number | undefined;
    if (input === undefined) {
      return undefined;
    }
    try {
      parsedValue = Number.parseInt(input);
    } catch (error) {
      parsedValue = undefined;
    }
    return parsedValue;
  }

  private checkStartsWith(input: string, startsWith: string[]): boolean {
    for (let item of startsWith) {
      if (input.startsWith(item)) return true;
    }
    return false;
  }

  private checkInputInAllowedValues(
    input: string,
    allowedValues: string[],
  ): boolean {
    input = input.toUpperCase();
    for (let item of allowedValues) {
      if (input === item.toUpperCase()) return true;
    }
    return false;
  }
}
