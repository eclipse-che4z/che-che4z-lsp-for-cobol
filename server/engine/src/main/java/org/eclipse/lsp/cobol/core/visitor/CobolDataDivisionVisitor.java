/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.DivisionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.core.CobolDataDivisionParser;
import org.eclipse.lsp.cobol.core.CobolDataDivisionParserBaseVisitor;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * Visitor for Data Division ANTLR parser results
 */
@Slf4j
public class CobolDataDivisionVisitor extends CobolDataDivisionParserBaseVisitor<List<Node>> {
  private final ExtendedDocument extendedDocument;
  private final CopybooksRepository copybooks;
  private final MessageService messageService;
  private final Map<String, CobolParser.FileControlEntryContext> fileControls;
  @Getter
  private final List<SyntaxError> errors = new ArrayList<>();
  public CobolDataDivisionVisitor(
          ExtendedDocument extendedDocument,
          CopybooksRepository copybooks,
          MessageService messageService,
          Map<String, CobolParser.FileControlEntryContext> fileControls) {
    this.extendedDocument = extendedDocument;
    this.copybooks = copybooks;
    this.messageService = messageService;
    this.fileControls = fileControls;
  }

  @Override
  public List<Node> visitDataDivision(CobolDataDivisionParser.DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(ctx, location -> new DivisionNode(location, DivisionType.DATA_DIVISION));
  }

