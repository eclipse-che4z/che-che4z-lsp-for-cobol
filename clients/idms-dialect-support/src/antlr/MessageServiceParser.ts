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
 *    Broadcom - initial API and implementation
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */

import { Parser } from "antlr4ng";
import { MessageService } from "../engine/services/MessageService";
import { tryParseInt } from "../engine/util";

export abstract class MessageServiceParser extends Parser {
  private messageService?: MessageService;

  protected getMessageService(): MessageService {
    if (!this.messageService) {
      throw new Error("Message service is not set");
    }
    return this.messageService;
  }

  public setMessageService(messageService: MessageService) {
    this.messageService = messageService;
  }

  public notifyError(template: string, ...parameters: string[]) {
    const message = this.getMessageService().get(template, parameters);
    super.notifyErrorListeners(message, this.getCurrentToken(), null);
  }

  protected validateValue(actual: string, expected: string) {
    if (actual != null && actual !== expected) {
      this.notifyError("parsers.validValueMsg", actual, expected);
    }
  }

  protected validateSubSchemaNameLength(input: string) {
    if (input != null && !input.match("16|18")) {
      this.notifyError("cobolParser.subSchemaNameLength", input);
    }
  }

  protected validateLength(
    input: string,
    objectType: string,
    validLength: number,
  ) {
    if (input != null && input.length > validLength) {
      this.notifyError("parsers.maxLength", validLength.toString(), objectType);
    }
  }

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

  protected validateIntegerRange(
    input: string,
    minValue: number,
    maxValue: number,
  ) {
    const intInputValue = tryParseInt(input);
    if (
      intInputValue != null &&
      !(intInputValue >= minValue && intInputValue <= maxValue)
    ) {
      this.notifyError(
        "parsers.intRangeValue",
        minValue.toString(),
        maxValue.toString(),
      );
    }
  }

  protected validateStringLengthRange(
    input: string,
    minLength: number,
    maxLength: number,
  ) {
    if (
      input != null &&
      !(input.length >= minLength && input.length <= maxLength)
    ) {
      this.notifyError(
        "parsers.stringLengthRange",
        minLength.toString(),
        maxLength.toString(),
      );
    }
  }
}
