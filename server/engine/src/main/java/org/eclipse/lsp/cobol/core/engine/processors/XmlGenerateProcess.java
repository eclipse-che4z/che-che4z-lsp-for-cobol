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
import org.eclipse.lsp.cobol.common.model.tree.XmlGenerateNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.model.NodeUtils;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.groupingBy;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;

/** Apply all validation of XML Generate Statement. */
public class XmlGenerateProcess implements Processor<XmlGenerateNode> {
  public static final ImmutableList<EffectiveDataType> IDENTIFIER3_DATA_TYPES =
      ImmutableList.of(
          EffectiveDataType.INTEGER, EffectiveDataType.REAL, EffectiveDataType.UNDETERMINED);
  private final SymbolAccumulatorService symbolAccumulatorService;

  public XmlGenerateProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(XmlGenerateNode xmlGenerateNode, ProcessingContext processingContext) {
    List<VariableUsageNode> identifier1Nodes =
        VariableUsageUtils.getVariableUsageNode(xmlGenerateNode, xmlGenerateNode.getIdentifier1());
    if (identifier1Nodes.isEmpty()) return;
    List<VariableNode> identifier1FoundDefinitions =
        VariableUsageUtils.getDefinitionNode(
            symbolAccumulatorService, xmlGenerateNode, identifier1Nodes);

    semanticAnalysisForIdentifier1(
        processingContext, identifier1Nodes, identifier1FoundDefinitions);
    List<VariableUsageNode> identifier2Nodes =
        VariableUsageUtils.getVariableUsageNode(xmlGenerateNode, xmlGenerateNode.getIdentifier2());
    if (identifier2Nodes.isEmpty()) return;
    List<VariableNode> identifier2FoundDefinitions =
        VariableUsageUtils.getDefinitionNode(
            symbolAccumulatorService, xmlGenerateNode, identifier2Nodes);
    if (identifier2FoundDefinitions.isEmpty()) return;
    semanticAnalysisForIdentifier2(
        processingContext,
        identifier2Nodes,
        identifier2FoundDefinitions,
        identifier1FoundDefinitions);

    if (Objects.nonNull(xmlGenerateNode.getIdentifier3())) {
      List<VariableUsageNode> identifier3Nodes =
          VariableUsageUtils.getVariableUsageNode(
              xmlGenerateNode, xmlGenerateNode.getIdentifier3());
      if (identifier3Nodes.isEmpty()) return;
      List<VariableNode> identifier3FoundDefinitions =
          VariableUsageUtils.getDefinitionNode(
              symbolAccumulatorService, xmlGenerateNode, identifier3Nodes);
      semanticAnalysisForIdentifier3(
          processingContext,
          identifier3Nodes,
          identifier3FoundDefinitions,
          identifier2FoundDefinitions,
          identifier1FoundDefinitions);

      if (Objects.nonNull(xmlGenerateNode.getIdentifier4())) {

        List<VariableUsageNode> identifier4Nodes =
            VariableUsageUtils.getVariableUsageNode(
                xmlGenerateNode, xmlGenerateNode.getIdentifier4());
        if (identifier4Nodes.isEmpty()) return;
        List<VariableNode> identifier4FoundDefinitions =
            VariableUsageUtils.getDefinitionNode(
                symbolAccumulatorService, xmlGenerateNode, identifier4Nodes);
        semanticAnalysisForIdentifier4(
            processingContext,
            identifier4Nodes,
            identifier4FoundDefinitions,
            identifier1FoundDefinitions,
            identifier3FoundDefinitions);
      }
      if (Objects.nonNull(xmlGenerateNode.getIdentifier5())) {

        List<VariableUsageNode> identifier5Nodes =
            VariableUsageUtils.getVariableUsageNode(
                xmlGenerateNode, xmlGenerateNode.getIdentifier5());
        if (identifier5Nodes.isEmpty()) return;
        List<VariableNode> identifier5FoundDefinitions =
            VariableUsageUtils.getDefinitionNode(
                symbolAccumulatorService, xmlGenerateNode, identifier5Nodes);
        semanticAnalysisForIdentifier5(
            processingContext,
            identifier5Nodes,
            identifier5FoundDefinitions,
            identifier1FoundDefinitions,
            identifier3FoundDefinitions);
      }

      if (Objects.nonNull(xmlGenerateNode.getIdentifier6())
          && !xmlGenerateNode.getIdentifier6().isEmpty()) {
        semanticAnalysisForIdentifier6(
            xmlGenerateNode, processingContext, identifier2FoundDefinitions);
      }

      if (Objects.nonNull(xmlGenerateNode.getIdentifier7())
          && !xmlGenerateNode.getIdentifier7().isEmpty()) {
        semanticAnalysisForIdentifier7(
            xmlGenerateNode, processingContext, identifier2FoundDefinitions);
      }

      if (Objects.nonNull(xmlGenerateNode.getIdentifier8())
          && !xmlGenerateNode.getIdentifier8().isEmpty()) {
        semanticAnalysisForIdentifier8(
            xmlGenerateNode, processingContext, identifier2FoundDefinitions);
      }
    }
  }

