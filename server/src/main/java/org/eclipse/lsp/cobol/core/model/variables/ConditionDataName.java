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

package org.eclipse.lsp.cobol.core.model.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.List;

import static org.eclipse.lsp.cobol.core.model.variables.StructureType.CONDITION_ITEM;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_88;

/**
 * This value class represents a conditional data name entry, that has a level number 88. It cannot
 * be a top element in the structure. It always contains a variable name and a value, but not PIC
 * clause.
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class ConditionDataName extends AbstractVariable {
  String value;
  String valueTo;

  public ConditionDataName(
      String name, Locality definition, Variable parent, String value, String valueTo) {
    super(LEVEL_88, name, definition, parent);
    this.value = value;
    this.valueTo = valueTo;
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

  @Override
  public Variable rename(RenameItem newParent) {
    return new ConditionDataName(name, definition, newParent, value, valueTo);
  }

  @Override
  public StructureType getStructureType() {
    return CONDITION_ITEM;
  }

  @Override
  public String getFormattedDisplayLine() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(getFormattedSuffix()).append(" VALUE ").append(value);
    if (valueTo != null) stringBuilder.append(" THRU ").append(valueTo);
    return stringBuilder.append(".").toString();
  }
}
