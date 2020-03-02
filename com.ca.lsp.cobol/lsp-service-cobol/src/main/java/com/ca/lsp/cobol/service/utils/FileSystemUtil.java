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

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

/**
 * This is an utility class that provide filesystem related methods consumed by the classes that
 * rely on the filesystem implementation as {@link CopybookServiceImpl} and {@link
 * CopybookDependencyServiceImpl}
 */
@Slf4j
@UtilityClass
public class FileSystemUtil {

  public static String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  public static boolean isFileExists(Path pathFile) {
    return pathFile != null && pathFile.toFile().exists();
  }

  public static void writeOnFile(Path filePath, String contents) {
    try {
      Files.write(filePath, (contents + "\n").getBytes(), StandardOpenOption.APPEND);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }
}
