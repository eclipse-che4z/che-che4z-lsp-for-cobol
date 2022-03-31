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
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;

/** The abstract class for variables with level number. */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
abstract class VariableWithLevelNode extends VariableNode {
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
    addProcessStep(this::checkLevel);
  }

  protected VariableWithLevelNode(
      Locality location, int level, String name, boolean redefines, VariableType variableType) {
    super(location, name, variableType, false);
    this.level = level;
    this.redefines = redefines;
    this.specifiedGlobal = false;
    addProcessStep(this::checkLevel);
  }

  @Override
  public void setParent(Node parent) {
    super.setParent(parent);
    if (parent instanceof VariableWithLevelNode)
      setGlobal(((VariableWithLevelNode) parent).isGlobal());
  }

  private List<SyntaxError> checkLevel() {
    List<SyntaxError> errors = new ArrayList<>();
    if ((level == LEVEL_01 || level == LEVEL_77)
        && getLocality().getRange().getStart().getCharacter() > AREA_A_FINISH)
      errors.add(getError(MessageTemplate.of(AREA_A_WARNING, getName())));
    if (specifiedGlobal && level != LEVEL_01)
      errors.add(getError(MessageTemplate.of(GLOBAL_NON_01_LEVEL_MSG)));
    return errors;
  }

  protected String getFormattedSuffix() {
    String globalSuffix = specifiedGlobal ? GLOBAL_SUFFIX : "";
    return String.format("%1$02d %2$s%3$s", level, getName(), globalSuffix);
  }
}