  @Override
  public List<Node> visitQualifiedDataName(CobolDataDivisionParser.QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(CobolDataDivisionParser.VariableUsageNameContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality, isVariableDefinitionMandatory(ctx)));
  }

  @Override
  public List<Node> visitDataDivisionSection(CobolDataDivisionParser.DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitFileSection(CobolDataDivisionParser.FileSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.FILE));
  }

  @Override
  public List<Node> visitWorkingStorageSection(CobolDataDivisionParser.WorkingStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.WORKING_STORAGE));
  }


  @Override
  public List<Node> visitLinkageSection(CobolDataDivisionParser.LinkageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LINKAGE));
  }

  @Override
  public List<Node> visitLocalStorageSection(CobolDataDivisionParser.LocalStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LOCAL_STORAGE));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(
          CobolDataDivisionParser.DataDescriptionEntryFormat1Context ctx) {
    VariableDefinitionNode variableDefinitionNode =
            VariableDefinitionNode.builder()
                    .level(getLevel(ctx.levelNumber().LEVEL_NUMBER()))
                    .levelLocality(getLevelLocality(ctx.levelNumber().LEVEL_NUMBER()))
                    .statementLocality(retrieveLocality(ctx).orElse(null))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .global(!ctx.dataGlobalClause().isEmpty())
                    .picClauses(retrievePicTexts(ctx.dataPictureClause()))
                    .valueClauses(retrieveValues(ctx.dataValueClause()))
                    .usageClauses(retrieveUsageFormat(ctx.dataUsageClause()))
                    .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
                    .redefinesClauses(
                            ctx.dataRedefinesClause().stream()
                                    .map(CobolDataDivisionParser.DataRedefinesClauseContext::dataName)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
                    .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
                    .signClause(!ctx.dataSignClause().isEmpty())
                    .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
                    .isJustified(!ctx.dataJustifiedClause().isEmpty())
                    .isUnBounded(
                            !ctx.dataOccursClause().isEmpty()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo()).isPresent()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo().UNBOUNDED())
                                    .isPresent())
                    .build();

    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitFileDescriptionEntry(
          CobolDataDivisionParser.FileDescriptionEntryContext ctx) {
    if (ctx.fileDescriptionEntryClauses() == null) {
      return ImmutableList.of();
    }

    areaAWarning(ctx.getStart());
    String fileControlClause = "";
    String fileName = getName(ctx.fileDescriptionEntryClauses().cobolWord());
    if (fileControls.containsKey(fileName)) {
      CobolParser.FileControlEntryContext fileControlEntryContext = fileControls.remove(fileName);
      fileControlClause = getIntervalText(fileControlEntryContext.fileControlClauses());
    }

    return addTreeNode(
            VariableDefinitionNode.builder()
                    .level(LEVEL_FD_SD)
                    .variableNameAndLocality(
                            extractNameAndLocality(ctx.fileDescriptionEntryClauses().cobolWord()))
                    .statementLocality(
                            retrieveLocality(ctx.fileDescriptionEntryClauses().cobolWord()).orElse(null))
                    .fileDescriptor(getIntervalText(ctx.fileDescriptionEntryClauses()))
                    .fileControlClause(fileControlClause)
                    .isSortDescription(Objects.nonNull(ctx.fileDescriptionEntryClauses().SD()))
                    .isExternal(isFDExternal(ctx))
                    .global(isFeildDescriptionEntryGlobal(ctx))
                    .build(),
            visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(
          CobolDataDivisionParser.DataDescriptionEntryFormat2Context ctx) {
    VariableDefinitionNode.Builder builder =
            VariableDefinitionNode.builder()
                    .level(LEVEL_66)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveLocality(ctx).orElse(null));

    ofNullable(ctx.dataRenamesClause())
            .map(
                    dataRenamesClauseContext ->
                            dataRenamesClauseContext.qualifiedVariableDataName().dataName().stream()
                                    .map(CobolDataDivisionParser.DataNameContext.class::cast)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
            .ifPresent(builder::renamesClause);

    ofNullable(ctx.dataRenamesClause())
            .map(CobolDataDivisionParser.DataRenamesClauseContext::thruDataName)
            .map(
                    thruDataNameContext ->
                            thruDataNameContext.qualifiedVariableDataName().dataName().stream()
                                    .map(CobolDataDivisionParser.DataNameContext.class::cast)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
            .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
          CobolDataDivisionParser.DataDescriptionEntryFormat1Level77Context ctx) {
    VariableDefinitionNode variableDefinitionNode =
            VariableDefinitionNode.builder()
                    .level(LEVEL_77)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_77()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveLocality(ctx).orElse(null))
                    .global(!ctx.dataGlobalClause().isEmpty())
                    .picClauses(retrievePicTexts(ctx.dataPictureClause()))
                    .valueClauses(retrieveValues(ctx.dataValueClause()))
                    .usageClauses(retrieveUsageFormat(ctx.dataUsageClause()))
                    .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
                    .redefinesClauses(
                            ctx.dataRedefinesClause().stream()
                                    .map(CobolDataDivisionParser.DataRedefinesClauseContext::dataName)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
                    .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
                    .signClause(!ctx.dataSignClause().isEmpty())
                    .isJustified(!ctx.dataJustifiedClause().isEmpty())
                    .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
                    .isUnBounded(
                            !ctx.dataOccursClause().isEmpty()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo()).isPresent()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo().UNBOUNDED())
                                    .isPresent())
                    .build();
    return addTreeNode(variableDefinitionNode, visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(
          CobolDataDivisionParser.DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
            .map(CobolDataDivisionParser.DataValueClauseContext::valueIsToken)
            .map(
                    valueToken ->
                            addTreeNode(
                                    VariableDefinitionNode.builder()
                                            .level(LEVEL_88)
                                            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_88()))
                                            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                                            .statementLocality(retrieveLocality(ctx).orElse(null))
                                            .valueClauses(retrieveValues(ImmutableList.of(ctx.dataValueClause())))
                                            .valueToken(retrieveValueToken(valueToken))
                                            .build(),
                                    visitChildren(ctx)))
            .orElse(ImmutableList.of());
  }

  private Optional<Locality> retrieveLocality(ParserRuleContext ctx) {
    return retrieveRangeLocality(ctx)
            .map(extendedDocument::mapLocation)
            .map(this::locationToLocality);
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .copybookId(copybooks.getCopybookIdByUri(location.getUri()))
            .build();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    List<Node> result = new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    try {
      Location location = extendedDocument.mapLocation(buildTokenRange(terminalNode.getSymbol()));
      return locationToLocality(location);
    } catch (IllegalStateException e) {
      LOG.debug(
              "Node: {} with range: {} has issue with the mapping",
              terminalNode,
              buildTokenRange(terminalNode.getSymbol()));
      throw e;
    }
  }

  private List<ValueClause> retrieveValues(
          List<CobolDataDivisionParser.DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(CobolDataDivisionParser.DataValueClauseContext context) {
    return new ValueClause(
            retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()),
            getLocality(context.getStart()).orElse(null));
  }

  private Optional<Locality> getLocality(Token childToken) {
    Location location = extendedDocument.mapLocation(buildTokenRange(childToken));
    return ofNullable(locationToLocality(location));
  }

  private VariableNameAndLocality extractNameAndLocality(
          CobolDataDivisionParser.EntryNameContext context) {
    if (context == null || context.dataName() == null) return null;
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(
          CobolDataDivisionParser.DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(
          CobolDataDivisionParser.CobolWordContext context) {
    return new VariableNameAndLocality(getName(context), retrieveLocality(context).orElse(null));
  }

  private List<OccursClause> retrieveOccursValues(
          List<CobolDataDivisionParser.DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
            .map(this::toOccursClause)
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(
          CobolDataDivisionParser.DataOccursClauseContext ctx) {
    return ofNullable(VisitorHelper.getInteger(ctx.integerLiteral()))
            .map(
                    intLit ->
                            new OccursClause(
                                    intLit,
                                    retrieveOccursToValue(ctx).orElse(null),
                                    Optional.ofNullable(ctx.dataOccursTo())
                                            .map(CobolDataDivisionParser.DataOccursToContext::UNBOUNDED)
                                            .isPresent(),
                                    retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(
          CobolDataDivisionParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
            .map(CobolDataDivisionParser.IndexNameContext::cobolWord)
            .map(this::extractNameAndLocality)
            .collect(toList());
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) return children;
    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx)
            .map(constructNode(nodeConstructor, children))
            .orElse(children);
  }

  private boolean isFDExternal(CobolDataDivisionParser.FileDescriptionEntryContext ctx) {
    return Objects.nonNull(ctx.fileDescriptionEntryClauses())
            && ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause().stream()
            .map(CobolDataDivisionParser.FileDescriptionEntryClauseContext::externalClause)
            .anyMatch(Objects::nonNull);
  }

  private boolean isFeildDescriptionEntryGlobal(
          CobolDataDivisionParser.FileDescriptionEntryContext ctx) {
    return !ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause().isEmpty()
            && Objects.nonNull(
            ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause(0).globalClause())
            && !ctx.fileDescriptionEntryClauses()
            .fileDescriptionEntryClause(0)
            .globalClause()
            .isEmpty();
  }

  @Override
  public List<Node> visitChildren(RuleNode node) {
    checkInterruption();
    return super.visitChildren(node);
  }

  private boolean isVariableDefinitionMandatory(CobolDataDivisionParser.VariableUsageNameContext ctx) {
    Boolean isDataRecordClause = ofNullable(ctx.getParent())
            .map(ParserRuleContext::getParent)
            .map(CobolDataDivisionParser.DataRecordsClauseContext.class::isInstance)
            .orElse(false);
    return !isDataRecordClause;
  }
  private void areaAWarning(Token token) {
    // skip area A check for cics and sql block
    if (token.getText().startsWith("EXEC")) {
      return;
    }
    getLocality(token)
            .filter(it -> it.getRange().getStart().getCharacter() > AREA_A_FINISH)
            .ifPresent(
                    it ->
                            throwException(
                                    token.getText(),
                                    it,
                                    messageService.getMessage("CobolVisitor.AreaAWarningMsg")));
  }
  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(locality.toOriginalLocation())
                    .suggestion(message + wrongToken)
                    .severity(ErrorSeverity.WARNING)
                    .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
    if (!errors.contains(error) && !wrongToken.equals(CobolDialect.FILLER)) {
      errors.add(error);
    }
  }

}
