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
package org.eclipse.lsp.cobol.core.model.tree.logic;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.FigurativeConstants;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;

import java.util.List;
import java.util.stream.Collectors;

/** QualifiedReferenceNode processor */
@Slf4j
public class QualifiedReferenceUpdateVariableUsage implements Processor<QualifiedReferenceNode> {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String DUPLICATED_DEFINITION_ERROR = "semantics.duplicated";

  private final SymbolService symbolService;

  public QualifiedReferenceUpdateVariableUsage(SymbolService symbolService) {
    this.symbolService = symbolService;
  }

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    updateVariableUsage(node, ctx);
  }

  private void updateVariableUsage(QualifiedReferenceNode node, ProcessingContext ctx) {
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
                programNode -> symbolService.getVariableDefinition(programNode, variableUsageNodes))
            .orElseGet(ImmutableList::of);

    for (VariableNode definitionNode : foundDefinitions) {
      node.setVariableDefinitionNode(definitionNode);
      for (VariableUsageNode usageNode : variableUsageNodes) {
        while (definitionNode != null && !usageNode.getName().equals(definitionNode.getName())) {
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
    if (foundDefinitions.size() > 1) {
      foundDefinitions =
          foundDefinitions.stream()
              .filter(d -> !d.getLocality().getUri().startsWith("implicit:"))
              .collect(Collectors.toList());
    }
    if (foundDefinitions.size() == 1) {
      return;
    }
    String dataName = variableUsageNodes.get(0).getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
        .anyMatch(e -> dataName.toUpperCase().equals(e))) {
      return;
    }

    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.ERROR)
            .locality(node.getLocality())
            .messageTemplate(
                MessageTemplate.of(
                    foundDefinitions.isEmpty() ? NOT_DEFINED_ERROR : DUPLICATED_DEFINITION_ERROR,
                    dataName))
            .build();
    ctx.getErrors().add(error);
    LOG.debug("Syntax error by QualifiedReferenceNode " + error.toString());
  }
}
