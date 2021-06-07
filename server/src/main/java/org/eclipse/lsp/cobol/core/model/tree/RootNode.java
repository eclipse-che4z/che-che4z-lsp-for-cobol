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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.List;

import static java.util.stream.Collectors.toList;

/** The class represents the root. All trees must start with one root node. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class RootNode extends Node {
  public RootNode(Locality locality) {
    super(locality, NodeType.ROOT);
  }

  /**
   * Process tree node and its children after tree construction.
   *
   * <p>Root node processing consists of two steps:
   *
   * <p>- convert all VariableDefinitionNode into appropriate VariableNode
   *
   * <p>- process all tree nodes
   *
   * @return the list of errors for all syntax tree
   */
  @Override
  public List<SyntaxError> process() {
    List<SyntaxError> errors = processVariableDefinition();
    errors.addAll(super.process());
    return errors;
  }

  private List<SyntaxError> processVariableDefinition() {
    List<Node> nodesWithVariableDefinitions =
        getDepthFirstStream()
            .filter(hasType(NodeType.VARIABLE_DEFINITION))
            .map(Node::getParent)
            .distinct()
            .collect(toList());
    return nodesWithVariableDefinitions.stream()
        .map(VariableDefinitionUtil::processNodeWithVariableDefinitions)
        .flatMap(List::stream)
        .collect(toList());
  }
}