  private void semanticAnalysisForIdentifier8(
      XmlGenerateNode xmlGenerateNode,
      ProcessingContext ctx,
      List<VariableNode> identifier2FoundDefinitions) {
    List<VariableUsageNode> identifier8Nodes =
        VariableUsageUtils.getVariableUsageNode(xmlGenerateNode, xmlGenerateNode.getIdentifier8());
    identifier8Nodes.forEach(
        identifier8 -> {
          List<VariableNode> foundDefinitionsForIdentifier8 =
              VariableUsageUtils.getDefinitionNode(
                  symbolAccumulatorService,
                  xmlGenerateNode,
                  Collections.singletonList(identifier8));
          if (foundDefinitionsForIdentifier8.isEmpty() || identifier2FoundDefinitions.isEmpty()) {
            return;
          }

          boolean isIdentifier8SubsetOfIdentifier2 =
              identifier2FoundDefinitions
                  .get(0)
                  .getDepthFirstStream()
                  .anyMatch(node -> node.equals(foundDefinitionsForIdentifier8.get(0)));
          if (!isIdentifier8SubsetOfIdentifier2) {
            ctx.getErrors()
                .add(
                    SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .severity(ErrorSeverity.ERROR)
                        .location(identifier8.getLocality().toOriginalLocation())
                        .messageTemplate(
                            MessageTemplate.of(
                                "xmlParseProcess.identifier7",
                                identifier8.getNodeType(),
                                identifier2FoundDefinitions.get(0).getName()))
                        .build());
          }
        });
  }

  private void semanticAnalysisForIdentifier7(
      XmlGenerateNode xmlGenerateNode,
      ProcessingContext ctx,
      List<VariableNode> identifier2FoundDefinitions) {

    List<VariableUsageNode> identifier7Nodes =
        VariableUsageUtils.getVariableUsageNode(xmlGenerateNode, xmlGenerateNode.getIdentifier7());
    identifier7Nodes.forEach(
        identifier7 -> {
          List<VariableNode> foundDefinitionsForIdentifier7 =
              VariableUsageUtils.getDefinitionNode(
                  symbolAccumulatorService,
                  xmlGenerateNode,
                  Collections.singletonList(identifier7));
          if (foundDefinitionsForIdentifier7.isEmpty() || identifier2FoundDefinitions.isEmpty()) {
            return;
          }

          boolean isIdentifier7SubsetOfIdentifier2 =
              identifier2FoundDefinitions
                  .get(0)
                  .getDepthFirstStream()
                  .anyMatch(node -> node.equals(foundDefinitionsForIdentifier7.get(0)));
          if (!isIdentifier7SubsetOfIdentifier2) {
            ctx.getErrors()
                .add(
                    SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .severity(ErrorSeverity.ERROR)
                        .location(identifier7.getLocality().toOriginalLocation())
                        .messageTemplate(
                            MessageTemplate.of(
                                "xmlParseProcess.identifier7",
                                identifier7.getNodeType(),
                                identifier2FoundDefinitions.get(0).getName()))
                        .build());
          }
        });
  }

