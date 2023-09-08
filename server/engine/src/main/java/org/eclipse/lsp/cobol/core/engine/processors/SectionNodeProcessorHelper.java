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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Iterables;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.OutlineNodeNames;
import org.eclipse.lsp.cobol.common.model.tree.variables.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.common.model.tree.variable.VariableType.FD;
import static org.eclipse.lsp.cobol.common.model.tree.variable.VariableType.SD;

/** The utility class is for converting VariableDefinitionNode into appropriate VariableNode. */
@UtilityClass
@Slf4j
public class SectionNodeProcessorHelper {

  private final List<Function<VariableDefinitionNode, ResultWithErrors<VariableNode>>> matchers =
      ImmutableList.of(
          SectionNodeProcessorHelper::fdMatcher,
          SectionNodeProcessorHelper::renameItemMatcher,
          SectionNodeProcessorHelper::conditionalDataNameMatcher,
          SectionNodeProcessorHelper::mnemonicNameMatcher,
          SectionNodeProcessorHelper::independentDataItemMatcher,
          SectionNodeProcessorHelper::multiTableDataNameMatcher,
          SectionNodeProcessorHelper::groupItemMatcher,
          SectionNodeProcessorHelper::tableDataNameMatcher,
          SectionNodeProcessorHelper::elementItemMatcher,
          SectionNodeProcessorHelper::mapNameMatcher
          // TODO: add check that the following items do not have VALUE:
          // TODO: 1. JUSTIFIED
          // TODO: 2. SYNCHRONIZED
          // TODO: 3. USAGE (not USAGE IN DISPLAY)

          // TODO: add check that value does not exceed PIC length
          );
  private static final Set<Integer> ALLOWED_TOP_LEVELS =
      ImmutableSet.of(LEVEL_01, LEVEL_66, LEVEL_77, LEVEL_88);

  /**
   * Process nodes with {@link VariableDefinitionNode} as a child and convert {@link
   * VariableDefinitionNode} into an appropriate {@link VariableNode}.
   *
   * <p>The method does the following things:
   *
   * <p>- delete all VariableDefinitionNode from the node
   *
   * <p>- convert VariableDefinitionNode into appropriate VariableNode
   *
   * <p>- build correct tree from VariableNodes and attach it to the node
   *
   * <p>- register variable definitions into nearest ProgramNode
   *
   * @param node the node with VariableDefinitionNodes
   * @return the list of errors
   */
  public List<SyntaxError> processNodeWithVariableDefinitions(Node node) {
    Deque<VariableDefinitionNode> variableDefinitionNodes = new LinkedList<>(unwrapVariables(node));
    variableDefinitionNodes.forEach(n -> n.getParent().removeChild(n));
    List<SyntaxError> errors = new ArrayList<>();
    errors.addAll(processDefinition(node, 1, variableDefinitionNodes));
    errors.addAll(checkGlobalUniqueNames(node));
    errors.addAll(checkTopNumbers(node));
    reshapeVariablesLocality(node);
    return errors;
  }

