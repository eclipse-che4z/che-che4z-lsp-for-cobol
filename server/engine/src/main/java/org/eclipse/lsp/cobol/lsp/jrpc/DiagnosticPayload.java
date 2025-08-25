/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.jrpc;

import lombok.NonNull;
import lombok.Value;
import org.eclipse.lsp4j.DiagnosticRelatedInformation;
import org.eclipse.lsp4j.Range;

/** Dialect Diagnostic Payload object is a part of the V2 dialect processing */
@Value
public class DiagnosticPayload {
  @NonNull String message;
  @NonNull Range range;
  DiagnosticRelatedInformation[] relatedInformation;
  int severity;
  String source;
  int[] tags;
  Integer errorCode;
}
