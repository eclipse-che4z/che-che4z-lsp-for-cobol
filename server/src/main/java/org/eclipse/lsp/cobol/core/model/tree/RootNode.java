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

import com.google.common.collect.ImmutableMap;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;
import org.eclipse.lsp.cobol.core.semantics.CodeBlockDefinitionUtils;

import java.util.List;
import java.util.Map;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.*;

/** The class represents the root. All trees must start with one root node. */
@ToString(callSuper = true)
@Getter
public class RootNode extends Node {
  public RootNode(Locality locality) {
    super(locality, ROOT);
  }

  private static final Map<NodeType, Function<Node, List<SyntaxError>>> DEFINITION_FUNCTORS =
      ImmutableMap.of(
          VARIABLE_DEFINITION,
          VariableDefinitionUtil::processNodeWithVariableDefinitions,
          PARAGRAPH,
          CodeBlockDefinitionUtils::defineCodeBlock,
          PROCEDURE_SECTION,
          CodeBlockDefinitionUtils::defineCodeBlock);

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
    List<SyntaxError> errors = processDefinition(VARIABLE_DEFINITION);
    errors.addAll(processDefinition(PARAGRAPH));
    errors.addAll(processDefinition(PROCEDURE_SECTION));
    errors.addAll(super.process());
    return errors;
  }

  private List<SyntaxError> processDefinition(NodeType type) {
    return getDepthFirstStream()
        .filter(hasType(type))
        .map(Node::getParent)
        .distinct()
        .collect(toList())
        .stream()
        .map(DEFINITION_FUNCTORS.get(type))
        .flatMap(List::stream)
        .collect(toList());
  }
}
