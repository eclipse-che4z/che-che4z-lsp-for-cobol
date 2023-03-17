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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.inject.Singleton;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Objects;

/** Identifies a copybook based on the file extensions */
@Singleton
public class CopybookIdentificationBasedOnExtension implements CopybookIdentificationService {

  /**
   * Identifies a copybook
   *
   * @param uri of the document
   * @param text of the document
   * @param config is a config
   * @return True if it's a copybook. False otherwise
   */
  @Override
  public boolean isCopybook(String uri, String text, List<String> config) {
    String[] uriAsArray = uri.split("/");
    String fileNameWithExtension = uriAsArray[uriAsArray.length - 1];
    String[] split = fileNameWithExtension.split("\\.");
    String extension = split.length > 1 ? "." + split[split.length - 1] : "";
    if (Objects.isNull(config)
        || config.size() == 0
        || StringUtils.isBlank(extension)) {
      return false;
    }
    return config.size() > 0
        && config.contains(extension);
  }
}
