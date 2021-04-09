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

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.Locality;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;

import java.util.List;
import java.util.stream.Collectors;

/** This value class represents the Table variable that may have an optional index */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class TableDataName extends AbstractVariable implements TableDeclaration {
  String picClause;
  String value;
  int occursTimes;
  List<IndexItem> indexes;
  UsageFormat usageFormat;

  public TableDataName(
      int levelNumber,
      String name,
      Locality definition,
      boolean global,
      Variable parent,
      String picClause,
      String value,
      int occursTimes,
      List<IndexItem> indexes,
      UsageFormat usageFormat) {
    super(levelNumber, name, definition, global, parent);
    this.picClause = picClause;
    this.value = value;
    this.occursTimes = occursTimes;
    this.indexes = indexes.stream().map(it -> it.updateParent(this)).collect(Collectors.toList());
    this.usageFormat = usageFormat;
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return new TableDataName(
        levelNumber,
        name,
        definition,
        newParent.global,
        newParent,
        picClause,
        value,
        occursTimes,
        indexes,
        usageFormat);
  }

  @Override
  public String getFormattedDisplayLine() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    stringBuilder.append(String.format(" OCCURS %1$d TIMES", occursTimes));
    if (picClause != null)
      stringBuilder.append(" PIC ").append(picClause);
    if (usageFormat != UsageFormat.UNDEFINED)
      stringBuilder.append(" USAGE ").append(usageFormat);
    if (StringUtils.isNoneBlank(value))
      stringBuilder.append(" VALUE ").append(value);
    return stringBuilder.append(".").toString();
  }
}
