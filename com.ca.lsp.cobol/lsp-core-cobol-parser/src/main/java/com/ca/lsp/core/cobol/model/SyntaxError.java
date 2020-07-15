/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.model;

import com.broadcom.lsp.domain.common.model.Position;
import lombok.Builder;
import lombok.Value;
import org.antlr.v4.runtime.Token;

import java.util.List;

@Value
public class SyntaxError {
  Position position;
  Token startToken;
  Token stopToken;
  List<String> ruleStack;
  String suggestion;
  ErrorSeverity severity;
  ErrorCode errorCode;

  // Please, don't use static imports for this method:
  // https://github.com/rzwitserloot/lombok/issues/2044
  @Builder(builderMethodName = "syntaxError", toBuilder = true)
  public SyntaxError(
      Position position,
      Token startToken,
      Token stopToken,
      List<String> ruleStack,
      String suggestion,
      ErrorSeverity severity,
      ErrorCode errorCode) {
    this.position = position;
    this.startToken = startToken;
    this.stopToken = stopToken;
    this.ruleStack = ruleStack;
    this.suggestion = suggestion;
    this.severity = severity;
    this.errorCode = errorCode;
  }
}
