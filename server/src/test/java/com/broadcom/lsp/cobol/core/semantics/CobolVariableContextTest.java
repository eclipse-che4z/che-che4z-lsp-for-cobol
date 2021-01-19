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
package com.broadcom.lsp.cobol.core.semantics;

import com.broadcom.lsp.cobol.core.model.Variable;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

/** Test for CobolVariableContextImpl */
class CobolVariableContextTest {
  private static final String LEVEL1 = "01";
  private static final String LEVEL2 = "02";
  private static final String LEVEL10 = "10";
  private static final String LEVEL18 = "18";
  private static final String LEVEL40 = "40";
  private static final String LEVEL77 = "77";
  private static final int LEVEL_77 = 77;
  private static final int LEVEL_66 = 66;

  private static final String VAR1 = "VAR1";
  private static final String VAR2 = "VAR2";
  private static final String VAR3 = "VAR3";
  private static final String VAR4 = "VAR4";
  private static final String VAR5 = "VAR5";
  private static final String VAR6 = "VAR6";
  private static final String VAR7 = "VAR7";
  private static final String VAR8 = "VAR8";
  private static final String PARENT1 = "PARENT1";

  private static final Location ERROR_LOCALITY_1 = new Location(null, new Range(new Position(0, 5), new Position(0, 6)));
  private static final Location ERROR_LOCALITY_2 = new Location(null, new Range(new Position(4, 5), new Position(0, 7)));

  private CobolVariableContext context;
  private Variable var1;
  private Variable var2;
  private Variable var3;
  private Variable var4;
  private Variable var5;
  private Variable var6;
  private Variable var7;
  private Variable var8;

  private List<Variable> variableList;

  @BeforeEach
  void createContext() {
    context = new CobolVariableContext();
    var1 = new Variable(LEVEL1, VAR1); // 01
    var2 = new Variable(LEVEL2, VAR2); // 02
    var3 = new Variable(LEVEL10, VAR3); // 10
    var4 = new Variable(LEVEL10, VAR4); // 10
    var5 = new Variable(LEVEL10, VAR5); // 10
    var6 = new Variable(LEVEL18, VAR6); // 18
    var7 = new Variable(LEVEL40, VAR7); // 40
    var8 = new Variable(LEVEL77, VAR8); // 77

    variableList =
        createVariableHierarchy(
            "01-parent1", "10-parent2", "20-childOuter", "30-childInner", "40-child");
  }

  @Test
  void testDefine() {
    context.define(var1, ERROR_LOCALITY_1);
    context.define(var2, ERROR_LOCALITY_1);
    context.define(var3, ERROR_LOCALITY_1);
    context.define(var4, ERROR_LOCALITY_1);
    context.define(var5, ERROR_LOCALITY_1);
    context.define(var6, ERROR_LOCALITY_1);
    context.define(var7, ERROR_LOCALITY_1);
    context.define(var8, ERROR_LOCALITY_1);

    assertEquals(8, context.getAll().size());
    assertEquals(var1, context.get(VAR1));
  }

  @Test
  void testAddUsage() {
    context.addUsage(VAR1, ERROR_LOCALITY_1);
    context.addUsage(VAR1, ERROR_LOCALITY_2);
    assertEquals(2, context.getUsages().get(var1.getName()).size());
  }

  @Test
  void testGetNegative() {
    context.define(var1, ERROR_LOCALITY_1);
    assertEquals(var1, context.get(VAR1));
    assertNull(context.get("null"));
    assertFalse(context.contains("notContains"));
  }

  @Test
  void testGetNames() {
    context.define(var1, ERROR_LOCALITY_1);
    context.define(var2, ERROR_LOCALITY_1);

    List<String> expected = List.of(VAR1, VAR2);
    assertEquals(
        expected, context.getAll().stream().map(Variable::getName).collect(Collectors.toList()));
  }

  @Test
  void searchVariableInStructureHappyTest() {
    assertTrue(isVariableDefinedInStructure(variableList.get(0), "CHILD"));
  }

  @Test
  void searchVariableInStructureBadTest() {
    assertFalse(isVariableDefinedInStructure(variableList.get(0), "CHILD222"));
  }

  @Test
  void getVariableByNameHappyTest() {
    assertNotNull(get(PARENT1));
  }

  @Test
  void getVariableByNameBadTest() {
    assertNull(get("NEW-VARIABLE-NOT-CREATED"));
  }

  private boolean isVariableDefinedInStructure(Variable variable, String targetVariableName) {
    if (variable.getChildren().contains(targetVariableName)) {
      return true;
    } else {
      for (String childVariableName : variable.getChildren()) {
        Variable childVariable = get(childVariableName);
        if (childVariable != null) {
          return isVariableDefinedInStructure(childVariable, targetVariableName);
        }
      }
    }
    return false;
  }

  private Variable get(String name) {
    return variableList.stream()
        .filter(
            variable -> Optional.ofNullable(variable.getName()).orElse("").equalsIgnoreCase(name))
        .findFirst()
        .orElse(null);
  }

  private List<Variable> createVariableHierarchy(String... variableNames) {
    List<Variable> variables = new ArrayList<>();
    for (String variable : variableNames) {
      String[] elements = variable.split("-");
      variables.add(new Variable(elements[0], elements[1].toUpperCase()));
    }

    return createRelationshipBetweenVariables(variables);
  }

  private List<Variable> createRelationshipBetweenVariables(List<Variable> variables) {
    variables =
        variables.stream()
            .filter(levelPredicate(LEVEL_77).and(levelPredicate(LEVEL_66)))
            .filter(variable -> variable.getLevelNumber() != -1)
            .collect(Collectors.toList());

    for (int i = 0; i < variables.size() - 1; i++) {
      context.generateRelations(variables.get(i), variables.get(i + 1));
    }
    return variables;
  }

  private Predicate<Variable> levelPredicate(int level) {
    return v -> v.getLevelNumber() != level;
  }
}
