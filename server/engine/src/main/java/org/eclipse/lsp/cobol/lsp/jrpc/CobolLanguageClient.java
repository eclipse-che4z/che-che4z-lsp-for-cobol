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
package org.eclipse.lsp.cobol.lsp.jrpc;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;
import org.eclipse.lsp4j.services.LanguageClient;

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

  /**
   * The copybook/resolve request is sent from the server to the client to
   * resolve copybook local absolute path if found
   *
   * @param cobolFileUri the uri of cobol program
   * @param copybookName the name of copybook to resolve
   * @param dialectType the name of copybook dialect
   * @return corresponding local file absolute path
   */
  @JsonRequest("copybook/resolve")
  default CompletableFuture<String> resolveCopybook(
      String cobolFileUri,
      String copybookName,
      String dialectType) {
    throw new UnsupportedOperationException();
  }

  /** TODO
   * The copybook/download request is sent from the server to the client to
   * download remote copybook
   *
   * @param cobolFilename the name of cobol program
   * @param copybookNames list of copybooks to download
   * @param dialectType the name of copybook dialect
   * @param quietMode the name of copybook dialect
   * @return corresponding local file absolute path
   */
  @JsonRequest("copybook/download")
  default CompletableFuture<Void> downloadCopybooks(
      String cobolFilename,
      List<String> copybookNames,
      String dialectType,
      boolean quietMode) {
    throw new UnsupportedOperationException();
  }
}
