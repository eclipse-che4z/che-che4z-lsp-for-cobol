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
import lombok.Getter;
import lombok.Value;

import java.util.ArrayList;
import java.util.List;

/**
 * This value class represents an element item COBOL variable. It has a PIC clause representing its
 * type, and an optional VALUE clause that stores an explicitly defined value; both as Strings.
 * Element items cannot have nested variables, but may be a top element with level 01. Allowed
 * levels for this element are 01-49.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class ElementItem extends AbstractVariable {
  private String picClause;
  private String value;
  @Getter private List<ConditionalDataName> conditionalDataNames = new ArrayList<>();

  public ElementItem(
      String name, String qualifier, Locality definition, String picClause, String value) {
    super(name, qualifier, definition);
    this.picClause = picClause;
    this.value = value;
  }

  /**
   * Add a nested {@link ConditionalDataName} item (level 88) for this {@link ElementItem}
   *
   * @param child - nested Conditional data name item
   */
  public void addConditionalChild(ConditionalDataName child) {
    conditionalDataNames.add(child);
  }

  @Override
  public Variable rename(String renameItemName) {
    return new ElementItem(
        name,
        VariableUtils.renameQualifier(qualifier, renameItemName),
        definition,
        picClause,
        value);
  }

  @Override
  public boolean isRenameable() {
    return true;
  }
}
