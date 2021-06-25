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

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.Locality;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static java.util.Collections.unmodifiableList;

/**
 * This interface represents a structured variable that may contain children ones. The children may
 * be variables or also structures.
 */
public abstract class StructuredVariable extends AbstractVariable {
  private final List<Variable> children = new ArrayList<>();

  StructuredVariable(
      int levelNumber, String name, Locality definition, boolean global, Variable parent) {
    super(levelNumber, name, definition, global, parent);
  }

  /**
   * Add a new nested variable to this structure
   *
   * @param variable - a nested variable. Can be a group or element, or all the other allowed type
   *     item.
   */
  public void addChild(@NonNull Variable variable) {
    children.add(variable);
  }

  /**
   * Return an immutable list of already defined nested variables
   *
   * @return defined nested variables.
   */
  @NonNull
  public List<Variable> getChildren() {
    return unmodifiableList(children);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    if (!super.equals(o)) return false;
    StructuredVariable that = (StructuredVariable) o;
    return Objects.equals(children, that.children);
  }

  @Override
  public int hashCode() {
    return Objects.hash(super.hashCode(), children);
  }
}
