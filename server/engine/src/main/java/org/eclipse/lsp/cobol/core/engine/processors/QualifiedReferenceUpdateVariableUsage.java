/*
 * Copyright (c) 2022 Broadcom.
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

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.CompilerDirectiveName;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.stream.Collectors;

/** QualifiedReferenceNode processor */
@Slf4j
public class QualifiedReferenceUpdateVariableUsage implements Processor<QualifiedReferenceNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public QualifiedReferenceUpdateVariableUsage(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    List<VariableUsageNode> variableUsageNodes =
        node.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE_USAGE))
            .map(VariableUsageNode.class::cast)
            .collect(Collectors.toList());

    if (variableUsageNodes.isEmpty()) {
      LOG.warn("Qualified reference node don't have any variable usages. {}", node);
      return;
    }

    List<VariableNode> foundDefinitions =
        node.getProgram()
            .map(
                programNode ->
                    symbolAccumulatorService.getVariableDefinition(programNode, variableUsageNodes))
            .orElseGet(ImmutableList::of);

    if (isQualifyExtendedDirectiveEnabled(ctx) && foundDefinitions.size() > 1) {
      foundDefinitions = updateDefinitionForQualifyExtended(node, foundDefinitions);
    }
    for (VariableNode definitionNode : foundDefinitions) {
      node.setVariableDefinitionNode(definitionNode);
      for (VariableUsageNode usageNode : variableUsageNodes) {
        while (definitionNode != null
            && !usageNode.getName().equalsIgnoreCase(definitionNode.getName())) {
          definitionNode =
              definitionNode
                  .getNearestParentByType(NodeType.VARIABLE)
                  .map(VariableNode.class::cast)
                  .orElse(null);
        }
        if (definitionNode == null) {
          // this is not valid case: if we found definition with all qualifiers we must find
          // definitions here too
          LOG.error("Can't find definitions for all usages");
          break;
        }
        definitionNode.addUsage(usageNode);
      }
    }
  }

  private static boolean isQualifyExtendedDirectiveEnabled(ProcessingContext ctx) {
    return ctx.getCompilerDirectiveContext()
        .filterDirectiveList(ImmutableList.of(CompilerDirectiveName.QUALIFY))
        .filter(t -> !t.getValue().isEmpty())
        .map(t -> t.getValue().get(t.getValue().size() - 1).equals("EXTEND"))
        .orElse(false);
  }

  private List<VariableNode> updateDefinitionForQualifyExtended(
      QualifiedReferenceNode node, List<VariableNode> foundDefinitions) {
    List<VariableNode> definitionWithLevel01 =
        foundDefinitions.stream()
            .filter(VariableWithLevelNode.class::isInstance)
            .map(VariableWithLevelNode.class::cast)
            .filter(n -> n.getLevel() == 1)
            .collect(Collectors.toList());
    if (definitionWithLevel01.size() == 1) {
      foundDefinitions = definitionWithLevel01;
      node.setVariableDefinitionNode(definitionWithLevel01.get(0));
    }
    return foundDefinitions;
  }
}
