/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects;

import com.google.common.collect.ImmutableList;
import com.google.inject.Singleton;
import lombok.SneakyThrows;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.List;

/**
 * Provides files in the working folder
 */
@Singleton
public class WorkingFolderService {

  private static final String DIALECTS_PATH_SYSTEM_PROPERTY = "dialect.path";

  /**
   * Returns a list of filenames in the working folder
   * @param workdir is a working folder URI
   * @return a list of filenames in the working folder
   */
  public List<String> getFilenames(URI workdir) {
    File files = new File(workdir);
    String[] filenames = files.list();
    if (filenames == null) {
      return ImmutableList.of();
    }
    return Arrays.asList(filenames);
  }

  /**
   * Returns a working folder uri
   * @return a working folder path
   */
  @SneakyThrows
  public URI getWorkingFolder() {
    URI workdir;
    String dialectPath = System.getProperty(DIALECTS_PATH_SYSTEM_PROPERTY);

    if (dialectPath != null) {
      workdir = getWorkingFolder(dialectPath);
    } else {
      workdir = getDefaultDir();
    }
    return workdir;
  }

  /**
   * Returns a working folder uri
   * @param path path string
   * @return a working folder uri
   */
  @SneakyThrows
  public URI getWorkingFolder(String path) {
    return new File(path).getAbsoluteFile().toURI();
  }

  private URI getDefaultDir() throws URISyntaxException {
    return WorkingFolderService.class.getProtectionDomain().getCodeSource().getLocation()
        .toURI();
  }

}
