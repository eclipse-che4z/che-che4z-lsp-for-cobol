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
import org.eclipse.lsp4j.TextDocumentItem;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

/** Identifies a copybook based on the file extensions */
@Singleton
public class CopybookIdentificationBasedOnExtension implements CopybookIdentificationService {

  private List<String> configuredCopybookExtensions;
  /**
   * Identifies a copybook
   *
   * @param doc copybook.
   * @return True if it's a copybook. False otherwise
   */
  @Override
  public boolean isCopybook(TextDocumentItem doc) throws UndeterminedDocumentException {
    String uri = doc.getUri();
    String[] uriAsArray = uri.split("/");
    String fileNameWithExtension = uriAsArray[uriAsArray.length - 1];
    String[] split = fileNameWithExtension.split("\\.");
    String extension = split.length > 1 ? "." + split[split.length - 1] : "";
    if (Objects.isNull(this.configuredCopybookExtensions)
        || this.configuredCopybookExtensions.size() == 0
        || StringUtils.isBlank(extension)) {
      throw new UndeterminedDocumentException();
    }
    return this.configuredCopybookExtensions.size() > 0
        && this.configuredCopybookExtensions.contains(extension);
  }

  /**
   * Notify copybook identification of client configurations
   *
   * @param configs client configuration
   */
  public void notifyExtensionConfig(List<String> configs) {
    this.configuredCopybookExtensions = Collections.unmodifiableList(configs);
  }
}
