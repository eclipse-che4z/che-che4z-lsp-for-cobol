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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import lombok.Value;

/**
 * This value class represents a copybook name with dialect info
 * context
 */
@Value
public class CopybookName {
  String name;
  String dialectType;

  /**
   * Extract a copybook name from processing copybook name
   * @param processingName a processing name
   * @return a copybook name
   */
  public static String extractName(String processingName) {
    int index = processingName.indexOf('#');
    return index > 0 ? processingName.substring(0,  index) : processingName;
  }

  /**
   * Creates a processing copybook name using a name and a dialect type
   * @return a processing copybook name
   */
  public String getProcessingName() {
    return String.format("%s#%s", name, dialectType);
  }
}
