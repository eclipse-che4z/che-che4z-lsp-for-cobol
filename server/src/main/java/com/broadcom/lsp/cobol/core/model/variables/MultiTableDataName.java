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

import java.util.List;

/**
 * This value class represents the multi-dimensional Table variable that may have nested variables,
 * and an optional index
 */
@Value
@EqualsAndHashCode(callSuper = true)
public class MultiTableDataName extends StructuredVariable implements TableDeclaration {
  private int occursTimes;
  private List<IndexItem> indexes;

  public MultiTableDataName(
      int levelNumber,
      String name,
      String qualifier,
      Locality definition,
      int occursTimes,
      List<IndexItem> indexes) {
    super(levelNumber, name, qualifier, definition);
    this.occursTimes = occursTimes;
    this.indexes = indexes;
  }
}
