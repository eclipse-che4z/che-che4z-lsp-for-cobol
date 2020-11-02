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
import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.unmodifiableList;

/**
 * This value class represents a group item COBOL variable. Group elements can have nested
 * variables. They cannot have neither PIC nor VALUE clauses. Can be the top element of the
 * structure with level 01, as well as nested ones with higher level numbers.
 */
@Value
public class GroupItem implements StructuredVariable {
  private String name;
  private Locality definition;
  private List<Variable> children = new ArrayList<>();

  public GroupItem(@NonNull String name, @NonNull Locality definition) {
    this.name = name;
    this.definition = definition;
  }

  /**
   * Add a new nested variable to this structure
   *
   * @param child - a nested variable. Can be a group or element, or all the other allowed type
   *     item.
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
