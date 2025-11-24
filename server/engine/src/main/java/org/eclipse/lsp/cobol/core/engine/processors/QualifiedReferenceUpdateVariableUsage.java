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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FigurativeConstants;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.CompilerDirectiveName;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** QualifiedReferenceNode processor */
@Slf4j
public class QualifiedReferenceUpdateVariableUsage implements Processor<QualifiedReferenceNode> {
  private static final String NOT_DEFINED_ERROR = "semantics.notDefined";
  private static final String NOT_DEFINED_IN_STRUCTURE_ERROR = "semantics.notDefinedInStructure";
  private static final String AMBIGUOUS_REFERENCE_ERROR = "semantics.ambiguous";

  private final SymbolAccumulator symbolAccumulator;

  public QualifiedReferenceUpdateVariableUsage(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(QualifiedReferenceNode node, ProcessingContext ctx) {
    List<VariableUsageNode> variableUsageChain = new ArrayList<>();
    for (Node child : node.getChildren()) {
      if (child.getNodeType() == NodeType.VARIABLE_USAGE) {
        variableUsageChain.add((VariableUsageNode) child);
      }
    }

    if (variableUsageChain.isEmpty()) {
      LOG.warn("Qualified reference node don't have any variable usages. {}", node);
      return;
    }

    List<VariableNode> foundDefinitions =
        ctx.getCurrentProgramNode() != null
            ? symbolAccumulator.getVariableDefinition(
                ctx.getCurrentProgramNode(), variableUsageChain)
            : ImmutableList.of();

    if (foundDefinitions.size() > 1 && isQualifyExtendedDirectiveEnabled(ctx)) {
      foundDefinitions =
          updateDefinitionForQualifyExtended(node, foundDefinitions, variableUsageChain);
    }
    for (VariableNode definitionNode : foundDefinitions) {
      node.setVariableDefinitionNode(definitionNode);
      for (VariableUsageNode usageNode : variableUsageChain) {
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
    if (foundDefinitions.size() > 1) {
      foundDefinitions =
          foundDefinitions.stream()
              .filter(d -> !d.getLocality().getUri().startsWith("implicit:"))
              .collect(Collectors.toList());
    }
    if (foundDefinitions.size() == 1) {
      return;
    }
    String dataName = variableUsageChain.get(0).getName();
    if (FigurativeConstants.FIGURATIVE_CONSTANTS.stream()
        .anyMatch(e -> dataName.toUpperCase().equals(e))) {
      return;
    }

    if (!variableUsageChain.get(0).isDefinitionMandatory()) {
      return;
    }

    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.ERROR)
            .location(node.getLocality().toOriginalLocation())
            .messageTemplate(generateMessageTemplate(foundDefinitions, variableUsageChain))
            .build();
    ctx.getErrors().add(error);
    LOG.debug("Syntax error by QualifiedReferenceNode " + error.toString());
  }

  private static MessageTemplate generateMessageTemplate(
      List<VariableNode> foundDefinitions, List<VariableUsageNode> variableUsageChain) {
    String base =
        variableUsageChain.size() == 1 ? NOT_DEFINED_ERROR : NOT_DEFINED_IN_STRUCTURE_ERROR;

    return MessageTemplate.of(
        foundDefinitions.isEmpty() ? base : AMBIGUOUS_REFERENCE_ERROR,
        convertStructureToParams(
            variableUsageChain.stream()
                .map(VariableUsageNode::getName)
                .collect(Collectors.toList())));
  }

  private static Object[] convertStructureToParams(List<String> variableUsageNames) {
    List<Object> params = new ArrayList<>();
    params.add(variableUsageNames.get(0));
    variableUsageNames.remove(0);

    if (!variableUsageNames.isEmpty()) {
      params.add(String.join(" OF ", variableUsageNames));
    }
    return params.toArray();
  }

  private static boolean isQualifyExtendedDirectiveEnabled(ProcessingContext ctx) {
    return ctx.getCompilerDirectiveContext()
        .filterDirectiveList(ImmutableList.of(CompilerDirectiveName.QUALIFY))
        .filter(t -> !t.getValue().isEmpty())
        .map(t -> t.getValue().get(t.getValue().size() - 1).equals("EXTEND"))
        .orElse(false);
  }

  /**
   * If compiler option QUALIFY(EXTEND) is in effect, and if there is only one fully qualified name
   * that matches your combination of qualifiers, that reference will be considered unique, even if
   * the set of qualifiers also matches a partial qualification for a different data item. Fully
   * qualified means every qualifier is specified.
   *
   * <p>Ref: https://www.ibm.com/docs/en/cobol-zos/6.3.0?topic=reference-qualification
   *
   * @param node
   * @param foundDefinitions
   * @param variableUsageChain
   * @return
   */
  private List<VariableNode> updateDefinitionForQualifyExtended(
      QualifiedReferenceNode node,
      List<VariableNode> foundDefinitions,
      List<VariableUsageNode> variableUsageChain) {
    final int parentLevel = variableUsageChain.size() - 1;
    final String topParentName = variableUsageChain.get(parentLevel).getName();
    List<VariableNode> variableDefsWithLevelNode =
        foundDefinitions.stream()
            .filter(VariableWithLevelNode.class::isInstance)
            .map(VariableWithLevelNode.class::cast)
            .collect(Collectors.toList());
    List<VariableNode> resultNodes =
        variableDefsWithLevelNode.stream()
            .map(VariableWithLevelNode.class::cast)
            .filter(v -> matchingExtendedQualification(v, parentLevel, topParentName))
            .collect(Collectors.toList());
    if (resultNodes.size() == 1) {
      node.setVariableDefinitionNode(resultNodes.get(0));
      variableDefsWithLevelNode = resultNodes;
    }
    return variableDefsWithLevelNode;
  }

  private static boolean matchingExtendedQualification(
      VariableWithLevelNode v, int parentLevel, String topParentName) {
    return parentLevel == 0 && v.getLevel() == 1
        || matchesNthVariableParentName(v, parentLevel, topParentName);
  }

  private static boolean matchesNthVariableParentName(
      VariableWithLevelNode v, int depth, String parentName) {
    Node n = v;
    for (int i = 0; i < depth; ++i) {
      Optional<Node> parent = n.getNearestParentByType(NodeType.VARIABLE);
      if (!parent.isPresent()) return false;
      n = parent.get();
    }
    return depth != 0
        && n instanceof VariableWithLevelNode
        && ((VariableWithLevelNode) n).getName().equalsIgnoreCase(parentName);
  }
}
