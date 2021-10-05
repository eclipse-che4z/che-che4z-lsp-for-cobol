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

import com.google.common.collect.Multimap;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import lombok.experimental.UtilityClass;

import java.util.*;
import java.util.stream.Collectors;

/**
 * The class take all defined variables and search through them by partial qualifier
 */
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
    return definedVariables.get(usageNodes.get(0).getDataName()).stream()
        .filter(it -> checkParents(it, usageNodes.subList(1, usageNodes.size())))
        .collect(Collectors.toList());
  }

  private static boolean checkParents(VariableNode variable, List<VariableUsageNode> parents) {
    for (VariableUsageNode parent : parents) {
      String parentName = parent.getDataName();
      do {
        variable = variable.getNearestParentByType(NodeType.VARIABLE)
            .map(VariableNode.class::cast)
            .orElse(null);
        if (variable == null)
          return false;
      } while (!variable.getName().equals(parentName));
    }
    return true;
  }
}
