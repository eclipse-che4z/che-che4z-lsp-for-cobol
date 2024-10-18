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

package org.eclipse.lsp.cobol.common.copybook;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.Uri;

/**
 * This value class represents a copybook name with dialect info context. Display name is the name
 * as it is specified in the original COPY statement. Dialect type is the type of the dialect the
 * copybook statement belongs to (default is COBOL). Qualified data name is the display name
 * concatenated with the specified qualifier or usage (part of dialects processing).
 */
@Value
@AllArgsConstructor
@Builder
public class CopybookName {
  String displayName;
  String dialectType;
  String extension;
  public String getQualifiedName() {
    return displayName;
  }

  public CopybookName(String displayName) {
    this.displayName = displayName;
    this.extension = null;
    this.dialectType = null;
  }

  public CopybookName(String displayName, String dialectType) {
    this.displayName = displayName;
    this.dialectType = dialectType;
    this.extension = null;
  }

  /**
   * Create an id from CopybookName object
   * @param programUri a program URI
   * @return an instance of copybook id
   */
  public CopybookId toCopybookId(Uri programUri) {
    return CopybookId.create(displayName, dialectType, programUri);
  }
}
