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
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;

/** This class represents program context in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
@Slf4j
public class ProgramNode extends Node {
  private final Multimap<String, VariableNode> variables = ArrayListMultimap.create();
  private String programName;

  public ProgramNode(Locality locality) {
    super(locality, PROGRAM);
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }

  /**
   * Get variable definition node based on list of variable usage nodes.
   *
   * @param usageNodes represents variable name and its parents
   * @return the list of founded variable definitions
   */
  public List<VariableNode> getVariableDefinition(List<VariableUsageNode> usageNodes) {
    List<VariableNode> foundDefinitions =
        VariableUsageUtils.findVariablesForUsage(variables, usageNodes);
    if (!foundDefinitions.isEmpty()) {
      return foundDefinitions;
    }

    Multimap<String, VariableNode> globals = ArrayListMultimap.create();
    getMapOfGlobalVariables()
        .values()
        .forEach(variableNode -> globals.put(variableNode.getName(), variableNode));
    return VariableUsageUtils.findVariablesForUsage(globals, usageNodes);
  }

  private Map<String, VariableNode> getMapOfGlobalVariables() {
    Map<String, VariableNode> result =
        getProgram().map(ProgramNode::getMapOfGlobalVariables).orElseGet(HashMap::new);
    variables.values().stream()
        .filter(VariableNode::isGlobal)
        .forEach(variableNode -> result.put(variableNode.getName(), variableNode));
    return result;
  }
}
