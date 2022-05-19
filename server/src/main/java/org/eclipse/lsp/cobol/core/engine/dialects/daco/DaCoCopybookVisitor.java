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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import com.google.common.collect.ImmutableList;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.CobolParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.OccursClause;
import org.eclipse.lsp.cobol.core.model.tree.variables.ValueClause;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * DaCoCopybookVisitor
 */
@RequiredArgsConstructor
public class DaCoCopybookVisitor extends CobolParserBaseVisitor<List<Node>> {
  public static final int LEVEL_66 = 66;
  public static final int LEVEL_77 = 77;
  public static final int LEVEL_88 = 88;
  private final String uri;
  private final int startingLevel;
  private final String suffix;
  private int firstCopybookLevel = 0;

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(CobolParser.DataDescriptionEntryFormat1Context ctx) {
    VariableDefinitionNode variableDefinitionNode = VariableDefinitionNode.builder()
            .level(calculateLevel(getLevel(ctx.levelNumber().LEVEL_NUMBER())))
            .levelLocality(getLevelLocality(ctx.levelNumber().LEVEL_NUMBER()))
            .statementLocality(retrieveRangeLocality(ctx))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .global(!ctx.dataGlobalClause().isEmpty())
            .picClauses(retrievePicTexts(ctx.dataPictureClause()))
            .valueClauses(retrieveValues(ctx.dataValueClause()))
            .usageClauses(retrieveUsageFormat(ctx.dataUsageClause()))
            .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
            .redefinesClauses(
                    ctx.dataRedefinesClause().stream()
                            .map(CobolParser.DataRedefinesClauseContext::dataName)
                            .map(this::extractNameAndLocality)
                            .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .build();

    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(CobolParser.DataDescriptionEntryFormat2Context ctx) {
    VariableDefinitionNode.Builder builder =
            VariableDefinitionNode.builder()
                    .level(LEVEL_66)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveRangeLocality(ctx));
    ofNullable(ctx.dataRenamesClause())
            .map(CobolParser.DataRenamesClauseContext::qualifiedVariableDataName)
            .map(this::extractNameAndLocality);
    ofNullable(ctx.dataRenamesClause())
            .map(CobolParser.DataRenamesClauseContext::thruDataName)
            .map(CobolParser.ThruDataNameContext::qualifiedVariableDataName)
            .map(this::extractNameAndLocality);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
          CobolParser.DataDescriptionEntryFormat1Level77Context ctx) {
    VariableDefinitionNode variableDefinitionNode = VariableDefinitionNode.builder()
            .level(LEVEL_77)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_77()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveRangeLocality(ctx))
            .global(!ctx.dataGlobalClause().isEmpty())
            .picClauses(retrievePicTexts(ctx.dataPictureClause()))
            .valueClauses(retrieveValues(ctx.dataValueClause()))
            .usageClauses(retrieveUsageFormat(ctx.dataUsageClause()))
            .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
            .redefinesClauses(
                    ctx.dataRedefinesClause().stream()
                            .map(CobolParser.DataRedefinesClauseContext::dataName)
                            .map(this::extractNameAndLocality)
                            .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .build();
    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(CobolParser.DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
            .map(CobolParser.DataValueClauseContext::valueIsToken)
            .map(
                    valueToken ->
                            addTreeNode(
                                    VariableDefinitionNode.builder()
                                            .level(LEVEL_88)
                                            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_88()))
                                            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                                            .statementLocality(retrieveRangeLocality(ctx))
                                            .valueClauses(retrieveValues(ImmutableList.of(ctx.dataValueClause())))
                                            .valueToken(retrieveValueToken(valueToken))
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
            .build();
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    return Locality.builder()
            .range(new Range(
                    new Position(terminalNode.getSymbol().getLine(), terminalNode.getSymbol().getCharPositionInLine()),
                    new Position(terminalNode.getSymbol().getLine(), terminalNode.getSymbol().getCharPositionInLine())))
            .build();
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.EntryNameContext context) {
    if (context == null || context.dataName() == null) {
      return null;
    }
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.QualifiedVariableDataNameContext context) {
    return extractNameAndLocality(context.dataName().get(0).cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.CobolWordContext context) {
    String name = getName(context);
    return new VariableNameAndLocality(name + (suffix == null ? "" : suffix), buildNameRangeLocality(context, name, uri));
  }

  private List<ValueClause> retrieveValues(List<CobolParser.DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(CobolParser.DataValueClauseContext context) {
    return new ValueClause(
            retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()), retrieveRangeLocality(context));
  }

  private List<OccursClause> retrieveOccursValues(List<CobolParser.DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
            .map(this::toOccursClause)
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(CobolParser.DataOccursClauseContext ctx) {
    return ofNullable(VisitorHelper.getInteger(ctx.integerLiteral()))
            .map(
                    intLit ->
                            new OccursClause(intLit, retrieveOccursToValue(ctx).orElse(null), retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(CobolParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
            .map(CobolParser.IndexNameContext::cobolWord)
            .map(this::extractNameAndLocality)
            .collect(toList());
  }
}
