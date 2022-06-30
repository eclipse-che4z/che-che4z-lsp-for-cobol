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
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.util.Optional;

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
   * Read injected code content
   * @param copybookConfig is a copybook config
   * @param copybookName for injected code name
   * @param programDocumentUri for program document uri
   * @param documentUri for current document uri
   * @return an optional copybook model
   */
  @Override
  public Optional<CopybookModel> read(CopybookConfig copybookConfig, CopybookName copybookName,
                                      String programDocumentUri, String documentUri) {
    String content = ImplicitCodeUtils.readImplicitCode(files, copybookName.getQualifiedName());
    return Optional.ofNullable(content)
        .map(c -> new CopybookModel(copybookName, ImplicitCodeUtils.createFullUrl(copybookName.getQualifiedName()), c));
  }

}
