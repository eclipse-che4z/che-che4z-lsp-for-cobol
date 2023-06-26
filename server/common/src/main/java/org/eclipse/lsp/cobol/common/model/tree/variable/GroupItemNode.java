/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.common.model.tree.variable;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;

/**
 * This value class represents a group item COBOL variable. Group elements can have nested
 * variables. They cannot have neither PIC nor VALUE clauses. Can be the top element of the
 * structure with level 01, as well as nested ones with higher level numbers.
 *
 * <p>Group item can have usage clause.<br>
 * <br>
 *
 * <pre>
 *  Case 1.
 *    Working-Storage Section.
 *    01 FOO POINTER GLOBAL.   {- This is valid. Here FOO node has
 *    01 FOO2 pointer GLOBAL.       only 1 children of node type
 *    Procedure Division.           VARIABLE_DEFINITION_NAME. Which should not
 *                                  be considered for empty structure.
 *     </pre>
 *
 * <pre>
 *    Case 2.
 *       WORKING-STORAGE SECTION.
 *       01 PARENT.    {--- This is invalid
 *       PROCEDURE DIVISION.
 * </pre>
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class GroupItemNode extends VariableWithLevelNode implements UsageClause {
  private final UsageFormat usageFormat;

  public GroupItemNode(
      Locality location,
      int level,
      String name,
      boolean global,
      boolean redefines,
      UsageFormat usageFormat) {
    super(location, level, name, redefines, VariableType.GROUP_ITEM, global);
    this.usageFormat = usageFormat;
  }

  @Override
  protected String getVariableDisplayString() {
    return getFormattedSuffix() + ".";
  }
}
