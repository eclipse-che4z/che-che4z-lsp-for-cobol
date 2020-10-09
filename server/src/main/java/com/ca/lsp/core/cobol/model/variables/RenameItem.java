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

package com.ca.lsp.core.cobol.model.variables;

import com.ca.lsp.core.cobol.model.Locality;
import lombok.Value;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.unmodifiableList;

/**
 * This value class represents a renaming data name entry, that has a level number 66. It may be one
 * a top level, but should trail a variable structure. It is used to regroup element items, e.g.
 * copy elements of the previous structure into this one using RENAME and RENAME THRU/THROUGH
 * operations.
 */
@Value
public class RenameItem implements StructuredVariable {
  private String name;
  private Locality definition;
  private List<Variable> children = new ArrayList<>();

  public RenameItem(@Nonnull String name, @Nonnull Locality definition) {
    this.name = name;
    this.definition = definition;
  }

  /**
   * Add the given variable to the children list of this variable
   *
   * @param variable - a variable to copy
   */
  public void rename(Variable variable) {
    children.add(variable);
  }

  /**
   * Add the given variable range to the children list of this variable. This method does not check
   * if the given variable range is correct - it should be assured by the client code.
   *
   * @param groupItem - a parent variable of the structure to copy
   * @param start - the start element of the structure range to copy
   * @param stop - the stop element of the structure range to copy
   */
  public void renameThru(GroupItem groupItem, Variable start, Variable stop) {
    List<Variable> childrenToRename = groupItem.getChildren();
    children.addAll(
        childrenToRename.subList(childrenToRename.indexOf(start), childrenToRename.indexOf(stop)));
  }

  /**
   * Not supported for this type of variable
   *
   * @param variable - a variable to add
   */
  @Override
  public void addChild(Variable variable) {
    throw new UnsupportedOperationException();
  }

  /**
   * Return a list of renamed elementary items
   *
   * @return re-defined nested variables.
   */
  public List<Variable> getChildren() {
    return unmodifiableList(children);
  }
}
