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

import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.file.*;
import java.util.List;
import java.util.stream.Stream;

import static java.lang.String.format;
import static java.nio.file.Files.readAllLines;
import static java.nio.file.StandardOpenOption.WRITE;
import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;

/**
 * This service implements API for low-level file systems access. It mainly oriented to work with
 * copybooks, especially with .copybooks folder.
 */
@Singleton
@Slf4j
public class WorkspaceFileService implements FileSystemService {
  private static final List<String> ALLOWED_EXTENSIONS = asList("cpy", "cbl", "cobol", "cob");
  private static final String COPYBOOKS_FOLDER = ".copybooks";
  private static final String C4Z_FOLDER = ".c4z";

  @Override
  public boolean fileExists(@Nullable Path file) {
    return file != null && file.toFile().exists();
  }

  @Override
  public void writeInFile(
      @Nonnull Path targetPath,
      @Nonnull String content,
      @Nullable StandardOpenOption standardOpenOption) {
    try {
      Files.write(targetPath, (content + "\n").getBytes(), WRITE, standardOpenOption);
    } catch (IOException e) {
      log.error("Error writing to file: " + targetPath, e);
    }
  }

  @Nonnull
  @Override
  public String decodeURI(@Nonnull String uri) {
    try {
      return URLDecoder.decode(uri, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      log.error("Cannot decode URI: " + uri, e);
      return uri;
    }
  }

  @Nonnull
  @Override
  public List<String> interpretPaths(@Nonnull List<Object> settings) {
    return settings.stream()
        .map(Object::toString)
        .map(
            path ->
                path.substring(path.indexOf(COPYBOOKS_FOLDER) + COPYBOOKS_FOLDER.length())
                    .replace("/", filesystemSeparator())
                    .replace("\"", ""))
        .collect(toList());
  }

  @Nonnull
  @Override
  public Path getPath(@Nonnull String basePath, @Nonnull String... more) {
    return Paths.get(basePath, more);
  }

  @Nonnull
  @Override
  public Path getCopybookFolderPath(@Nonnull String workspacePath) {
    return getPath(workspacePath, C4Z_FOLDER, COPYBOOKS_FOLDER);
  }

  @Nonnull
  @Override
  public List<Path> getPathList(@Nonnull String outer, @Nonnull List<String> variablePart) {
    return variablePart.stream()
        .map(it -> Paths.get(outer, it))
        .filter(Files::exists)
        .collect(toList());
  }

  @Override
  public Path createFolders(Path path) {
    try {
      return Files.createDirectories(path);
    } catch (IOException e) {
      log.error("Error creating folders for " + path, e);
      return null;
    }
  }

  @Override
  public void createFolder(@Nonnull Path path) {
    try {
      Files.createDirectory(path);
    } catch (IOException e) {
      log.error("Error creating folder: " + path, e);
    }
  }

  @Override
  public void createFile(@Nonnull Path path) {
    if (!path.toFile().exists()) {
      try {
        Files.createFile(path);
      } catch (IOException e) {
        log.error("Error creating file: " + path, e);
      }
    }
  }

  @Nullable
  @Override
  public String getNameFromURI(@Nonnull String uri) {
    try {
      return FilenameUtils.getBaseName(Paths.get(new URI(uri)).getFileName().toString());
    } catch (URISyntaxException e) {
      log.error("Cannot get file name from: " + uri, e);
      return null;
    }
  }

  @Nullable
  @Override
  public String getExtensionFromURI(@Nonnull String uri) {
    return FilenameUtils.getExtension(uri);
  }

  @Nonnull
  @Override
  public List<String> getContentFromFile(@Nonnull Path filePath) {
    try {
      return readAllLines(filePath);
    } catch (IOException e) {
      log.error("Cannot get content of: " + filePath.toString(), e);
      return emptyList();
    }
  }

  @Nullable
  @Override
  public String getContentByPath(@Nonnull Path path) {
    try (Stream<String> stream = Files.lines(path)) {
      return stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse("");
    } catch (IOException e) {
      log.error("Cannot get content of: " + path.toString(), e);
      return null;
    }
  }

  @Nullable
  @Override
  public Path applySearch(@Nonnull String fileName, @Nonnull Path targetFolderPath) {
    try (Stream<Path> pathStream =
        Files.find(
            targetFolderPath,
            100,
            (path, basicFileAttributes) -> isValidFileFound(path.toFile(), fileName),
            FileVisitOption.FOLLOW_LINKS)) {
      return pathStream.findAny().orElse(null);
    } catch (IOException e) {
      log.error(format("Error searching for %s in %s", fileName, targetFolderPath.toString()), e);
      return null;
    }
  }

  @Override
  @Nullable
  public Path getPathFromURI(@Nonnull String uri) {
    try {
      return Paths.get(new URI(uri).normalize());
    } catch (URISyntaxException e) {
      log.error("Cannot find file by given URI: " + uri, e);
      return null;
    }
  }

  @Override
  public void removeIfPresent(@Nonnull String element, @Nonnull Path targetPath) {
    try {
      List<String> result = getContentFromFile(targetPath);

      List<String> updatedLines = result.stream().filter(s -> !s.equals(element)).collect(toList());

      // don't write if the lines were not modify
      if (!updatedLines.equals(result)) {
        Files.write(targetPath, updatedLines, StandardOpenOption.TRUNCATE_EXISTING);
      }
    } catch (IOException e) {
      log.error(format("Cannot remove %s in %s", element, targetPath.toString()), e);
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
  private boolean isValidFileFound(File currentFile, String requiredName) {
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
  private boolean hasFileValidExtension(String fullPath) {
    return ALLOWED_EXTENSIONS.stream()
        .anyMatch(ext -> ext.equalsIgnoreCase(FilenameUtils.getExtension(fullPath)));
  }

  /** @return the representation os based of the FS separator */
  private static String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }
}
