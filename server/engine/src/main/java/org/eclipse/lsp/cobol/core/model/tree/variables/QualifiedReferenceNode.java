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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.FigurativeConstants;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The class represents usage of qualified variable in COBOL. Under this node will be one or more
 * instances of VariableUsageNode.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Slf4j
public class QualifiedReferenceNode extends Node {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String DUPLICATED_DEFINITION_ERROR = "semantics.duplicated";

  private VariableNode variableDefinitionNode;

  public QualifiedReferenceNode(Locality location) {
    super(location, NodeType.QUALIFIED_REFERENCE_NODE);
    addProcessStep(this::waitForVariableDefinitions);
  }

  public Optional<VariableNode> getVariableDefinitionNode() {
    return Optional.ofNullable(variableDefinitionNode);
  }

  private List<SyntaxError> waitForVariableDefinitions() {
    addProcessStep(this::updateVariableUsages);
    return ImmutableList.of();
  }

  private List<SyntaxError> updateVariableUsages() {
    List<VariableUsageNode> variableUsageNodes = getChildren().stream()
        .filter(hasType(NodeType.VARIABLE_USAGE))
        .map(VariableUsageNode.class::cast)
        .collect(Collectors.toList());
    if (variableUsageNodes.isEmpty()) {
      LOG.warn("Qualified reference node don't have any variable usages. {}", this);
      return ImmutableList.of();
    }
    List<VariableNode> foundDefinitions = getNearestParentByType(NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .map(programNode -> programNode.getVariableDefinition(variableUsageNodes))
        .orElseGet(ImmutableList::of);
    for (VariableNode definitionNode: foundDefinitions) {
      variableDefinitionNode = definitionNode;
      for (VariableUsageNode usageNode : variableUsageNodes) {
        while (definitionNode != null && !usageNode.getName().equals(definitionNode.getName())) {
          definitionNode = definitionNode.getNearestParentByType(NodeType.VARIABLE)
              .map(VariableNode.class::cast)
              .orElse(null);
        }
        if (definitionNode == null) {
          // this is not valid case: if we found definition with all qualifiers we must find definitions here too
          LOG.error("Can't find definitions for all usages");
          break;
        }
        definitionNode.addUsage(usageNode);
      }
    }
    if (foundDefinitions.size() == 1)
      return ImmutableList.of();
    String dataName = variableUsageNodes.get(0).getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
            .anyMatch(e -> dataName.toUpperCase().equals(e))) return ImmutableList.of();
    SyntaxError error = SyntaxError.syntaxError().errorStage(ErrorStage.SYNTAX)
        .severity(ErrorSeverity.ERROR)
        .locality(getLocality())
        .messageTemplate(MessageTemplate.of(
            foundDefinitions.isEmpty() ? NOT_DEFINED_ERROR : DUPLICATED_DEFINITION_ERROR,
            dataName
        ))
        .build();
    LOG.debug("Syntax error by QualifiedReferenceNode " + error.toString());
    return ImmutableList.of(error);
  }
}
