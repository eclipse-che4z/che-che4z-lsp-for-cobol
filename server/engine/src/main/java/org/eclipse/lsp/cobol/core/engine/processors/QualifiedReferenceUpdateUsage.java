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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.CompilerDirectiveName;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.FigurativeConstants;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/** QualifiedReferenceNode processor */
@Slf4j
public class QualifiedReferenceUpdateUsage implements Processor<QualifiedReferenceNode> {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String AMBIGUOUS_REFERENCE_ERROR = "semantics.ambiguous";

  private final SymbolAccumulatorService symbolAccumulatorService;

  public QualifiedReferenceUpdateUsage(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    updateVariableUsage(node, ctx);
    updateFunctionReference(node, ctx);
    Optional<UsageNode> dataName =
        node.getChildren().stream()
            .filter(
                Node.hasType(NodeType.UNDETERMINED)
                    .or(Node.hasType(NodeType.VARIABLE_USAGE)))
            .filter(UsageNode.class::isInstance)
            .map(UsageNode.class::cast)
            .findFirst();
    dataName
        .filter(
            usageNode ->
                usageNode.getDefinitions().isEmpty()
                        || usageNode.getDefinitions()
                        .stream().filter(d -> !d.getUri().startsWith("implicit:")).count() > 1)
        .filter(UsageNode::isDefinitionMandatory)
        .ifPresent(
            usageNode ->
                ctx.getErrors()
                    .add(
                        SyntaxError.syntaxError()
                            .errorSource(ErrorSource.PARSING)
                            .severity(ErrorSeverity.ERROR)
                            .location(node.getLocality().toOriginalLocation())
                            .messageTemplate(
                                MessageTemplate.of(
                                    usageNode.getDefinitions().isEmpty()
                                        ? NOT_DEFINED_ERROR
                                        : AMBIGUOUS_REFERENCE_ERROR,
                                    usageNode.getName()))
                            .build()));
    if (!ctx.getErrors().isEmpty())
      LOG.debug(
          "Syntax error by QualifiedReferenceNode "
              + ctx.getErrors().get(ctx.getErrors().size() - 1));
  }

  private void updateFunctionReference(QualifiedReferenceNode node, ProcessingContext ctx) {
    List<UsageNode> usageNodes =
        node.getChildren().stream()
            .filter(
                Node.hasType(NodeType.UNDETERMINED).or(Node.hasType(NodeType.FUNCTION_REFERENCE)))
            .map(UsageNode.class::cast)
            .collect(Collectors.toList());

    if (usageNodes.isEmpty()) {
      return;
    }

    UsageNode usageNode = usageNodes.get(0);
    SymbolAccumulatorService.FunctionInfo functionInfo =
        symbolAccumulatorService.getFunctionReference(usageNode.getName());

    if (functionInfo == null) {
      return;
    }

    if (!shouldProcessFunction(functionInfo, usageNode)) {
      return;
    }

    node.getProgram()
        .ifPresent(
            program -> {
              for (UsageNode un : usageNodes) {
                symbolAccumulatorService
                    .registerFunctionReferenceNode(program, un)
                    .ifPresent(ctx.getErrors()::add);
                un.addDefinition(functionInfo);
                un.setNodeType(NodeType.FUNCTION_REFERENCE);
              }
            });
  }

  private boolean shouldProcessFunction(
      SymbolAccumulatorService.FunctionInfo functionInfo, UsageNode usageNode) {
    if (functionInfo.isDeclared()) {
      return true;
    }

    if (!(usageNode instanceof FunctionReference)) {
      return false;
    }

    FunctionReference functionReference = (FunctionReference) usageNode;
    return functionReference.isFunctionPrefixed();
  }

  private void updateVariableUsage(QualifiedReferenceNode node, ProcessingContext ctx) {
    List<UsageNode> variableUsageNodes =
        node.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE_USAGE).or(Node.hasType(NodeType.UNDETERMINED)))
            .map(UsageNode.class::cast)
            .collect(Collectors.toList());
    updateVariableUsageFor(variableUsageNodes, node, ctx);
  }

  private void updateVariableUsageFor(
      List<UsageNode> nodes, QualifiedReferenceNode node, ProcessingContext ctx) {
    if (nodes.isEmpty()) {
      LOG.warn("Qualified reference node don't have any variable usages. {}", node);
      return;
    }
    if (!symbolAccumulatorService.isVariableNameAllowed(nodes.get(0).getName())) {
      return;
    }

    List<VariableNode> foundDefinitions =
        node.getProgram()
            .map(programNode -> symbolAccumulatorService.getVariableDefinition(programNode, nodes))
            .orElseGet(ImmutableList::of);

    if (isQualifyExtendedDirectiveEnabled(ctx) && foundDefinitions.size() > 1) {
      foundDefinitions = updateDefinitionForQualifyExtended(node, foundDefinitions);
    }
    for (VariableNode definitionNode : foundDefinitions) {
      node.setVariableDefinitionNode(definitionNode);
      for (UsageNode usageNode : nodes) {
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
        usageNode.setNodeType(NodeType.VARIABLE_USAGE);
      }
    }

    if (foundDefinitions.size() == 1) {
      return;
    }
    String dataName = nodes.get(0).getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
        .anyMatch(e -> dataName.toUpperCase().equals(e))) {
      nodes.get(0).setNodeType(NodeType.FIGURATIVE_CONSTANT);
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
