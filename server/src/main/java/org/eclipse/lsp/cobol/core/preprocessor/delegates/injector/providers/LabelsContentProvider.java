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

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

import java.util.Optional;

/**
 * Generates predefined copybook content provider that generates content for a copybook
 */
public class LabelsContentProvider implements ContentProvider {

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
    StringBuilder sb = new StringBuilder();
    for (String paragraph : copybookConfig.getPredefinedParagraphs()) {
      sb.append(StringUtils.repeat(' ', 7));
      sb.append(paragraph);
      sb.append(".\r\n");
    }

    return Optional.of(new CopybookModel(copybookName, ImplicitCodeUtils.createFullUrl(copybookName.getQualifiedName()), sb.toString()));
  }
}
