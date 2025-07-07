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
import org.eclipse.lsp.cobol.common.io.ResolveFileContent;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;

/** Resolves content of a URI */
public class ClientBasedFileContent implements ResolveFileContent {
  private final Provider<CobolLanguageClient> clientProvider;

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
    return clientProvider.get().getFileContent(uri);
  }
}
