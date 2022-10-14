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
package org.eclipse.lsp.cobol.service.utils;

import com.google.common.collect.ImmutableList;
import com.google.inject.Singleton;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Nullable;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

/**
 * This service implements API for low-level file systems access. It mainly oriented to work with
 * copybooks, especially with .copybooks folder.
 */
@Singleton
@Slf4j
public class WorkspaceFileService implements FileSystemService {

  @Override
  public boolean fileExists(@Nullable Path file) {
    return file != null && file.toFile().exists();
  }

  @NonNull
  @Override
  public String decodeURI(@NonNull String uri) {
    try {
      return URLDecoder.decode(uri, StandardCharsets.UTF_8.toString());
    } catch (UnsupportedEncodingException e) {
      LOG.error("Can't decode URI", e);
      throw new IllegalArgumentException("UTF-8 charset is unsupported", e);
    }
  }

  @Nullable
  @Override
  public String getNameFromURI(@NonNull String uri) {
    return new File(uri).getName().replaceFirst("\\?.*$", "");
  }

  @Nullable
  @Override
  public String getContentByPath(@NonNull Path path) {
    CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder();
    decoder.onMalformedInput(CodingErrorAction.REPLACE);
    try (FileInputStream input = new FileInputStream(path.toFile());
        InputStreamReader reader = new InputStreamReader(input, decoder);
        BufferedReader bufferedReader = new BufferedReader(reader)) {
      StringBuilder sb = new StringBuilder();
      String line = bufferedReader.readLine();
      while (line != null) {
        sb.append(line).append("\n");
        line = bufferedReader.readLine();
      }
      return sb.toString();
    } catch (IOException e) {
      LOG.error("Cannot get content of: {}", path, e);
      return null;
    }
  }

  @Override
  @Nullable
  public Path getPathFromURI(@NonNull String uri) {
    try {
      return Paths.get(new URI(uri).normalize());
    } catch (URISyntaxException e) {
      LOG.error("Cannot find file by given URI: {}", uri, e);
      return null;
    }
  }

  /**
   * This method validates an URI to verify if is defined as extended document, according to a
   * regex.
   *
   * @param uri document URI opened in the client
   * @return true if the document is an extended document, false otherwise
   */
  public static boolean isFileUnderExtendedSourceFolder(String uri) {
    // the regex will match resources in the format [file://<FOLDER>/.c4z/.extsrcs/<DOCUMENT>]
    return Pattern.matches("file://.*?\\.c4z/\\.extsrcs/.+", uri);
  }

  @Override
  @NonNull
  public String readFromInputStream(InputStream inputStream, Charset charset) throws IOException {
    StringBuilder resultStringBuilder = new StringBuilder();
    try (BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, charset))) {
      String line;
      while ((line = br.readLine()) != null) {
        resultStringBuilder.append(line).append("\n");
      }
    }
    return resultStringBuilder.toString();
  }

  @Override
  @NonNull
  public List<String> listFilesInDirectory(final String path) {

    final String[] pathSplittedByFirstAsterisk = uriWithReplacedPlaceholdersToAsterisks(
        path).split("\\*", 2);
    final String pathToResolve = pathSplittedByFirstAsterisk[0];
    final boolean isPathContainsAsterisk = pathSplittedByFirstAsterisk.length >= 2;
    int maxDepth = 0;
    if (isPathContainsAsterisk) {
      maxDepth = pathSplittedByFirstAsterisk[1].split("/").length + 1;
    }

    try (Stream<Path> streamPath = Files.find(
        Paths.get(pathToResolve),
        maxDepth,
        (a, c) -> {
          final String uriPath = a.toUri().getPath().replaceAll("\\\\", "/");
          return !isPathContainsAsterisk || Pattern.compile(pathSplittedByFirstAsterisk[1])
              .matcher(uriPath).find();
        })) {
      return
          streamPath
              .map(Path::toFile)
              .filter(File::isFile)
              .map(File::getName)
              .collect(Collectors.toList());
    } catch (IOException e) {
      LOG.error("An error occurred while reading list of files", e);
    }
    return ImmutableList.of();
  }

  private String uriWithReplacedPlaceholdersToAsterisks(String uri) {
    return uri.replaceAll("\\$\\{.*\\}", "*");
  }
}
