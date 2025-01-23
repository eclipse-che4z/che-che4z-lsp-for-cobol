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
package org.eclipse.lsp.cobol.core.engine.processors.utils;

import static java.util.stream.Collectors.groupingBy;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.common.model.tree.variable.VariableType.FD;
import static org.eclipse.lsp.cobol.common.model.tree.variable.VariableType.SD;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import java.util.*;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.VariableConstants;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.tree.variables.*;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** The utility class is for converting VariableDefinitionNode into appropriate VariableNode. */
@UtilityClass
@Slf4j
public class SectionNodeProcessorHelper {

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
   * @param sectionNode        the node with VariableDefinitionNodes
   * @param currentProgramNode the nearest ProgramNode
   * @return the list of errors
   */
  public List<SyntaxError> processNodeWithVariableDefinitions(SectionNode sectionNode,
                                                              SymbolAccumulator symbolAccumulator,
                                                              ProgramNode currentProgramNode) {
    return processNodeWithVariableDefinitions((Node) sectionNode, symbolAccumulator, currentProgramNode);
  }

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
   * @param fileDescriptionNode the node with VariableDefinitionNodes
   * @return the list of errors
   */
  public List<SyntaxError> processNodeWithVariableDefinitions(FileDescriptionNode fileDescriptionNode,
                                                              SymbolAccumulator symbolAccumulator,
                                                              ProgramNode currentProgramNode) {
    return processNodeWithVariableDefinitions((Node) fileDescriptionNode, symbolAccumulator, currentProgramNode);
  }

  private List<SyntaxError> processNodeWithVariableDefinitions(Node node, SymbolAccumulator symbolAccumulator,
                                                               ProgramNode currentProgramNode) {
    Deque<VariableDefinitionNode> variableDefinitionNodes = new LinkedList<>(unwrapVariables(node));
    for (VariableDefinitionNode n : variableDefinitionNodes) {
      n.getParent().removeChild(n);
    }
    List<SyntaxError> errors = new ArrayList<>();

    errors.addAll(processDefinition(node, 1, variableDefinitionNodes, symbolAccumulator, currentProgramNode));

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
    List<Node> variables = new ArrayList<>();
    List<CopyNode> copybooks = new LinkedList<>();

    for (Node child : node.getChildren()) {
      if (child.getNodeType() == NodeType.VARIABLE_DEFINITION) {
        variables.add(child);
      }
      if (child.getNodeType() == NodeType.COPY) {
        copybooks.add((CopyNode) child);
      }
    }

    copybooks.sort(Comparator.comparingInt(c -> c.getLocality().getRange().getStart().getLine()));

    int index = 0;
    for (CopyNode copyNode : copybooks) {
      index = insertCopybook(variables, index, copyNode);
    }

    return variables.stream()
        .flatMap(
            n -> {
              if (n.getNodeType() == NodeType.COPY) {
                return n.getDepthFirstStream();
              }
              return ImmutableList.of(n).stream();
            })
        .filter(hasType(NodeType.VARIABLE_DEFINITION))
        .map(VariableDefinitionNode.class::cast)
        .collect(Collectors.toList());
  }

  private static int insertCopybook(List<Node> variables, int index, CopyNode copyNode) {
    if (index > variables.size() - 1) {
      variables.add(copyNode);
      return index;
    }
    for (int i = index; i < variables.size(); i++) {
      index++;
      if (!canInsertCopyNodeAtIndex(copyNode, i, variables)) {
        index = i;
        break;
      }
    }

    // append at last
    if (index >= variables.size()) {
      variables.add(copyNode);
      return variables.indexOf(copyNode);
    }

    variables.add(index, copyNode);
    if (adjustCopyNodeChild(copyNode, variables, index + 1)) {
      return variables.indexOf(copyNode) + 1;
    }
    return index;
  }

  private static boolean adjustCopyNodeChild(CopyNode copyNode, List<Node> variables, int index) {
    boolean areNodesAdjusted = false;
    ArrayList<Node> nodes = new ArrayList<>(variables);
    for (int i = index; i < nodes.size(); i++) {
      Node variable = nodes.get(i);
      String variableNodeUri = variable.getLocality().getUri();
      String copybookNodeUri = copyNode.getUri();
      if (Objects.equals(variableNodeUri, copybookNodeUri)) {
        adjustVariableNodeInsideCopyNode(copyNode, variables, i, variable);
        areNodesAdjusted = true;
      } else {
        break;
      }
    }
    return areNodesAdjusted;
  }

  private static void adjustVariableNodeInsideCopyNode(CopyNode copyNode, List<Node> variables, int i, Node variable) {
      if (variable instanceof VariableDefinitionNode) {
          int insertIndex;
          for (insertIndex = 0; insertIndex < copyNode.getChildren().size(); insertIndex++) {
              Node node = copyNode.getChildren().get(insertIndex);
              if (node instanceof CopyNode) {
                  adjustCopyNodeChild((CopyNode) node, variables, i);
              }
              Locality copybNodeChildLocality = node.getLocality();
              Locality variableLocality = variable.getLocality();
              if (RangeUtils.isBefore(variableLocality.getRange().getStart(), copybNodeChildLocality.getRange().getStart())) {
                  break;
              }
          }
          if (!isVariableNodeAlreadyPresentIn(copyNode, (VariableDefinitionNode) variable)) {
              copyNode.addChildAt(insertIndex, variable);
              variables.remove(variable);
          }
      }
  }

