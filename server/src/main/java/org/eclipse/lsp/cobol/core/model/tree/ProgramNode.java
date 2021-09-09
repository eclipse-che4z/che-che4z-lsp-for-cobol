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
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.variables.NodeConverter;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.visitor.VariableUsageDelegate;

import java.util.*;

import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toSet;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.STATEMENT;

/** This class represents program context in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class ProgramNode extends Node {
  private final Collection<Variable> definedVariables = new ArrayList<>();
  private final List<CodeBlockDefinitionNode> codeBlocks = new ArrayList<>();
  @EqualsAndHashCode.Exclude private final NodeConverter nodeConverter = new NodeConverter();
  @EqualsAndHashCode.Exclude private VariableUsageDelegate variableUsageDelegate;
  private String programName;

  /**
   * Use for testing.
   *
   * @param locality the node location.
   */
  ProgramNode(Locality locality) {
    super(locality, PROGRAM);
    addProcessStep(this::waitForVariableDefinition);
  }

  public ProgramNode(Locality locality, MessageService messageService) {
    super(locality, PROGRAM);
    variableUsageDelegate = new VariableUsageDelegate(messageService);
    addProcessStep(this::waitForVariableDefinition);
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

  private List<SyntaxError> waitForVariableDefinition() {
    addProcessStep(this::processVariables);
    return ImmutableList.of();
  }

  private List<SyntaxError> processVariables() {
    List<SyntaxError> errors = new ArrayList<>();
    Set<String> variableNames = definedVariables.stream().map(Variable::getName).collect(toSet());

    List<Variable> availableVariables = new ArrayList<>(definedVariables);
    getGlobalVariables().stream()
        .filter(variable -> !variableNames.contains(variable.getName()))
        .forEach(availableVariables::add);
    Map<Locality, Variable> variableUsages =
        variableUsageDelegate
            .updateUsageAndGenerateErrors(availableVariables)
            .unwrap(errors::addAll);
    errors.addAll(validateStatements(variableUsages));
    return errors;
  }

  /**
   * Add the variable definition to that program context.
   *
   * @param node the variable definition node
   */
  public void addVariableDefinition(VariableNode node) {
    definedVariables.add(nodeConverter.convertVariable(node));
  }

  /**
   * Add a paragraph defined in the program context.
   *
   * @param node - the paragraph node
   * @return syntax error if the code block duplicates
   */
  public Optional<SyntaxError> registerCodeBlock(CodeBlockDefinitionNode node) {
    codeBlocks.add(node);
    // TODO: add uniqueness check for paragraphs
    return Optional.empty();
  }

  /**
   * Add the usage of a code block defined in this program. Returns an optional syntax error if the
   * paragraph is not defined.
   *
   * @param node the usage node to register
   * @return Optional error if the paragraph or section with the given name is not defined
   */
  public Optional<SyntaxError> registerCodeBlockUsage(CodeBlockUsageNode node) {
    final Optional<CodeBlockDefinitionNode> definition =
        codeBlocks.stream().filter(it -> it.getName().equals(node.getName())).findAny();
    definition.ifPresent(it -> it.addUsage(node.getLocality()));
    return definition.isPresent()
        ? Optional.empty()
        : Optional.of(
            SyntaxError.syntaxError()
                .messageTemplate(
                    MessageTemplate.of("semantics.paragraphNotDefined", node.getName()))
                .severity(ErrorSeverity.ERROR)
                .locality(node.getLocality())
                .build());
  }

  private List<Variable> getGlobalVariables() {
    List<Variable> globalVariables =
        definedVariables.stream().filter(Variable::isGlobal).collect(toList());
    Set<String> globalVariablesNames =
        globalVariables.stream().map(Variable::getName).collect(toSet());
    getNearestParentByType(PROGRAM)
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getGlobalVariables)
        .orElseGet(ImmutableList::of)
        .stream()
        .filter(variable -> !globalVariablesNames.contains(variable.getName()))
        .forEach(globalVariables::add);
    return globalVariables;
  }

  private List<SyntaxError> validateStatements(Map<Locality, Variable> variables) {
    return getDepthFirstStream()
        .filter(hasType(STATEMENT))
        .map(StatementNode.class::cast)
        .map(it -> it.validate(variables))
        .flatMap(Collection::stream)
        .collect(toList());
  }
}
