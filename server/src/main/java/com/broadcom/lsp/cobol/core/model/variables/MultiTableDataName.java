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
import lombok.ToString;
import lombok.Value;

import java.util.List;

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
      UsageFormat usageFormat, String scopeName) {
    super(levelNumber, name, definition, parent, scopeName);
    this.occursTimes = occursTimes;
    this.indexes = indexes;
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
        usageFormat, getScopeName());
  }
}
