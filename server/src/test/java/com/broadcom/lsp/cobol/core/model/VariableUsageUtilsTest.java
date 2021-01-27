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


import com.broadcom.lsp.cobol.core.model.variables.ElementItem;
import com.broadcom.lsp.cobol.core.model.variables.Variable;
import org.junit.jupiter.api.Test;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** This test check functions of the {@link VariableUsageUtils}. */
class VariableUsageUtilsTest {
  @Test
  void empty() {
    Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(List.of());
    assertTrue(VariableUsageUtils.findVariables(definedVariables, "foo", List.of()).isEmpty());
  }

  @Test
  void findByNameWithAnyParent() {
    List<Variable> variables = collectVariables(
        var("FOO"),
        var("BAR",
            var("FOO",
                var("BAZ")),
            var("BAZ",
                var("FOO")))
    );
    Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
    List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "FOO", List.of());
    checkQualifiers(found, "FOO", "BAR FOO", "BAR BAZ FOO");
  }

  @Test
  void findByNameAndParent() {
    List<Variable> variables = collectVariables(
        var("FOO"),
        var("BAR",
            var("FOO",
                var("BAZ")),
            var("BAZ",
                var("FOO")))
    );
    Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
    List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "FOO", List.of("BAR"));
    checkQualifiers(found, "BAR FOO", "BAR BAZ FOO");
  }

  @Test
  void findByNameAndTwoParents() {
    List<Variable> variables = collectVariables(
        var("FOO",
            var("BAZ",
                var("BAR"),
                var("QWE",
                    var("BAR"))),
            var("QWE",
                var("BAZ",
                    var("BAR")))),
        var("BAZ",
            var("FOO",
                var("BAR")))
    );
    Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
    List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "BAR", List.of("BAZ", "FOO"));
    checkQualifiers(found, "FOO BAZ BAR", "FOO BAZ QWE BAR", "FOO QWE BAZ BAR");
  }

  private static void checkQualifiers(List<Variable> variables, String... qualifiers) {
    assertEquals(Set.of(qualifiers),
        variables.stream().map(VariableUsageUtilsTest::getQualifier).collect(Collectors.toSet()));
  }

  private static List<Variable> collectVariables(Function<Variable, List<Variable>>... factories) {
    List<Variable> result = new ArrayList<>();
    for (var factory: factories)
      result.addAll(factory.apply(null));
    return result;
  }

  private static Function<Variable, List<Variable>> var(String name, Function<Variable, List<Variable>>... factories) {
    return (Variable parent) -> {
      List<Variable> result = new ArrayList<>();
      Variable it = new ElementItem(name, Locality.builder().build(), parent, "", "", null);
      result.add(it);
      for (var factory: factories)
        result.addAll(factory.apply(it));
      return result;
    };
  }

  private static String getQualifier(Variable variable) {
    return Optional.ofNullable(variable.getParent())
        .map(it -> getQualifier(it) + " ")
        .orElse("") + variable.getName();
  }
}
