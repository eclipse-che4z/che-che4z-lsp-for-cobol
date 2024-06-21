/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

/** Data transport object of CF AST. GoTo type is CICS HANDLE ABEND statement node. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class HandleAbend extends CFASTNode {
  private final String handleType;
  private final String value;

  public HandleAbend(Location location, String type, String value) {
    super(CFASTNodeType.EXEC_CICS_HANDLE.getValue(), location);
    this.handleType = type;
    this.value = value;
  }
}
