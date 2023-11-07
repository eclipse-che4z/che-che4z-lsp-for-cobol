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

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;

import javax.annotation.Nullable;
import java.io.*;
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
import java.nio.file.attribute.BasicFileAttributes;
import java.util.List;
import java.util.function.BiPredicate;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * This service implements API for low-level file systems access. It mainly oriented to work with
 * copybooks, especially with .copybooks folder.
 */
@Slf4j
public class WorkspaceFileService implements FileSystemService {
  public WorkspaceFileService() {
  }

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
    int maxDepth = 1;
    if (isPathContainsAsterisk) {
      maxDepth = pathSplittedByFirstAsterisk[1].split("/").length + 1;
    }

    BiPredicate<Path, BasicFileAttributes> pathBasicFileAttributesBiPredicate = (a, c) -> {
      final String uriPath = a.toUri().getPath().replace("\\\\", "/");
      return !isPathContainsAsterisk || Pattern.compile(pathSplittedByFirstAsterisk[1]).matcher(uriPath).find();
    };
    Path start = Paths.get(pathToResolve);
    if (!Files.isDirectory(start)) {
      return ImmutableList.of();
    }
    try (Stream<Path> streamPath = Files.find(start, maxDepth, pathBasicFileAttributesBiPredicate)) {
      return streamPath
              .map(Path::toFile)
              .filter(File::isFile)
              .map(File::getName)
              .collect(Collectors.toList());
    } catch (IOException e) {
      LOG.error("An error occurred while reading list of files", e);
    }
    return ImmutableList.of();
  }

  /**
   * Reads implicit content
   *
   * @param name us a name of the implicit code
   * @return the content as a string
   */
  public String readImplicitCode(String name) {
    String uri = ImplicitCodeUtils.createPath(name);
    String content = null;
    try (InputStream inputStream = ImplicitCodeUtils.class.getResourceAsStream(uri)) {
      content = readFromInputStream(inputStream, StandardCharsets.UTF_8);
    } catch (IOException e) {
      LOG.error("Implicit code was not loaded. ", e);
    }
    return content;
  }

  private String uriWithReplacedPlaceholdersToAsterisks(String uri) {
    return uri.replaceAll("\\$\\{.*\\}", "*");
  }
}
