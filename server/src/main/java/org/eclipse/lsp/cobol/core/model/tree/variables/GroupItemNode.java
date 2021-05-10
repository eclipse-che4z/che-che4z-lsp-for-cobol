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

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.EMPTY_STRUCTURE_MSG;

/**
 * This value class represents a group item COBOL variable. Group elements can have nested
 * variables. They cannot have neither PIC nor VALUE clauses. Can be the top element of the
 * structure with level 01, as well as nested ones with higher level numbers.
 */
@Getter
@ToString(callSuper = true)
public class GroupItemNode extends VariableWithLevelNode {
  private boolean redefines;

  public GroupItemNode(Locality location, int level, String name, boolean global, boolean redefines) {
    super(location, level, name, VariableType.GROUP_ITEM, global);
    this.redefines = redefines;
  }

  @Override
  public List<SyntaxError> process() {
    List<SyntaxError> errors = new ArrayList<>();
    if (getChildren().stream().noneMatch(node -> node.getNodeType() == NodeType.VARIABLE))
      errors.add(getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, getName())));
    errors.addAll(super.process());
    return errors;
  }
}
