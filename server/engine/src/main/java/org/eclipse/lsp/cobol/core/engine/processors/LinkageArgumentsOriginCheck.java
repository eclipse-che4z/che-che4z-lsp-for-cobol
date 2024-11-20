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

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/**
 * Check semantics of variables used under {@link
 * org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionUsingNode} and {@link
 * org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionReturningNode}
 */
public class LinkageArgumentsOriginCheck implements Processor<Node> {

  @Override
  public void accept(Node node, ProcessingContext processingContext) {
    if (isProcedureNode(node)) {
      processFunctionReferences(node, processingContext);
      processVariableUsages(node, processingContext);
    }
  }

  private void processVariableUsages(Node node, ProcessingContext processingContext) {
    node.getDepthFirstStream()
        .filter(child -> child.getNodeType() == NodeType.VARIABLE_USAGE)
        .map(VariableUsageNode.class::cast)
        .filter(this::isNotDefinedUnderLinkageSection)
        .forEach(
            n ->
                addError(
                    processingContext,
                    n,
                    "procedureDivisionHeaderProcess.wrongNodeLocation",
                    n.getName()));
  }

  private boolean isNotDefinedUnderLinkageSection(VariableUsageNode variableUsageNode) {
    return variableUsageNode
        .getDefinition()
        .flatMap(variableNode -> variableNode.getNearestParentByType(NodeType.SECTION))
        .map(SectionNode.class::cast)
        .filter(sectionNode -> sectionNode.getSectionType() != SectionType.LINKAGE)
        .isPresent();
  }

  private boolean isProcedureNode(Node node) {
    return node.getNodeType() == NodeType.PROCEDURE_RETURNING
        || node.getNodeType() == NodeType.PROCEDURE_USING;
  }

  private void processFunctionReferences(Node node, ProcessingContext processingContext) {
    node.getChildren().stream()
        .filter(n -> n.getNodeType() == NodeType.FUNCTION_REFERENCE)
        .map(FunctionReference.class::cast)
        .forEach(
            n ->
                addError(
                    processingContext,
                    n,
                    "procedureDivisionHeaderProcess.wrongDataName",
                    n.getName()));
  }

  private void addError(
      ProcessingContext processingContext, Node node, String message, Object... args) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .messageTemplate(MessageTemplate.of(message, args))
                .severity(ErrorSeverity.ERROR)
                .location(node.getLocality().toOriginalLocation())
                .build());
  }
}
