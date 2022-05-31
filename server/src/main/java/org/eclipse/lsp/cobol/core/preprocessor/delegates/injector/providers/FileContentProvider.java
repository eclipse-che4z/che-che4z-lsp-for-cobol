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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * Predefined copybook's content provider that reads content from a file
 */
@Slf4j
public class FileContentProvider implements ContentProvider {

  private final FileSystemService files;

  public FileContentProvider(FileSystemService files) {
    this.files = files;
  }

  /**
   * Read predefined copybook from resource
   * @param copybookConfig is a copybook config
   * @param resourcePath for predefined copybook
   * @return a copybook content
   */
  @Override
  public String read(CopybookConfig copybookConfig, String resourcePath) {
    InputStream inputStream = FileContentProvider.class.getResourceAsStream(resourcePath);
    String content = null;
    try {
      content =
          files.readFromInputStream(inputStream, StandardCharsets.UTF_8);
    } catch (IOException e) {
      LOG.error("Implicit copybook " + resourcePath + " is not loaded. ", e);
    }
    return content;
  }

}
