/*
 *
 *  Copyright (c) 2019 Broadcom.
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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.Variable;
import lombok.extern.java.Log;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.junit.Assert.*;

/** Test for CobolVariableContextImpl */
@Log
public class CobolVariableContextTest {
  private static final String LEVEL1 = "01";
  private static final String LEVEL2 = "02";
  private static final int LEVEL_77 = 77;
  private static final int LEVEL_66 = 66;

  private static final String VAR1 = "VAR1";
  private static final String VAR2 = "VAR2";
  private static final String PARENT1 = "PARENT1";

  private static final Position ERROR_POSITION1 = new Position(null, 0, 0, 3, 1, 5);
  private static final Position ERROR_POSITION2 = new Position(null, 0, 4, 8, 2, 5);

  private CobolVariableContext context;
  private Variable var1;
  private Variable var2;

  private List<Variable> variableList = new ArrayList<>();

  @Before
  public void createContext() {
    context = new CobolVariableContext();
    var1 = new Variable(LEVEL1, VAR1); // 01
    var2 = new Variable(LEVEL2, VAR2); // 02

    variableList.addAll(
        createVariableHierarchy(
            "01-parent1", "10-parent2", "20-childOuter", "30-childInner", "40-child"));
    variableList.addAll(
        createVariableHierarchy("01-outer1", "02-inner10", "06-inner20", "05-inner21"));

    variableList.addAll(
        createVariableHierarchy(
            "01-outer1",
            "02-inner10",
            "06-inner20",
            "06-inner21",
            "06-inner22",
            "03-inner30",
            "04-inner40",
            "05-inner41",
            "02-inner31",
            "01-outer2"));
  }

  @Test
  public void testDefine() {
    context.define(var1, ERROR_POSITION1);
    context.define(var2, ERROR_POSITION1);

    assertEquals(2, context.getAll().size());
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

    List<String> expected = new ArrayList<>();
    expected.add(VAR1);
    expected.add(VAR2);
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

  @Test
  public void testReorderVariableStructure() {
    int maxVarLevelDeep = 0;

    for (Variable variable : variableList) {
      int levelNumber = variable.getLevelNumber();

      // if level number is higher than maxVarLevelDeep deep that level number will be rewritten by
      // the cobol
      // compiler
      if (levelNumber > maxVarLevelDeep) {
        // if the number distance between current level number and maxVarLevelDeep deep is more than
        // 1 it means
        // that the level number should have a rewritten level number but maxVarLevelDeep deep value
        // shouldn't
        // change

        if (levelNumber - maxVarLevelDeep == 1) {
          maxVarLevelDeep++;
          variable.setLevelNumber(maxVarLevelDeep);
        } else {
          variable.setLevelNumber(maxVarLevelDeep + 1);
        }
      }
      LOG.info(
          String.format(
              "level number = %d and name %s", variable.getLevelNumber(), variable.getName()));
    }
    createRelationshipBetweenVariables(variableList);
    assertTrue(get("INNER21", variableList).getParent().getName().equalsIgnoreCase("INNER10"));
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

  private Variable get(String name, List<Variable> targetList) {
    return targetList.stream()
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
            .filter(
                variable ->
                    variable.getLevelNumber() != LEVEL_77 && variable.getLevelNumber() != LEVEL_66)
            .filter(variable -> variable.getLevelNumber() != -1)
            .collect(Collectors.toList());

    for (int i = 0; i < variables.size() - 1; i++) {
      context.generateRelations(variables.get(i), variables.get(i + 1));
    }
    return variables;
  }
}
