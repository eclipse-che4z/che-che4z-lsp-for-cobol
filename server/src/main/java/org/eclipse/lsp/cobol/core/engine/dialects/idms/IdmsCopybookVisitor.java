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
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.IdmsCopyParser;
import org.eclipse.lsp.cobol.core.IdmsCopyParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.*;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;
import static org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsParserHelper.*;

/**
 * This extension of {@link IdmsCopyParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link IdmsCopyParser} for IDMS copybooks.
 */
@Slf4j
@RequiredArgsConstructor
public class IdmsCopybookVisitor extends IdmsCopyParserBaseVisitor<List<Node>> {
  private final String uri;
  private final int parentLevel;

  private int firstCopybookLevel = 0;

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(IdmsCopyParser.DataDescriptionEntryFormat1Context ctx) {
    return addTreeNode(
        VariableDefinitionNode.builder()
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
                    .map(IdmsCopyParser.DataRedefinesClauseContext::dataName)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .build(),
        visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(IdmsCopyParser.DataDescriptionEntryFormat2Context ctx) {
    VariableDefinitionNode.Builder builder =
        VariableDefinitionNode.builder()
            .level(LEVEL_66)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveRangeLocality(ctx));
    ofNullable(ctx.dataRenamesClause())
        .map(IdmsCopyParser.DataRenamesClauseContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
        .map(IdmsCopyParser.DataRenamesClauseContext::thruDataName)
        .map(IdmsCopyParser.ThruDataNameContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
      IdmsCopyParser.DataDescriptionEntryFormat1Level77Context ctx) {
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
                    .map(IdmsCopyParser.DataRedefinesClauseContext::dataName)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
            .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
            .signClause(!ctx.dataSignClause().isEmpty())
            .build(),
        visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(IdmsCopyParser.DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
        .map(IdmsCopyParser.DataValueClauseContext::valueIsToken)
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
  public List<Node> visitFileDescriptionEntry(IdmsCopyParser.FileDescriptionEntryContext ctx) {
    if (ctx.fileDescriptionEntryClauses() == null || ctx.fileDescriptionEntryClauses().cobolWord() == null) {
      return ImmutableList.of();
    }
    String fileControlClause = "";
    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(LEVEL_FD_SD)
            .variableNameAndLocality(
                extractNameAndLocality(ctx.fileDescriptionEntryClauses().cobolWord()))
            .statementLocality(retrieveRangeLocality(ctx.fileDescriptionEntryClauses().cobolWord()))
            .fileDescriptor(getIntervalText(ctx.fileDescriptionEntryClauses()))
            .fileControlClause(fileControlClause)
            .isSortDescription(Objects.nonNull(ctx.fileDescriptionEntryClauses().SD()))
            .build(),
        visitChildren(ctx));
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
    if (parentLevel != 0) {
      if (firstCopybookLevel == 0) {
        firstCopybookLevel = level;
        return parentLevel;
      }
      return level - firstCopybookLevel + parentLevel;
    }
    return level;
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) return children;

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

  private VariableNameAndLocality extractNameAndLocality(IdmsCopyParser.EntryNameContext context) {
    if (context == null || context.dataName() == null) return null;
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(IdmsCopyParser.DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(IdmsCopyParser.CobolWordContext context) {
    String name = getName(context);
    return new VariableNameAndLocality(name, buildNameRangeLocality(context, name, uri));
  }

  private List<ValueClause> retrieveValues(List<IdmsCopyParser.DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(IdmsCopyParser.DataValueClauseContext context) {
    return new ValueClause(
        retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()), retrieveRangeLocality(context));
  }

  private List<OccursClause> retrieveOccursValues(List<IdmsCopyParser.DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
        .map(this::toOccursClause)
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(IdmsCopyParser.DataOccursClauseContext ctx) {
    return ofNullable(getInteger(ctx.integerLiteral()))
        .map(
            intLit ->
                new OccursClause(intLit, retrieveOccursToValue(ctx).orElse(null), retrieveIndexNames(ctx)));
  }

  private Integer getInteger(IdmsCopyParser.IntegerLiteralContext context) {
    return ofNullable(context)
        .map(ParserRuleContext::getText)
        .filter(it -> !it.isEmpty())
        .map(Integer::parseInt)
        .orElse(null);
  }

  private List<VariableNameAndLocality> retrieveIndexNames(IdmsCopyParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
        .map(IdmsCopyParser.IndexNameContext::cobolWord)
        .map(this::extractNameAndLocality)
        .collect(toList());
  }

}
