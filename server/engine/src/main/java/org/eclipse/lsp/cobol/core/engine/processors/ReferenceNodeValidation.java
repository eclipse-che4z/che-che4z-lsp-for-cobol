/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processors;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FigurativeConstants;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/** Add semantics error for usages which doesn't have a proper definition */
@Slf4j
@AllArgsConstructor
public class ReferenceNodeValidation implements Processor<QualifiedReferenceNode> {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String AMBIGUOUS_REFERENCE_ERROR = "semantics.ambiguous";

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext processingContext) {
    updateErrorForVariableUsageNode(node, processingContext);
    updateErrorForFunctionReferences(node, processingContext);
  }

  private <T extends DefinedAndUsedStructure> List<T> getNodesWithIssue(
      QualifiedReferenceNode node, Predicate<Node> nodeFilterPredicate, Class<T> nodeTypeClass) {
    return node.getChildren().stream()
        .filter(nodeFilterPredicate)
        .map(nodeTypeClass::cast)
        .filter(n -> n.getDefinitions() == null || n.getDefinitions().size() != 1)
        .collect(Collectors.toList());
  }

  private void updateErrorForVariableUsageNode(
      QualifiedReferenceNode node, ProcessingContext processingContext) {
    List<VariableUsageNode> variableUsageNodes =
        node.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE_USAGE))
            .map(VariableUsageNode.class::cast)
            .collect(Collectors.toList());
    if (variableUsageNodes.isEmpty()) return;
    VariableUsageNode variableUsageNode = variableUsageNodes.get(0);
    List<Location> definitions = variableUsageNode.getDefinitions();
    if (definitions.size() > 1) {
      definitions =
          definitions.stream()
              .filter(d -> !d.getUri().startsWith("implicit:"))
              .collect(Collectors.toList());
    }
    if (definitions.size() == 1) {
      return;
    }
    String dataName = variableUsageNode.getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
        .anyMatch(e -> dataName.toUpperCase().equals(e))) {
      return;
    }

    if (!variableUsageNode.isDefinitionMandatory()) {
      return;
    }
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.ERROR)
            .location(node.getLocality().toOriginalLocation())
            .messageTemplate(
                MessageTemplate.of(
                    definitions.isEmpty() ? NOT_DEFINED_ERROR : AMBIGUOUS_REFERENCE_ERROR,
                    dataName))
            .build();
    processingContext.getErrors().add(error);
    LOG.debug("Syntax error by QualifiedReferenceNode " + error.toString());
  }

  private void updateErrorForFunctionReferences(
      QualifiedReferenceNode node, ProcessingContext processingContext) {
    List<FunctionReference> functionReferencesWithIssues =
        getNodesWithIssue(node, Node.hasType(NodeType.FUNCTION_REFERENCE), FunctionReference.class);
    for (FunctionReference functionReference : functionReferencesWithIssues) {
      processingContext
          .getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(functionReference.getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          functionReference.getDefinitions().isEmpty()
                              ? NOT_DEFINED_ERROR
                              : AMBIGUOUS_REFERENCE_ERROR,
                          functionReference.getName()))
                  .build());
    }
  }
}
