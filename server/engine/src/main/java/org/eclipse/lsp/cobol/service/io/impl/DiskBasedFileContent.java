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
import java.nio.file.Path;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.io.ResolveFileContent;

/** Interface to resolve content of a URI at the server side */
public class DiskBasedFileContent implements ResolveFileContent {
  private final FileSystemService fileSystemService;

  @Inject
  public DiskBasedFileContent(FileSystemService fileSystemService) {
    this.fileSystemService = fileSystemService;
  }

  /**
   * @param uri
   * @return
   */
  @Override
  public CompletableFuture<String> getFileContent(String uri) {
    try {
      final Path file = fileSystemService.getPathFromURI(uri);
      return CompletableFuture.completedFuture(
          fileSystemService.fileExists(file)
              ? fileSystemService.getContentByPath(Objects.requireNonNull(file))
              : null);
    } catch (IllegalArgumentException e) {
      return CompletableFuture.completedFuture(null);
    }
  }
}
