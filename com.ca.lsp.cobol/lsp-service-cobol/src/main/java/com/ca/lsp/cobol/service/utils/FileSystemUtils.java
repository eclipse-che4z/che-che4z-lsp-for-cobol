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
import org.eclipse.lsp4j.WorkspaceFolder;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.file.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * This is an utility class that provide filesystem related methods consumed by the classes that
 * rely on the filesystem implementation as {@link CopybookServiceImpl} and {@link
 * CopybookDependencyServiceImpl}
 */
@Slf4j
@UtilityClass
public class FileSystemUtils {
  private final List<String> ALLOWED_EXTENSIONS = Arrays.asList("cpy", "cbl", "cobol", "cob");
  private static final String DEP_EXTENSION = ".dep";

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
  public static void writeOnFile(Path targetPath, String contents) {
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
   * @param workspaceFolders folders which are provided at the init moment
   * @return a list of path of those folders
   */
  public List<Path> getWorkspaceFoldersAsPathList(List<WorkspaceFolder> workspaceFolders) {
    return Optional.ofNullable(workspaceFolders)
        .map(Collection::stream)
        .orElseGet(Stream::empty)
        .filter(Objects::nonNull)
        .map(FileSystemUtils::resolveUriPath)
        .collect(Collectors.toList());
  }

  /**
   * This method can be used to extract the name of a given COBOL file from the URI
   *
   * @param documentUri
   * @return the cobol program name from the given URI
   */
  public String getFileNameFromURI(String documentUri) {
    String result = null;
    try {
      result = FilenameUtils.getBaseName(Paths.get(new URI(documentUri)).getFileName().toString());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
    }
    return result;
  }

  /**
   * This method provides the path to a specific file based on the COBOL file
   *
   * @param dependencyFolderPath the folder where we are creating the dependency file
   * @param cobolFileName
   * @return the path of the dependency file
   */
  public Path retrieveDependencyFile(Path dependencyFolderPath, String cobolFileName) {
    return Paths.get(dependencyFolderPath + filesystemSeparator() + cobolFileName + DEP_EXTENSION);
  }

  /**
   * @param it workspace folder
   * @return the normalized path version of the given folder
   */
  private Path resolveUriPath(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()).normalize());
    } catch (URISyntaxException e) {
      log.error(e.getMessage());
    }
    return null;
  }
}
