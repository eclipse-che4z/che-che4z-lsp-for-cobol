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

package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.*;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.utils.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.CobolParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetToBooleanStatement;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetToOnOffStatement;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetUpDownByStatement;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode.Builder;
import org.eclipse.lsp.cobol.core.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.common.SubroutineService;
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
import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class CobolVisitor extends CobolParserBaseVisitor<List<Node>> {

  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  private final CopybooksRepository copybooks;
  private final CommonTokenStream tokenStream;
  private final ExtendedDocument extendedDocument;
  private final MessageService messageService;
  private final SubroutineService subroutineService;

  private Map<String, FileControlEntryContext> fileControls = null;
  private final Map<String, SubroutineDefinition> subroutineDefinitionMap = new HashMap<>();
  private final CachingConfigurationService cachingConfigurationService;

  public CobolVisitor(
          @NonNull CopybooksRepository copybooks,
          @NonNull CommonTokenStream tokenStream,
          @NonNull ExtendedDocument extendedDocument,
          MessageService messageService,
          SubroutineService subroutineService,
          CachingConfigurationService cachingConfigurationService) {
    this.copybooks = copybooks;
    this.tokenStream = tokenStream;
    this.extendedDocument = extendedDocument;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
  }

  @Override
  public List<Node> visitStartRule(StartRuleContext ctx) {
    // we can skip the other nodes, but not the root
    return ImmutableList.of(
        retrieveLocality(ctx)
            .map(RootNode::new)
            .map(
                rootNode -> {
                  visitChildren(ctx).forEach(rootNode::addChild);
                  return rootNode;
                })
            .orElseGet(
                () -> {
                  LOG.warn("The root node for syntax tree was not constructed");
                  return new RootNode();
                }));
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
  public List<Node> visitCompilerOptions(CompilerOptionsContext ctx) {
    return addTreeNode(ctx, location -> new CompilerDirectiveNode(location, ctx.getText()));
  }

  @Override
  public List<Node> visitIdentificationDivision(IdentificationDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
        ctx, location -> new DivisionNode(location, DivisionType.IDENTIFICATION_DIVISION));
  }

  @Override
  public List<Node> visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
    List<Node> result = new ArrayList<>();
    ofNullable(ctx.programName())
        .map(RuleContext::getText)
        .map(PreprocessorStringUtils::trimQuotes)
        .ifPresent(
            name ->
                retrieveLocality(ctx)
                    .ifPresent(locality -> result.add(new ProgramIdNode(locality, name))));
    return result;
  }

  @Override
  public List<Node> visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
        ctx, location -> new DivisionNode(location, DivisionType.PROCEDURE_DIVISION));
  }

  @Override
  public List<Node> visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
        ctx, location -> new DivisionNode(location, DivisionType.ENVIRONMENT_DIVISION));
  }

  @Override
  public List<Node> visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(ctx, location -> new DivisionNode(location, DivisionType.DATA_DIVISION));
  }

  @Override
  public List<Node> visitDataDivisionSection(DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitWorkingStorageSection(WorkingStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.WORKING_STORAGE));
  }

  @Override
  public List<Node> visitCompilerXOpts(CompilerXOptsContext ctx) {
    return addTreeNode(ctx, locality -> new CICSTranslatorNode(locality, NodeType.CUSTOM));
  }

  @Override
  public List<Node> visitProgramUnit(ProgramUnitContext ctx) {
    fileControls = new HashMap<>();
    return addTreeNode(ctx, ProgramNode::new);
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
  public List<Node> visitFileDescriptionEntry(FileDescriptionEntryContext ctx) {
    if (ctx.fileDescriptionEntryClauses() == null) {
      return ImmutableList.of();
    }
    areaAWarning(ctx.getStart());
    String fileControlClause = "";
    String fileName = getName(ctx.fileDescriptionEntryClauses().cobolWord());
    if (fileControls.containsKey(fileName)) {
      FileControlEntryContext fileControlEntryContext = fileControls.remove(fileName);
      fileControlClause = getIntervalText(fileControlEntryContext.fileControlClauses());
    }

    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(LEVEL_FD_SD)
            .variableNameAndLocality(
                extractNameAndLocality(ctx.fileDescriptionEntryClauses().cobolWord()))
            .statementLocality(
                retrieveLocality(ctx.fileDescriptionEntryClauses().cobolWord())
                    .orElse(null))
            .fileDescriptor(getIntervalText(ctx.fileDescriptionEntryClauses()))
            .fileControlClause(fileControlClause)
            .isSortDescription(Objects.nonNull(ctx.fileDescriptionEntryClauses().SD()))
            .global(isFeildDescriptionEntryGlobal(ctx))
            .build(),
        visitChildren(ctx));
  }

  private boolean isFeildDescriptionEntryGlobal(FileDescriptionEntryContext ctx) {
    return !ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause().isEmpty()
        && Objects.nonNull(
            ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause(0).globalClause())
        && !ctx.fileDescriptionEntryClauses()
            .fileDescriptionEntryClause(0)
            .globalClause()
            .isEmpty();
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
  public List<Node> visitProcedureDeclarative(CobolParser.ProcedureDeclarativeContext ctx) {
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
  public List<Node> visitEndProgramStatement(EndProgramStatementContext ctx) {
    areaAWarning(ctx.getStart());
    return ofNullable(ctx.programName())
        .map(ParserRuleContext::getStart)
        .map(Token::getText)
        .map(PreprocessorStringUtils::trimQuotes)
        .map(id -> addTreeNode(ctx.programName(), locality -> new ProgramEndNode(locality, id)))
        .orElse(ImmutableList.of());
  }

  @Override
  public List<Node> visitConfigurationSection(ConfigurationSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.CONFIGURATION));
  }

  @Override
  public List<Node> visitInputOutputSection(InputOutputSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.INPUT_OUTPUT));
  }

  @Override
  public List<Node> visitFileControlEntry(FileControlEntryContext ctx) {
    String filename = VisitorHelper.getName(ctx.selectClause().fileName());
    if (StringUtils.isNotBlank(filename)) {
      String fileControlClause = getIntervalText(ctx.fileControlClauses());
      checkFileControlUniqueness(ctx, filename);
      return addTreeNode(ctx, locality -> new FileEntryNode(locality, filename, fileControlClause));
    }
    return addTreeNode(ctx, locality -> new FileEntryNode(locality, filename, ""));
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

  private void checkFileControlUniqueness(FileControlEntryContext ctx, String filename) {
    getLocality(ctx.selectClause().fileName().getStart())
        .ifPresent(
            locality -> {
              if (fileControls.containsKey(filename.toUpperCase())) {
                SyntaxError error =
                    SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .suggestion(
                            messageService.getMessage("CobolVisitor.duplicateFileName", filename))
                        .severity(ErrorSeverity.ERROR)
                        .location(locality.toOriginalLocation())
                        .build();
                errors.add(error);
                LOG.debug("Syntax error by CobolVisitor#visitSelectClause: {}", error);
              } else {
                fileControls.put(filename.toUpperCase(), ctx);
              }
            });
  }

  @Override
  public List<Node> visitFileSection(FileSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.FILE));
  }

  @Override
  public List<Node> visitLinkageSection(LinkageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LINKAGE));
  }

  @Override
  public List<Node> visitLocalStorageSection(LocalStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LOCAL_STORAGE));
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
  public List<Node> visitExecCicsStatement(ExecCicsStatementContext ctx) {
    areaBWarning(ctx);
    return Collections.emptyList();
  }

  @Override
  public List<Node> visitExecSqlStatement(ExecSqlStatementContext ctx) {
    areaBWarning(ctx);
    return Collections.emptyList();
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
  public List<Node> visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    return addTreeNode(ctx, PerformNode::new);
  }

  @Override
  public List<Node> visitPerformProcedureStatement(PerformProcedureStatementContext ctx) {
    ProcedureNameContext procedureNameContext = ctx.procedureName().get(0);
    final String section =
        procedureNameContext.inSection() != null
            ? procedureNameContext.inSection().sectionName().getText()
            : null;
    final String targetName = procedureNameContext.paragraphName().getText();
    return addTreeNode(ctx, locality -> new PerformNode(locality, section, targetName));
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
  public List<Node> visitRemarksParagraph(RemarksParagraphContext ctx) {
    return addTreeNode(ctx, RemarksNode::new);
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    return addTreeNode(
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
                    .map(DataRedefinesClauseContext::dataName)
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
            .build(),
        visitChildren(ctx));
  }

  @Override
  public List<Node> visitEnvironmentSwitchNameClause(EnvironmentSwitchNameClauseContext ctx) {
    Locality locality =
        getLocality(
                Optional.<ParserRuleContext>ofNullable(ctx.mnemonicName()).orElse(ctx).getStart())
            .orElse(null);
    String name = ofNullable(ctx.mnemonicName()).map(RuleContext::getText).orElse(FILLER_NAME);
    String systemName = ctx.environmentName().getText();
    return addTreeNode(
        VariableDefinitionNode.builder()
            .statementLocality(locality)
            .variableNameAndLocality(new VariableNameAndLocality(name, locality))
            .systemName(systemName)
            .build(),
        visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    Builder builder =
        VariableDefinitionNode.builder()
            .level(LEVEL_66)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveLocality(ctx).orElse(null));
    ofNullable(ctx.dataRenamesClause())
        .map(
            dataRenamesClauseContext ->
                dataRenamesClauseContext.qualifiedVariableDataName().dataName().stream()
                    .map(DataNameContext.class::cast)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
        .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
        .map(DataRenamesClauseContext::thruDataName)
        .map(
            thruDataNameContext ->
                thruDataNameContext.qualifiedVariableDataName().dataName().stream()
                    .map(DataNameContext.class::cast)
                    .map(this::extractNameAndLocality)
                    .collect(toList()))
        .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
        .map(DataValueClauseContext::valueIsToken)
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

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
      DataDescriptionEntryFormat1Level77Context ctx) {
    return addTreeNode(
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
                    .map(DataRedefinesClauseContext::dataName)
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
            .build(),
        visitChildren(ctx));
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
            .map(DataRecordsClauseContext.class::isInstance)
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
    String subroutineName = PreprocessorStringUtils.trimQuotes(ctx.getText()).toUpperCase();
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

  // NOTE: CobolVisitor is not managed by Guice DI, so can't use annotation here.
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

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(message + wrongToken)
            .severity(ErrorSeverity.WARNING)
            .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
    if (!errors.contains(error)) {
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

  private void throwWarning(Token token) {
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
    final int start = ctx.getStart().getTokenIndex();
    final int stop = ctx.getStop().getTokenIndex();

    areaBWarning(
        start < stop ? tokenStream.getTokens(start, stop) : ImmutableList.of(ctx.getStart()));
  }

  private void areaBWarning(@NonNull List<Token> tokenList) {
    tokenList.forEach(
        token ->
            getLocality(token)
                .filter(startsInAreaA(token))
                .ifPresent(
                    locality ->
                        throwException(
                            token.getText(),
                            locality,
                            messageService.getMessage("CobolVisitor.AreaBWarningMsg"))));
  }

  private Predicate<Locality> startsInAreaA(Token token) {
    return it -> {
      int charPosition = it.getRange().getStart().getCharacter();
      return charPosition > 6 && charPosition < 11 && token.getChannel() != HIDDEN;
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

  // TODO: Add check that name does not present in the predefined variables list (? - to check)
  private VariableNameAndLocality extractNameAndLocality(EntryNameContext context) {
    if (context == null || context.dataName() == null) return null;
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
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

  private List<OccursClause> retrieveOccursValues(List<DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
        .map(this::toOccursClause)
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(DataOccursClauseContext ctx) {
    return ofNullable(VisitorHelper.getInteger(ctx.integerLiteral()))
        .map(
            intLit ->
                new OccursClause(
                    intLit, retrieveOccursToValue(ctx).orElse(null),
                        Optional.ofNullable(ctx.dataOccursTo()).map(DataOccursToContext::UNBOUNDED).isPresent(),
                        retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
        .map(IndexNameContext::cobolWord)
        .map(this::extractNameAndLocality)
        .collect(toList());
  }

  private List<ValueClause> retrieveValues(List<DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(DataValueClauseContext context) {
    return new ValueClause(
        retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()),
        getLocality(context.getStart()).orElse(null));
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    try {
      Location location = extendedDocument.mapLocation(buildTokenRange(terminalNode.getSymbol()));
      return locationToLocality(location);
    } catch (IllegalStateException e) {
      LOG.debug("Node: {} with range: {} has issue with the mapping", terminalNode, buildTokenRange(terminalNode.getSymbol()));
      throw e;
    }
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
        .range(location.getRange())
        .uri(location.getUri())
        .copybookId(copybooks.getCopybookIdByUri(location.getUri()))
        .build();
  }
}
