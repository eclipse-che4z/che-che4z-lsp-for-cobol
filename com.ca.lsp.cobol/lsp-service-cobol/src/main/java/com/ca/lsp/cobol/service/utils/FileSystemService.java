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
import java.nio.file.StandardOpenOption;
import java.util.List;

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

  /**
   * Retrieve the content of a dependency file and return it back to the callee.
   *
   * @param filePath target path of the file
   * @return the content of the dependency file or null if doesn't exist
   */
  @Nonnull
  List<String> getContentFromFile(@Nonnull Path filePath);

  /**
   * Write the content to the file by the given path
   *
   * @param targetPath NIO path of the target file where to write
   * @param content the content to write
   * @param standardOpenOption the open option (APPEND|TRUNCATE)
   */
  void writeInFile(Path targetPath, String content, StandardOpenOption standardOpenOption);

  /**
   * Remove an element present inside the file defined on targetPath
   *
   * @param element to remove from the file
   * @param targetPath Path reference to the file
   */
  void removeIfPresent(@Nonnull String element, @Nonnull Path targetPath);

  /**
   * Search for the file with given name in the folder.
   *
   * @param fileName file to search
   * @param targetFolderPath physical path where to search for the file
   * @return Path of the found copybook in the target folder.
   */
  @Nullable
  Path applySearch(@Nonnull String fileName, @Nonnull Path targetFolderPath);

  /**
   * Extract the file extension from the {@link URI} given as input
   *
   * @param uri reference to the file from where extract the file extension
   * @return the String representation of the file extension or null if the URI is not valid
   */
  @Nullable
  String getExtensionFromURI(@Nonnull String uri);

  /**
   * Create a file on file system from a given {@link Path}
   *
   * @param path target path that will be used to create the file
   */
  void createFile(@Nonnull Path path);

  /**
   * Create a directory by creating all nonexistent parent directories first.
   *
   * @param path in input that will be used to create the folders
   * @return the created directory
   */
  @Nullable
  Path createFolders(@Nonnull Path path);

  /**
   * Create a folder from a given path
   *
   * @param path in input that will be used to create the folders
   */
  void createFolder(@Nonnull Path path);

  /**
   * Get full path for copybook folder which is inside .ch4z folder
   *
   * @param workspacePath - String representation of path
   * @return - full path
   */
  @Nonnull
  Path getCopybookFolderPath(@Nonnull String workspacePath);

  /**
   * Return the list of paths represented by a fixed part (outer + inner), and a variable part
   * iterated to obtain the path in this form: {[base,middle,v1],[base,middle,v2], ...}
   *
   * @param outer first level of folder
   * @param variablePart list of names of folders that are contained inside the inner
   * @return a lis of paths represented in the way: {[outer,inner,v1],[outer,inner,v2], ...}
   */
  @Nonnull
  List<Path> getPathList(@Nonnull String outer, @Nonnull List<String> variablePart);

  /**
   * Return a {@link Path} representation of a bunch of {@link String} given as input or null if is
   * not possible get the path. After each pah a FS separator is added automatically
   *
   * @param basePath the string that represent the base path
   * @param more additional String used to compose the path
   * @return the {@link Path} that contains all the given segment, null if the path doesn't exists.
   */
  @Nonnull
  Path getPath(@Nonnull String basePath, @Nonnull String... more);

  /**
   * Transform from a List<Object> to a list of strings which contains the exact path needed to be
   * attached to a required URI.
   *
   * @param settings result of the requested configuration settings
   * @return list of refactored strings
   */
  @Nonnull
  List<String> interpretPaths(@Nonnull List<Object> settings);
}
