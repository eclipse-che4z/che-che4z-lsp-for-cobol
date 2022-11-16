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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNameNode;

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
   * @param programNode is a program node
   * @return a list of variable name info
   */
  public List<VariableNameInfo> scan(ProgramNode programNode) {
    return programNode.getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.VARIABLE_DEFINITION_NAME)
        .map(VariableDefinitionNameNode.class::cast)
        .map(VariableDefinitionNameNode::getName)
        .filter(Objects::nonNull)
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
