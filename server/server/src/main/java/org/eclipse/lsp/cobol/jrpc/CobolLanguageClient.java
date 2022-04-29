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
package org.eclipse.lsp.cobol.jrpc;

import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.concurrent.CompletableFuture;

/**
 * The class extends LSP language client with COBOL related methods.
 */
public interface CobolLanguageClient extends LanguageClient {
  /**
   * The cobol/resolveSubroutine request is sent from the server to the client to
   * resolve subroutine name into local file URI.
   *
   * @param name the name of subroutine
   * @return corresponding local file URI or null
   */
  @JsonRequest("cobol/resolveSubroutine")
  default CompletableFuture<String> resolveSubroutine(String name) {
    throw new UnsupportedOperationException();
  }
}
