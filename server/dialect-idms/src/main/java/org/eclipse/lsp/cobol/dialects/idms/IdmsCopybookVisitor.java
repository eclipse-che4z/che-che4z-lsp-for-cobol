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

package org.eclipse.lsp.cobol.dialects.idms;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.dialects.idms.IdmsParserHelper.*;

import com.google.common.collect.ImmutableList;
import java.util.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.OccursClause;
import org.eclipse.lsp.cobol.common.model.tree.variable.ValueClause;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This extension of {@link IdmsCopyParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link IdmsCopyParser} for IDMS copybooks.
 */
@Slf4j
@RequiredArgsConstructor
class IdmsCopybookVisitor extends IdmsCopyParserBaseVisitor<List<Node>> {
  private final CopybookService copybookService;
  private final CopybookProcessingMode copybookProcessingMode;
  private final IdmsCopybookService idmsCopybookService;
  private final String programDocumentUri;
  private final String documentUri;
  private final int parentLevel;
  private final Set<CopybookName> processedCopybooks;
  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  private int firstCopybookLevel = 0;

  IdmsCopybookVisitor(CopybookService copybookService,
                      CopybookProcessingMode copybookProcessingMode,
                      ParseTreeListener treeListener,
                      MessageService messageService,
                      String programDocumentUri,
                      String documentUri,
                      int parentLevel,
                      Set<CopybookName> processedCopybooks) {
    this.copybookService = copybookService;
    this.copybookProcessingMode = copybookProcessingMode;
    this.programDocumentUri = programDocumentUri;
    this.documentUri = documentUri;
    this.parentLevel = parentLevel;
    this.processedCopybooks = processedCopybooks;
    idmsCopybookService = new IdmsCopybookService(programDocumentUri, copybookService,
            copybookProcessingMode, treeListener, messageService, processedCopybooks);
  }

  @Override
  public List<Node> visitCopyIdmsStatement(IdmsCopyParser.CopyIdmsStatementContext ctx) {
    IdmsCopyParser.CopyIdmsSourceContext optionsContext = ctx.copyIdmsOptions().copyIdmsSource();
    String nameToken = optionsContext.getText().toUpperCase();
    CopybookName copybookName = new CopybookName(StringUtils.trimQuotes(nameToken), IdmsDialect.NAME);

    ResultWithErrors<CopybookModel> resolvedCopybook = copybookService.resolve(
            copybookName.toCopybookId(programDocumentUri),
            copybookName,
            programDocumentUri,
            documentUri,
            true);
    CopybookModel copybookModel = resolvedCopybook.getResult();
    Locality locality = IdmsParserHelper.buildNameRangeLocality(optionsContext, copybookName.getDisplayName(), documentUri);
    errors.addAll(resolvedCopybook.getErrors());
    return idmsCopybookService.processCopybook(copybookModel, calculateLevel(getLevel(ctx)), locality)
        .unwrap(errors::addAll);
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(IdmsCopyParser.DataDescriptionEntryFormat1Context ctx) {
    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(calculateLevel(VisitorHelper.getLevel(ctx.levelNumber().LEVEL_NUMBER())))
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
            .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
            .isJustified(!ctx.dataJustifiedClause().isEmpty())
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
            .map(dataRenamesClauseContext -> dataRenamesClauseContext.qualifiedVariableDataName()
                    .dataName()
                    .stream()
                    .map(IdmsCopyParser.DataNameContext.class::cast)
                    .map(this::extractNameAndLocality).collect(toList()))
            .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
            .map(thruDataNameContext -> thruDataNameContext.qualifiedVariableDataName().dataName().stream()
                    .map(IdmsCopyParser.DataNameContext.class::cast)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
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
            .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
            .isJustified(!ctx.dataJustifiedClause().isEmpty())
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

  private int getLevel(IdmsCopyParser.CopyIdmsStatementContext ctx) {
    return Optional.ofNullable(ctx.LEVEL_NUMBER())
        .map(ParseTree::getText)
        .map(Integer::parseInt)
        .orElse(0);
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
        .uri(documentUri)
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
    String name = VisitorHelper.getName(context);
    return new VariableNameAndLocality(name, buildNameRangeLocality(context, name, documentUri));
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
                new OccursClause(intLit, retrieveOccursToValue(ctx).orElse(null), false, retrieveIndexNames(ctx)));
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
