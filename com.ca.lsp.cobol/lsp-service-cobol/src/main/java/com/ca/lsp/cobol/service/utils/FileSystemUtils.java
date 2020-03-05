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

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.List;

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
}
