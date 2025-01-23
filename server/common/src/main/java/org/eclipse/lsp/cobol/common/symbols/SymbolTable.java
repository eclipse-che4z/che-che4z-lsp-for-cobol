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
package org.eclipse.lsp.cobol.common.symbols;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp4j.Range;

import java.util.*;

/** A container for symbol information */
@RequiredArgsConstructor
public class SymbolTable {
  @Getter
  private final List<CodeBlockDefinitionNode> codeBlocks = new ArrayList<>();
  @Getter
  private final Multimap<String, CodeBlockReference> paragraphMap = ArrayListMultimap.create();
  @Getter
  private final Map<String, CodeBlockReference> sectionMap = new HashMap<>();
  @Getter
  private final SymbolTable parent;

  private final Multimap<String, VariableNode> variablesMap = ArrayListMultimap.create();
  private final Multimap<String, VariableNode> variablesGlobalsMap = ArrayListMultimap.create();

  public Collection<VariableNode> getVariables() {
    List<VariableNode> result = new ArrayList<>();
    result.addAll(variablesGlobalsMap.values());
    result.addAll(variablesMap.values());
    return result;
  }

  public Collection<VariableNode> findVariables(String name) {
    Collection<VariableNode> result = new ArrayList<>();
    result.addAll(variablesGlobalsMap.get(name));
    result.addAll(variablesMap.get(name));
    return result;
  }

  /**
   * Generates unique key for the prorgam
   * @param program node
   * @return string value of a generated key
   */
  public static String generateKey(ProgramNode program) {
    Range range = program.getLocality().getRange();
    String rangeString = "["
            + range.getStart().getLine() + ", " + range.getStart().getCharacter()
            + "-"
            + range.getEnd().getLine() + ", " + range.getEnd().getCharacter()
            + "]";
    return program.getProgramName() + "%" + program.getLocality().getUri() + "%" + rangeString;
  }

  public void register(VariableNode node) {
      (isGlobal(node) ? variablesGlobalsMap : variablesMap)
              .put(node.getName().toUpperCase(Locale.ROOT), node);
  }

  private static boolean isGlobal(VariableNode node) {
    if(node.isGlobal()) {
      return true;
    }
    Node parent = node.getParent();
    while (parent != null) {
      if(parent instanceof VariableNode && ((VariableNode) parent).isGlobal()) {
        return true;
      }
      parent = parent.getParent();
    }
    return false;
  }

  public Multimap<String, VariableNode> getVariablesMap() {
    Multimap<String, VariableNode> result = ArrayListMultimap.create();
    result.putAll(variablesMap);
    result.putAll(variablesGlobalsMap);
    return result;
  }

  /**
   * Get variable definition node based on list of variable usage nodes.
   *
   * @param usagePath represents variable name and its parents
   * @return the list of founded variable definitions
   */
  public List<VariableNode> getVariableDefinition(List<VariableUsageNode> usagePath) {
    List<VariableNode> foundDefinitions = findVariablesCandidates(variablesMap, usagePath);
    if (!foundDefinitions.isEmpty()) {
      return foundDefinitions;
    }

    return globalVariableSearch(this, usagePath);
  }

  private List<VariableNode> globalVariableSearch(SymbolTable symbolTable, List<VariableUsageNode> usagePath) {
    List<VariableNode> result = findVariablesCandidates(symbolTable.variablesGlobalsMap, usagePath);
    if (!result.isEmpty() || symbolTable.getParent() == null) {
      return result;
    }
    return globalVariableSearch(symbolTable.getParent(), usagePath);
  }

  private static List<VariableNode> findVariablesCandidates(Multimap<String, VariableNode> definedVariables, List<VariableUsageNode> path) {
      Collection<VariableNode> candidates = definedVariables.get(path.get(0).getName());
      List<VariableUsageNode> parents = path.subList(1, path.size());

      Map<VariableNode, Integer> stepToMatchParentsMap = new HashMap<>();
      for (VariableNode variable : candidates) {
        countToMatchParents(variable, parents).ifPresent(steps -> stepToMatchParentsMap.put(variable, steps + 1));
      }

      List<VariableNode> exactHierarchyMatchedVariables = new ArrayList<>();
      for (Map.Entry<VariableNode, Integer> entry : stepToMatchParentsMap.entrySet()) {
        if (entry.getValue().equals(path.size())) {
          exactHierarchyMatchedVariables.add(entry.getKey());
        }
      }

      return exactHierarchyMatchedVariables.isEmpty()
              ? new ArrayList<>(stepToMatchParentsMap.keySet())
              : exactHierarchyMatchedVariables;
  }

  private static Optional<Integer> countToMatchParents(VariableNode variable, List<VariableUsageNode> usagePath) {
    int count = 0;
    for (VariableUsageNode parent : usagePath) {
      String parentName = parent.getName();
      do {
        variable = getNearestParentVariable(variable);
        if (variable == null) {
          return Optional.empty();
        }
        count++;
      } while (!variable.getName().equals(parentName));
    }
    return Optional.of(count);
  }

  private static VariableNode getNearestParentVariable(VariableNode variable) {
    return variable.getNearestParentByType(NodeType.VARIABLE)
            .map(VariableNode.class::cast)
            .orElse(null);
  }
}
