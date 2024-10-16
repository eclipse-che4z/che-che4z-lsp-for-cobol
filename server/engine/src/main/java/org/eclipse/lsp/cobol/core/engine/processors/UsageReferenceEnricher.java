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
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Enriches the @{@link QualifiedReferenceNode}'s children by replacing the Variable node
 * with @{@link FunctionReference} node.
 */
@AllArgsConstructor
public class UsageReferenceEnricher implements Processor<QualifiedReferenceNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext processingContext) {
    List<Node> usageNodes =
        node.getChildren().stream()
            .filter(
                Node.hasType(NodeType.VARIABLE_USAGE).or(Node.hasType(NodeType.FUNCTION_REFERENCE)))
            .collect(Collectors.toList());

    if (usageNodes.isEmpty()) {
      return;
    }

    Node dataNameNode = usageNodes.get(0);
    DefinedAndUsedStructure usageNode = (DefinedAndUsedStructure) dataNameNode;
    if (!usageNode.getDefinitions().isEmpty()) {
      return;
    }
    SymbolAccumulatorService.FunctionInfo functionInfo =
        symbolAccumulatorService.getFunctionReference(usageNode.getName());

    if (functionInfo == null) {
      return;
    }

    if (!shouldProcessFunction(functionInfo, dataNameNode)) {
      return;
    }

    if (dataNameNode instanceof VariableUsageNode) {
      node.getProgram()
          .ifPresent(
              programNode -> {
                int indexOfNode = node.getChildren().indexOf(dataNameNode);
                node.getChildren().remove(dataNameNode);
                FunctionReference functionReference =
                    new FunctionReference(dataNameNode.getLocality(), usageNode.getName());
                node.getChildren().add(indexOfNode, functionReference);
                symbolAccumulatorService
                    .registerFunctionReferenceNode(programNode, functionReference)
                    .ifPresent(processingContext.getErrors()::add);
                functionReference.setDefinitions(functionInfo.getDefinition());
              });
    }
  }

  private boolean shouldProcessFunction(
      SymbolAccumulatorService.FunctionInfo functionInfo, Node usageNode) {
    Optional<Node> nearestProgramNode = usageNode.getNearestParentByType(NodeType.PROGRAM);
    if (!nearestProgramNode.isPresent()) return false;
    ProgramNode programNode = (ProgramNode) nearestProgramNode.get();
    if (functionInfo.isDeclared(programNode)) {
      return true;
    }

    if (!(usageNode instanceof FunctionReference)) {
      return false;
    }

    FunctionReference functionReference = (FunctionReference) usageNode;
    return functionReference.isFunctionPrefixed();
  }
}
