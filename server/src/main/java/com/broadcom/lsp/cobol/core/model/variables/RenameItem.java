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
import lombok.NonNull;
import lombok.Value;

import java.util.List;

/**
 * This value class represents a renaming data name entry, that has a level number 66. It may be one
 * a top level, but should trail a variable structure. It is used to regroup element items, e.g.
 * copy elements of the previous structure into this one using RENAME and RENAME THRU/THROUGH
 * operations.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class RenameItem extends StructuredVariable {
  private static final int LEVEL_NUMBER = 66;
  private String name;
  private String qualifier;
  private Locality definition;

  public RenameItem(
      @NonNull String name,
      @NonNull String qualifier,
      @NonNull Locality definition,
      @NonNull List<Variable> renamedChildren) {
    super(LEVEL_NUMBER);
    this.name = name;
    this.qualifier = qualifier;
    this.definition = definition;
    renamedChildren.forEach(this::addChild);
  }

  @Override
  public boolean isRenameable() {
    return false;
  }

  @Override
  public Variable rename(String renameItemName) {
    return new RenameItem(
        name, VariableUtils.renameQualifier(qualifier, renameItemName), definition, getChildren());
  }
}
