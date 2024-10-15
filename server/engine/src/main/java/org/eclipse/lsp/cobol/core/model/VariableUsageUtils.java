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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

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
        findDefinedVariable(usageNodes.get(0).getName(), definedVariables).stream()
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

  private Collection<VariableNode> findDefinedVariable(String name, Multimap<String, VariableNode> definedVariables) {
    Collection<VariableNode> foundVariable =  definedVariables.get(name);
    if (foundVariable.size() > 0) {
      return foundVariable;
    }
    Optional<VariableNode> node = definedVariables.values()
            .stream().flatMap(Node::getDepthFirstStream)
            .filter(VariableNode.class::isInstance)
            .map(VariableNode.class::cast)
            .filter(var -> var.getName().equals(name))
            .findFirst();
    if (node.isPresent()) {
      foundVariable.add(node.get());
    }
    return foundVariable;
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

  /**
   * Retrieves {@link VariableUsageNode} based on the passed parent node and variable locality
   * @param parentNode parent node under which usage needs to be determined
   * @param identifier {@link VariableNameAndLocality} variable locality whose usage needs to be determined.
   * @return List of {@link VariableUsageNode} for the passed identifier
   */
  public List<VariableUsageNode> getVariableUsageNode(
          Node parentNode, VariableNameAndLocality identifier) {
    return parentNode.getDepthFirstStream()
            .filter(VariableUsageNode.class::isInstance)
            .map(VariableUsageNode.class::cast)
            .filter(node1 -> RangeUtils.isInside(node1.getLocality().getRange(), identifier.getLocality().getRange()))
            .collect(Collectors.toList());
  }

  /**
   * Retrieves {@link VariableUsageNode} based on the passed parent node and variable locality
   * @param parentNode parent node under which usage needs to be determined
   * @param identifiers Lis of {@link VariableNameAndLocality} variable locality whose usage needs to be determined.
   * @return List of {@link VariableUsageNode} for the passed identifier
   */
  public List<VariableUsageNode> getVariableUsageNode(
          Node parentNode, List<VariableNameAndLocality> identifiers) {
    return identifiers.stream().map(iden -> VariableUsageUtils.getVariableUsageNode(parentNode, iden))
            .flatMap(Collection::stream)
            .collect(Collectors.toList());
  }


  /**
   * Retrieves variable definition nodes for the passed {@link VariableUsageNode}
   * @param symbolAccumulatorService instance of {@link SymbolAccumulatorService}
   * @param containerNode  container node for the variableUsage node
   * @param identifiers List of {@link VariableUsageNode}
   * @return List of {@link VariableNode}
   */
  public List<VariableNode> getDefinitionNode(SymbolAccumulatorService symbolAccumulatorService,
                                               Node containerNode, List<VariableUsageNode> identifiers) {
    return containerNode.getProgram()
            .map(
                    programNode -> identifiers.stream().map(id -> symbolAccumulatorService.getVariableDefinition(
                            programNode, Collections.singletonList(id))).collect(Collectors.toList()))
            .map(e -> e.stream().flatMap(Collection::stream))
            .map(e1 -> e1.collect(Collectors.toList()))
            .orElse(ImmutableList.of());
  }
}
