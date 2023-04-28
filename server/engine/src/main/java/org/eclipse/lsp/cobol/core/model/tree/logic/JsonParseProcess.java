/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.model.tree.JsonParseNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.ConditionDataNameNode;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/** Apply all the validation for the JSON Parse statement and return found errors. */
public class JsonParseProcess implements Processor<JsonParseNode> {
  public static final ImmutableList<EffectiveDataType> ALPHANUMERIC_DATA_TYPES =
      ImmutableList.of(EffectiveDataType.STRING, EffectiveDataType.INTEGER);
  private final SymbolAccumulatorService symbolAccumulatorService;

  public JsonParseProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  /**
   * Performs the validation of JSON parse statement.
   *
   * @param jsonParseNode Node to be analysed. {@link JsonParseNode} in this case.
   * @param ctx {@link ProcessingContext}
   */
  @Override
  public void accept(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    semanticAnalysisForIdentifier(jsonParseNode, ctx);
  }

  private void semanticAnalysisForIdentifier(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    List<VariableUsageNode> identifier1Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier1());
    List<VariableNode> identifierFoundDefinitions = getIdentifierDefinitions(jsonParseNode, identifier1Nodes);

    semanticAnalysisForIdentifier1(jsonParseNode, ctx, identifier1Nodes, identifierFoundDefinitions);
    semanticAnalysisForIdentifier2(jsonParseNode, ctx, identifierFoundDefinitions);

    if (Objects.nonNull(jsonParseNode.getIdentifier3()) && !jsonParseNode.getIdentifier3().isEmpty()) {
      semanticAnalysisForIdentifier3(jsonParseNode, ctx);
    }

    if (Objects.nonNull(jsonParseNode.getIdentifier4()) && !jsonParseNode.getIdentifier4().isEmpty()) {
      semanticAnalysisForIdentifier4(jsonParseNode, ctx);
    }

    if (Objects.nonNull(jsonParseNode.getIdentifier5()) && !jsonParseNode.getIdentifier5().isEmpty()) {
      semanticAnalysisForIdentifier5(jsonParseNode, ctx);
    }

