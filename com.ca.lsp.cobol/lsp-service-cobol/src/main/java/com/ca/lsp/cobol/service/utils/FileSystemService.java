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

package com.ca.lsp.cobol.service.utils;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Path;

/** This interface represents API for low-level file systems access */
public interface FileSystemService {
  /**
   * Normalize the URI defined in the workspace to get a NIO Path object that will be used within
   * the FileSystemService, example: [input:
   * file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy] --> [output:
   * C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy]
   *
   * @param uri URI string representation of a file
   * @return the {@link Path} representation of the given URI in input
   * @throws IllegalArgumentException if the URI of WorkspaceFolder is not valid
   */
  @Nullable
  Path getPathFromURI(@Nonnull String uri);

  /**
   * This method extracts the name of a file from a valid {@link URI} and return the name back to
   * the client as String or null in case of error.
   *
   * @param uri the reference of the file from where extract the name
   * @return the String representation of the file name or null if any {@link URISyntaxException} is
   *     caught.
   */
  @Nullable
  String getNameFromURI(@Nonnull String uri);

  /**
   * Retrieve the content of the file as a string.
   *
   * @param file URI from where extract the content
   * @return content of the file as String representation
   */
  @Nullable
  String getContentByPath(@Nonnull Path file);

  /**
   * Check if the file with the given path exists
   *
   * @param file NIO path of the file to check
   * @return true if the path represent a valid file, false otherwise
   */
  boolean fileExists(@Nullable Path file);

  /**
   * Replace special chars (as parenthesis, spaces and so on) that are encoded by the LSP protocol
   * on the client side. Needs to be encoded in order to display to the user the uri correctly.
   *
   * @param uri provided by the {@link org.eclipse.lsp4j.services.TextDocumentService}
   * @return a new String decoded with UTF8
   */
  @Nonnull
  String decodeURI(@Nonnull String uri);
}
