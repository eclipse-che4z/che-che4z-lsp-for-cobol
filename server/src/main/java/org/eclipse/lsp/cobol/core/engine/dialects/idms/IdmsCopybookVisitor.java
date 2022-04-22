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

package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
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

import java.util.List;
import java.util.Optional;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser} for IDMS copybooks.
 */
@Slf4j
@AllArgsConstructor
public class IdmsCopybookVisitor extends CobolParserBaseVisitor<List<Node>>  {
  private final CommonTokenStream tokenStream;

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(CobolParser.DataDescriptionEntryFormat1Context ctx) {
    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(getLevel(ctx.levelNumber().LEVEL_NUMBER()))
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
            .build(),
        visitChildren(ctx));
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
        .map(CobolParser.DataRenamesClauseContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
        .map(CobolParser.DataRenamesClauseContext::thruDataName)
        .map(CobolParser.ThruDataNameContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
      CobolParser.DataDescriptionEntryFormat1Level77Context ctx) {
    return addTreeNode(
        VariableDefinitionNode.builder()
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
            .build(),
        visitChildren(ctx));
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

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) return children;

    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality retrieveRangeLocality(ParserRuleContext ctx) {
    Range range = new Range(
        new Position(ctx.start.getLine(), ctx.start.getCharPositionInLine()),
        new Position(ctx.stop.getLine(), ctx.stop.getCharPositionInLine()));

    return Locality.builder()
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
    if (context == null || context.dataName() == null) return null;
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolParser.CobolWordContext context) {
    return new VariableNameAndLocality(
        getName(context), retrieveRangeLocality(context));
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
                new OccursClause(intLit, retrieveOccursToValue(ctx), retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(CobolParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
        .map(CobolParser.IndexNameContext::cobolWord)
        .map(this::extractNameAndLocality)
        .collect(toList());
  }

}
