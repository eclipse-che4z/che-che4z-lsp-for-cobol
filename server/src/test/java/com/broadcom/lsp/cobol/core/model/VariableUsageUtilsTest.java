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
import com.google.common.collect.ImmutableList;
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
        Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(ImmutableList.of());
        assertTrue(VariableUsageUtils.findVariables(definedVariables, "foo", ImmutableList.of(),
                new LinkedList<>()).isEmpty());
    }

    @Test
    void findByNameWithAnyParent() {
        List<Variable> variables = collectVariables(
                var("FOO", "scope"),
                var("BAR", "scope",
                        var("FOO", "scope",
                                var("BAZ", "scope")),
                        var("BAZ", "scope",
                                var("FOO", "scope")))
        );
        Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
        List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "FOO", ImmutableList.of(),
                new LinkedList<>(ImmutableList.of("scope")));
        checkQualifiers(found, "FOO", "BAR FOO", "BAR BAZ FOO");
    }

    @Test
    void findByNameAndParent() {
        List<Variable> variables = collectVariables(
                var("FOO", "scope"),
                var("BAR", "scope",
                        var("FOO", "scope",
                                var("BAZ", "scope")),
                        var("BAZ", "scope",
                                var("FOO", "scope")))
        );
        Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
        List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "FOO", ImmutableList.of("BAR"), new LinkedList<>(ImmutableList.of("scope")));
        checkQualifiers(found, "BAR FOO", "BAR BAZ FOO");
    }

    @Test
    void findByNameAndTwoParents() {
        List<Variable> variables = collectVariables(
                var("FOO", "scope",
                        var("BAZ", "scope",
                                var("BAR", "scope"),
                                var("QWE", "scope",
                                        var("BAR", "scope"))),
                        var("QWE", "scope",
                                var("BAZ", "scope",
                                        var("BAR", "scope")))),
                var("BAZ", "scope",
                        var("FOO", "scope",
                                var("BAR", "scope")))
        );
        Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
        List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "BAR", ImmutableList.of("BAZ", "FOO"), new LinkedList<>(ImmutableList.of("scope")));
        checkQualifiers(found, "FOO BAZ BAR", "FOO BAZ QWE BAR", "FOO QWE BAZ BAR");
    }

    @Test
    void findByNameByScopeAndParent() {
        List<Variable> variables = collectVariables(
                var("FOO", "scope1"),
                var("BAR", "scope1",
                        var("FOO", "scope2",
                                var("BAZ", "scope2")),
                        var("BAZ", "scope3",
                                var("FOO", "scope3")))
        );

        Map<String, List<Variable>> definedVariables = VariableUsageUtils.convertDefinedVariables(variables);
        List<Variable> found = VariableUsageUtils.findVariables(definedVariables, "FOO", ImmutableList.of("BAR"),
                new LinkedList<>(ImmutableList.of("scope2")));
        assertEquals(1, found.size());

    }
    private static void checkQualifiers(List<Variable> variables, String... qualifiers) {
        assertEquals(Arrays.stream(qualifiers).collect(Collectors.toSet()),
                variables.stream().map(VariableUsageUtilsTest::getQualifier).collect(Collectors.toSet()));
    }

    private static List<Variable> collectVariables(Function<Variable, List<Variable>>... factories) {
        List<Variable> result = new ArrayList<>();
        for (Function<Variable, List<Variable>> factory: factories)
            result.addAll(factory.apply(null));
        return result;
    }

  private static Function<Variable, List<Variable>> var(
      String name, String scopeName, Function<Variable, List<Variable>>... factories) {
    return (Variable parent) -> {
      List<Variable> result = new ArrayList<>();
      Variable it =
          new ElementItem(name, Locality.builder().build(), parent, "", "", null, scopeName);
      result.add(it);
      for (Function<Variable, List<Variable>> factory : factories) result.addAll(factory.apply(it));
      return result;
    };
  }

    private static String getQualifier(Variable variable) {
        return Optional.ofNullable(variable.getParent())
                .map(it -> getQualifier(it) + " ")
                .orElse("") + variable.getName();
    }
}
