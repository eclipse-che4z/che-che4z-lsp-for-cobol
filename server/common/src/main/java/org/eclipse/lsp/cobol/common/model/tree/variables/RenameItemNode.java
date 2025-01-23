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
package org.eclipse.lsp.cobol.common.model.tree.variables;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Iterables;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.utils.VariableUtils;

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.VariableConstants.*;

/**
 * This value class represents a renaming data name entry, that has a level number 66. It may be one
 * a top level, but should trail a variable structure. It is used to regroup element items, e.g.
 * copy elements of the previous structure into this one using RENAME and RENAME THRU/THROUGH
 * operations.
 */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class RenameItemNode extends VariableWithLevelNode {

  @EqualsAndHashCode.Exclude @ToString.Exclude @Getter @Setter private GroupItemNode varGroupParent;

  public RenameItemNode(
      Locality location, String name, boolean redefines, boolean global) {
    super(location, LEVEL_66, name, redefines, VariableType.RENAME_ITEM, global);
  }

  public static RenameItemNode fromDefinition(VariableDefinitionNode definitionNode, List<SyntaxError> errors) {
    GroupItemNode group = getPrecedingStructureForRename(definitionNode);
    boolean global = group != null && group.isGlobal();
    RenameItemNode variable =
            new RenameItemNode(
                    definitionNode.getLocality(),
                    VariableUtils.getName(definitionNode),
                    definitionNode.hasRedefines(),
                    global);
    VariableUtils.createVariableNameNode(variable, definitionNode.getVariableName());
    errors.addAll(processRenamesBoundaries(variable, group, definitionNode));
    if (errors.isEmpty()) {
      variable.setVarGroupParent(group);
    }
    return variable;
  }

  private static List<SyntaxError> processRenamesBoundaries(
          RenameItemNode variable, GroupItemNode group, VariableDefinitionNode definitionNode) {
    if (group == null)
      return ImmutableList.of(variable.getError(MessageTemplate.of(NO_STRUCTURE_BEFORE_RENAME)));
    List<SyntaxError> errors = new ArrayList<>();
    Integer renamesIndex =
            processRenamesClauseAndGetIndex(variable, definitionNode.getRenamesClause(), group)
                    .unwrap(errors::addAll);
    Integer renamesThruIndex =
            processRenamesClauseAndGetIndex(variable, definitionNode.getRenamesThruClause(), group)
                    .unwrap(errors::addAll);
    if (renamesIndex != -1 && renamesThruIndex != -1 && renamesIndex >= renamesThruIndex)
      errors.add(variable.getError(MessageTemplate.of(INCORRECT_CHILDREN_ORDER)));
    return errors;
  }
  private static GroupItemNode getPrecedingStructureForRename(VariableDefinitionNode definitionNode) {
    Deque<Node> siblings = new LinkedList<>(definitionNode.getParent().getChildren());
    while (!siblings.isEmpty()) {
      Node precedingNode = siblings.pollLast();
      if (precedingNode instanceof RenameItemNode) continue;
      if (precedingNode instanceof GroupItemNode) return (GroupItemNode) precedingNode;
      return null;
    }
    return null;
  }

  private static void processRenameClause(
          RenameItemNode variable, VariableNameAndLocality rename, VariableNode allowedQualifier) {
    VariableUsageNode qualifiedVar = new VariableUsageNode(rename.getName(), rename.getLocality());
    variable.addChild(qualifiedVar);
    allowedQualifier.addUsage(qualifiedVar);
  }

  private static ResultWithErrors<Integer> processRenamesClauseAndGetIndex(
          RenameItemNode variable, List<VariableNameAndLocality> renames, GroupItemNode group) {
    List<SyntaxError> errors = new ArrayList<>();
    List<VariableNode> nodesForRenaming =
            group.getChildren().stream()
                    .flatMap(Node::getDepthFirstStream)
                    .filter(hasType(NodeType.VARIABLE))
                    .map(VariableNode.class::cast)
                    .collect(Collectors.toList());
    if (renames == null) return new ResultWithErrors<>(-1, errors);
    String renamesName = renames.get(0).getName();
    int renamesIndex = Iterables.indexOf(nodesForRenaming, it -> renamesName.equals(it.getName()));
    if (renamesIndex != -1) {
      VariableUsageNode variableUsageNode =
              new VariableUsageNode(renamesName, renames.get(0).getLocality());
      variable.addChild(variableUsageNode);
      VariableNode variableDefNode = nodesForRenaming.get(renamesIndex);
      variableDefNode.addUsage(variableUsageNode);
      if (renames.size() > 1) {
        VariableNode allowedQualifier = getAllowedQualifier(group, variableDefNode, renames.get(1));
        if (Objects.nonNull(allowedQualifier)) {
          processRenameClause(variable, renames.get(1), allowedQualifier);
        } else {
          errors.add(
                  variable.getError(
                          MessageTemplate.of(CHILD_TO_RENAME_NOT_FOUND, renames.get(1).getName())));
        }
      }
    } else
      errors =
              ImmutableList.of(
                      variable.getError(MessageTemplate.of(CHILD_TO_RENAME_NOT_FOUND, renamesName)));
    return new ResultWithErrors<>(renamesIndex, errors);
  }

  private static VariableNode getAllowedQualifier(
          GroupItemNode group, VariableNode childVar, VariableNameAndLocality variable) {
    if (group.getName().equals(variable.getName())) return group;
    VariableNode parentNode = childVar;
    while (!parentNode.getName().equals(variable.getName())) {
      parentNode =
              parentNode
                      .getNearestParentByType(NodeType.VARIABLE)
                      .map(VariableNode.class::cast)
                      .orElse(null);
      if (Objects.isNull(parentNode)) break;
    }
    return parentNode;
  }

  @Override
  protected String getVariableDisplayString() {
    return getFormattedSuffix() + ".";
  }

  @Override
  public Optional<Node> getNearestParentByType(NodeType type) {
    if (type == NodeType.VARIABLE)
      return Optional.ofNullable(varGroupParent)
          .flatMap(
              it -> (it.getNodeType() == type) ? Optional.of(it) : it.getNearestParentByType(type));
    else return super.getNearestParentByType(type);
  }
}
