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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;
import org.eclipse.lsp.cobol.common.model.tree.JsonGenerateNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.ConditionDataNameNode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.groupingBy;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;

/** Apply all the validation for the JSON Generate statement and return found errors. */
public class JsonGenerateProcess implements Processor<JsonGenerateNode> {
  // TODO: remove undetermined once effective data type calculation is corrected
  public static final ImmutableList<EffectiveDataType> ALPHANUMERIC_DATA_TYPES =
      ImmutableList.of(
          EffectiveDataType.STRING, EffectiveDataType.INTEGER, EffectiveDataType.UNDETERMINED);
  public static final ImmutableList<EffectiveDataType> IDENTIFIER3_DATA_TYPES =
          ImmutableList.of(EffectiveDataType.INTEGER, EffectiveDataType.REAL, EffectiveDataType.UNDETERMINED);
  private final SymbolAccumulatorService symbolAccumulatorService;

  public JsonGenerateProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  /**
   * Performs the validation of JSON generate statement.
   *
   * @param jsonGenerateNode Node to be analysed. {@link JsonGenerateNode} in this case.
   * @param processingContext {@link ProcessingContext}
   */
  @Override
  public void accept(JsonGenerateNode jsonGenerateNode, ProcessingContext processingContext) {
    List<VariableUsageNode> identifier1Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, jsonGenerateNode.getIdentifier1());
    if (identifier1Nodes.isEmpty()) return;
    List<VariableNode> identifier1FoundDefinitions =
            VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, identifier1Nodes);
    if (identifier1FoundDefinitions.isEmpty()) return;
    semanticAnalysisForIdentifier1(processingContext, identifier1Nodes, identifier1FoundDefinitions);

    List<VariableUsageNode> identifier2Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, jsonGenerateNode.getIdentifier2());
    if (identifier2Nodes.isEmpty()) return;
    List<VariableNode> identifier2FoundDefinitions =
            VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, identifier2Nodes);
    if (identifier2FoundDefinitions.isEmpty()) return;
    semanticAnalysisForIdentifier2(processingContext, identifier2Nodes, identifier2FoundDefinitions, identifier1FoundDefinitions);

    if (Objects.nonNull(jsonGenerateNode.getIdentifier3())) {
      List<VariableUsageNode> identifier3Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, jsonGenerateNode.getIdentifier3());
      if (identifier3Nodes.isEmpty()) return;
      List<VariableNode> identifier3FoundDefinitions =
              VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, identifier3Nodes);
      semanticAnalysisForIdentifier3(
          processingContext,
          identifier3Nodes,
          identifier3FoundDefinitions,
          identifier2FoundDefinitions,
          identifier1FoundDefinitions);
    }

    if (Objects.nonNull(jsonGenerateNode.getIdentifier4()) && !jsonGenerateNode.getIdentifier4().isEmpty()) {
      semanticAnalysisForIdentifier4(jsonGenerateNode, processingContext, identifier2FoundDefinitions);
    }

    if (Objects.nonNull(jsonGenerateNode.getIdentifier5()) && !jsonGenerateNode.getIdentifier5().isEmpty()) {
      semanticAnalysisForIdentifier5(jsonGenerateNode, processingContext, identifier2FoundDefinitions);
    }

    if (Objects.nonNull(jsonGenerateNode.getPhases()) && !jsonGenerateNode.getPhases().isEmpty()) {
      semanticAnalysisForIdentifier6(jsonGenerateNode, processingContext);
    }
  }

  private void semanticAnalysisForIdentifier6(JsonGenerateNode jsonGenerateNode, ProcessingContext ctx) {
    jsonGenerateNode.getPhases().forEach(phase -> {
      VariableNameAndLocality identifier6 = phase.getIdentifier6();
      List<VariableUsageNode> identifier6Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, identifier6);
      List<VariableNode> foundDefinitionsForIdentifier6 =
              VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, identifier6Nodes);
      if (foundDefinitionsForIdentifier6.isEmpty()) return;
      if (Objects.nonNull(phase.getConditionNames())) {
        semanticCheckForCondition(jsonGenerateNode, ctx, phase, foundDefinitionsForIdentifier6);
      }
      if (foundDefinitionsForIdentifier6.get(0) instanceof ElementaryItemNode) {
        ElementaryItemNode node = (ElementaryItemNode) foundDefinitionsForIdentifier6.get(0);
        if (node.getPicClause().toUpperCase().trim().equals("X")) {
          return;
        }
      }
      ctx.getErrors().add(
              SyntaxError.syntaxError()
                      .errorSource(ErrorSource.PARSING)
                      .severity(ErrorSeverity.ERROR)
                      .location(identifier6.getLocality().toOriginalLocation())
                      .messageTemplate(
                              MessageTemplate.of("jsonGenProcess.identifier6.dataType", identifier6.getName()))
                      .build()
      );
    });
  }

  private void semanticCheckForCondition(JsonGenerateNode jsonGenerateNode, ProcessingContext ctx, JsonGenerateNode.JsonGenPhase phase, List<VariableNode> foundDefinitionsForIdentifier6) {
    List<VariableUsageNode> conditionNodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, phase.getConditionNames());
    List<VariableNode> conditionNodeDefn =
            VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, conditionNodes);
    if (foundDefinitionsForIdentifier6
            .get(0)
            .getDepthFirstStream()
            .filter(node -> node.equals(conditionNodeDefn.get(0)))
            .noneMatch(ConditionDataNameNode.class::isInstance)) {
      // add error
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(phase.getConditionNames().getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonGenProcess.condition.dataType",
                                              phase.getConditionNames().getName(),
                                              foundDefinitionsForIdentifier6.get(0).getName()))
                              .build());
    }
  }

  private void semanticAnalysisForIdentifier5(JsonGenerateNode jsonGenerateNode, ProcessingContext ctx, List<VariableNode> identifier2FoundDefinitions) {
    List<VariableUsageNode> identifier5Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, jsonGenerateNode.getIdentifier5());
    identifier5Nodes.forEach(identifier5 -> {
      List<VariableNode> foundDefinitionsForIdentifier5 =
              VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, Collections.singletonList(identifier5));
      if (foundDefinitionsForIdentifier5.isEmpty() || identifier2FoundDefinitions.isEmpty()) {
        return;
      }
      boolean isIdentifier5SubsetOfIdentifier2 =
              identifier2FoundDefinitions
                      .get(0)
                      .getDepthFirstStream()
                      .filter(node -> node.equals(foundDefinitionsForIdentifier5.get(0)))
                      .anyMatch(node -> node instanceof ElementaryItemNode);

      if (!isIdentifier5SubsetOfIdentifier2) {
        ctx.getErrors()
                .add(
                        SyntaxError.syntaxError()
                                .errorSource(ErrorSource.PARSING)
                                .severity(ErrorSeverity.ERROR)
                                .location(identifier5.getLocality().toOriginalLocation())
                                .messageTemplate(
                                        MessageTemplate.of(
                                                "jsonParseProcess.identifier4",
                                                identifier5.getName(),
                                                identifier2FoundDefinitions.get(0).getName()))
                                .build());
      }
    });

  }

  private void semanticAnalysisForIdentifier4(JsonGenerateNode jsonGenerateNode, ProcessingContext ctx, List<VariableNode> identifier2FoundDefinitions) {
    List<VariableUsageNode> identifier4Nodes = VariableUsageUtils.getVariableUsageNode(jsonGenerateNode, jsonGenerateNode.getIdentifier4());
    identifier4Nodes.forEach(identifier4 -> {
      List<VariableNode> foundDefinitionsForIdentifier4 =
              VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, jsonGenerateNode, Collections.singletonList(identifier4));
      if (foundDefinitionsForIdentifier4.isEmpty() || identifier2FoundDefinitions.isEmpty()) {
        return;
      }

      boolean isIdentifier4SubsetOfIdentifier2 =
              identifier2FoundDefinitions
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
                                                identifier2FoundDefinitions.get(0).getName()))
                                .build());
      }
    });
  }

  private void semanticAnalysisForIdentifier3(ProcessingContext ctx, List<VariableUsageNode> identifier3Nodes, List<VariableNode> identifier3FoundDefinitions, List<VariableNode> identifier2FoundDefinitions, List<VariableNode> identifier1FoundDefinitions) {
    if (identifier3FoundDefinitions.isEmpty()) return;
    if (VariableUsageUtils.checkForNoOverlapBetweenNodes(identifier3FoundDefinitions.get(0), identifier1FoundDefinitions.get(0))) {
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonParseProcess.identifier2.overlap",
                                              identifier2FoundDefinitions.get(0).getName(),
                                              identifier3Nodes.get(0).getName()))
                              .build());
    }

    if (VariableUsageUtils.checkForNoOverlapBetweenNodes(identifier3FoundDefinitions.get(0), identifier2FoundDefinitions.get(0))) {
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonParseProcess.identifier2.overlap",
                                              identifier2FoundDefinitions.get(0).getName(),
                                              identifier3Nodes.get(0).getName()))
                              .build());
    }

    if (identifier3FoundDefinitions.get(0) instanceof ElementaryItemNode) {
      ElementaryItemNode node = (ElementaryItemNode) identifier3FoundDefinitions.get(0);
      if (!IDENTIFIER3_DATA_TYPES.contains(node.getEffectiveDataType())) {
        ctx.getErrors()
                .add(
                        SyntaxError.syntaxError()
                                .errorSource(ErrorSource.PARSING)
                                .severity(ErrorSeverity.ERROR)
                                .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                                .messageTemplate(
                                        MessageTemplate.of(
                                                "jsonGenProcess.identifier3.dataType",
                                                identifier3Nodes.get(0).getName()))
                                .build());
      }
    } else {
        boolean isValidGroupItem =
                identifier3FoundDefinitions
                        .get(0)
                        .getDepthFirstStream()
                        .filter(ElementaryNode.class::isInstance)
                        .map(ElementaryNode.class::cast)
                        .allMatch(iden3 -> IDENTIFIER3_DATA_TYPES.contains(iden3.getEffectiveDataType())
                                && !iden3.getPicClause().toUpperCase().contains("P"));
        if (!isValidGroupItem) {
          ctx.getErrors().add(
                  SyntaxError.syntaxError()
                          .errorSource(ErrorSource.PARSING)
                          .severity(ErrorSeverity.ERROR)
                          .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                          .messageTemplate(
                                  MessageTemplate.of(
                                          "jsonGenProcess.identifier3.dataType",
                                          identifier3Nodes.get(0).getName()))
                          .build()
          );
        }
      }
  }

  private void semanticAnalysisForIdentifier2(ProcessingContext ctx, List<VariableUsageNode> identifier2Nodes, List<VariableNode> identifier2FoundDefinitions, List<VariableNode> identifier1FoundDefinitions) {
    // check no overlap
    if (!identifier2FoundDefinitions.isEmpty()
            && !identifier1FoundDefinitions.isEmpty()
            && VariableUsageUtils.checkForNoOverlapBetweenNodes(identifier2FoundDefinitions.get(0), identifier1FoundDefinitions.get(0))) {
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonParseProcess.identifier2.overlap",
                                              identifier2FoundDefinitions.get(0).getName(),
                                              identifier2Nodes.get(0).getName()))
                              .build());
    }

    if (identifier2FoundDefinitions.get(0) instanceof ElementaryItemNode) {
      // validate elementary items
      ElementaryItemNode foundDefinitionNode = (ElementaryItemNode) identifier2FoundDefinitions.get(0);
      if (foundDefinitionNode.getName().equals(FILLER_NAME)
              || foundDefinitionNode.getName().trim().equals("")
              || isRenameClause(foundDefinitionNode)
              || foundDefinitionNode.isDynamicLength()) {
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
    } else {
      // validate group item
      validateIdentifier2GroupItem(ctx, identifier2Nodes, identifier2FoundDefinitions);
    }

  }

  private void validateIdentifier2GroupItem(ProcessingContext ctx, List<VariableUsageNode> nodes, List<VariableNode> definitions) {
    boolean isNonUniqueChildrenItem = getElementaryNodeStreamForIdentifier2(definitions)
            .collect(groupingBy(VariableWithLevelNode::getName))
            .entrySet().stream()
            .anyMatch(e -> e.getValue().size() > 1);

    boolean isGroupItemValid = getElementaryNodeStreamForIdentifier2(definitions).findAny().isPresent() && !isNonUniqueChildrenItem;

    boolean isGroupItemDynamic =
            definitions
                    .get(0)
                    .getDepthFirstStream()
                    .filter(ElementaryItemNode.class::isInstance)
                    .map(ElementaryItemNode.class::cast)
                    .anyMatch(ElementaryNode::isDynamicLength);
    if (!isGroupItemValid || isGroupItemDynamic) {
      ctx.getErrors()
              .add(
                      SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.ERROR)
                              .location(nodes.get(0).getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of(
                                              "jsonGenProcess.identifier2.groupItemError",
                                              nodes.get(0).getName()))
                              .build());
    }
  }

  private Stream<VariableWithLevelNode> getElementaryNodeStreamForIdentifier2(List<VariableNode> definitions) {
    List<VariableWithLevelNode> childItems = new ArrayList<>();
    List<VariableWithLevelNode> collect = definitions.get(0).getChildren().stream()
            .filter(VariableWithLevelNode.class::isInstance)
            .map(VariableWithLevelNode.class::cast)
            .filter(node -> node.getLevel() != 66)
            .filter(node -> !node.isRedefines())
            .filter(node -> !(node.getName().trim().equals("") || node.getName().equals(FILLER_NAME))).collect(Collectors.toList());

    collect.forEach(node -> {
      if (node instanceof UsageClause) {
        UsageClause currentNode = (UsageClause) node;
        boolean isProperUsageForIden2 = !ImmutableList.of(UsageFormat.POINTER, UsageFormat.FUNCTION_POINTER,
                UsageFormat.PROCEDURE_POINTER, UsageFormat.OBJECT_REFERENCE).contains(currentNode.getUsageFormat());
        if (isProperUsageForIden2) {
          childItems.add(node);
        }
      } else {
        childItems.add(node);
      }
    });
    return childItems.stream();
  }

  private boolean isRenameClause(ElementaryItemNode foundDefinitionNode) {
    return foundDefinitionNode.getLevel() == 66;
  }

  private void semanticAnalysisForIdentifier1(
          ProcessingContext ctx,
          List<VariableUsageNode> identifier1,
          List<VariableNode> identifier1Definitions) {
    // node must be an elementary data item of category alphanumeric/National OR
    // alphanumeric/national group item
    if (identifier1Definitions.get(0) instanceof ElementaryItemNode) {
      ElementaryItemNode foundDefinitionNode = (ElementaryItemNode) identifier1Definitions.get(0);
      boolean isNational = foundDefinitionNode.getUsageFormat() == UsageFormat.NATIONAL;
      if (!(ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())
              || isNational)
          || foundDefinitionNode.isJustified()
          || foundDefinitionNode.isDynamicLength()) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier1.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonGenProcess.identifier1.elementaryItemError",
                            identifier1.get(0).getName()))
                    .build());
      }
    } else {
      if (identifier1Definitions.get(0) instanceof VariableWithLevelNode) {
        verifyIdentifier1GroupItem(identifier1Definitions, identifier1, ctx);
      } else {
        // definition could be only groupItem or elementary item
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier1Definitions.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(MessageTemplate.of("jsonParseProcess.identifier.typeError"))
                    .build());
      }
    }
  }

  private void verifyIdentifier1GroupItem(List<VariableNode> definitions, List<VariableUsageNode> identifier1, ProcessingContext ctx) {
    boolean isGroupItemAlphanumeric =
            definitions
                    .get(0)
                    .getDepthFirstStream()
                    .filter(ElementaryItemNode.class::isInstance)
                    .map(ElementaryItemNode.class::cast)
                    .anyMatch(node -> ALPHANUMERIC_DATA_TYPES.contains(node.getEffectiveDataType()) || node.getUsageFormat() == UsageFormat.NATIONAL);

    boolean isGroupItemDynamic =
            definitions
                    .get(0)
                    .getDepthFirstStream()
                    .filter(ElementaryItemNode.class::isInstance)
                    .map(ElementaryItemNode.class::cast)
                    .anyMatch(ElementaryNode::isDynamicLength);

    boolean isGroupItemJustified =
            definitions
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
                              .location(identifier1.get(0).getLocality().toOriginalLocation())
                              .messageTemplate(
                                      MessageTemplate.of("jsonParseProcess.identifier1.groupItemError"))
                              .build());
    }
  }
}
