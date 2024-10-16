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

package org.eclipse.lsp.cobol.common.file;

import lombok.NonNull;

import javax.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.List;

/** This interface represents API for low-level file systems access */
public interface FileSystemService {
  /**
   * Retrieve the content of the file as a string.
   *
   * @param file URI from where extract the content
   * @return content of the file as String representation
   */
  @Nullable
  String getContentByPath(@NonNull Path file);

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
  @NonNull
  String decodeURI(@NonNull String uri);

  /**
   * Read the bytes from the input stream and convert it to text
   *
   * @param inputStream the stream to read from
   * @param charset the charset of the file
   * @return the content from the inputStream
   * @throws IOException in case if file is not found or cannot be loaded
   */
  @NonNull
  String readFromInputStream(InputStream inputStream, Charset charset) throws IOException;

  /**
   * Lists the files of the directory path by name.
   *
   * @param uri URI to process
   * @return the lists of the files
   */
  @NonNull
  List<String> listFilesInDirectory(String uri);

  /**
   * Reads implicit content
   * @param name us a name of the implicit code
   * @return the content as a string
   */
  String readImplicitCode(String name);
}