  /**
   * Collects node children variables including copybook nested variables
   *
   * @param node - node for processing
   * @return a list of unwrapped variables
   */
  private List<VariableDefinitionNode> unwrapVariables(Node node) {
    List<VariableDefinitionNode> variables = new ArrayList<>();
    List<CopyNode> copybooks = new LinkedList<>();

    node.getChildren()
        .forEach(
            c -> {
              if (c.getNodeType() == NodeType.VARIABLE_DEFINITION) {
                variables.add((VariableDefinitionNode) c);
              }
              if (c.getNodeType() == NodeType.COPY) {
                copybooks.add((CopyNode) c);
              }
            });

    copybooks.sort(Comparator.comparingInt(c -> c.getLocality().getRange().getStart().getLine()));

    List<CopyNode> allCopybooks =
        copybooks.stream()
            .flatMap(Node::getDepthFirstStream)
            .filter(n -> n.getNodeType() == NodeType.COPY)
            .map(CopyNode.class::cast)
            .collect(Collectors.toList());

    allCopybooks.stream()
        .filter(c -> c.getUri() != null)
        .forEach(
            c ->
                new ArrayList<>(variables)
                    .stream()
                        .filter(Objects::nonNull)
                        .filter(v -> v.getLocality() != null)
                        .filter(v -> v.getLocality().getUri() != null)
                        .filter(v -> v.getLocality().getUri().equals(c.getUri()))
                        .forEach(
                            v -> {
                              variables.remove(v);
                              c.addChild(v);
                            }));

    allCopybooks.forEach(
        copyNode -> {
          int copybookLine = copyNode.getLocality().getRange().getStart().getLine();
          String uri = copyNode.getLocality().getUri();
          AtomicInteger index = new AtomicInteger();
          for (Node variable : variables) {
            int variableLine = variable.getLocality().getRange().getStart().getLine();
            if (variable.getLocality().getUri().equals(uri) && variableLine > copybookLine) {
              break;
            }
            index.incrementAndGet();
          }

          copyNode
              .getDepthFirstStream()
              .filter(hasType(NodeType.COPY))
              .flatMap(Node::getDepthFirstStream)
              .filter(hasType(NodeType.VARIABLE_DEFINITION))
              .map(VariableDefinitionNode.class::cast)
              .forEach(
                  copyNodeVariable -> variables.add(index.getAndIncrement(), copyNodeVariable));
        });
    return variables;
  }

  /**
   * In case of group variable the definition's locality contains only one line, but must contain
   * all children.
   *
   * @param node the node with Variable definitions
   */
  private void reshapeVariablesLocality(Node node) {
    List<Node> children = node.getChildren();
    if (children.isEmpty()) {
      return;
    }
    children.forEach(SectionNodeProcessorHelper::reshapeVariablesLocality);
    if (node.getNodeType() == NodeType.VARIABLE) {
      VariableNode variableNode = (VariableNode) node;
      if (isGroupedVariable(variableNode)) {
        List<Node> sameFileChildren =
            children.stream()
                .filter(c -> c.getLocality().getUri().equals(variableNode.getLocality().getUri()))
                .collect(Collectors.toList());
        if (!sameFileChildren.isEmpty()) {
          variableNode.extendLocality(
              sameFileChildren.get(sameFileChildren.size() - 1).getLocality().getRange().getEnd());
        }
      }
    }
  }

  private boolean isGroupedVariable(VariableNode variableNode) {
    return !ImmutableList.of(FD, SD).contains(variableNode.getVariableType());
  }

