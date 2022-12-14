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
import java.net.URL;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Provides files in the working folder
 */
@Singleton
class WorkingFolderService {

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
   * Returns a working folder path
   * @return a working folder path
   */
  @SneakyThrows
  public List<URI> getWorkingFolder() {
    List<URI> workdirs = new LinkedList<>();
    String dialectPaths = System.getProperty(DIALECTS_PATH_SYSTEM_PROPERTY);

    if (dialectPaths != null) {
      for (String dialectPath : dialectPaths.split(",")) {
        workdirs.add(new URL("file:" + dialectPath + "/").toURI());
      }
    } else {
      workdirs.add(getDefaultDir());
    }
    return workdirs;
  }

  private URI getDefaultDir() throws URISyntaxException {
    return WorkingFolderService.class.getProtectionDomain().getCodeSource().getLocation()
        .toURI();
  }

}
