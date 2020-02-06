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
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static java.util.stream.Collectors.toList;

/**
 * This class represents a structure to store variables of a COBOL program and build a variable
 * hierarchy.
 */
public class CobolVariableContext implements SubContext<Variable> {
  private static final int LEVEL_77 = 77;
  private static final int LEVEL_66 = 66;

  private final List<Variable> variables = new ArrayList<>();
  private final Multimap<String, Position> variableDefinitions = HashMultimap.create();
  private final Multimap<String, Position> variableUsages = HashMultimap.create();

  @Override
  public void define(Variable variable, Position position) {
    variables.add(variable);
    variableDefinitions.put(variable.getName(), position);
  }

  @Override
  public void addUsage(String variableName, Position position) {
    variableUsages.put(variableName, position);
  }

  @Override
  public List<Variable> getAll() {
    return Collections.unmodifiableList(variables);
  }

  @Override
  public boolean contains(String name) {
    return get(name) != null;
  }

  @Override
  public Multimap<String, Position> getDefinitions() {
    return variableDefinitions;
  }

  @Override
  public Multimap<String, Position> getUsages() {
    return variableUsages;
  }

  @Override
  public void merge(String name, SubContext<Variable> subContext) {
    variableDefinitions.putAll(subContext.getDefinitions());
    variableUsages.putAll(subContext.getUsages());
    buildVariableStructure(name, subContext);
  }

  public Variable get(String name) {
    return variables.stream()
        .filter(
            variable -> Optional.ofNullable(variable.getName()).orElse("").equalsIgnoreCase(name))
        .findFirst()
        .orElse(null);
  }

  /**
   * @param rootVariableName the root variable from where start the deep search
   * @param targetVariableName the name of the variable to found in the variable tree
   * @return a boolean true if the variable targetVaraible is present false otherwise
   */
  public boolean parentContainsSpecificChild(String rootVariableName, String targetVariableName) {
    Variable rootVariable = get(rootVariableName);

    if (rootVariable.getChildren().contains(targetVariableName)) {
      return true;
    } else {
      for (String childVariableName : rootVariable.getChildren()) {
        Variable childVariable = get(childVariableName);
        if (childVariable != null) {
          return parentContainsSpecificChild(childVariable.getName(), targetVariableName);
        }
      }
    }
    return false;
  }

  public void createRelationBetweenVariables() {
    // variable with level number [ 77 ] are not part of list used to generate the structure because
    // it cannot be a group item but just an element item
    List<Variable> variableList =
        getAll().stream()
            .filter(
                variable ->
                    variable.getLevelNumber() != LEVEL_77 && variable.getLevelNumber() != LEVEL_66)
            .filter(variable -> variable.getLevelNumber() != -1)
            .collect(toList());

    for (int i = 0; i < variableList.size() - 1; i++) {
      generateRelations(variableList.get(i), variableList.get(i + 1));
    }
  }

  /**
   * Remove all the copybook marks that were not resolved. Copybook mark is a variable with copybook
   * name and level number '-1'. If copybook is missing, then this mark will stay here and should be
   * deleted not to appear in the variable list.
   */
  public void removeUnresolvedCopybookMarks() {
    List<Variable> unresolvedCopybooks =
        variables.stream().filter(it -> it.getLevelNumber() == -1).collect(toList());
    variables.removeAll(unresolvedCopybooks);
    unresolvedCopybooks.forEach(it -> variableDefinitions.removeAll(it.getName()));
  }

  /**
   * This routine will identify the correct relation between two variable defined in the data
   * division section. There are 3 different cases verified by that routine: 1) The two variables
   * are on the same level 2) the second variable have a greater level than the first variable in
   * input (it means that. the second variable is children of the first) 3) the second variable have
   * a lower level than the first variable in input (it means that first and second variable do not
   * correlate, and we need to navigate the structure back to identify the right parent variable)
   *
   * @param v1 First variable
   * @param v2 Second variable
   */
  void generateRelations(Variable v1, Variable v2) {

    // the second variable is a 01-level that cannot be child of other variables
    if (v2.getLevelNumber() == 1) {
      return;
    }

    int levelNumberFirstVariable = v1.getLevelNumber();
    int levelNumberSecondVariable = v2.getLevelNumber();

    /*
     * If the two variables are on the same level of indentation they will have the same parent
     * variable (if it exists - null otherwise) and both will be defined in the children structure
     * of the parent variable.
     */
    if (levelNumberFirstVariable == levelNumberSecondVariable) {
      setVariableAtSameLevel(v1, v2);

      /*
       * If the second variable have a level of indentation bigger than the first variable it means that the second variable
       * is child of the first variable, and will have the first variable in input as parent and that parent will update its children list
       * with the second variable in input
       */

    } else if (levelNumberSecondVariable > levelNumberFirstVariable) {
      v1.getChildren().add(v2.getName());
      v2.setParent(v1);
    } else {
      /*
       * if the second variable have a lower value than the first variable it means that the two variables are not part of the same structure,
       * and we should navigate back in the structure in order to found the right parent of the second variable.
       * By the way, because the level [01] is on the most outer level, we should check that the parent of the first variable is not a 01-level variable.
       * In that case the two variables will have the same parent and will
       */

      if (v1.getParent().getLevelNumber() == 1) {
        setVariableAtSameLevel(v1, v2);
      } else {
        generateRelations(v1.getParent(), v2);
      }
    }
  }

  private void setVariableAtSameLevel(Variable v1, Variable v2) {
    /*
     * If the second variable is a 01-level, it is part of a new structure, so the two variables
     * will not share a common parent, but they are on the same 01-level
     */
    v2.setParent(v1.getParent());
    if (v1.getParent() != null) {
      v1.getParent().getChildren().add(v2.getName());
    }
  }

  /**
   * Replace the copybook mark with a variable structure of this copybook. Copybook analyzer puts
   * these marks into the context to show where the copybook variable structure should be built in
   * respecting the main document structure.
   *
   * <p>Copybook mark is a variable with copybook name and level number '-1'.
   *
   * @param name - copybook name
   * @param subContext - copybook context
   */
  private void buildVariableStructure(String name, SubContext<Variable> subContext) {
    int indexOfCopybook = variables.indexOf(new Variable("-1", name));
    if (indexOfCopybook == -1) {
      variables.addAll(subContext.getAll());
    }
    variables.addAll(indexOfCopybook + 1, subContext.getAll());
    variables.remove(indexOfCopybook);
    variableDefinitions.removeAll(name);
    if (variables.contains(new Variable("-1", name))) {
      buildVariableStructure(name, subContext);
    }
  }
}