    if (Objects.nonNull(jsonParseNode.getIdentifier5()) && !jsonParseNode.getIdentifier5().isEmpty() && !jsonParseNode.getConditionName().isEmpty()) {
      semanticAnalysisForCondition(jsonParseNode, ctx);
    }
  }

  private void semanticAnalysisForCondition(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    List<VariableUsageNode> identifier5Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier5());
    List<VariableNode> foundDefinitionsForIdentifier5 = getIdentifierDefinitions(jsonParseNode, identifier5Nodes);

    List<VariableUsageNode> conditionNames = getIdentifier(jsonParseNode, jsonParseNode.getConditionName());
    List<VariableNode> conditionDefinition = getIdentifierDefinitions(jsonParseNode, conditionNames);

    if (foundDefinitionsForIdentifier5.isEmpty() || conditionDefinition.isEmpty()) return;
    conditionDefinition.forEach(
        condition ->
            getConditionVariableUsage(conditionNames, condition)
                .ifPresent(
                    con -> {
                      if (condition instanceof ConditionDataNameNode) {
                        if (foundDefinitionsForIdentifier5
                            .get(0)
                            .getDepthFirstStream()
                            .noneMatch(node -> node.equals(condition))) {
                          ctx.getErrors()
                              .add(
                                  SyntaxError.syntaxError()
                                      .errorSource(ErrorSource.PARSING)
                                      .severity(ErrorSeverity.ERROR)
                                      .location(con.getLocality().toOriginalLocation())
                                      .messageTemplate(
                                          MessageTemplate.of(
                                              "jsonParseProcess.condition1",
                                              con.getName(),
                                              foundDefinitionsForIdentifier5.get(0).getName()))
                                      .build());
                        }
                      } else {
                        ctx.getErrors()
                            .add(
                                SyntaxError.syntaxError()
                                    .errorSource(ErrorSource.PARSING)
                                    .severity(ErrorSeverity.ERROR)
                                    .location(con.getLocality().toOriginalLocation())
                                    .messageTemplate(
                                        MessageTemplate.of(
                                            "jsonParseProcess.condition2", con.getName()))
                                    .build());
                      }
                    }));
  }

  private Optional<VariableUsageNode> getConditionVariableUsage(
      List<VariableUsageNode> conditionNames, VariableNode condition) {
    return conditionNames.stream()
        .filter(qs -> condition.getName().equalsIgnoreCase(qs.getName()))
        .findFirst();
  }

  private void semanticAnalysisForIdentifier2(
      JsonParseNode jsonParseNode,
      ProcessingContext ctx,
      List<VariableNode> identifier1Definitions) {
    List<VariableUsageNode> identifier2Nodes =
        getIdentifier(jsonParseNode, jsonParseNode.getIdentifier2());
    List<VariableNode> foundDefinitionsForIdentifier2 =
        getIdentifierDefinitions(jsonParseNode, identifier2Nodes);
    if (foundDefinitionsForIdentifier2.isEmpty()) return;
    checkValidDefinition(jsonParseNode, ctx, identifier2Nodes, foundDefinitionsForIdentifier2);
    if (!foundDefinitionsForIdentifier2.isEmpty()
        && !identifier1Definitions.isEmpty()
        && checkForNoOverlapBetweenIdentifier1AndIdentifier2(
            identifier1Definitions.get(0), foundDefinitionsForIdentifier2.get(0))) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "jsonParseProcess.identifier2.overlap",
                          identifier1Definitions.get(0).getName(),
                          identifier2Nodes.get(0).getName()))
                  .build());
    }

    if (!(foundDefinitionsForIdentifier2.get(0) instanceof ElementaryItemNode)) {
      if (foundDefinitionsForIdentifier2.get(0) instanceof GroupItemNode) {
        validateIdentifier2GroupItem(ctx, identifier2Nodes, foundDefinitionsForIdentifier2);
      } else {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonParseProcess.identifier2.wrongClause",
                            identifier2Nodes.get(0).getName()))
                    .build());
      }
    } else {
      ElementaryItemNode foundDefinitionNode =
          (ElementaryItemNode) foundDefinitionsForIdentifier2.get(0);
      if (foundDefinitionNode.isUnBounded()
          || foundDefinitionNode.isDynamicLength()
          || !ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonParseProcess.identifier2", identifier2Nodes.get(0).getName()))
                    .build());
      }
    }
  }

  private void validateIdentifier2GroupItem(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier2Nodes,
      List<VariableNode> foundDefinitionsForIdentifier2) {
    boolean isGroupItemAlphanumeric =
        foundDefinitionsForIdentifier2
            .get(0)
            .getDepthFirstStream()
            .filter(ElementaryItemNode.class::isInstance)
            .map(ElementaryItemNode.class::cast)
            .anyMatch(node -> ALPHANUMERIC_DATA_TYPES.contains(node.getEffectiveDataType()));

    boolean isGroupItemUnbounded =
        foundDefinitionsForIdentifier2
            .get(0)
            .getDepthFirstStream()
            .filter(TableDataNameNode.class::isInstance)
            .map(TableDataNameNode.class::cast)
            .anyMatch(TableDataNameNode::isUnBounded);

    boolean isGroupItemDynamic =
        foundDefinitionsForIdentifier2
            .get(0)
            .getDepthFirstStream()
            .filter(ElementaryItemNode.class::isInstance)
            .map(ElementaryItemNode.class::cast)
            .anyMatch(ElementaryNode::isDynamicLength);
    if (!isGroupItemAlphanumeric || isGroupItemUnbounded || isGroupItemDynamic) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "jsonParseProcess.identifier2.groupItemError",
                          identifier2Nodes.get(0).getName()))
                  .build());
    }
  }

  private boolean checkForNoOverlapBetweenIdentifier1AndIdentifier2(
      VariableNode identifier1Definitions, VariableNode identifier2Definitions) {
    Optional<Node> match1 =
        identifier1Definitions
            .getDepthFirstStream()
            .filter(node -> node.equals(identifier2Definitions))
            .findAny();
    Optional<Node> match2 =
        identifier2Definitions
            .getDepthFirstStream()
            .filter(node -> node.equals(identifier1Definitions))
            .findAny();
    return match1.isPresent() || match2.isPresent();
  }

  private List<VariableUsageNode> getIdentifier(
      JsonParseNode jsonParseNode, VariableNameAndLocality identifier) {
    return jsonParseNode.getChildren().stream()
        .flatMap(Node::getDepthFirstStream)
        .filter(hasType(NodeType.VARIABLE_USAGE))
        .map(VariableUsageNode.class::cast)
        .filter(
            node ->
                node.getName().equalsIgnoreCase(identifier.getName())
                    && node.getLocality().equals(identifier.getLocality()))
        .collect(Collectors.toList());
  }

  private List<VariableUsageNode> getIdentifier(
      JsonParseNode jsonParseNode, List<VariableNameAndLocality> identifiers) {
    return jsonParseNode.getChildren().stream()
        .flatMap(Node::getDepthFirstStream)
        .filter(hasType(NodeType.VARIABLE_USAGE))
        .map(VariableUsageNode.class::cast)
        .filter(
            node ->
                identifiers.stream()
                    .anyMatch(
                        str ->
                            str.getName().equalsIgnoreCase(node.getName())
                                && str.getLocality().equals(node.getLocality())))
        .collect(Collectors.toList());
  }

  private void semanticAnalysisForIdentifier5(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    List<VariableUsageNode> identifier5Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier5());
    identifier5Nodes.forEach(identifier5 -> {
      List<VariableNode> foundDefinitionsForIdentifier5 = getIdentifierDefinitions(jsonParseNode, Collections.singletonList(identifier5));

      if (foundDefinitionsForIdentifier5.isEmpty()) {
        return;
      }

      if (foundDefinitionsForIdentifier5.get(0) instanceof ElementaryItemNode) {
        ElementaryItemNode foundNode = (ElementaryItemNode) foundDefinitionsForIdentifier5.get(0);
        boolean isString = foundNode.getEffectiveDataType() == EffectiveDataType.STRING;
        boolean isSingleByte = foundNode.getPicClause().trim().equalsIgnoreCase("X");
        if (isString && isSingleByte) {
          return;
        }
      }
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(identifier5.getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonParseProcess.identifier5", identifier5.getName()))
                              .build());
    });
  }

  private void semanticAnalysisForIdentifier4(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    List<VariableUsageNode> identifier2Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier2());
    List<VariableNode> foundDefinitionsForIdentifier2 = getIdentifierDefinitions(jsonParseNode, identifier2Nodes);

    List<VariableUsageNode> identifier4Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier4());
    identifier4Nodes.forEach(identifier4 -> {
      List<VariableNode> foundDefinitionsForIdentifier4 = getIdentifierDefinitions(jsonParseNode, Collections.singletonList(identifier4));

      if (foundDefinitionsForIdentifier2.isEmpty() || foundDefinitionsForIdentifier4.isEmpty()) {
        return;
      }

      boolean isIdentifier4SubsetOfIdentifier2 =
              foundDefinitionsForIdentifier2
                      .get(0)
                      .getDepthFirstStream()
                      .anyMatch(node -> node.equals(foundDefinitionsForIdentifier4.get(0)));

      if (!isIdentifier4SubsetOfIdentifier2) {
        ctx.getErrors()
                .add(
                        SyntaxError.syntaxError()
                                .errorSource(ErrorSource.PARSING)
                                .severity(ErrorSeverity.ERROR)
                                .location(identifier4.getLocality().toOriginalLocation())
                                .messageTemplate(
                                        MessageTemplate.of(
                                                "jsonParseProcess.identifier4",
                                                identifier4.getName(),
                                                foundDefinitionsForIdentifier2.get(0).getName()))
                                .build());
      }
    });
  }

  private void semanticAnalysisForIdentifier3(JsonParseNode jsonParseNode, ProcessingContext ctx) {
    List<VariableUsageNode> identifier2Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier2());
    List<VariableNode> foundDefinitionsForIdentifier2 = getIdentifierDefinitions(jsonParseNode, identifier2Nodes);

    List<VariableUsageNode> identifier3Nodes = getIdentifier(jsonParseNode, jsonParseNode.getIdentifier3());
    identifier3Nodes.forEach(identifier3 -> {
      List<VariableNode> foundDefinitionsForIdentifier3 = getIdentifierDefinitions(jsonParseNode, Collections.singletonList(identifier3));

      if (foundDefinitionsForIdentifier3.isEmpty() || foundDefinitionsForIdentifier2.isEmpty())
        return;

      boolean isIdentifier3SubsetOfIdentifier2 =
              foundDefinitionsForIdentifier2
                      .get(0)
                      .getDepthFirstStream()
                      .anyMatch(node -> node.equals(foundDefinitionsForIdentifier3.get(0)));
      if (jsonParseNode.isOmitted()
              && !foundDefinitionsForIdentifier2.get(0).equals(foundDefinitionsForIdentifier3.get(0))) {
        ctx.getErrors()
                .add(
                        SyntaxError.syntaxError()
                                .errorSource(ErrorSource.PARSING)
                                .severity(ErrorSeverity.ERROR)
                                .location(identifier3.getLocality().toOriginalLocation())
                                .messageTemplate(
                                        MessageTemplate.of(
                                                "jsonParseProcess.omittedIdentifier3",
                                                identifier3.getName(),
                                                foundDefinitionsForIdentifier2.get(0).getName()))
                                .build());
        return;
      }
      if (!isIdentifier3SubsetOfIdentifier2) {
        ctx.getErrors()
                .add(
                        SyntaxError.syntaxError()
                                .errorSource(ErrorSource.PARSING)
                                .severity(ErrorSeverity.ERROR)
                                .location(identifier3.getLocality().toOriginalLocation())
                                .messageTemplate(
                                        MessageTemplate.of(
                                                "jsonParseProcess.identifier3",
                                                identifier3.getName(),
                                                foundDefinitionsForIdentifier2.get(0).getName()))
                                .build());
      }
    });
  }

  private void semanticAnalysisForIdentifier1(
      JsonParseNode jsonParseNode,
      ProcessingContext ctx,
      List<VariableUsageNode> identifier1Nodes,
      List<VariableNode> foundDefinitions) {
    checkValidDefinition(jsonParseNode, ctx, identifier1Nodes, foundDefinitions);

    if (foundDefinitions.isEmpty()) return;
    // node must be an elementary OR alphanumeric group item
    if (!(foundDefinitions.get(0) instanceof ElementaryItemNode)) {
      if (foundDefinitions.get(0) instanceof GroupItemNode) {
        verifyIdentifier1GroupItem(foundDefinitions, identifier1Nodes, ctx);
      } else {
        // definition could be only groupItem or elementary item
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier1Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(MessageTemplate.of("jsonParseProcess.identifier.typeError"))
                    .build());
      }
    } else {
      ElementaryItemNode foundDefinitionNode = (ElementaryItemNode) foundDefinitions.get(0);
      if (!ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())
          || foundDefinitionNode.isDynamicLength()
          || foundDefinitionNode.isJustified()) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier1Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonParseProcess.identifier1.elementaryItemError",
                            identifier1Nodes.get(0).getName()))
                    .build());
      }
    }
  }

  private void checkValidDefinition(
      JsonParseNode jsonParseNode,
      ProcessingContext ctx,
      List<VariableUsageNode> nodes,
      List<VariableNode> foundDefinitions) {
    if (foundDefinitions.isEmpty()) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "jsonParseProcess.noDefnIdentifier1", nodes.get(0).getName()))
                  .build());
    }
    if (foundDefinitions.size() > 1) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of("semantics.ambiguous", jsonParseNode.getIdentifier1()))
                  .build());
    }
  }

  private void verifyIdentifier1GroupItem(
      List<VariableNode> foundDefinitions,
      List<VariableUsageNode> identifier1Nodes,
      ProcessingContext ctx) {
    boolean isGroupItemAlphanumeric =
        foundDefinitions
            .get(0)
            .getDepthFirstStream()
            .filter(ElementaryItemNode.class::isInstance)
            .map(ElementaryItemNode.class::cast)
            .anyMatch(node -> ALPHANUMERIC_DATA_TYPES.contains(node.getEffectiveDataType()));

    boolean isGroupItemDynamic =
        foundDefinitions
            .get(0)
            .getDepthFirstStream()
            .filter(ElementaryItemNode.class::isInstance)
            .map(ElementaryItemNode.class::cast)
            .anyMatch(ElementaryNode::isDynamicLength);

    boolean isGroupItemJustified =
        foundDefinitions
            .get(0)
            .getDepthFirstStream()
            .filter(ElementaryItemNode.class::isInstance)
            .map(ElementaryItemNode.class::cast)
            .anyMatch(ElementaryNode::isJustified);

    if (!isGroupItemAlphanumeric || isGroupItemDynamic || isGroupItemJustified) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier1Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of("jsonParseProcess.identifier1.groupItemError"))
                  .build());
    }
  }

  private List<VariableNode> getIdentifierDefinitions(
      JsonParseNode jsonParseNode, List<VariableUsageNode> identifier1Nodes) {
    return jsonParseNode
        .getProgram()
        .map(
            programNode ->
                symbolAccumulatorService.getVariableDefinition(
                    programNode, Collections.singletonList(identifier1Nodes.get(0))))
        .orElseGet(ImmutableList::of);
  }
}
