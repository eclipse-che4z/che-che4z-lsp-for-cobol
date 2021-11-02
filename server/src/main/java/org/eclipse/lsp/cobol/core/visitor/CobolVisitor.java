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

import com.google.common.collect.HashMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multimap;
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
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.CobolParserBaseVisitor;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetToBooleanStatement;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetToOnOffStatement;
import org.eclipse.lsp.cobol.core.model.tree.statements.SetUpDownByStatement;
import org.eclipse.lsp.cobol.core.model.tree.variables.*;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode.Builder;
import org.eclipse.lsp.cobol.core.model.variables.DivisionType;
import org.eclipse.lsp.cobol.core.model.variables.SectionType;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.core.semantics.SemanticContext;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.SubroutineService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;
import static org.antlr.v4.runtime.Lexer.HIDDEN;
import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.*;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class CobolVisitor extends CobolParserBaseVisitor<List<Node>> {

  private final List<SyntaxError> errors = new ArrayList<>();
  private final Multimap<String, Location> subroutineUsages = HashMultimap.create();
  private final NamedSubContext copybooks;
  private final CommonTokenStream tokenStream;
  private final Map<Token, Locality> positions;
  private final Map<Token, EmbeddedCode> embeddedCodeParts;
  private final MessageService messageService;
  private final SubroutineService subroutineService;
  private final AnalysisConfig analysisConfig;
  private Map<String, FileControlEntryContext> fileControls = null;

  public CobolVisitor(
      @NonNull String documentUri,
      @NonNull NamedSubContext copybooks,
      @NonNull CommonTokenStream tokenStream,
      @NonNull Map<Token, Locality> positions,
      @NonNull AnalysisConfig analysisConfig,
      Map<Token, EmbeddedCode> embeddedCodeParts,
      MessageService messageService,
      SubroutineService subroutineService) {
    this.copybooks = copybooks;
    this.positions = positions;
    this.embeddedCodeParts = embeddedCodeParts;
    this.tokenStream = tokenStream;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
    this.analysisConfig = analysisConfig;
  }

  /**
   * Get the semantic context of the document as an output of th semantic analysis
   *
   * @return the semantic context of the document, containing all the definitions and usages of
   *     paragraphs, variables and copybooks
   */
  @NonNull
  public ResultWithErrors<SemanticContext> finishAnalysis() {
    return new ResultWithErrors<>(
        SemanticContext.builder()
            .copybookDefinitions(copybooks.getDefinitions().asMap())
            .copybookUsages(copybooks.getUsages().asMap())
            .subroutinesDefinitions(getSubroutineDefinition())
            .subroutinesUsages(subroutineUsages.asMap())
            .build(),
        errors);
  }

  @Override
  public List<Node> visitStartRule(StartRuleContext ctx) {
    // we can skip the other nodes, but not the root
    return retrieveRangeLocality(ctx, positions)
        .map(
            locality -> {
              Node rootNode = new RootNode(locality);
              visitChildren(ctx).forEach(rootNode::addChild);
              addCopyNodes(rootNode, copybooks.getUsages());
              return ImmutableList.of(rootNode);
            })
        .orElse(ImmutableList.of());
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
            name -> {
              retrieveRangeLocality(ctx, positions)
                  .ifPresent(locality -> result.add(new ProgramIdNode(locality, name)));
            });
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
                retrieveRangeLocality(ctx.fileDescriptionEntryClauses().cobolWord(), positions)
                    .orElse(null))
            .fileDescriptor(getIntervalText(ctx.fileDescriptionEntryClauses()))
            .fileControlClause(fileControlClause)
            .isSortDescription(Objects.nonNull(ctx.fileDescriptionEntryClauses().SD()))
            .build(),
        visitChildren(ctx));
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

    ofNullable(ctx.END())
        .map(TerminalNode::getSymbol)
        .ifPresent(endToken -> areaAWarning(endToken));
    return visitChildren(ctx);
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
      checkFileControlUniqueness(ctx, filename);
    }
    return addTreeNode(ctx, locality -> new FileEntryNode(locality, filename));
  }

  private void checkFileControlUniqueness(FileControlEntryContext ctx, String filename) {
    getLocality(ctx.selectClause().fileName().getStart())
        .ifPresent(
            locality -> {
              if (fileControls.containsKey(filename.toUpperCase())) {
                SyntaxError error =
                    SyntaxError.syntaxError()
                        .suggestion(
                            messageService.getMessage("CobolVisitor.duplicateFileName", filename))
                        .severity(ErrorSeverity.ERROR)
                        .locality(locality)
                        .build();
                errors.add(error);
                LOG.debug("Syntax error by CobolVisitor#visitSelectClause: {}", error);
              } else {
                fileControls.put(filename.toUpperCase(), ctx);
              }
            });
  }

  @Override
  public List<Node> visitMapSection(MapSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.MAP));
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
  public List<Node> visitStatement(StatementContext ctx) {
    areaBWarning(ctx);
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitExecCicsStatement(ExecCicsStatementContext ctx) {
    areaBWarning(ctx);
    if (analysisConfig.getFeatures().contains(EmbeddedCodeNode.Language.CICS)) {
      return processEmbeddedNodes(ctx, ctx.cicsRules(), EmbeddedCodeNode.Language.CICS);
    } else {
      return Collections.emptyList();
    }
  }

  @Override
  public List<Node> visitExecSqlStatement(ExecSqlStatementContext ctx) {
    areaBWarning(ctx);
    if (analysisConfig.getFeatures().contains(EmbeddedCodeNode.Language.SQL)) {
      return processEmbeddedNodes(ctx, ctx.sqlCode(), EmbeddedCodeNode.Language.SQL);
    } else {
      return Collections.emptyList();
    }
  }

  private List<Node> processEmbeddedNodes(
      ParserRuleContext parent, ParserRuleContext ctx, EmbeddedCodeNode.Language language) {
    final Optional<EmbeddedCode> embeddedCode =
        ofNullable(ctx).map(ParserRuleContext::getStart).map(embeddedCodeParts::get);
    // apply area B check for tokens provided by a specific lexer
    embeddedCode.map(EmbeddedCode::getTokens).ifPresent(this::areaBWarning);
    return embeddedCode
        .flatMap(
            code ->
                getLocality(parent.getStart())
                    .<List<Node>>map(
                        it ->
                            ImmutableList.of(
                                new EmbeddedCodeNode(
                                    it, code.getTokenStream(), code.getTree(), language))))
        .orElse(ImmutableList.of());
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
  public List<Node> visitMapClause(MapClauseContext ctx) {
    return ofNullable(ctx.idms_map_name_definition())
        .map(Idms_map_name_definitionContext::dataName)
        .map(this::extractNameAndLocality)
        .map(
            varName -> {
              return addTreeNode(
                  VariableDefinitionNode.builder()
                      .level(LEVEL_MAP_NAME)
                      .variableNameAndLocality(varName)
                      .statementLocality(retrieveRangeLocality(ctx, positions).orElse(null))
                      .build(),
                  visitChildren(ctx));
            })
        .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    String name = getName(ctx.entryName());
    int level = getLevel(ctx.LEVEL_NUMBER());
    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(level)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER()))
            .statementLocality(retrieveRangeLocality(ctx, positions).orElse(null))
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
    String name = getName(ctx.entryName());
    Builder builder =
        VariableDefinitionNode.builder()
            .level(LEVEL_66)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveRangeLocality(ctx, positions).orElse(null));
    ofNullable(ctx.dataRenamesClause())
        .map(DataRenamesClauseContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
        .map(DataRenamesClauseContext::thruDataName)
        .map(ThruDataNameContext::dataName)
        .map(this::extractNameAndLocality)
        .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    String name = getName(ctx.entryName());
    return ofNullable(ctx.dataValueClause())
        .map(DataValueClauseContext::valueIsToken)
        .map(
            valueToken ->
                addTreeNode(
                    VariableDefinitionNode.builder()
                        .level(LEVEL_88)
                        .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_88()))
                        .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                        .statementLocality(retrieveRangeLocality(ctx, positions).orElse(null))
                        .valueClauses(retrieveValues(ImmutableList.of(ctx.dataValueClause())))
                        .valueToken(retrieveValueToken(valueToken))
                        .build(),
                    visitChildren(ctx)))
        .orElse(ImmutableList.of());
  }

  private String retrieveValueToken(ValueIsTokenContext ctx) {
    return ctx.valueToken().getText().toUpperCase()
        + Optional.ofNullable(ctx.isAreToken())
            .map(ParserRuleContext::getText)
            .map(String::toUpperCase)
            .map(" "::concat)
            .orElse("");
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
      DataDescriptionEntryFormat1Level77Context ctx) {
    String name = getName(ctx.entryName());
    return addTreeNode(
        VariableDefinitionNode.builder()
            .level(LEVEL_77)
            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_77()))
            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
            .statementLocality(retrieveRangeLocality(ctx, positions).orElse(null))
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
            .build(),
        visitChildren(ctx));
  }

  @Override
  public List<Node> visitSetUpDownByStatement(SetUpDownByStatementContext ctx) {
    List<Locality> receivingFields = mapRulesToLocalities(ctx.receivingField());
    return ofNullable(ctx.sendingField())
        .map(
            it ->
                addTreeNode(
                    ctx,
                    locality ->
                        new SetUpDownByStatement(
                            locality,
                            receivingFields,
                            positions.get(it.getStart()),
                            ofNullable(it.literal()).map(ParserRuleContext::getText).orElse(null))))
        .orElseGet(ImmutableList::of);
  }

  @Override
  public List<Node> visitSetToOnOff(SetToOnOffContext ctx) {
    return addTreeNode(
        ctx,
        locality -> new SetToOnOffStatement(locality, mapRulesToLocalities(ctx.receivingField())));
  }

  @Override
  public List<Node> visitSetToBoolean(SetToBooleanContext ctx) {
    return addTreeNode(
        ctx,
        locality ->
            new SetToBooleanStatement(locality, mapRulesToLocalities(ctx.receivingField())));
  }

  @Override
  public List<Node> visitQualifiedDataName(QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(VariableUsageNameContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality));
  }

  @Override
  public List<Node> visitFileName(FileNameContext ctx) {
    return addTreeNode(
        ctx,
        locality -> {
          Node usage = new VariableUsageNode(getName(ctx), locality);
          Node reference = new QualifiedReferenceNode(locality);
          reference.addChild(usage);
          return reference;
        });
  }

  @Override
  public List<Node> visitIdms_map_name(Idms_map_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitIdms_db_entity_name(Idms_db_entity_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitIdms_procedure_name(Idms_procedure_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitCallStatement(CallStatementContext ctx) {
    if (ctx.literal() != null) {
      String subroutineName =
          PreprocessorStringUtils.trimQuotes(ctx.literal().getText()).toUpperCase();
      Optional<Locality> locality = getLocality(ctx.literal().getStart());
      locality.ifPresent(
          it -> {
            if (!subroutineService.getUri(subroutineName).isPresent()) {
              reportSubroutineNotDefined(subroutineName, it);
            }
          });
      locality
          .map(Locality::toLocation)
          .ifPresent(location -> subroutineUsages.put(subroutineName, location));
    }
    return visitChildren(ctx);
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
    return addTreeNode(ctx, locality -> new IfNode(locality, ctx));
  }

  @Override
  public List<Node> visitParagraphs(ParagraphsContext ctx) {
    return addTreeNode(ctx, ParagraphsNode::new);
  }

  @Override
  public List<Node> visitProcedureDivisionBody(ProcedureDivisionBodyContext ctx) {
    return addTreeNode(ctx, ProcedureDivisionBodyNode::new);
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

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .suggestion(message + wrongToken)
            .severity(ErrorSeverity.WARNING)
            .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  private List<Locality> mapRulesToLocalities(List<? extends ParserRuleContext> rules) {
    return rules.stream()
        .map(ParserRuleContext::getStart)
        .map(this::getLocality)
        .filter(Optional::isPresent)
        .map(Optional::get)
        .collect(toList());
  }

  private Optional<Locality> getLocality(Token childToken) {
    return ofNullable(positions.get(childToken));
  }

  private void reportSubroutineNotDefined(String name, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(messageService.getMessage("CobolVisitor.subroutineNotFound", name))
            .severity(ErrorSeverity.INFO)
            .locality(getIntervalPosition(locality, locality))
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
            .suggestion(messageService.getMessage("CobolVisitor.misspelledWord", suggestion))
            .severity(ErrorSeverity.WARNING)
            .locality(locality)
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

  private Map<String, Collection<Location>> getSubroutineDefinition() {
    return subroutineUsages.keySet().stream()
        .map(name -> new ImmutablePair<>(name, subroutineService.getUri(name)))
        .filter(pair -> pair.getValue().isPresent())
        .collect(toMap(Pair::getKey, CobolVisitor::getSubroutineLocation));
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
    return VisitorHelper.createTreeNode(positions, visitChildren(ctx), ctx, nodeConstructor);
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
        getName(context), retrieveRangeLocality(context, positions).orElse(null));
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
                new OccursClause(intLit, retrieveOccursToValue(ctx), retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
        .map(IndexNameContext::cobolWord)
        .map(this::extractNameAndLocality)
        .collect(toList());
  }

  private Integer retrieveOccursToValue(DataOccursClauseContext ctx) {
    return ofNullable(ctx.dataOccursTo())
        .map(DataOccursToContext::integerLiteral)
        .map(VisitorHelper::getInteger)
        .orElse(null);
  }

  private List<ValueClause> retrieveValues(List<DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(DataValueClauseContext context) {
    return new ValueClause(
        retrieveValueIntervals(context.dataValueClauseLiteral().dataValueInterval()),
        positions.get(context.getStart()));
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    return positions.get(terminalNode.getSymbol());
  }

  private void addCopyNodes(Node rootNode, Multimap<String, Location> copybookUsages) {
    for (Map.Entry<String, Location> copybook : copybookUsages.entries()) {
      String name = copybook.getKey();
      Range range = copybook.getValue().getRange();
      rootNode.addChild(
          new CopyNode(
              Locality.builder().range(range).uri(copybook.getValue().getUri()).build(), name));
    }
  }
}
