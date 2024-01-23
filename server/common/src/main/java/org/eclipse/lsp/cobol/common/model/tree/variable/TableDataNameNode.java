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

/** This value class represents the Table variable that may have an optional index */
@Getter
@ToString(callSuper = true)
@SuppressWarnings("squid:S107")
@EqualsAndHashCode(callSuper = true)
public class TableDataNameNode extends ElementaryNode {
  private final String value;
  private final int occursTimes;

  public TableDataNameNode(
      Locality location,
      int level,
      String name,
      boolean redefines,
      boolean global,
      String picClause,
      String value,
      int occursTimes,
      UsageFormat usageFormat,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent) {
    this(
        location,
        level,
        name,
        redefines,
        global,
        picClause,
        value,
        occursTimes,
        usageFormat,
        isBlankWhenZeroPresent,
        isSignClausePresent,
        false,
        false,
        false);
  }

  public TableDataNameNode(
      Locality location,
      int level,
      String name,
      boolean redefines,
      boolean global,
      String picClause,
      String value,
      int occursTimes,
      UsageFormat usageFormat,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent,
      boolean isDynamicLength,
      boolean isJustified,
      boolean isUnBounded) {
    super(
        location,
        level,
        name,
        redefines,
        VariableType.TABLE_DATA_NAME,
        global,
        isBlankWhenZeroPresent,
        isSignClausePresent,
        isDynamicLength,
        isJustified,
        isUnBounded,
        picClause,
        usageFormat);
    this.value = value;
    this.occursTimes = occursTimes;
  }

  @Override
  protected String getVariableDisplayString() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    stringBuilder.append(String.format(" OCCURS %1$d TIMES", occursTimes));
    if (picClause != null) stringBuilder.append(" PIC ").append(picClause);
    if (usageFormat != null && usageFormat != UsageFormat.UNDEFINED)
      stringBuilder.append(" USAGE ").append(usageFormat.toDisplayString());
    if (StringUtils.isNoneBlank(value)) stringBuilder.append(" VALUE ").append(value);
    return stringBuilder.append(".").toString();
  }
}
