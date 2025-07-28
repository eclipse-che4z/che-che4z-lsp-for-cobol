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

import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;

/** Java independent COBOL dialect client API * */
public interface DialectClientApi {
  /**
   * Process the dialect
   *
   * @param dialectName is a dialect name
   * @param programUri is a program uri
   * @param text is a document content
   * @return ProcessDialectResult
   */
  @JsonRequest("dialect/process")
  default CompletableFuture<DialectProcessingResult> processDialect(
      String dialectName, String programUri, String text) {
    throw new UnsupportedOperationException();
  }
}
