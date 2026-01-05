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
package org.eclipse.lsp.cobol.service.io.impl;

import com.google.inject.Inject;
import com.google.inject.Provider;
import java.io.File;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.concurrent.CompletableFuture;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.io.ResolveFileContent;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp4j.jsonrpc.ResponseErrorException;
import org.eclipse.lsp4j.jsonrpc.messages.ResponseErrorCode;

/** Resolves content of a URI */
@Slf4j
public class ClientBasedFileContent implements ResolveFileContent {
  private final Provider<CobolLanguageClient> clientProvider;
  private boolean clientSupportsFileContent = true;

  @Inject
  public ClientBasedFileContent(Provider<CobolLanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  /**
   * Resolves content of a URI
   *
   * @param uri
   * @return
   */
  @Override
  public CompletableFuture<String> getFileContent(String uri) {
    if (!clientSupportsFileContent) return CompletableFuture.completedFuture(readFromFile(uri));

    return clientProvider
        .get()
        .getFileContent(uri)
        .exceptionally(
            ex -> {
              LOG.warn("getFileContent error:", ex);
              if (isMethodNotFoundError(ex)) {
                clientSupportsFileContent = false;
                return readFromFile(uri);
              }
              return null;
            });
  }

  private static boolean isMethodNotFoundError(Throwable ex) {
    return ex instanceof ResponseErrorException
        && ((ResponseErrorException) ex).getResponseError().getCode()
            == ResponseErrorCode.MethodNotFound.getValue();
  }

  private static String readFromFile(String uri) {
    if (!uri.startsWith("file:")) return null;

    try {
      return new String(
          Files.readAllBytes(new File(new URI(uri)).toPath()), StandardCharsets.UTF_8);
    } catch (Exception e) {
      LOG.warn("readFromFile error:", e);
      return null;
    }
  }
}
