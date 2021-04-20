/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate;
import org.eclipse.lsp.cobol.core.visitor.VariableUsageDelegate;

import java.util.*;
import java.util.stream.Collectors;

/** This class represents program context in COBOL. */
public class ProgramNode extends Node {
  private VariableDefinitionDelegate variableDefinitionDelegate;
  private VariableUsageDelegate variableUsageDelegate;
  private String programName;
  private Collection<Variable> definedVariables;

  /**
   * Use for testing.
   *
   * @param locality the node location.
   */
  ProgramNode(Locality locality) {
    super(locality, NodeType.PROGRAM);
  }

  public ProgramNode(
      Locality locality, Map<Token, Locality> positionMapping, MessageService messageService) {
    super(locality, NodeType.PROGRAM);
    variableDefinitionDelegate = new VariableDefinitionDelegate(positionMapping, messageService);
    variableUsageDelegate = new VariableUsageDelegate(positionMapping, messageService);
  }

  public VariableDefinitionDelegate getVariableDefinitionDelegate() {
    return variableDefinitionDelegate;
  }

  public VariableUsageDelegate getVariableUsageDelegate() {
    return variableUsageDelegate;
  }

  public String getProgramName() {
    return programName;
  }

  public void setProgramName(String programName) {
    this.programName = programName;
  }

  @Override
  public List<SyntaxError> getErrors() {
    List<SyntaxError> errors = new ArrayList<>();
    definedVariables = variableDefinitionDelegate.finishDefinitionAnalysis().unwrap(errors::addAll);
    Set<String> variableNames =
        definedVariables.stream().map(Variable::getName).collect(Collectors.toSet());
    List<Variable> availableVariables = new ArrayList<>(definedVariables);
    getGlobalVariables().stream()
        .filter(variable -> !variableNames.contains(variable.getName()))
        .forEach(availableVariables::add);
    Map<Locality, Variable> variableUsages =
        variableUsageDelegate
            .updateUsageAndGenerateErrors(availableVariables)
            .unwrap(errors::addAll);
    errors.addAll(validateStatements(getChildren(), variableUsages));
    return errors;
  }

  public Collection<Variable> getDefinedVariables() {
    return definedVariables;
  }

  private List<Variable> getGlobalVariables() {
    List<Variable> globalVariables =
        definedVariables.stream().filter(Variable::isGlobal).collect(Collectors.toList());
    Set<String> globalVariablesNames =
        globalVariables.stream().map(Variable::getName).collect(Collectors.toSet());
    List<Variable> parentGlobalVariables =
        getNearestParentByType(NodeType.PROGRAM)
            .map(ProgramNode.class::cast)
            .map(ProgramNode::getGlobalVariables)
            .orElseGet(ImmutableList::of);
    parentGlobalVariables.stream()
        .filter(variable -> !globalVariablesNames.contains(variable.getName()))
        .forEach(globalVariables::add);
    return globalVariables;
  }

  private List<SyntaxError> validateStatements(
      List<Node> children, Map<Locality, Variable> variables) {
    List<SyntaxError> result = new ArrayList<>();
    children.stream()
        .filter(it -> it.getNodeType() == NodeType.STATEMENT)
        .map(it -> (StatementNode) it)
        .map(it -> it.validate(variables))
        .forEach(result::addAll);
    children.stream()
        .map(Node::getChildren)
        .map(it -> validateStatements(it, variables))
        .forEach(result::addAll);
    return result;
  }
}
