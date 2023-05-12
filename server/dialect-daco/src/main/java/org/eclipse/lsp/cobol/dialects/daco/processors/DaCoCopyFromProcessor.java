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
package org.eclipse.lsp.cobol.dialects.daco.processors;

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp.cobol.dialects.daco.nodes.DaCoCopyFromNode;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

/** Handle Copy From node */
public class DaCoCopyFromProcessor implements Processor<DaCoCopyFromNode> {

  @Override
  public void accept(DaCoCopyFromNode copyFromNode, ProcessingContext processingContext) {
    astPostprocessing(processingContext.getVariableAccumulator(), copyFromNode, processingContext.getErrors());
  }

  private void astPostprocessing(VariableAccumulator variableAccumulator, DaCoCopyFromNode node, List<SyntaxError> errors) {

    List<GroupItemNode> protoCandidates =
        node.getNearestParentByType(NodeType.PROGRAM)
            .orElseThrow(RuntimeException::new)
            .getDepthFirstStream()
            .filter(GroupItemNode.class::isInstance)
            .map(GroupItemNode.class::cast)
            .filter(
                vdn ->
                    vdn.getName() != null && Objects.equals(vdn.getName(), node.getPrototypeName()))
            .collect(Collectors.toList());
    if (protoCandidates.size() != 1) {
      errors.add(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.DIALECT)
              .location(node.getLocality().toOriginalLocation())
              .suggestion("Can't find source for " + node.getPrototypeName())
              .severity(ErrorSeverity.ERROR)
              .build());
      return;
    }
    copyFrom(node.getLevel(), protoCandidates.get(0), node.getParent(), node);
    variableAccumulator.registerVariablesInProgram(node.getParent());
  }

  private void copyFrom(
      int baseLevel,
      GroupItemNode srcVariables,
      Node targetVariable,
      DaCoCopyFromNode copyFromNode) {
    List<Node> children =
        srcVariables.getChildren().stream()
            .filter(n -> n.getNodeType() == NodeType.VARIABLE)
            .collect(Collectors.toList());
    int lvlShift = baseLevel - srcVariables.getLevel();
    children.forEach(
        child ->
            cloneVarNode(lvlShift, child, copyFromNode.getNewSuffix())
                .ifPresent(targetVariable::addChild));
  }

  private Optional<Node> cloneVarNode(int lvlShift, Node node, String newSuffix) {
    if (node instanceof GroupItemNode) {
      GroupItemNode groupItemNode = (GroupItemNode) node;
      String newName =
          groupItemNode.getName().substring(0, groupItemNode.getName().length() - 2) + newSuffix;
      GroupItemNode cloneNode =
          new GroupItemNode(
              groupItemNode.getLocality(),
              groupItemNode.getLevel() + lvlShift,
              newName,
              groupItemNode.isGlobal(),
              groupItemNode.isRedefines(),
              groupItemNode.getUsageFormat());
      createVariableDefinitionNameNode(node, newName).ifPresent(cloneNode::addChild);

      groupItemNode
          .getChildren()
          .forEach(c -> cloneVarNode(lvlShift, c, newSuffix).ifPresent(cloneNode::addChild));
      return Optional.of(cloneNode);
    }
    if (node instanceof ElementaryItemNode) {
      ElementaryItemNode elNode = (ElementaryItemNode) node;
      String newName = elNode.getName().substring(0, elNode.getName().length() - 2) + newSuffix;
      ElementaryItemNode cloneNode =
          new ElementaryItemNode(
              node.getLocality(),
              elNode.getLevel() + lvlShift,
              newName,
              elNode.isGlobal(),
              elNode.getPicClause(),
              elNode.getValue(),
              elNode.getUsageFormat(),
              elNode.isRedefines(),
              elNode.isBlankWhenZeroPresent(),
              elNode.isSignClausePresent(),
              elNode.isDynamicLength(),
              elNode.isJustified(),
              elNode.isUnBounded());
      createVariableDefinitionNameNode(node, newName).ifPresent(cloneNode::addChild);
      return Optional.of(cloneNode);
    }
    if (node instanceof MultiTableDataNameNode) {
      MultiTableDataNameNode srcNode = (MultiTableDataNameNode) node;
      String newName = srcNode.getName().substring(0, srcNode.getName().length() - 2) + newSuffix;
      MultiTableDataNameNode cloneNode =
          new MultiTableDataNameNode(
              srcNode.getLocality(),
              srcNode.getLevel(),
              newName,
              srcNode.isRedefines(),
              srcNode.getOccursClause(),
              srcNode.getUsageFormat(),
              srcNode.isGlobal());
      createVariableDefinitionNameNode(node, newName).ifPresent(cloneNode::addChild);
      srcNode
          .getChildren()
          .forEach(c -> cloneVarNode(lvlShift, c, newSuffix).ifPresent(cloneNode::addChild));
      return Optional.of(cloneNode);
    }
    return Optional.empty();
  }

  private Optional<VariableDefinitionNameNode> createVariableDefinitionNameNode(
      Node node, String newName) {
    if (!(node instanceof VariableNode)) {
      return Optional.empty();
    }
    if ("FILLER".equalsIgnoreCase(((VariableNode) node).getName())) {
      return Optional.empty();
    }
    Locality defNameLocality =
        node.getChildren().stream()
            .filter(VariableDefinitionNameNode.class::isInstance)
            .findFirst()
            .orElseThrow(RuntimeException::new)
            .getLocality();
    return Optional.of(new VariableDefinitionNameNode(defNameLocality, newName));
  }
}
