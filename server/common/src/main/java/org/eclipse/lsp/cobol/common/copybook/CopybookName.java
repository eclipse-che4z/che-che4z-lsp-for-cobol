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
  String name;
  String dialect;
  String extension;
  public String getQualifiedName() {
    return name;
  }

  public CopybookName(String name) {
    this.name = name;
    this.extension = null;
    this.dialect = null;
  }

  public CopybookName(String name, String dialect) {
    this.name = name;
    this.dialect = dialect;
    this.extension = null;
  }

  /**
   * Create an id from CopybookName object
   * @param programUri a program URI
   * @return an instance of copybook id
   */
  public CopybookId toCopybookId(String programUri) {
    return CopybookId.create(name, dialect, programUri);
  }
}
