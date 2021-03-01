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

import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;

import javax.annotation.Nullable;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static java.lang.System.lineSeparator;

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
      throw new RuntimeException("UTF-8 charset is unsupported", e);
    }
  }

  @Nullable
  @Override
  public String getNameFromURI(@NonNull String uri) {
    try {
      return FilenameUtils.getBaseName(Paths.get(new URI(uri)).getFileName().toString());
    } catch (URISyntaxException e) {
      LOG.error("Cannot get file name from: " + uri, e);
      return null;
    }
  }

  @Nullable
  @Override
  public String getContentByPath(@NonNull Path path) {
    try (Stream<String> stream = Files.lines(path)) {
      return stream.reduce((s1, s2) -> s1 + lineSeparator() + s2).orElse("");
    } catch (IOException e) {
      LOG.error("Cannot get content of: " + path.toString(), e);
      return null;
    }
  }

  @Override
  @Nullable
  public Path getPathFromURI(@NonNull String uri) {
    try {
      return Paths.get(new URI(uri).normalize());
    } catch (URISyntaxException e) {
      LOG.error("Cannot find file by given URI: " + uri, e);
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
}
