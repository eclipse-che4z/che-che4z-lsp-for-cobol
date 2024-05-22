/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.*;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToBooleanStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToOnOffStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetUpDownByStatement;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.MisspelledKeywordDistance;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Lexer.HIDDEN;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.core.CobolProcedureDivisionParser.*;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * Visitor for Procedure Division ANTLR parser results
 */
@Slf4j
public class CobolProcedureDivisionVisitor extends CobolProcedureDivisionParserBaseVisitor<List<Node>> {

  @Getter
  private final List<SyntaxError> errors = new ArrayList<>();
  private final CopybooksRepository copybooks;
  private final CommonTokenStream tokenStream;
  private final ExtendedDocument extendedDocument;
  private final MessageService messageService;
  private final SubroutineService subroutineService;

  private final Map<String, SubroutineDefinition> subroutineDefinitionMap = new HashMap<>();
  private final CachingConfigurationService cachingConfigurationService;
  private final CobolProgramLayout programLayout;

  public CobolProcedureDivisionVisitor(
          @NonNull CopybooksRepository copybooks,
          @NonNull CommonTokenStream tokenStream,
          @NonNull ExtendedDocument extendedDocument,
          MessageService messageService,
          SubroutineService subroutineService,
          CachingConfigurationService cachingConfigurationService,
          CobolProgramLayout programLayout) {

    this.copybooks = copybooks;
    this.tokenStream = tokenStream;
    this.extendedDocument = extendedDocument;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.programLayout = programLayout;
  }

