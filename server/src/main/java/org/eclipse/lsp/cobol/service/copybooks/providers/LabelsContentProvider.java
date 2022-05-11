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
package org.eclipse.lsp.cobol.service.copybooks.providers;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/**
 * Generates predefined copybook content provider that generates content for a copybook
 */
public class LabelsContentProvider implements ContentProvider {

  /**
   * Generate predefined copybook's content
   * @param copybookConfig is a copybook config
   * @param uri for predefined copybook
   * @return a copybook content
   */
  @Override
  public String read(CopybookConfig copybookConfig, String uri) {
    StringBuilder sb = new StringBuilder();
    for (String paragraph : copybookConfig.getPredefinedParagraphs()) {
      sb.append(StringUtils.repeat(' ', 7));
      sb.append(paragraph);
      sb.append(".\r\n");
    }
    return sb.toString();
  }
}
