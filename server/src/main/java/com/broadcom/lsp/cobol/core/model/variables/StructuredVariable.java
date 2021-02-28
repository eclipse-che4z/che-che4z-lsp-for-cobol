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
import lombok.NonNull;

import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.unmodifiableList;

/**
 * This interface represents a structured variable that may contain children ones. The children may
 * be variables or also structures.
 */
public abstract class StructuredVariable extends AbstractVariable {
  private List<Variable> children = new ArrayList<>();
  int levelNumber;

  StructuredVariable(
      int levelNumber, String name, Locality definition, Variable parent, String scopeName) {
    super(name, definition, parent, scopeName);
    this.levelNumber = levelNumber;
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

  /**
   * Get the level number of this structure that determines its hierarchy
   *
   * @return level number
   */
  public int getLevelNumber() {
    return levelNumber;
  }
}
