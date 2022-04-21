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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.Locality;

/**
 * This value class represents an element item COBOL variable. It has a PIC clause representing its
 * type, and an optional VALUE clause that stores an explicitly defined value; both as Strings.
 * Element items cannot have nested variables, but may be a top element with level 01. Allowed
 * levels for this element are 01-49.
 */
@Getter
@ToString(callSuper = true)
@SuppressWarnings("squid:S107")
@EqualsAndHashCode(callSuper = true)
public class ElementaryItemNode extends ElementaryNode {
  private final String value;

  public ElementaryItemNode(
      Locality location,
      int level,
      String name,
      boolean global,
      String picClause,
      String value,
      UsageFormat usageFormat,
      boolean redefines,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent) {
    super(
        location,
        level,
        name,
        redefines,
        VariableType.ELEMENTARY_ITEM,
        global,
        isBlankWhenZeroPresent,
        isSignClausePresent,
        picClause,
        usageFormat);

    this.value = value;
  }

  @Override
  protected String getVariableDisplayString() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    if (picClause != null) stringBuilder.append(" PIC ").append(picClause);
    if (usageFormat != UsageFormat.UNDEFINED) stringBuilder.append(" USAGE ").append(usageFormat.toDisplayString());
    if (StringUtils.isNoneBlank(value)) stringBuilder.append(" VALUE ").append(value);
    return stringBuilder.append(".").toString();
  }
}
