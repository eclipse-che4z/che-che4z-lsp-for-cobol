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
package org.eclipse.lsp.cobol.core.model;

import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.VariableConstants.LEVEL_77;

/** The class take all defined variables and search through them by partial qualifier */
@UtilityClass
public class VariableUsageUtils {
  /**
   * Return the list of variables matches the list of qualifiers
   *
   * @param definedVariables the map with all defined variables
   * @param usageNodes usage nodes consists of variable name and parents
   * @return the list of all matched variables
   */
  public static List<VariableNode> findVariablesForUsage(
      Multimap<String, VariableNode> definedVariables, List<VariableUsageNode> usageNodes) {
    Map<VariableNode, Integer> variableToStepCountsToMatchParentsMap =
        definedVariables.get(usageNodes.get(0).getName()).stream()
            .map(
                it ->
                    mapVariableToStepCountsToMatchParents(
                        it, usageNodes.subList(1, usageNodes.size())))
            .reduce(
                (firstMap, secondMap) -> {
                  firstMap.putAll(secondMap);
                  return firstMap;
                })
            .orElse(Collections.emptyMap());

    List<VariableNode> exactHierarchyMatchedVariables =
        variableToStepCountsToMatchParentsMap.entrySet().stream()
            .filter(entry -> entry.getValue().equals(usageNodes.size() - 1))
            .map(Map.Entry::getKey)
            .collect(Collectors.toList());

    return exactHierarchyMatchedVariables.isEmpty()
        ? new ArrayList<>(variableToStepCountsToMatchParentsMap.keySet())
        : exactHierarchyMatchedVariables;
  }

  private static Map<VariableNode, Integer> mapVariableToStepCountsToMatchParents(
      VariableNode variable, List<VariableUsageNode> parents) {
    VariableNode referredVariable = variable;
    int count = 0;
    for (VariableUsageNode parent : parents) {
      String parentName = parent.getName();
      do {

        variable = getNearestParentVariable(variable);
        if (variable == null) {
          return new HashMap<>();
        }
        count++;
      } while (!variable.getName().equals(parentName));
    }
    return Maps.newHashMap(Collections.singletonMap(referredVariable, count));
  }

  private static VariableNode getNearestParentVariable(VariableNode variable) {
    return variable.getNearestParentByType(NodeType.VARIABLE)
            .map(VariableNode.class::cast)
            .orElse(null);
  }

  /**
   * Checks that there is no overlap between the passed nodes
   * @param node1 First Node
   * @param node2 Second Node
   * @return True when nodes overlap, false otherwise.
   */
  public boolean checkForNoOverlapBetweenNodes(
          VariableNode node1, VariableNode node2) {
    if (checkFirstInSecond(node1, node2)) return true;
    return checkFirstInSecond(node2, node1);
  }

  private boolean checkFirstInSecond(VariableNode node1, VariableNode node2) {
    for (Node child : node1.getChildren()) {
      Optional<VariableWithLevelNode> any = child
              .getDepthFirstStream()
              .filter(VariableWithLevelNode.class::isInstance)
              .map(VariableWithLevelNode.class::cast)
              .filter(node -> node.getLevel() != LEVEL_77)
              .filter(node -> node.equals(node2))
              .findAny();
      if (any.isPresent()) return true;
    }
    return false;
  }
}
