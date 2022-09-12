/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.logic.VariableWithLevelCheckLevel;

/** The abstract class for variables with level number. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public abstract class VariableWithLevelNode extends VariableNode {
  private final int level;
  private final boolean specifiedGlobal;
  private final boolean redefines;
  private static final String GLOBAL_SUFFIX = " GLOBAL";

  protected VariableWithLevelNode(
      Locality location,
      int level,
      String name,
      boolean redefines,
      VariableType variableType,
      boolean global) {
    super(location, name, variableType, global);
    this.level = level;
    this.redefines = redefines;
    this.specifiedGlobal = global;
    addProcessStep(ctx -> new VariableWithLevelCheckLevel().accept(this, ctx));
  }

  protected VariableWithLevelNode(
      Locality location, int level, String name, boolean redefines, VariableType variableType) {
    super(location, name, variableType, false);
    this.level = level;
    this.redefines = redefines;
    this.specifiedGlobal = false;
    addProcessStep(ctx -> new VariableWithLevelCheckLevel().accept(this, ctx));
  }

  @Override
  public void setParent(Node parent) {
    super.setParent(parent);
    if (parent instanceof VariableWithLevelNode) {
      setGlobal(((VariableWithLevelNode) parent).isGlobal());
    }
  }

  protected String getFormattedSuffix() {
    String globalSuffix = specifiedGlobal ? GLOBAL_SUFFIX : "";
    return String.format("%1$02d %2$s%3$s", level, getName(), globalSuffix);
  }
}
