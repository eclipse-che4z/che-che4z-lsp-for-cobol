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
package com.broadcom.lsp.cobol.core.model;

import com.broadcom.lsp.cobol.core.model.variables.Variable;
import lombok.experimental.UtilityClass;

import java.util.*;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;

/**
 * The class take all defined variables and search through them by partial qualifier
 */
@UtilityClass
public class VariableUsageUtils {

  /**
   * Convert given defined variables into map, convenient for later search in findVariables function.
   * The defined variables can be converted once and used for all subsequent searches.
   *
   * @param definedVariables the collection with defined variables
   * @return the converted representation
   */
  public static Map<String, List<Variable>> convertDefinedVariables(Collection<Variable> definedVariables) {
    return definedVariables.stream().collect(groupingBy(Variable::getName));
  }

  /**
   * Return the list of variables matches the list of qualifiers
   *
   * @param definedVariables the map with all defined variables
   * @param name the name of variable
   * @param parents the list of parents in order they appear in COBOL.
   *                Ex.: CHILD OF PARENT1 OF PARENT2 => ["PARENT1", "PARENT2"]
   * @return the list of all matched variables
   */
  public static List<Variable> findVariables(
      Map<String, List<Variable>> definedVariables, String name, List<String> parents) {
    return definedVariables.getOrDefault(name, List.of()).stream()
        .filter(it -> checkParents(it, parents))
        .collect(Collectors.toList());
  }

  private static boolean checkParents(Variable variable, List<String> parents) {
    for (String parent : parents) {
      do {
        variable = variable.getParent();
        if (variable == null)
          return false;
      } while (!variable.getName().equals(parent));
    }
    return true;
  }
}
