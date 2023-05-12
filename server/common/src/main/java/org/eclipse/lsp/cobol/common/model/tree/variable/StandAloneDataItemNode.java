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
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.model.Locality;

import static org.eclipse.lsp.cobol.common.VariableConstants.LEVEL_77;

/**
 * This value class represents an independent element item COBOL variable, that has a level number
 * 77. It should always have a PIC clause representing its type, and a VALUE clause that stores an
 * explicitly defined value; both as Strings. They cannot produce a structure in any way.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class StandAloneDataItemNode extends ElementaryNode {
  private final String value;

  public StandAloneDataItemNode(
      Locality location,
      String name,
      boolean global,
      String picClause,
      String value,
      boolean redefines,
      UsageFormat usageFormat,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent) {
    this(
        location,
        name,
        global,
        picClause,
        value,
        redefines,
        usageFormat,
        isBlankWhenZeroPresent,
        isSignClausePresent,
        false,
        false,
        false);
  }

  public StandAloneDataItemNode(
      Locality location,
      String name,
      boolean global,
      String picClause,
      String value,
      boolean redefines,
      UsageFormat usageFormat,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent,
      boolean isDynamicLength,
      boolean isJustified,
      boolean isUnBounded) {
    super(
        location,
        LEVEL_77,
        name,
        redefines,
        VariableType.STAND_ALONE_DATA_ITEM,
        global,
        isBlankWhenZeroPresent,
        isSignClausePresent,
        isDynamicLength,
        isJustified,
        isUnBounded,
        picClause,
        usageFormat);
    this.value = value;
  }

  @Override
  protected String getVariableDisplayString() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    if (picClause != null) stringBuilder.append(" PIC ").append(picClause);
    if (StringUtils.isNoneBlank(value)) stringBuilder.append(" VALUE ").append(value);
    return stringBuilder.append(".").toString();
  }
}
