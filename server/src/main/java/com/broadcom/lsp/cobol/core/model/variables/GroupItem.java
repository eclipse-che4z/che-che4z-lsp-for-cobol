/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.core.model.variables;

import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.VariableUtils;
import lombok.EqualsAndHashCode;
import lombok.Value;

/**
 * This value class represents a group item COBOL variable. Group elements can have nested
 * variables. They cannot have neither PIC nor VALUE clauses. Can be the top element of the
 * structure with level 01, as well as nested ones with higher level numbers.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class GroupItem extends StructuredVariable {
  private String name;
  private String qualifier;
  private Locality definition;

  public GroupItem(int number, String name, String qualifier, Locality definition) {
    super(number);
    this.name = name;
    this.qualifier = qualifier;
    this.definition = definition;
  }

  @Override
  public Variable rename(String renameItemName) {
    return new GroupItem(
        levelNumber, name, VariableUtils.renameQualifier(qualifier, renameItemName), definition);
  }
}