    private static boolean isVariableNodeAlreadyPresentIn(CopyNode copyNode, VariableDefinitionNode variable) {
      for (Node node : copyNode.getChildren()) {
        if (node instanceof VariableDefinitionNode) {
          VariableDefinitionNode varNode = (VariableDefinitionNode) node;
          if (varNode.getLocality().equals(variable.getLocality())
                  && varNode.getVariableName().equals(variable.getVariableName())) {
            return true;
          }
        }
      }
      return false;
    }

    private static boolean canInsertCopyNodeAtIndex(
      CopyNode copyNode, int index, List<Node> variables) {
    String copybookLocalityUri = copyNode.getLocality().getUri();
    Range copybookLocalityRange = copyNode.getLocality().getRange();
    Node variableDefinitionNode = variables.get(index);
    String variableUri = variableDefinitionNode.getLocality().getUri();
    Position variableStartPosition = variableDefinitionNode.getLocality().getRange().getEnd();
    return variableUri.equals(copybookLocalityUri)
        && RangeUtils.isBefore(variableStartPosition, copybookLocalityRange.getStart());
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
          Node rootNode, int level, Deque<VariableDefinitionNode> definitionNodes,
          SymbolAccumulator symbolAccumulator, ProgramNode currentProgramNode) {
    VariableNode lastVariableOnTheLevel = null;
    List<SyntaxError> errors = new ArrayList<>();
    while (!definitionNodes.isEmpty()) {
      VariableDefinitionNode definitionNode = definitionNodes.getFirst();
      int nextLevelNumber = definitionNode.getLevel();
      if ((nextLevelNumber < level || nextLevelNumber == LEVEL_66) && level != LEVEL_01) {
        break;
      }
      if (nextLevelNumber == level || nextLevelNumber == LEVEL_66 || nextLevelNumber == LEVEL_MNEMONIC) {

        definitionNode.setParent(rootNode);

        if (definitionNode.getUsageClauses().isEmpty() && rootNode instanceof UsageClause) {
          definitionNode.setUsageClauses(ImmutableList.of(((UsageClause) rootNode).getUsageFormat()));
        }

        List<VariableNode> variableNodes = createVariableNode(definitionNode, errors);
        if (!variableNodes.isEmpty()) {
          VariableNode variableNode = variableNodes.get(0);
          checkClauses(definitionNode, variableNode, errors);
          ResultWithErrors<VariableNode> convertResult = handleRedefines(new ResultWithErrors<>(variableNode, errors), definitionNode);
          VariableNode variable = convertResult.unwrap(errors::addAll);
          lastVariableOnTheLevel = variable;
          rootNode.addChild(variable);
          // Reassign all children from definition node to converted variable definition node
          definitionNode.getChildren().forEach(variable::addChild);
          variableNodes.forEach(v -> symbolAccumulator.addVariable(currentProgramNode, v));
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
                definitionNodes, symbolAccumulator, currentProgramNode));
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

  private static List<VariableNode> createVariableNode(VariableDefinitionNode definitionNode, List<SyntaxError> errors) {
    switch (definitionNode.getLevel()) {
      case LEVEL_FD_SD: return Collections.singletonList(FileDescriptionNode.fromDefinition(definitionNode));
      case LEVEL_66: return Collections.singletonList(RenameItemNode.fromDefinition(definitionNode, errors));
      case LEVEL_77: return Collections.singletonList(StandAloneDataItemNode.fromDefinition(definitionNode));
      case LEVEL_88: return Collections.singletonList(ConditionDataNameNode.fromDefinition(definitionNode, errors));
      case LEVEL_MNEMONIC: return Collections.singletonList(MnemonicNameNode.fromDefinition(definitionNode));
      case  LEVEL_MAP_NAME: return Collections.singletonList(MapNameNode.fromDefinition(definitionNode));
      default:
        if (definitionNode.getLevel() < LEVEL_01) {
            return Collections.emptyList();
        }
        if (definitionNode.doesntHavePic()) {
          if (definitionNode.hasOccurs() && definitionNode.doesntHaveUsage()) {
            return MultiTableDataNameNode.fromDefinition(definitionNode);
          }
          if (definitionNode.doesntHaveOccurs() && !definitionNode.isBlankWhenZeroPresent()) {
            return Collections.singletonList(GroupItemNode.fromDefinition(definitionNode));
          }
        }
        if (definitionNode.hasPic() || definitionNode.hasUsage()) {
          if (definitionNode.hasOccurs()) {
            return TableDataNameNode.fromDefinition(definitionNode);
          }
          if (definitionNode.doesntHaveOccurs()) {
            return Collections.singletonList(ElementaryItemNode.fromDefinition(definitionNode));
          }
        }
        break;
    }
    return Collections.emptyList();
  }

  private static void checkClauses(VariableDefinitionNode definitionNode, VariableNode result, List<SyntaxError> errors) {
    Stream.of(
      checkClauseIsSingle(result, definitionNode::getPicClauses, "PICTURE"),
      checkClauseIsSingle(result, definitionNode::getOccursClauses, "OCCURS"),
      checkClauseIsSingle(result, definitionNode::getValueClauses, "VALUE"),
      checkClauseIsSingle(result, definitionNode::getRedefinesClauses, "REDEFINES"),
      checkClauseIsSingle(result, definitionNode::getUsageClauses, "USAGE")
      // TODO: check the same way that the other clauses are singular or absent
      ).filter(Objects::nonNull)
            .forEach(errors::add);
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

  private static SyntaxError checkClauseIsSingle(
          VariableNode variableNode, Supplier<List<?>> clausesGetter, String clauseName) {
    if (clausesGetter.get().size() > 1)
      return variableNode.getError(MessageTemplate.of(VariableConstants.TOO_MANY_CLAUSES_MSG, clauseName));
    return null;
  }
}