  private void semanticAnalysisForIdentifier6(
      XmlGenerateNode xmlGenerateNode,
      ProcessingContext ctx,
      List<VariableNode> identifier2FoundDefinitions) {
    List<VariableUsageNode> identifier6Nodes =
        VariableUsageUtils.getVariableUsageNode(xmlGenerateNode, xmlGenerateNode.getIdentifier6());
    identifier6Nodes.forEach(
        identifier6 -> {
          List<VariableNode> foundDefinitionsForIdentifier6 =
              VariableUsageUtils.getDefinitionNode(
                  symbolAccumulatorService,
                  xmlGenerateNode,
                  Collections.singletonList(identifier6));
          if (foundDefinitionsForIdentifier6.isEmpty() || identifier2FoundDefinitions.isEmpty()) {
            return;
          }

          boolean isIdentifier6SubsetOfIdentifier2 =
              identifier2FoundDefinitions
                  .get(0)
                  .getDepthFirstStream()
                  .anyMatch(node -> node.equals(foundDefinitionsForIdentifier6.get(0)));
          if (!isIdentifier6SubsetOfIdentifier2) {
            ctx.getErrors()
                .add(
                    SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .severity(ErrorSeverity.ERROR)
                        .location(identifier6.getLocality().toOriginalLocation())
                        .messageTemplate(
                            MessageTemplate.of(
                                "xmlParseProcess.identifier6",
                                identifier6.getName(),
                                identifier2FoundDefinitions.get(0).getName()))
                        .build());
          }
        });
  }

