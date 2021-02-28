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
      String name,
      Locality definition,
      Variable parent,
      String picClause,
      String value,
      int occursTimes,
      List<IndexItem> indexes,
      UsageFormat usageFormat, String scopeName) {
    super(name, definition, parent, scopeName);
    this.picClause = picClause;
    this.value = value;
    this.occursTimes = occursTimes;
    this.indexes = indexes;
    this.usageFormat = usageFormat;
  }

  @Override
  public Variable rename(RenameItem newParent) {
    return new TableDataName(
        name,
        definition,
        newParent,
        picClause,
        value,
        occursTimes,
        indexes,
        usageFormat, getScopeName());
  }
}