  private List<SyntaxError> processDefinition(
      Node rootNode, int level, Deque<VariableDefinitionNode> definitionNodes) {
    VariableNode lastVariableOnTheLevel = null;
    List<SyntaxError> errors = new ArrayList<>();
    while (!definitionNodes.isEmpty()) {
      VariableDefinitionNode definitionNode = definitionNodes.getFirst();
      int nextLevelNumber = definitionNode.getLevel();
      if ((nextLevelNumber < level || nextLevelNumber == LEVEL_66) && level != LEVEL_01) break;
      if (nextLevelNumber == level
          || nextLevelNumber == LEVEL_66
          || nextLevelNumber == LEVEL_MNEMONIC) {
        definitionNode.setParent(rootNode);
        if (definitionNode.getUsageClauses().isEmpty() && rootNode instanceof UsageClause)
          definitionNode.setUsageClauses(
              ImmutableList.of(((UsageClause) rootNode).getUsageFormat()));
        Optional<ResultWithErrors<VariableNode>> convertResult = convert(definitionNode);
        if (convertResult.isPresent()) {
          VariableNode variable = convertResult.get().unwrap(errors::addAll);
          lastVariableOnTheLevel = variable;
          rootNode.addChild(variable);
          // Reassign all children from definition node to converted variable definition node
          definitionNode.getChildren().forEach(variable::addChild);
        } else {
          SyntaxError error =
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ERROR)
                  .location(definitionNode.getLocality().toOriginalLocation())
                  .messageTemplate(MessageTemplate.of(UNKNOWN_VARIABLE_DEFINITION))
                  .build();
          errors.add(error);
          LOG.debug("Syntax error by VariableDefinitionUtil " + error.toString());
        }
        definitionNodes.removeFirst();
      } else {
        errors.addAll(
            processDefinition(
                getParentForNextLevel(rootNode, lastVariableOnTheLevel, definitionNode),
                definitionNode.getLevel(),
                definitionNodes));
      }
    }
    return errors;
  }

  private boolean isRootLevel(int level) {
    return ImmutableSet.of(LEVEL_66, LEVEL_77, LEVEL_01).contains(level);
  }

  private static Node getParentForNextLevel(
      Node rootNode, VariableNode lastVariableOnTheLevel, VariableDefinitionNode definitionNode) {
    if (lastVariableOnTheLevel == null) {
      return rootNode;
    }
    if (definitionNode.getLevel() == LEVEL_88) {
      return lastVariableOnTheLevel;
    }
    if (isRootLevel(definitionNode.getLevel())) {
      return definitionNode.getNearestParent(n -> !n.getNodeType().equals(NodeType.VARIABLE_DEFINITION)).get();
    }
    if (lastVariableOnTheLevel.getVariableType() == VariableType.GROUP_ITEM) {
      return lastVariableOnTheLevel;
    }
    if (lastVariableOnTheLevel.getVariableType() == VariableType.MULTI_TABLE_DATA_NAME) {
      return lastVariableOnTheLevel;
    }
    return rootNode;
  }

  private Optional<ResultWithErrors<VariableNode>> convert(VariableDefinitionNode definitionNode) {
    return matchers.stream()
        .map(matcher -> matcher.apply(definitionNode))
        .filter(Objects::nonNull)
        .map(result -> handleGeneralErrors(result, definitionNode))
        .map(result -> handleRedefines(result, definitionNode))
        .findFirst();
  }

  private ResultWithErrors<VariableNode> handleGeneralErrors(
      ResultWithErrors<VariableNode> result, VariableDefinitionNode definitionNode) {
    List<SyntaxError> errors = new ArrayList<>(result.getErrors());
    VariableNode variableNode = result.getResult();
    errors.addAll(definitionNode.getErrors(variableNode));
    return new ResultWithErrors<>(variableNode, errors);
  }

  private ResultWithErrors<VariableNode> renameItemMatcher(VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() != LEVEL_66) return null;
    GroupItemNode group = getPrecedingStructureForRename(definitionNode);
    boolean global = group != null && group.isGlobal();
    RenameItemNode variable =
        new RenameItemNode(
            definitionNode.getLocality(),
            getName(definitionNode),
            definitionNode.hasRedefines(),
            global);
    createVariableNameNode(variable, definitionNode.getVariableName());
    List<SyntaxError> errors = processRenamesBoundaries(variable, group, definitionNode);
    if (errors.isEmpty()) variable.setVarGroupParent(group);
    return new ResultWithErrors<>(variable, errors);
  }

  private ResultWithErrors<VariableNode> fdMatcher(VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() == LEVEL_FD_SD) {
      FileDescriptionNode variable =
          new FileDescriptionNode(
              definitionNode.getLocality(),
              getName(definitionNode),
              definitionNode.isSortDescription() ? SD : FD,
              definitionNode.isGlobal(),
              definitionNode.isExternal(),
              definitionNode.getFileDescriptor(),
              definitionNode.getFileControlClause());
      createVariableNameNode(variable, definitionNode.getVariableName());
      return new ResultWithErrors<>(variable, Collections.emptyList());
    }
    return null;
  }

  private ResultWithErrors<VariableNode> conditionalDataNameMatcher(
      VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() != LEVEL_88) return null;
    String variableName = getName(definitionNode);
    ConditionDataNameNode variable =
        new ConditionDataNameNode(
            definitionNode.getLocality(),
            variableName,
            definitionNode.hasRedefines(),
            definitionNode.getValueIntervals(),
            definitionNode.getValueToken());
    createVariableNameNode(variable, definitionNode.getVariableName());
    VariableWithLevelNode precedingVariable = getVariableForConditional(definitionNode);
    List<SyntaxError> errors = ImmutableList.of();
    if (precedingVariable == null || precedingVariable.getLevel() == LEVEL_66)
      errors =
          ImmutableList.of(
              variable.getError(MessageTemplate.of(PREVIOUS_WITHOUT_PIC_FOR_88, variableName)));
    return new ResultWithErrors<>(variable, errors);
  }

  private ResultWithErrors<VariableNode> mnemonicNameMatcher(
      VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() == LEVEL_MNEMONIC) {
      MnemonicNameNode variable =
          new MnemonicNameNode(
              definitionNode.getLocality(),
              definitionNode.getSystemName(),
              getName(definitionNode));
      createVariableNameNode(variable, definitionNode.getVariableName());
      return new ResultWithErrors<>(variable, ImmutableList.of());
    }
    return null;
  }

  private ResultWithErrors<VariableNode> mapNameMatcher(VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() == LEVEL_MAP_NAME) {
      MapNameNode variable = new MapNameNode(definitionNode.getLocality(), getName(definitionNode));
      createVariableNameNode(variable, definitionNode.getVariableName());
      return new ResultWithErrors<>(variable, ImmutableList.of());
    }
    return null;
  }

  private ResultWithErrors<VariableNode> independentDataItemMatcher(
      VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() != LEVEL_77) return null;
    StandAloneDataItemNode variable =
        new StandAloneDataItemNode(
            definitionNode.getLocality(),
            getName(definitionNode),
            definitionNode.isGlobal(),
            definitionNode.getPic(),
            definitionNode.getValue(),
            definitionNode.hasRedefines(),
            definitionNode.getUsage(),
            definitionNode.isBlankWhenZeroPresent(),
            definitionNode.isSignClausePresent(),
            definitionNode.isDynamicLength(),
            definitionNode.isJustified(),
            definitionNode.isUnBounded());

    createVariableNameNode(variable, definitionNode.getVariableName());
    return new ResultWithErrors<>(variable, ImmutableList.of());
  }

  private ResultWithErrors<VariableNode> multiTableDataNameMatcher(
      VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() >= LEVEL_01
        && definitionNode.doesntHavePic()
        && definitionNode.hasOccurs()
        && definitionNode.doesntHaveUsage()) {
      MultiTableDataNameNode variable =
          new MultiTableDataNameNode(
              definitionNode.getLocality(),
              definitionNode.getLevel(),
              getName(definitionNode),
              definitionNode.hasRedefines(),
              definitionNode.getOccursClauses().get(0),
              definitionNode.getUsage(),
              definitionNode.isGlobal());
      createVariableNameNode(variable, definitionNode.getVariableName());
      for (VariableNameAndLocality nameAndLocality : definitionNode.getOccursIndexes())
        variable.addChild(
            new IndexItemNode(
                nameAndLocality.getLocality(), nameAndLocality.getName(), variable.isGlobal()));
      return new ResultWithErrors<>(variable, ImmutableList.of());
    }
    return null;
  }

  // TODO:
  // 1. Group Item can have usage clause.
  // 2. Group Item can't have following:
  //    2.a- BLANK WHEN ZERO/ DYNAMIC LENGTH/ JUSTIFIED/ OCCURS/ PICTURE/ SYNCHRONIZED
  private ResultWithErrors<VariableNode> groupItemMatcher(VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() >= LEVEL_01
        && definitionNode.doesntHavePic()
        && definitionNode.doesntHaveOccurs()
        && !definitionNode.isBlankWhenZeroPresent()) {
      GroupItemNode variable =
          new GroupItemNode(
              definitionNode.getLocality(),
              definitionNode.getLevel(),
              getName(definitionNode),
              definitionNode.isGlobal(),
              definitionNode.hasRedefines(),
              definitionNode.getUsage());
      createVariableNameNode(variable, definitionNode.getVariableName());
      return new ResultWithErrors<>(variable, ImmutableList.of());
    }
    return null;
  }

  private ResultWithErrors<VariableNode> tableDataNameMatcher(
      VariableDefinitionNode definitionNode) {
    if (definitionNode.getLevel() >= LEVEL_01
        && (definitionNode.hasPic() || definitionNode.hasUsage())
        && definitionNode.hasOccurs()) {
      TableDataNameNode variable =
          new TableDataNameNode(
              definitionNode.getLocality(),
              definitionNode.getLevel(),
              getName(definitionNode),
              definitionNode.hasRedefines(),
              definitionNode.isGlobal(),
              definitionNode.getPic(),
              definitionNode.getValue(),
              definitionNode.getOccursNumber(),
              definitionNode.getUsage(),
              definitionNode.isBlankWhenZeroPresent(),
              definitionNode.isSignClausePresent(),
              definitionNode.isDynamicLength(),
              definitionNode.isJustified(),
              definitionNode.isUnBounded());
      createVariableNameNode(variable, definitionNode.getVariableName());
      for (VariableNameAndLocality nameAndLocality : definitionNode.getOccursIndexes())
        variable.addChild(
            new IndexItemNode(
                nameAndLocality.getLocality(), nameAndLocality.getName(), variable.isGlobal()));
      return new ResultWithErrors<>(variable, ImmutableList.of());
    }
    return null;
  }

  private ResultWithErrors<VariableNode> elementItemMatcher(VariableDefinitionNode definitionNode) {
    List<SyntaxError> errors = new ArrayList<>();
    if (definitionNode.getLevel() >= LEVEL_01
        && (definitionNode.hasPic() || definitionNode.hasUsage())
        && definitionNode.doesntHaveOccurs()) {
      ElementaryItemNode variable =
          new ElementaryItemNode(
              definitionNode.getLocality(),
              definitionNode.getLevel(),
              getName(definitionNode),
              definitionNode.isGlobal(),
              definitionNode.getPic(),
              definitionNode.getValue(),
              definitionNode.getUsage(),
              definitionNode.hasRedefines(),
              definitionNode.isBlankWhenZeroPresent(),
              definitionNode.isSignClausePresent(),
              definitionNode.isDynamicLength(),
              definitionNode.isJustified(),
              definitionNode.isUnBounded());
      createVariableNameNode(variable, definitionNode.getVariableName());
      return new ResultWithErrors<>(variable, errors);
    }
    return null;
  }

  private String getName(VariableDefinitionNode definitionNode) {
    return Optional.ofNullable(definitionNode.getVariableName())
        .map(VariableNameAndLocality::getName)
        .orElse(OutlineNodeNames.FILLER_NAME);
  }

  private void createVariableNameNode(Node parent, VariableNameAndLocality nameAndLocality) {
    if (nameAndLocality == null
        || nameAndLocality.getName() == null
        || nameAndLocality.getLocality() == null) return;
    Node varName =
        new VariableDefinitionNameNode(nameAndLocality.getLocality(), nameAndLocality.getName());
    parent.addChild(varName);
  }

  private List<SyntaxError> checkGlobalUniqueNames(Node node) {
    return node.getChildren().stream()
        .filter(VariableWithLevelNode.class::isInstance)
        .map(VariableWithLevelNode.class::cast)
        .filter(VariableWithLevelNode::isSpecifiedGlobal)
        .collect(groupingBy(VariableNode::getName))
        .values()
        .stream()
        .filter(list -> list.size() > 1)
        .flatMap(List::stream)
        .map(variable -> variable.getError(MessageTemplate.of(GLOBAL_TOO_MANY_DEFINITIONS)))
        .collect(Collectors.toList());
  }

  private List<SyntaxError> checkTopNumbers(Node node) {
    return node.getChildren().stream()
        .filter(VariableWithLevelNode.class::isInstance)
        .map(VariableWithLevelNode.class::cast)
        .filter(it -> !ALLOWED_TOP_LEVELS.contains(it.getLevel()))
        .map(
            variable ->
                variable.getError(
                    MessageTemplate.of(NUMBER_NOT_ALLOWED_AT_TOP, variable.getName())))
        .collect(Collectors.toList());
  }

  private GroupItemNode getPrecedingStructureForRename(VariableDefinitionNode definitionNode) {
    Deque<Node> siblings = new LinkedList<>(definitionNode.getParent().getChildren());
    while (!siblings.isEmpty()) {
      Node precedingNode = siblings.pollLast();
      if (precedingNode instanceof RenameItemNode) continue;
      if (precedingNode instanceof GroupItemNode) return (GroupItemNode) precedingNode;
      return null;
    }
    return null;
  }

  private List<SyntaxError> processRenamesBoundaries(
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

  private ResultWithErrors<Integer> processRenamesClauseAndGetIndex(
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

  private void processRenameClause(
      RenameItemNode variable, VariableNameAndLocality rename, VariableNode allowedQualifier) {
    VariableUsageNode qualifiedVar = new VariableUsageNode(rename.getName(), rename.getLocality());
    variable.addChild(qualifiedVar);
    allowedQualifier.addUsage(qualifiedVar);
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

  private VariableWithLevelNode getVariableForConditional(VariableDefinitionNode definitionNode) {
    Node parent = definitionNode.getParent();
    if (parent instanceof VariableWithLevelNode) return (VariableWithLevelNode) parent;
    return null;
  }

  // TODO: 66 and 88 cannot be redefined
  private ResultWithErrors<VariableNode> handleRedefines(
      ResultWithErrors<VariableNode> result, VariableDefinitionNode definitionNode) {
    if (definitionNode.doesntHaveRedefines()) return result;
    VariableNode variableNode = result.getResult();
    List<SyntaxError> errors = new ArrayList<>(result.getErrors());
    VariableNameAndLocality redefinesNameAndLocality = definitionNode.getRedefines();
    String redefinesName = redefinesNameAndLocality.getName();
    Locality redefinesLocality = redefinesNameAndLocality.getLocality();
    VariableUsageNode redefineUsage = new VariableUsageNode(redefinesName, redefinesLocality);
    variableNode.addChild(redefineUsage);
    List<VariableWithLevelNode> eligibleNodesForRedefine =
        getEligibleNodesForRedefine(definitionNode);
    Optional<VariableWithLevelNode> allowedRedefinedNode =
        eligibleNodesForRedefine.stream()
            .filter(node -> node.getName().equals(redefinesName))
            .findFirst();
    if (eligibleNodesForRedefine.isEmpty() || !allowedRedefinedNode.isPresent()) {
      errors.add(
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.PARSING)
              .severity(ERROR)
              .messageTemplate(MessageTemplate.of(REDEFINE_IMMEDIATELY_FOLLOW, redefinesName))
              .location(redefinesLocality.toOriginalLocation())
              .build());
    } else {
      allowedRedefinedNode.get().addUsage(redefineUsage);
      if (checkLevel77Mismatch(definitionNode, allowedRedefinedNode.get())) {
        errors.add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ERROR)
                .messageTemplate(MessageTemplate.of(LEVELS_MUST_MATCH, redefinesName))
                .location(definitionNode.getLevelLocality().toOriginalLocation())
                .build());
      }
    }
    if (definitionNode.hasValue()) {
      Locality valueLocality = definitionNode.getValueLocality();
      if (valueLocality != null)
        errors.add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .location(valueLocality.toOriginalLocation())
                .severity(ERROR)
                .messageTemplate(
                    MessageTemplate.of(REDEFINED_CONTAIN_VALUE, variableNode.getName()))
                .build());
    }
    return new ResultWithErrors<>(variableNode, errors);
  }

  private boolean checkLevel77Mismatch(
      VariableDefinitionNode definitionNode, VariableWithLevelNode allowedRedefinedNode) {
    return allowedRedefinedNode.getLevel() != definitionNode.getLevel()
        && (allowedRedefinedNode.getLevel() == LEVEL_77 || definitionNode.getLevel() == LEVEL_77);
  }

  private static List<VariableWithLevelNode> getEligibleNodesForRedefine(
      VariableDefinitionNode definitionNode) {
    Deque<Node> siblings = new LinkedList<>(definitionNode.getParent().getChildren());
    List<VariableWithLevelNode> eligibleNodesForRedefine = new ArrayList<>();
    LinkedList<VariableWithLevelNode> availableNodes =
        siblings.stream()
            .filter(node -> node instanceof VariableWithLevelNode)
            .map(VariableWithLevelNode.class::cast)
            .filter(
                node ->
                    !node.getVariableType().equals(VariableType.CONDITION_DATA_NAME)
                        && !node.getVariableType().equals(VariableType.RENAME_ITEM))
            .collect(Collectors.toCollection(LinkedList::new));
    if (availableNodes.isEmpty()) return eligibleNodesForRedefine;
    VariableWithLevelNode variable;
    do {
      variable = availableNodes.pollLast();
      eligibleNodesForRedefine.add(variable);
    } while (Objects.requireNonNull(variable).isRedefines());
    return eligibleNodesForRedefine;
  }
}