  private void semanticAnalysisForIdentifier5(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier5Nodes,
      List<VariableNode> identifier5FoundDefinitions,
      List<VariableNode> identifier1FoundDefinitions,
      List<VariableNode> identifier3FoundDefinitions) {
    if (identifier5FoundDefinitions.isEmpty()) return;
    if (identifier5FoundDefinitions.get(0) instanceof ElementaryNode) {
      ElementaryNode foundDefinitionNode =
          (ElementaryNode) identifier5FoundDefinitions.get(0);
      boolean isNational = foundDefinitionNode.getUsageFormat() == UsageFormat.NATIONAL;
      if (!(NodeUtils.ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())
              || isNational)
          || foundDefinitionNode.isJustified()
          || foundDefinitionNode.isDynamicLength()) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier5Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonGenProcess.identifier1.elementaryItemError",
                            identifier5Nodes.get(0).getName()))
                    .build());
      }

    } else {

      if (VariableUsageUtils.checkForNoOverlapBetweenNodes(
          identifier5FoundDefinitions.get(0), identifier1FoundDefinitions.get(0))) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier5Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlGenProcess.identifier2.overlap",
                            identifier1FoundDefinitions.get(0).getName(),
                            identifier5Nodes.get(0).getName()))
                    .build());
      }

      if (VariableUsageUtils.checkForNoOverlapBetweenNodes(
          identifier5FoundDefinitions.get(0), identifier3FoundDefinitions.get(0))) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier5Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlGenProcess.identifier2.overlap",
                            identifier3FoundDefinitions.get(0).getName(),
                            identifier5Nodes.get(0).getName()))
                    .build());
      }
    }
  }

  private void semanticAnalysisForIdentifier4(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier4Nodes,
      List<VariableNode> identifier3FoundDefinitions,
      List<VariableNode> identifier1FoundDefinitions,
      List<VariableNode> identifier4FoundDefinitions) {
    if (identifier4FoundDefinitions.isEmpty()) return;
    if (identifier4FoundDefinitions.get(0) instanceof ElementaryNode) {
      ElementaryNode foundDefinitionNode =
          (ElementaryNode) identifier4FoundDefinitions.get(0);
      boolean isNational = foundDefinitionNode.getUsageFormat() == UsageFormat.NATIONAL;
      if (!(NodeUtils.ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())
              || isNational)
          || foundDefinitionNode.isJustified()
          || foundDefinitionNode.isDynamicLength()) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier4Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "jsonGenProcess.identifier1.elementaryItemError",
                            identifier4Nodes.get(0).getName()))
                    .build());
      }

    } else {
      if (VariableUsageUtils.checkForNoOverlapBetweenNodes(
          identifier4FoundDefinitions.get(0), identifier1FoundDefinitions.get(0))) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier4Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlGenProcess.identifier2.overlap",
                            identifier1FoundDefinitions.get(0).getName(),
                            identifier4Nodes.get(0).getName()))
                    .build());
      }

      if (VariableUsageUtils.checkForNoOverlapBetweenNodes(
          identifier4FoundDefinitions.get(0), identifier3FoundDefinitions.get(0))) {
        ctx.getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.ERROR)
                    .location(identifier4Nodes.get(0).getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlGenProcess.identifier2.overlap",
                            identifier3FoundDefinitions.get(0).getName(),
                            identifier4Nodes.get(0).getName()))
                    .build());
      }
    }
  }

  private void semanticAnalysisForIdentifier3(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier3Nodes,
      List<VariableNode> identifier3FoundDefinitions,
      List<VariableNode> identifier2FoundDefinitions,
      List<VariableNode> identifier1FoundDefinitions) {
    if (identifier3FoundDefinitions.isEmpty()) return;

    if (!identifier1FoundDefinitions.isEmpty()
        && VariableUsageUtils.checkForNoOverlapBetweenNodes(
            identifier3FoundDefinitions.get(0), identifier1FoundDefinitions.get(0))) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "xmlGenProcess.identifier2.overlap",
                          identifier3Nodes.get(0).getName(),
                          identifier2FoundDefinitions.get(0).getName()))
                  .build());
    }

    if (!identifier2FoundDefinitions.isEmpty()
        && VariableUsageUtils.checkForNoOverlapBetweenNodes(
            identifier3FoundDefinitions.get(0), identifier2FoundDefinitions.get(0))) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier3Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "xmlGenProcess.identifier2.overlap",
                          identifier3Nodes.get(0).getName(),
                          identifier2FoundDefinitions.get(0).getName()))
                  .build());

      if (identifier3FoundDefinitions.get(0) instanceof ElementaryNode) {
        ElementaryNode node = (ElementaryNode) identifier3FoundDefinitions.get(0);
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
                .allMatch(
                    iden3 ->
                        IDENTIFIER3_DATA_TYPES.contains(iden3.getEffectiveDataType())
                            && !iden3.getPicClause().toUpperCase().contains("P"));
        if (!isValidGroupItem) {
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
      }
    }
  }

  private void semanticAnalysisForIdentifier2(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier2Nodes,
      List<VariableNode> identifier2FoundDefnitions,
      List<VariableNode> identifier1FoundDefinitions) {
    // checking for overlap between identifier1 and identifier2
    if (!identifier2FoundDefnitions.isEmpty()
        && !identifier1FoundDefinitions.isEmpty()
        && VariableUsageUtils.checkForNoOverlapBetweenNodes(
            identifier2FoundDefnitions.get(0), identifier1FoundDefinitions.get(0))) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier2Nodes.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "xmlGenProcess.identifier2.overlap",
                              identifier2Nodes.get(0).getName(),
                              identifier1FoundDefinitions.get(0).getName()
                          ))
                  .build());
    }

    // validation of elementary items
    if (identifier2FoundDefnitions.get(0) instanceof ElementaryNode) {
      ElementaryNode foundDefinitionNode =
          (ElementaryNode) identifier2FoundDefnitions.get(0);
      if (foundDefinitionNode.getName().equals(FILLER_NAME)
          || foundDefinitionNode.getName().trim().isEmpty()
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
                            "xmlParse.identifier2.dataType", identifier2Nodes.get(0).getName()))
                    .build());
      }
    } else {
      validateIdentifier2Group(ctx, identifier2Nodes, identifier2FoundDefnitions);
    }
  }

  private void validateIdentifier2Group(
      ProcessingContext ctx, List<VariableUsageNode> nodes, List<VariableNode> definitions) {
    boolean isNonUniqueChildren =
        getElementaryNodeStreamForIdentifier2(definitions)
            .collect(groupingBy(VariableWithLevelNode::getName))
            .entrySet()
            .stream()
            .anyMatch(e -> e.getValue().size() > 1);

    boolean isGroupItemValid =
        getElementaryNodeStreamForIdentifier2(definitions).findAny().isPresent()
            && !isNonUniqueChildren;

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
                          "jsonGenProcess.identifier2.groupItemError", nodes.get(0).getName()))
                  .build());
    }
  }

  private Stream<VariableWithLevelNode> getElementaryNodeStreamForIdentifier2(
      List<VariableNode> definitions) {
    List<VariableWithLevelNode> childItems = new ArrayList<>();
    List<VariableWithLevelNode> collect =
        definitions.get(0).getChildren().stream()
            .filter(VariableWithLevelNode.class::isInstance)
            .map(VariableWithLevelNode.class::cast)
            .filter(node -> node.getLevel() != 66)
            .filter(node -> !node.isRedefines())
            .filter(
                node -> !(node.getName().trim().equals("") || node.getName().equals(FILLER_NAME)))
            .collect(Collectors.toList());
    collect.forEach(
        node -> {
          if (node instanceof UsageClause) {
            UsageClause currentNode = (UsageClause) node;
            boolean isProperUsageForIden2 =
                !ImmutableList.of(
                        UsageFormat.POINTER,
                        UsageFormat.FUNCTION_POINTER,
                        UsageFormat.PROCEDURE_POINTER,
                        UsageFormat.OBJECT_REFERENCE)
                    .contains(currentNode.getUsageFormat());
            if (isProperUsageForIden2) {
              childItems.add(node);
            }
          } else {
            childItems.add(node);
          }
        });
    return childItems.stream();
  }

  private boolean isRenameClause(ElementaryNode foundDefinitionNode) {
    return foundDefinitionNode.getLevel() == 66;
  }

  private void semanticAnalysisForIdentifier1(
      ProcessingContext ctx,
      List<VariableUsageNode> identifier1,
      List<VariableNode> identifier1Definitions) {
    if (identifier1Definitions.isEmpty()) return;
    if (identifier1Definitions.get(0) instanceof ElementaryNode) {
      ElementaryNode foundDefinitionNode = (ElementaryNode) identifier1Definitions.get(0);
      boolean isNational = foundDefinitionNode.getUsageFormat() == UsageFormat.NATIONAL;
      if (!(NodeUtils.ALPHANUMERIC_DATA_TYPES.contains(foundDefinitionNode.getEffectiveDataType())
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
      }
    }
  }

  private void verifyIdentifier1GroupItem(
      List<VariableNode> definitions, List<VariableUsageNode> identifier1, ProcessingContext ctx) {
    if (!NodeUtils.isNodeAlphanumeric(definitions.get(0))
        || NodeUtils.checkIfNodeHasDynamicGroupItem(definitions.get(0))
        || NodeUtils.checkIfNodeHasJustifiedGroupItem(definitions.get(0))) {
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(identifier1.get(0).getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of("jsonParseProcess.identifier1.groupItemError", identifier1.get(0).getName()))
                  .build());
    }
  }
}
