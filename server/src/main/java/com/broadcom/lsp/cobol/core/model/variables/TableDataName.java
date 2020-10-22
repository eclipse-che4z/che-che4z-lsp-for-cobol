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
import lombok.Value;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.unmodifiableList;

/**
 * This value class represents the Table variable that may have nested variables, and an optional
 * index
 */
@Value
public class TableDataName implements StructuredVariable {
  private String name;
  private int occursTimes;
  private IndexItem index;
  private Locality definition;
  private List<Variable> children = new ArrayList<>();

  public TableDataName(
      @NonNull String name,
      int occursTimes,
      @NonNull Locality definition,
      @Nullable IndexItem index) {
    this.name = name;
    this.occursTimes = occursTimes;
    this.definition = definition;
    this.index = index;
  }

  /**
   * Add a new nested variable to this one
   *
   * @param child - a nested variable. Can be a group or element item.
   */
  public void addChild(Variable child) {
    children.add(child);
  }

  /**
   * Return a list of already defined nested variables
   *
   * @return defined nested variables.
   */
  public List<Variable> getChildren() {
    return unmodifiableList(children);
  }
}
