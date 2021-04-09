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

import org.eclipse.lsp.cobol.core.model.Locality;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.Value;

import java.util.List;
import java.util.stream.Collectors;

/**
 * This value class represents the multi-dimensional Table variable that may have nested variables,
 * and an optional index
 */
@Value
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MultiTableDataName extends StructuredVariable implements TableDeclaration {
  int occursTimes;
  List<IndexItem> indexes;
  UsageFormat usageFormat;

  public MultiTableDataName(
      int levelNumber,
      String name,
      Locality definition,
      Variable parent,
      int occursTimes,
      List<IndexItem> indexes,
      UsageFormat usageFormat) {
    super(levelNumber, name, definition, parent);
    this.occursTimes = occursTimes;
    this.indexes = indexes.stream().map(it -> it.updateParent(this)).collect(Collectors.toList());
    this.usageFormat = usageFormat;
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return new MultiTableDataName(
        levelNumber,
        name,
        definition,
        newParent,
        occursTimes,
        indexes,
        usageFormat);
  }

  @Override
  public String getFormattedDisplayLine() {
    StringBuilder stringBuilder = new StringBuilder(getFormattedSuffix());
    stringBuilder.append(String.format(" OCCURS %1$d TIMES", occursTimes));
    if (usageFormat != UsageFormat.UNDEFINED)
      stringBuilder.append(" USAGE ").append(usageFormat);
    return stringBuilder.append(".").toString();
  }
}
