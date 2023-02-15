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
package org.eclipse.lsp.cobol.common.error;

import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.DiagnosticRelatedInformation;

/**
 * This value class represents a syntax or semantic error found during the analysis. The finalized
 * version should always contain a non-null {@link Locality}. If it has only the offended token
 * after the CobolLanguageEngine finishes analysis, then
 * this error is invalid.
 */
// Please, don't use static imports for this method:
// https://github.com/rzwitserloot/lombok/issues/2044
@Builder(builderMethodName = "syntaxError", toBuilder = true)
@Value
public class SyntaxError {
  OriginalLocation location;
  MessageTemplate messageTemplate;
  String suggestion;
  ErrorSeverity severity;
  ErrorCode errorCode;
  ErrorSource errorSource;
  DiagnosticRelatedInformation relatedInformation;
}
