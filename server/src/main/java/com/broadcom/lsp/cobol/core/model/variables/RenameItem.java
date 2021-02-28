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
import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.ToString;
import lombok.Value;

import java.util.List;

import static com.broadcom.lsp.cobol.core.visitor.VariableDefinitionDelegate.LEVEL_66;

/**
 * This value class represents a renaming data name entry, that has a level number 66. It may be one
 * a top level, but should trail a variable structure. It is used to regroup element items, e.g.
 * copy elements of the previous structure into this one using RENAME and RENAME THRU/THROUGH
 * operations.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class RenameItem extends StructuredVariable {

  public RenameItem(@NonNull String name, @NonNull Locality definition, String scopeName) {
    super(LEVEL_66, name, definition, null, scopeName);
  }

  @Override
  public boolean isConditional() {
    return false;
  }

  @Override
  public void addConditionName(ConditionDataName variable) {
    throw new UnsupportedOperationException("This variable is not conditional");
  }

  @Override
  public List<ConditionDataName> getConditionNames() {
    return ImmutableList.of();
  }
}
