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
import lombok.EqualsAndHashCode;
import lombok.Value;

/**
 * This value class represents an element item COBOL variable. It has a PIC clause representing its
 * type, and an optional VALUE clause that stores an explicitly defined value; both as Strings.
 * Element items cannot have nested variables, but may be a top element with level 01. Allowed
 * levels for this element are 01-49.
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class ElementItem extends AbstractVariable {
  String picClause;
  String value;
  UsageFormat usageFormat;

  public ElementItem(
      String name,
      Locality definition,
      Variable parent,
      String picClause,
      String value,
      UsageFormat usageFormat) {
    super(name, definition, parent);
    this.picClause = picClause;
    this.value = value;
    this.usageFormat = usageFormat;
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return new ElementItem(
        name,
        definition,
        newParent,
        picClause,
        value,
        usageFormat);
  }
}
