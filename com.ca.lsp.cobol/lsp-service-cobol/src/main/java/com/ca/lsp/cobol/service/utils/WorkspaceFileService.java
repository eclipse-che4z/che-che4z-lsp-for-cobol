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
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
  public String getContentByPath(@Nonnull Path path) {
    try (Stream<String> stream = Files.lines(path)) {
      return stream.reduce((s1, s2) -> s1 + lineSeparator() + s2).orElse("");
    } catch (IOException e) {
      log.error("Cannot get content of: " + path.toString(), e);
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
}
