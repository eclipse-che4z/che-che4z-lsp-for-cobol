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

/** Data transport object of CF AST. GoTo type is EXEC SQL WHENEVER statement node. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class SqlWhenever extends CFASTNode {
  private final String wheneverCondition;
  private final String wheneverType;
  private final String value;

  public SqlWhenever(Location location, String wheneverCondition, String wheneverType, String value) {
    super(CFASTNodeType.EXEC_SQL_WHENEVER.getValue(), location);
    this.wheneverCondition = wheneverCondition;
    this.wheneverType = wheneverType;
    this.value = value;
  }
}
