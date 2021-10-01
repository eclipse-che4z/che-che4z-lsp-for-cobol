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

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Context;
import org.eclipse.lsp.cobol.core.model.tree.Describable;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import java.util.List;

/**
 * The class represents the name of variable definition.
 *
 * <p>Example:
 *
 * <pre>
 * 01 FIRST.
 *   05 SECOND PIC 9.
 * </pre>
 *
 * Here we have different locations for whole definition and variable name:
 *
 * <pre>
 *     ->|   |<- Name location
 *       |   |
 * ->|01 FIRST.
 * |    05 SECOND PIC 9.|<-------|
 * |                             |
 * |-- var definition location --|
 * </pre>
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class VariableDefinitionNameNode extends Node implements Context, Describable {
  private final String name;

  public VariableDefinitionNameNode(Locality location, String name) {
    super(location, NodeType.VARIABLE_DEFINITION_NAME);
    this.name = name;
  }

  @Override
  public List<? extends Node> getDefinitions() {
    return ImmutableList.of(this);
  }

  @Override
  public List<? extends Node> getUsages() {
    return getNearestParentByType(NodeType.VARIABLE)
        .map(VariableNode.class::cast)
        .map(VariableNode::getUsages)
        .orElseGet(ImmutableList::of);
  }

  @Override
  public String getFormattedDisplayString() {
    return getNearestParentByType(NodeType.VARIABLE)
        .map(VariableNode.class::cast)
        .map(VariableNode::getFullVariableDescription)
        .orElse("");
  }
}
