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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.lsp.jrpc;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.common.copybook.CopyBookDTO;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.lsp.DialectItemDTO;
import org.eclipse.lsp4j.jsonrpc.services.JsonNotification;
import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;
import org.eclipse.lsp4j.services.LanguageClient;

/** The class extends LSP language client with COBOL related methods. */
public interface CobolLanguageClient extends LanguageClient, DialectClientApi {
  /**
   * The cobol/resolveSubroutine request is sent from the server to the client to resolve subroutine
   * name into local file URI.
   *
   * @param name the name of subroutine
   * @return corresponding local file URI or null
   */
  @JsonRequest("cobol/resolveSubroutine")
  default CompletableFuture<String> resolveSubroutine(String name) {
    throw new UnsupportedOperationException();
  }

  /**
   * The copybook/resolve request is sent from the server to the client to resolve / identify a
   * copybook name into a file URI.
   *
   * @param cobolFileUri the uri of cobol program
   * @param copybookName the name of copybook to resolve
   * @param dialectType the name of copybook dialect
   * @return corresponding a file URI or null.
   */
  @JsonRequest("copybook/resolve")
  default CompletableFuture<String> resolveCopybookUri(
      String cobolFileUri, String copybookName, String dialectType) {
    throw new UnsupportedOperationException();
  }

  /**
   * The file/content request is sent from the server to the client to get the content of a URI.
   *
   * @param uri the uri whose content is needed
   * @return string content of the passed URI
   */
  @JsonRequest("file/content")
  default CompletableFuture<String> getFileContent(String uri) {
    throw new UnsupportedOperationException();
  }

  /**
   * TODO The copybook/download request is sent from the server to the client to download remote
   * copybook
   *
   * @param cobolFileUri Uri of the cobol program
   * @param copybooks list of copybooks to download
   * @param quietMode the name of copybook dialect
   * @return void object
   */
  @JsonRequest("copybook/download")
  default CompletableFuture<Void> downloadCopybooks(
      String cobolFileUri, List<CopyBookDTO> copybooks, boolean quietMode) {
    throw new UnsupportedOperationException();
  }

  /**
   * Notifies language client that CFAST is ready
   *
   * @param result is a result with CFAST data
   */
  @JsonNotification("cfast/ready")
  default void cfastReady(ExtendedApiResult result) {
    throw new UnsupportedOperationException();
  }

  /**
   * Gets the list of installed dialects
   *
   * @return List of available dialects
   */
  @JsonRequest("availableDialects")
  default CompletableFuture<List<DialectItemDTO>> availableDialects() {
    throw new UnsupportedOperationException();
  }
}
