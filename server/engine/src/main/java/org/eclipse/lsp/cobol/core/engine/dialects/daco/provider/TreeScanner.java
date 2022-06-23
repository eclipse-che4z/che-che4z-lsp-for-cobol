/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * Scans nodes for variable definitions with defined name's pattern
 */
@UtilityClass
class TreeScanner {

  /**
   * Scans nodes for variable definitions with defined name's pattern
   * @param nodes is generated nodes with DaCo dialect processor
   * @return a list of variable name info
   */
  public List<VariableNameInfo> scan(List<Node> nodes) {
    List<Node> list = new LinkedList<>(nodes);
    nodes.forEach(n -> list.addAll(n.getDepthFirstStream().collect(Collectors.toList())));
    return list.stream()
        .filter(n -> n.getNodeType() == NodeType.VARIABLE_DEFINITION)
        .map(VariableDefinitionNode.class::cast)
        .map(VariableDefinitionNode::getVariableName)
        .filter(Objects::nonNull)
        .map(VariableNameAndLocality::getName)
        .map(TreeScanner::getVariableNameInfo)
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  private VariableNameInfo getVariableNameInfo(String name) {
    VariableNameInfo result = null;
    if (name.length() == 10 && (name.startsWith("TBF") || name.startsWith("TBL")) && name.indexOf("-X") == 6) {
      result = new VariableNameInfo(name.substring(3, 6), name.substring(8));
    }
    return result;
  }
}