  @Override
  public List<Node> visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
            ctx, location -> new DivisionNode(location, DivisionType.PROCEDURE_DIVISION));
  }

  @Override
  public List<Node> visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());

    String name = ctx.getStart().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx,
                                    locality ->
                                            new ProcedureSectionNode(locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());

    String name = ctx.paragraphDefinitionName().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx, locality -> new ParagraphNode(locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitXmlParseStatement(XmlParseStatementContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.qualifiedDataName().getText(), retrieveLocality(ctx.qualifiedDataName()).orElse(null));

    VariableNameAndLocality xmlValidatingContext = ofNullable(ctx.xmlValidating())
            .map(c -> new VariableNameAndLocality(c.getText(), retrieveLocality(c).orElse(null)))
            .orElse(null);

    VariableNameAndLocality xmlNationalContext = ofNullable(ctx.xmlNational())
            .map(c -> new VariableNameAndLocality(c.getText(), retrieveLocality(c).orElse(null)))
            .orElse(null);

    VariableNameAndLocality identifier2 = ofNullable(ctx.xmlValidating())
            .map(XmlValidatingContext::qualifiedDataName)
            .map(qualCtx -> new VariableNameAndLocality(qualCtx.getText(),
                    retrieveLocality(qualCtx).orElse(null)))
            .orElse(null);

    VariableNameAndLocality encodingLocality = ofNullable(ctx.xmlEncoding()).map(ctx2 ->
                    new VariableNameAndLocality(ctx2.integerLiteral().getText(), retrieveLocality(ctx2).orElse(null)))
            .orElse(null);

    ProcedureName procName = parseProcedureName(Optional.ofNullable(ctx.xmlProcessinProcedure())
        .map(XmlProcessinProcedureContext::procedureName)
        .orElse(null));

    ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
        .map(ThroughContext::procedureName)
        .orElse(null));

    return addTreeNode(
            ctx,
            locality ->
                    new XMLParseNode(
                            locality,
                            identifier1,
                            identifier2,
                            encodingLocality,
                            xmlValidatingContext,
                            xmlNationalContext,
                            procName,
                            thru)
                    );
  }

  @Override
  public List<Node> visitOnExceptionClause(OnExceptionClauseContext ctx) {
    return addTreeNode(ctx, OnExceptionNode::new);
  }

  @Override
  public List<Node> visitNotOnExceptionClause(NotOnExceptionClauseContext ctx) {
    return addTreeNode(ctx, OnNotExceptionNode::new);
  }

  @Override
  public List<Node> visitUseStatement(UseStatementContext ctx) {
    return ctx.useDebugClause() != null
        ?
        addTreeNode(ctx, l -> new UseForDebuggingNode(l, null))
        :
        addTreeNode(ctx, UseNode::new);
  }

  /**
   * In this method, first condition is checking if there is any other element present on the same
   * line as DECLARATIVES token and throws an error if the condition is true; In the PROCEDURE
   * DIVISION, each of the keywords DECLARATIVES and END DECLARATIVES must begin in Area A and be
   * followed immediately by a separator period; no other text can appear on the same line. After
   * the keywords END DECLARATIVES, no text can appear before the following section header.
   */
  @Override
  public List<Node> visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
    Token firstDeclarative = ctx.getStart();
    int firstDeclLine = firstDeclarative.getLine();

    if (!ctx.procedureDeclarative().isEmpty()) {
      Token declarativeBody = ctx.procedureDeclarative(0).getStart();
      if (firstDeclLine == declarativeBody.getLine()) {
        getLocality(declarativeBody)
                .ifPresent(
                        locality ->
                                throwException(
                                        declarativeBody.getText(),
                                        locality,
                                        messageService.getMessage("CobolVisitor.declarativeSameMsg")));
      }
    }

    areaAWarning(firstDeclarative);

    ofNullable(ctx.END()).map(TerminalNode::getSymbol).ifPresent(this::areaAWarning);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitProcedureDeclarative(ProcedureDeclarativeContext ctx) {
    String name = ctx.getStart().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx,
                                    locality ->
                                            new DeclarativeProcedureSectionNode(
                                                    locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitJsonParse(JsonParseContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.jsonIdentifier1().getText(), retrieveLocality(ctx.jsonIdentifier1()).orElse(null));

    VariableNameAndLocality identifier2 = new VariableNameAndLocality(
            ctx.jsonIdentifier2().getText(), retrieveLocality(ctx.jsonIdentifier2()).orElse(null));

    List<VariableNameAndLocality> identifier3 = ctx.jsonIdentifier3().isEmpty()
            ? null
            : ctx.jsonIdentifier3().stream()
            .map(iden3 -> new VariableNameAndLocality(iden3.getText(), retrieveLocality(iden3).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier4 = ctx.jsonIdentifier4().isEmpty()
            ? null
            : ctx.jsonIdentifier4().stream()
            .map(iden4 -> new VariableNameAndLocality(iden4.getText(), retrieveLocality(iden4).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier5 =
            ctx.json_parse_phrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().stream()
                    .map(Json_parse_phrase1Context::jsonIdentifier5)
                    .filter(Objects::nonNull)
                    .map(idctx -> new VariableNameAndLocality(idctx.getText(), retrieveLocality(idctx).orElse(null)))
                    .collect(Collectors.toList());

    List<VariableNameAndLocality> conditionName =
            ctx.json_parse_phrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().get(0).callUsingPhrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().get(0).callUsingPhrase1().jsonConditionName().stream()
                    .map(
                            context ->
                                    new VariableNameAndLocality(
                                            context.getText(), retrieveLocality(context).orElse(null)))
                    .collect(toList());

    boolean isOmitted = Objects.nonNull(ctx.OMITTED()) && !ctx.OMITTED().isEmpty();

    return addTreeNode(
            ctx,
            locality ->
                    new JsonParseNode(
                            locality,
                            identifier1,
                            identifier2,
                            identifier3,
                            identifier4,
                            identifier5,
                            conditionName,
                            isOmitted));
  }

  @Override
  public List<Node> visitJsonGenerate(JsonGenerateContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.jsonGenIdentifier1().getText(), retrieveLocality(ctx.jsonGenIdentifier1()).orElse(null));

    VariableNameAndLocality identifier2 = new VariableNameAndLocality(
            ctx.jsonGenIdentifier2().getText(), retrieveLocality(ctx.jsonGenIdentifier2()).orElse(null));

    VariableNameAndLocality identifier3 = Optional.ofNullable(ctx.jsonGenIdentifier3())
            .map(iden3 -> new VariableNameAndLocality(iden3.getText(), retrieveLocality(iden3).orElse(null)))
            .orElse(null);

    List<VariableNameAndLocality> identifier4 = ctx.jsonGenIdentifier4().isEmpty()
            ? null
            : ctx.jsonGenIdentifier4().stream()
            .map(iden4 -> new VariableNameAndLocality(iden4.getText(), retrieveLocality(iden4).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier5 = ctx.jsonGenIdentifier5().isEmpty()
            ? null
            : ctx.jsonGenIdentifier5().stream()
            .map(iden5 -> new VariableNameAndLocality(iden5.getText(), retrieveLocality(iden5).orElse(null)))
            .collect(Collectors.toList());

    List<JsonGenerateNode.JsonGenPhase> phases = ctx.json_gen_phrase1().isEmpty()
            ? null
            : ctx.json_gen_phrase1().stream()
            .filter(idctx -> Objects.nonNull(idctx.jsonGenIdentifier6()))
            .map(idctx -> new JsonGenerateNode.JsonGenPhase(
                    new VariableNameAndLocality(idctx.jsonGenIdentifier6().getText(),
                            retrieveLocality(idctx.jsonGenIdentifier6()).orElse(null)),
                    Objects.nonNull(idctx.jsonGenConditionName()) ? new VariableNameAndLocality(idctx.jsonGenConditionName().getText(),
                            retrieveLocality(idctx.jsonGenConditionName()).orElse(null)) : null
            ))
            .collect(Collectors.toList());

    return addTreeNode(
            ctx,
            locality ->
                    new JsonGenerateNode(
                            locality,
                            identifier1,
                            identifier2,
                            identifier3,
                            identifier4,
                            identifier5,
                            phases));
  }

  @Override
  public List<Node> visitSectionName(SectionNameContext ctx) {
    return addTreeNode(
            ctx, locality -> new SectionNameNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitStatement(StatementContext ctx) {
    areaBWarning(ctx);
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIfThen(IfThenContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIfElse(IfElseContext ctx) {
    throwWarning(ctx.getStart());
    return addTreeNode(ctx, IfElseNode::new);
  }

  @Override
  public List<Node> visitOpenInputStatement(OpenInputStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (OpenInputContext openInputContext : ctx.openInput()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(openInputContext.fileName().getText().toUpperCase(),
                      retrieveLocality(openInputContext.fileName()).orElse(null));
      nodes.addAll(addTreeNode(ctx, locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.INPUT)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenOutputStatement(OpenOutputStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (OpenOutputContext openOutputContext : ctx.openOutput()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(openOutputContext.fileName().getText().toUpperCase(),
                      retrieveLocality(openOutputContext.fileName()).orElse(null));
      nodes.addAll(addTreeNode(openOutputContext,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.OUTPUT)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenIOStatement(OpenIOStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (FileNameContext fileNameContext : ctx.fileName()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(fileNameContext.getText().toUpperCase(),
                      retrieveLocality(fileNameContext).orElse(null));
      nodes.addAll(addTreeNode(ctx,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.I_O)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenExtendStatement(OpenExtendStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (FileNameContext fileNameContext : ctx.fileName()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(fileNameContext.getText().toUpperCase(),
                      retrieveLocality(fileNameContext).orElse(null));
      nodes.addAll(addTreeNode(ctx,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.EXTEND)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitReadStatement(ReadStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.readFilenameClause().fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.readFilenameClause().fileName()).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.READ_STATEMENT));
  }

  @Override
  public List<Node> visitWriteStatement(WriteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.writeStatementClause().recordName().getText().toUpperCase(),
                    retrieveLocality(ctx.writeStatementClause().recordName()).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.WRITE_STATEMENT));
  }

  @Override
  public List<Node> visitRewriteStatement(RewriteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.recordName().getText().toUpperCase(),
                    retrieveLocality(ctx.recordName()).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.REWRITE_STATEMENT));
  }

  @Override
  public List<Node> visitDeleteStatement(DeleteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.deleteFilenameClause().fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.deleteFilenameClause().fileName()).orElseGet(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.DELETE_STATEMENT));
  }

  @Override
  public List<Node> visitStartStatement(StartStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.fileName()).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.START_STATEMENT));
  }

  @Override
  public List<Node> visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    return addTreeNode(ctx, PerformNode::new);
  }

  @Override
  public List<Node> visitPerformProcedureStatement(PerformProcedureStatementContext ctx) {
    final ProcedureName targetName = parseProcedureName(ctx.procedureName());
    final ProcedureName thruName = parseProcedureName(Optional.ofNullable(ctx.through())
        .map(ThroughContext::procedureName)
        .orElse(null));
    return addTreeNode(ctx, locality -> new PerformNode(locality, targetName, thruName));
  }

  @Override
  public List<Node> visitSentence(SentenceContext ctx) {
    throwWarning(ctx.getStart());
    return addTreeNode(ctx, SentenceNode::new);
  }

  @Override
  public List<Node> visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    throwWarning(ctx.getStart());
    return addTreeNode(ctx, EvaluateWhenOtherNode::new);
  }

  @Override
  public List<Node> visitParagraphName(ParagraphNameContext ctx) {
    return addTreeNode(
            ctx, locality -> new CodeBlockUsageNode(locality, VisitorHelper.getName(ctx)));
  }

  @Override
  public List<Node> visitSetUpDownByStatement(SetUpDownByStatementContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    List<Node> sendingField =
            ofNullable(ctx.sendingField()).map(this::visit).orElseGet(ImmutableList::of);
    List<Node> children = new ArrayList<>();
    children.addAll(receivingField);
    children.addAll(sendingField);
    if (sendingField.size() != 1) return children;
    SetUpDownByStatement statement =
            new SetUpDownByStatement(
                    retrieveLocality(ctx).orElse(null),
                    receivingField,
                    sendingField.get(0));
    return addTreeNode(statement, children);
  }

  @Override
  public List<Node> visitSetToOnOff(SetToOnOffContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    SetToOnOffStatement statement =
            new SetToOnOffStatement(retrieveLocality(ctx).orElse(null), receivingField);
    return addTreeNode(statement, receivingField);
  }

  @Override
  public List<Node> visitSetToBoolean(SetToBooleanContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    SetToBooleanStatement statement =
            new SetToBooleanStatement(
                    retrieveLocality(ctx).orElse(null), receivingField);
    return addTreeNode(statement, receivingField);
  }

  @Override
  public List<Node> visitLiteral(LiteralContext ctx) {
    return addTreeNode(ctx, locality -> new LiteralNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitQualifiedDataName(QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(VariableUsageNameContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality, isVariableDefinitionMandatory(ctx)));
  }

  private boolean isVariableDefinitionMandatory(VariableUsageNameContext ctx) {
    Boolean isDataRecordClause = ofNullable(ctx.getParent())
            .map(ParserRuleContext::getParent)
            .map(CobolDataDivisionParser.DataRecordsClauseContext.class::isInstance)
            .orElse(false);
    return !isDataRecordClause;
  }

  @Override
  public List<Node> visitFileName(FileNameContext ctx) {
    return addTreeNode(
            ctx,
            locality -> {
              QualifiedReferenceNode reference = new QualifiedReferenceNode(locality);
              VariableUsageNode usage = new VariableUsageNode(getName(ctx), locality);
              reference.addChild(usage);
              return reference;
            });
  }

  @Override
  public List<Node> visitCallStatement(CallStatementContext ctx) {
    return addTreeNode(ctx, SubroutineNode::new);
  }

  @Override
  public List<Node> visitGoToStatement(GoToStatementContext ctx) {
    return addTreeNode(
            ctx,
            locality ->
                    new GoToNode(
                            locality,
                            ctx.procedureName().stream()
                                    .map(ProcedureNameContext::paragraphName)
                                    .map(ParserRuleContext::getText)
                                    .collect(toList())));
  }

  @Override
  public List<Node> visitExitStatement(ExitStatementContext ctx) {
    if (ctx.PROGRAM() != null) {
      return addTreeNode(ctx, StopNode::new);
    }
    if (ctx.SECTION() != null) {
      return addTreeNode(ctx, ExitSectionNode::new);
    }
    if (ctx.PARAGRAPH() != null) {
      return addTreeNode(ctx, ExitParagraphNode::new);
    }
    return addTreeNode(ctx, ExitNode::new);
  }

  @Override
  public List<Node> visitGobackStatement(GobackStatementContext ctx) {
    return addTreeNode(ctx, GoBackNode::new);
  }

  @Override
  public List<Node> visitStopStatement(StopStatementContext ctx) {
    return addTreeNode(ctx, StopNode::new);
  }

  @Override
  public List<Node> visitEvaluateStatement(EvaluateStatementContext ctx) {
    return addTreeNode(ctx, EvaluateNode::new);
  }

  @Override
  public List<Node> visitEvaluateWhen(EvaluateWhenContext ctx) {
    return addTreeNode(ctx, EvaluateWhenNode::new);
  }

  @Override
  public List<Node> visitIfStatement(IfStatementContext ctx) {
    return addTreeNode(ctx, IfNode::new);
  }

  @Override
  public List<Node> visitParagraphs(ParagraphsContext ctx) {
    return addTreeNode(ctx, ParagraphsNode::new);
  }

  @Override
  public List<Node> visitProcedureDivisionBody(ProcedureDivisionBodyContext ctx) {
    return addTreeNode(ctx, ProcedureDivisionBodyNode::new);
  }

  @Override
  public List<Node> visitParagraphDefinitionName(ParagraphDefinitionNameContext ctx) {
    return addTreeNode(ctx, locality -> new ParagraphNameNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitConstantName(ConstantNameContext ctx) {
    String subroutineName = StringUtils.trimQuotes(ctx.getText()).toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    locality -> {
                      if (cachingConfigurationService.getSubroutineDirectories().size() > 0
                              && !subroutineService.getUri(subroutineName).isPresent()) {
                        reportSubroutineNotDefined(subroutineName, locality);
                      }
                      subroutineDefinitionMap.putIfAbsent(
                              subroutineName,
                              new SubroutineDefinition(
                                      getSubroutineLocation(
                                              new ImmutablePair<>(
                                                      subroutineName, subroutineService.getUri(subroutineName)))
                                              .stream()
                                              .findFirst()
                                              .orElseGet(
                                                      () ->
                                                              new Location(
                                                                      ImplicitCodeUtils.createSubroutineLocation(), new Range())),
                                      subroutineName));
                      SubroutineNameNode usage = new SubroutineNameNode(locality, subroutineName);
                      SubroutineDefinition foundDefinition = subroutineDefinitionMap.get(subroutineName);
                      foundDefinition.addUsages(usage);
                      usage.setDefinition(foundDefinition);
                      return ImmutableList.of((Node) usage);
                    })
            .orElseGet(ImmutableList::of);
  }

  @Override
  public List<Node> visitChildren(RuleNode node) {
    checkInterruption();
    return super.visitChildren(node);
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

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling
   * {@link #visitChildren} on {@code ctx}.</p>
   *
   * @param ctx
   */
  @Override
  public List<Node> visitAtEndPhrase(AtEndPhraseContext ctx) {
    return addTreeNode(ctx, AtEndNode::new);
  }

  @Override
  public List<Node> visitSortStatement(SortStatementContext ctx) {
    boolean ascending;
    String key;
    if (ctx.sortOnKeyClause() != null) {
      ascending = ctx.sortOnKeyClause().stream()
          .map(s -> s.ASCENDING() != null)
          .filter(b -> b)
          .findAny()
          .orElse(false);

      key = ctx.sortOnKeyClause().stream()
          .map(SortOnKeyClauseContext::KEY)
          .filter(Objects::nonNull)
          .map(ParseTree::getText)
          .findFirst()
          .orElse("");
    } else {
      ascending = false;
      key = "";
    }

    return addTreeNode(ctx, locality -> new SortNode(locality, ascending, key));
  }

  @Override
  public List<Node> visitMergeStatement(MergeStatementContext ctx) {
    boolean ascending;
    String key;
    if (ctx.mergeOnKeyClause() != null) {
      ascending = ctx.mergeOnKeyClause().stream()
          .map(s -> s.ASCENDING() != null)
          .filter(b -> b)
          .findAny()
          .orElse(false);

      key = ctx.mergeOnKeyClause().stream()
          .map(MergeOnKeyClauseContext::KEY)
          .filter(Objects::nonNull)
          .map(ParseTree::getText)
          .findFirst()
          .orElse("");
    } else {
      ascending = false;
      key = "";
    }

    return addTreeNode(ctx, locality -> new MergeNode(locality, ascending, key));
  }

  @Override
  public List<Node> visitInputProcedurePhrase(InputProcedurePhraseContext ctx) {
    final ProcedureName procName = parseProcedureName(ctx.procedureName());
    final ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
        .map(ThroughContext::procedureName)
        .orElse(null));

    Locality locality = retrieveLocality(ctx).orElse(null);
    InputNode node = new InputNode(locality);
    node.setTarget(procName);
    node.setThru(thru);

    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  @Override
  public List<Node> visitOutputProcedurePhrase(OutputProcedurePhraseContext ctx) {
    final ProcedureName procName = parseProcedureName(ctx.procedureName());
    final ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
        .map(ThroughContext::procedureName)
        .orElse(null));

    Locality locality = retrieveLocality(ctx).orElse(null);
    OutputNode node = new OutputNode(locality);
    node.setTarget(procName);
    node.setThru(thru);

    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  @Override public List<Node> visitAlterStatement(AlterStatementContext ctx) {
    if (ctx.alterProceedTo() != null && ctx.alterProceedTo().size() > 0) {
      AlterProceedToContext alter = ctx.alterProceedTo().get(0);
      if (alter.procedureName() != null && alter.procedureName().size() == 2) {
        ProcedureNameContext from = alter.procedureName(0);
        ProcedureNameContext to = alter.procedureName(1);

        String name = Optional.ofNullable(from.paragraphName()).map(RuleContext::getText).orElse(null);
        String inSection = Optional.ofNullable(from.inSection())
            .map(InSectionContext::sectionName)
            .map(RuleContext::getText).orElse(null);
        ProcedureName alterFrom = new ProcedureName(name, inSection);

        name = Optional.ofNullable(to.paragraphName()).map(RuleContext::getText).orElse(null);
        inSection = Optional.ofNullable(to.inSection())
            .map(InSectionContext::sectionName)
            .map(RuleContext::getText).orElse(null);
        ProcedureName alterTo = new ProcedureName(name, inSection);

        Locality locality = retrieveLocality(ctx).orElse(null);
        AlterNode node = new AlterNode(locality, alterFrom, alterTo);
        visitChildren(ctx).forEach(node::addChild);

        return ImmutableList.of(node);
      }
    }
    return visitChildren(ctx);
  }

  private ProcedureName parseProcedureName(ProcedureNameContext procedureNameContext) {
    if (procedureNameContext == null) {
      return null;
    }
    final String sectionName =
            procedureNameContext.inSection() != null
                    ? procedureNameContext.inSection().sectionName().getText()
                    : null;
    final String targetName = procedureNameContext.paragraphName().getText();
    return new ProcedureName(targetName, sectionName);
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

  private Optional<Locality> getLocality(Token childToken) {
    Location location = extendedDocument.mapLocation(buildTokenRange(childToken));
    return ofNullable(locationToLocality(location));
  }

  private void reportSubroutineNotDefined(String name, Locality locality) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .suggestion(messageService.getMessage("CobolVisitor.subroutineNotFound", name))
                    .severity(ErrorSeverity.INFO)
                    .location(getIntervalPosition(locality, locality).toOriginalLocation())
                    .build();
    LOG.debug("Syntax error by CobolVisitor#reportSubroutineNotDefined: {}", error);
    errors.add(error);
  }

  protected void throwWarning(Token token) {
    String tokenText = token.getText().toUpperCase();
    if (MisspelledKeywordDistance.KEYWORDS.getSuggestions().contains(tokenText)) return;
    MisspelledKeywordDistance.calculateDistance(tokenText)
            .ifPresent(
                    correctWord ->
                            getLocality(token)
                                    .ifPresent(locality -> reportMisspelledKeyword(correctWord, locality)));
  }

  private void reportMisspelledKeyword(String suggestion, Locality locality) {
    if (locality == null) return;
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .suggestion(messageService.getMessage("CobolVisitor.misspelledWord", suggestion))
                    .severity(ErrorSeverity.WARNING)
                    .location(locality.toOriginalLocation())
                    .build();
    LOG.debug("Syntax error by CobolVisitor#reportMisspelledKeyword: {}", error);
    errors.add(error);
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

  private void areaBWarning(ParserRuleContext ctx) {
    List<Token> tokens = ctx.getStart() != ctx.getStop() ? findTokens(ctx.getStart(), ctx.getStop()) : ImmutableList.of(ctx.getStart());
    tokens.forEach(token -> getLocality(token).filter(startsInAreaA(token))
            .ifPresent(locality -> throwException(token.getText(), locality, messageService.getMessage("CobolVisitor.AreaBWarningMsg"))));
  }

  private List<Token> findTokens(Token startToken, Token stopToken) {
    List<Token> result = new ArrayList<>();
    boolean start = false;
    boolean stop = false;
    for (int i = 0; i < tokenStream.size() && !stop; i++) {
      Token t = tokenStream.get(i);
      if (!start && t == startToken) {
        start = true;
      }
      if (start) {
        result.add(t);
      }
      if (t == stopToken) {
        stop = true;
      }
    }
    return result;
  }

  private Predicate<Locality> startsInAreaA(Token token) {
    return it -> {
      int charPosition = it.getRange().getStart().getCharacter();
      int areaBStartIndex = programLayout.getSequenceLength() + programLayout.getIndicatorLength() + programLayout.getAreaALength();
      return charPosition > programLayout.getSequenceLength() && charPosition < areaBStartIndex && token.getChannel() != HIDDEN;
    };
  }

  private static Collection<Location> getSubroutineLocation(
          ImmutablePair<String, Optional<String>> subroutinePair) {
    return subroutinePair
            .getValue()
            .map(it -> new Location(it, new Range(new Position(), new Position())))
            .map(Collections::singletonList)
            .orElse(emptyList());
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx)
            .map(constructNode(nodeConstructor, children))
            .orElse(children);
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) return children;
    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private VariableNameAndLocality extractNameAndLocality(CobolWordContext context) {
    return new VariableNameAndLocality(
            getName(context), retrieveLocality(context).orElse(null));
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
}
