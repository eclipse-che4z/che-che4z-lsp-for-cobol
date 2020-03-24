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
 */
package com.ca.lsp.cobol.service.utils;

import com.ca.lsp.cobol.service.CopybookServiceImpl;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;

import javax.annotation.Nonnull;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.file.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import static java.nio.file.Files.readAllLines;

/**
 * This is an utility class that provide filesystem related methods consumed by the classes that
 * rely on the filesystem implementation as {@link CopybookServiceImpl} and {@link
 * CopybookDependencyServiceImpl}
 */
@Slf4j
@UtilityClass
public class FileSystemUtils {
  private final List<String> ALLOWED_EXTENSIONS = Arrays.asList("cpy", "cbl", "cobol", "cob");

  /** @return the representation os based of the FS separator */
  public static String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  /**
   * @param pathFile NIO path of the file to check
   * @return true if the path represent a valid file, false otherwise
   */
  public static boolean isFileExists(Path pathFile) {
    return pathFile != null && pathFile.toFile().exists();
  }

  /**
   * @param targetPath NIO path of the target file where to write
   * @param contents the content to write
   */
  public static void writeInFile(Path targetPath, String contents) {
    try {
      Files.write(targetPath, (contents + "\n").getBytes(), StandardOpenOption.APPEND);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * From a given file this routine analyze if the file is not a directory and have a valid
   * ALLOWED_EXTENSIONS
   *
   * @param currentFile file analyzed during the scan of a folder
   * @param requiredName the name of the file to match
   * @return true if all the condition are met, false otherwise
   */
  public boolean isValidFileFound(File currentFile, String requiredName) {
    return currentFile.isFile()
        && !currentFile.isDirectory()
        && currentFile.getName().contains(".")
        && FilenameUtils.getBaseName(currentFile.getName()).equalsIgnoreCase(requiredName)
        && hasFileValidExtension(currentFile.getAbsoluteFile().toString().toLowerCase());
  }

  /**
   * Verify that the file extension is one of the ALLOWED_EXTENSIONS defined.
   *
   * @param fullPath file full path with extension
   * @return true if the file have a valid extension false otherwise
   */
  public boolean hasFileValidExtension(String fullPath) {
    return ALLOWED_EXTENSIONS.stream()
        .anyMatch(ext -> ext.equalsIgnoreCase(FilenameUtils.getExtension(fullPath)));
  }

  /**
   * This method could be used when an URI contains special chars (as parenthesis, spaces and so on)
   * that are encoded by the LSP protocol on the client side but needs to be encoded in order to
   * display to the user the uri correctly.
   *
   * @param uri provided by the {@link org.eclipse.lsp4j.services.TextDocumentService}
   * @return a new String decoded with UTF8
   */
  public static String decodeURI(String uri) {
    try {
      return URLDecoder.decode(uri, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      log.error(e.getMessage());
      return uri;
    }
  }

  /**
   * This method return a {@link Path} representation of a bunch of {@link String} given as input or
   * null if is not possible get the path. After each pah a FS separator is added automatically
   *
   * @param basePath the string that represent the base path
   * @param more additional String used to compose the path
   * @return the {@link Path} that contains all the given segment, null if the path doesn't exists.
   */
  public Path getPath(@Nonnull String basePath, @Nonnull String... more) {
    return Paths.get(
        basePath,
        filesystemSeparator(),
        Arrays.stream(more)
            .map(path -> path + filesystemSeparator())
            .collect(Collectors.joining()));
  }

  /**
   * This method create a folder from a given path
   *
   * @param path in input that will be used to create the folder
   */
  public void createFolder(Path path) {
    try {
      Files.createDirectory(path);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  /**
   * Create a file on filesystem from a given {@link Path}
   *
   * @param path target path that will be used to create the file
   */
  public void createFile(Path path) {
    if (!path.toFile().exists()) {
      try {
        Files.createFile(path);
      } catch (IOException e) {
        log.error(e.getMessage());
      }
    }
  }

  /**
   * This method extract the name of a file from a valid {@link URI} and return the name back to the
   * client as String or null in case of error.
   *
   * @param uri the reference of the file from where extract the name
   * @return the String representation of the file name or null if any {@link URISyntaxException} is
   *     caught.
   */
  public String getNameFromURI(String uri) {
    try {
      return FilenameUtils.getBaseName(Paths.get(new URI(uri)).getFileName().toString());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  /**
   * This method extract the file extension from the {@link URI} given as input
   *
   * @param uri reference to the file from where extract the file extension
   * @return the String representation of the file extension or null if the URI is not valid
   */
  public String getExtensionFromURI(String uri) {
    return FilenameUtils.getExtension(uri);
  }

  /**
   * This method retrieve the content of a dependency file and return it back to the callee.
   *
   * @param filePath target path of the file
   * @return the content of the dependency file or null if doesn't exists
   */
  public List<String> getContentFromFile(Path filePath) {
    try {
      return readAllLines(filePath);
    } catch (IOException e) {
      log.error(e.getMessage());
      return Collections.emptyList();
    }
  }
}
