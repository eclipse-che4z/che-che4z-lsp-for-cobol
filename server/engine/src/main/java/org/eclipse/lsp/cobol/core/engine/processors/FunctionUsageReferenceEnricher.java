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
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Enriches the @{@link QualifiedReferenceNode}'s children by replacing the Variable node
 * with @{@link FunctionReference} node.
 */
@AllArgsConstructor
public class FunctionUsageReferenceEnricher implements Processor<QualifiedReferenceNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext processingContext) {
    Optional<ProgramNode> program = node.getProgram();
    if (!program.isPresent()) return;
    List<VariableUsageNode> usageNodes =
        node.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE_USAGE))
            .map(VariableUsageNode.class::cast)
            .collect(Collectors.toList());

    if (usageNodes.isEmpty()) {
      return;
    }

    VariableUsageNode dataNameNode = usageNodes.get(0);
    if (!isFunctionDeclaredWithName(dataNameNode, program.get())) return;

    if (!dataNameNode.getDefinitions().isEmpty()) {
      return;
    }
    SymbolAccumulatorService.FunctionInfo functionInfo =
        symbolAccumulatorService.getFunctionReference(dataNameNode.getName(), program.get());

    if (functionInfo == null) {
      return;
    }

    program.ifPresent(
        programNode -> {
          int indexOfQualifiedNode = node.getParent().getChildren().indexOf(node);
          node.getChildren().remove(dataNameNode);
          FunctionReference functionReference =
              new FunctionReference(dataNameNode.getLocality(), dataNameNode.getName());
          functionReference.setDefinitions(functionInfo.getDefinition());
          node.getParent().getChildren().add(indexOfQualifiedNode, functionReference);
        });
  }

  private static boolean isFunctionDeclaredWithName(
      VariableUsageNode dataNameNode, ProgramNode program) {
    while (!program.getRepository().containsKey(dataNameNode.getName().toUpperCase(Locale.ROOT))) {
      Optional<ProgramNode> nearestProgram = program.getProgram();
      if (nearestProgram.isPresent()) {
        program = nearestProgram.get();
        continue;
      }
      return false;
    }
    return true;
  }
}
