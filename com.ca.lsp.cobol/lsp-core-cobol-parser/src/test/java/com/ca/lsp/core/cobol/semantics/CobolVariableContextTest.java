/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.semantics;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.Variable;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.junit.Assert.*;

/** Test for CobolVariableContextImpl */
public class CobolVariableContextTest {
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

  private static final Position ERROR_POSITION1 = new Position(null, 0, 3, 1, 5);
  private static final Position ERROR_POSITION2 = new Position(null, 4, 8, 2, 5);

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

  @Before
  public void createContext() {
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
  public void testDefine() {
    context.define(var1, ERROR_POSITION1);
    context.define(var2, ERROR_POSITION1);
    context.define(var3, ERROR_POSITION1);
    context.define(var4, ERROR_POSITION1);
    context.define(var5, ERROR_POSITION1);
    context.define(var6, ERROR_POSITION1);
    context.define(var7, ERROR_POSITION1);
    context.define(var8, ERROR_POSITION1);

    assertEquals(8, context.getAll().size());
    assertEquals(var1, context.get(VAR1));
  }

  @Test
  public void testAddUsage() {
    context.addUsage(VAR1, ERROR_POSITION1);
    context.addUsage(VAR1, ERROR_POSITION2);
    assertEquals(2, context.getUsages().get(var1.getName()).size());
  }

  @Test
  public void testGetNegative() {
    context.define(var1, ERROR_POSITION1);
    assertEquals(var1, context.get(VAR1));
    assertNull(context.get("null"));
    assertFalse(context.contains("notContains"));
  }

  @Test
  public void testGetNames() {
    context.define(var1, ERROR_POSITION1);
    context.define(var2, ERROR_POSITION1);

    List<String> expected = List.of(VAR1, VAR2);
    assertEquals(
        expected, context.getAll().stream().map(Variable::getName).collect(Collectors.toList()));
  }

  @Test
  public void searchVariableInStructureHappyTest() {
    assertTrue(isVariableDefinedInStructure(variableList.get(0), "CHILD"));
  }

  @Test
  public void searchVariableInStructureBadTest() {
    assertFalse(isVariableDefinedInStructure(variableList.get(0), "CHILD222"));
  }

  @Test
  public void getVariableByNameHappyTest() {
    assertNotNull(get(PARENT1));
  }

  @Test
  public void getVariableByNameBadTest() {
    assertNull(get("NEW-VARIABLE-NOT-CREATED"));
  }

  /**
   * Test that {@link CobolVariableContext#removeUnresolvedCopybookMarks} removes all the variables
   * that have level number '-1'.
   */
  @Test
  public void removeUnresolvedCopybookMarksTest() {
    CobolVariableContext context = new CobolVariableContext();
    Position pos = new Position("doc", 0, 1, 0, 0);
    String cpyMark = "cpyMark";

    context.define(new Variable("-1", cpyMark), pos);
    context.define(new Variable("0", "var1"), pos);
    context.define(new Variable("1", "var2"), pos);
    context.removeUnresolvedCopybookMarks();

    assertEquals(2, context.getAll().size());
    assertFalse(context.contains(cpyMark));
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
