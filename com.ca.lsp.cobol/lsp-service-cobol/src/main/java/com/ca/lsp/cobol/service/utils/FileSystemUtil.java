// TODO: Add header
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
