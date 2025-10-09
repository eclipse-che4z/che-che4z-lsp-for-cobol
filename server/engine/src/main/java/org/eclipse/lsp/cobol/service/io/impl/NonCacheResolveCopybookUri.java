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
import java.util.concurrent.CompletableFuture;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.io.ResolveCopybookUri;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;

/** Resolves a copybook uri for a COBOL document from client */
@Slf4j
public class NonCacheResolveCopybookUri implements ResolveCopybookUri {
  private final Provider<CobolLanguageClient> clientProvider;

  @Inject
  public NonCacheResolveCopybookUri(Provider<CobolLanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  /**
   * @param cobolFileUri
   * @param copybookName
   * @param dialectType
   * @return
   */
  @Override
  public CompletableFuture<String> resolveCopybookUri(
      String cobolFileUri, CopybookName copybookName, String dialectType) {
    CompletableFuture<String> clientRequest =
        this.clientProvider
            .get()
            .resolveCopybookUri(cobolFileUri, copybookName.getDisplayName(), dialectType)
            .exceptionally(
                ex -> {
                  LOG.warn(
                      "Failed to resolve copybook URI: {} for program {}",
                      copybookName.getDisplayName(),
                      cobolFileUri,
                      ex);
                  return null;
                });
    return clientRequest;
  }
}
