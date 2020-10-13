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
package com.broadcom.lsp.cobol.core.model;

import lombok.Builder;
import lombok.Value;
import org.antlr.v4.runtime.Token;

import java.util.List;

/**
 * This value class represents a syntax or semantic error found during the analysis. The finalized
 * version should always contain a non-null {@link Locality}. If it has only the offended token
 * after the {@link com.broadcom.lsp.cobol.core.engine.CobolLanguageEngine} finishes analysis, then
 * this error is invalid.
 */
@Value
public class SyntaxError {
  Locality locality;
  List<String> ruleStack;
  Token offendedToken;
  String suggestion;
  ErrorSeverity severity;
  ErrorCode errorCode;

  // Please, don't use static imports for this method:
  // https://github.com/rzwitserloot/lombok/issues/2044
  @Builder(builderMethodName = "syntaxError", toBuilder = true)
  public SyntaxError(
      Locality locality,
      List<String> ruleStack,
      Token offendedToken,
      String suggestion,
      ErrorSeverity severity,
      ErrorCode errorCode) {
    this.locality = locality;
    this.ruleStack = ruleStack;
    this.offendedToken = offendedToken;
    this.suggestion = suggestion;
    this.severity = severity;
    this.errorCode = errorCode;
  }
}
