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
package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableList;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.OccursClause;
import org.eclipse.lsp.cobol.common.model.tree.variable.ValueClause;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.dialects.daco.VisitorHelper.*;

/**
 * DaCoCopybookVisitor
 */
@RequiredArgsConstructor
public class DaCoCopybookVisitor extends VariableParserBaseVisitor<List<Node>> {
  private final String uri;
  private final int startingLevel;
  private final String suffix;
  private int firstCopybookLevel = 0;
  private final String copybookId;

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(VariableParser.DataDescriptionEntryFormat1Context ctx) {
    VariableDefinitionNode variableDefinitionNode = VariableDefinitionNode.builder()
            .level(calculateLevel(VisitorHelper.getLevel(ctx.levelNumber().LEVEL_NUMBER())))
            .levelLocality(getLevelLocality(ctx.levelNumber().LEVEL_NUMBER()))
            .statementLocality(retrieveRangeLocality(ctx))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .global(!ctx.dataGlobalClause().isEmpty())
            .picClauses(VisitorHelper.retrievePicTexts(ctx.dataPictureClause()))
            .valueClauses(retrieveValues(ctx.dataValueClause()))
            .usageClauses(VisitorHelper.retrieveUsageFormat(ctx.dataUsageClause()))
            .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
            .redefinesClauses(
                    ctx.dataRedefinesClause().stream()
                            .map(VariableParser.DataRedefinesClauseContext::dataName)
                            .map(this::extractNameAndLocality)
                            .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
            .isJustified(!ctx.dataJustifiedClause().isEmpty())
            .build();

    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(VariableParser.DataDescriptionEntryFormat2Context ctx) {
    VariableDefinitionNode.Builder builder =
            VariableDefinitionNode.builder()
                    .level(LEVEL_66)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveRangeLocality(ctx));

    ofNullable(ctx.dataRenamesClause())
            .map(dataRenamesClauseContext -> dataRenamesClauseContext.qualifiedVariableDataName()
                    .dataName()
                    .stream()
                    .map(VariableParser.DataNameContext.class::cast)
                    .map(this::extractNameAndLocality).collect(toList()))
            .ifPresent(builder::renamesClause);

    ofNullable(ctx.dataRenamesClause())
            .map(thruDataNameContext -> thruDataNameContext.qualifiedVariableDataName().dataName().stream()
                    .map(VariableParser.DataNameContext.class::cast)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
            .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
      VariableParser.DataDescriptionEntryFormat1Level77Context ctx) {
    VariableDefinitionNode variableDefinitionNode = VariableDefinitionNode.builder()
            .level(LEVEL_77)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_77()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveRangeLocality(ctx))
            .global(!ctx.dataGlobalClause().isEmpty())
            .picClauses(VisitorHelper.retrievePicTexts(ctx.dataPictureClause()))
            .valueClauses(retrieveValues(ctx.dataValueClause()))
            .usageClauses(VisitorHelper.retrieveUsageFormat(ctx.dataUsageClause()))
            .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
            .redefinesClauses(
                    ctx.dataRedefinesClause().stream()
                            .map(VariableParser.DataRedefinesClauseContext::dataName)
                            .map(this::extractNameAndLocality)
                            .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
            .isJustified(!ctx.dataJustifiedClause().isEmpty())
            .build();
    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(VariableParser.DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
            .map(VariableParser.DataValueClauseContext::valueIsToken)
            .map(
                    valueToken ->
                            addTreeNode(
                                    VariableDefinitionNode.builder()
                                            .level(LEVEL_88)
                                            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_88()))
                                            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                                            .statementLocality(retrieveRangeLocality(ctx))
                                            .valueClauses(retrieveValues(ImmutableList.of(ctx.dataValueClause())))
                                            .valueToken(VisitorHelper.retrieveValueToken(valueToken))
                                            .build(),
                                    visitChildren(ctx)))
            .orElse(ImmutableList.of());
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    List<Node> result = new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  private int calculateLevel(int level) {
    if (startingLevel != 0) {
      if (firstCopybookLevel == 0) {
        firstCopybookLevel = level;
        return startingLevel;
      }
      return level - firstCopybookLevel + startingLevel;
    }
    return level;
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) {
      return children;
    }

    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality retrieveRangeLocality(ParserRuleContext ctx) {
    Range range = new Range(
            new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
            new Position(ctx.stop.getLine() - 1, ctx.stop.getCharPositionInLine()));

    return Locality.builder()
            .uri(uri)
            .range(range)
            .copybookId(copybookId)
            .build();
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    return Locality.builder()
            .range(new Range(
                    new Position(terminalNode.getSymbol().getLine(), terminalNode.getSymbol().getCharPositionInLine()),
                    new Position(terminalNode.getSymbol().getLine(), terminalNode.getSymbol().getCharPositionInLine())))
            .copybookId(copybookId)
            .build();
  }

  private VariableNameAndLocality extractNameAndLocality(VariableParser.EntryNameContext context) {
    if (context == null || context.dataName() == null) {
      return null;
    }
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(VariableParser.DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(VariableParser.CobolWordContext context) {
    String name = VisitorHelper.getName(context);
    String generatedName = name;
    Optional<String> cbSuffix = DaCoHelper.extractSuffix(name);
    if (cbSuffix.isPresent() && suffix != null) {
      if (cbSuffix.get().isEmpty()) {
        generatedName += suffix;
      }
      if (cbSuffix.get().length() == 2) {
        generatedName = name.substring(0, name.length() - 2) + suffix;
      }
    }
    Locality locality =  VisitorHelper.buildNameRangeLocality(context, name, uri);
    locality.setCopybookId(copybookId);
    return new VariableNameAndLocality(generatedName, locality);
  }

  private List<ValueClause> retrieveValues(List<VariableParser.DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(VariableParser.DataValueClauseContext context) {
    return new ValueClause(
            VisitorHelper.retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()), retrieveRangeLocality(context));
  }

  private List<OccursClause> retrieveOccursValues(List<VariableParser.DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
            .map(this::toOccursClause)
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(VariableParser.DataOccursClauseContext ctx) {
    return ofNullable(VisitorHelper.getInteger(ctx.integerLiteral()))
            .map(
                    intLit ->
                            new OccursClause(intLit, VisitorHelper.retrieveOccursToValue(ctx).orElse(null), false,
                                    retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(VariableParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
            .map(VariableParser.IndexNameContext::cobolWord)
            .map(this::extractNameAndLocality)
            .collect(toList());
  }
}
