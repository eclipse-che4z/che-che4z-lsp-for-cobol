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

import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.CobolParserBaseVisitor;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.semantics.GroupContext;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.core.semantics.PredefinedVariableContext;
import org.eclipse.lsp.cobol.core.semantics.SemanticContext;
import org.eclipse.lsp.cobol.core.semantics.outline.NodeType;
import org.eclipse.lsp.cobol.core.semantics.outline.OutlineTreeBuilder;
import org.eclipse.lsp.cobol.service.SubroutineService;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.antlr.v4.runtime.tree.RuleNode;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.*;
import static org.eclipse.lsp.cobol.core.visitor.VariableDefinitionDelegate.*;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class CobolVisitor extends CobolParserBaseVisitor<Void> {
  private static final String DECLARATIVE_SAME_MSG =
      "The following token cannot be on the same line as a DECLARATIVE token: ";

  private final List<SyntaxError> errors = new ArrayList<>();
  private final PredefinedVariableContext constants = new PredefinedVariableContext();
  private final GroupContext groupContext = new GroupContext();
  private final Multimap<String, Location> subroutineUsages = HashMultimap.create();

  private String programName = null;

  private final NamedSubContext copybooks;
  private final CommonTokenStream tokenStream;
  private final OutlineTreeBuilder outlineTreeBuilder;
  private final Map<Token, Locality> positionMapping;
  private final MessageService messageService;
  private final SubroutineService subroutineService;
  private final VariableDefinitionDelegate variablesDelegate;
  private final VariableUsageDelegate variableUsageDelegate;

  public CobolVisitor(
      @NonNull String documentUri,
      @NonNull NamedSubContext copybooks,
      @NonNull CommonTokenStream tokenStream,
      @NonNull Map<Token, Locality> positionMapping,
      MessageService messageService,
      SubroutineService subroutineService) {
    this.copybooks = copybooks;
    this.positionMapping = positionMapping;
    this.tokenStream = tokenStream;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
    outlineTreeBuilder = new OutlineTreeBuilder(documentUri, positionMapping);
    variablesDelegate = new VariableDefinitionDelegate(positionMapping, messageService);
    variableUsageDelegate = new VariableUsageDelegate(positionMapping, messageService);
  }

  /**
   * Get the semantic context of the document as an output of th semantic analysis
   *
   * @return the semantic context of the document, containing all the definitions and usages of
   *     paragraphs, variables and copybooks
   */
  @NonNull
  public ResultWithErrors<SemanticContext> finishAnalysis() {
    Collection<Variable> definedVariables =
        variablesDelegate.finishDefinitionAnalysis().unwrap(errors::addAll);
    errors.addAll(variableUsageDelegate.updateUsageAndGenerateErrors(definedVariables));
    errors.addAll(groupContext.generateParagraphErrors(messageService));
    return new ResultWithErrors<>(
        SemanticContext.builder()
            .variableDefinitions(collectVariableDefinitions(definedVariables))
            .variableUsages(collectVariableUsages(definedVariables))
            .paragraphDefinitions(groupContext.getParagraphDefinitions())
            .paragraphUsages(groupContext.getParagraphUsages())
            .paragraphRanges(groupContext.getParagraphRanges())
            .sectionDefinitions(groupContext.getSectionDefinitions())
            .sectionUsages(groupContext.getSectionUsages())
            .sectionRanges(groupContext.getSectionRanges())
            .constantDefinitions(constants.getDefinitions().asMap())
            .constantUsages(constants.getUsages().asMap())
            .copybookDefinitions(copybooks.getDefinitions().asMap())
            .copybookUsages(copybooks.getUsages().asMap())
            .subroutinesDefinitions(getSubroutineDefinition())
            .subroutinesUsages(subroutineUsages.asMap())
            .outlineTree(buildOutlineTree())
            .variables(definedVariables)
            .build(),
        errors);
  }

  private Map<String, Collection<Location>> collectVariableDefinitions(
      Collection<Variable> definedVariables) {
    Multimap<String, Location> definitions = HashMultimap.create();
    definedVariables.stream()
        .filter(it -> !FILLER_NAME.equals(it.getName()))
        .forEach(it -> definitions.put(it.getName(), it.getDefinition().toLocation()));
    return definitions.asMap();
  }

  private Map<String, Collection<Location>> collectVariableUsages(
      Collection<Variable> definedVariables) {
    Multimap<String, Location> usages = HashMultimap.create();
    definedVariables.forEach(
        it ->
            usages.putAll(
                it.getName(), it.getUsages().stream().map(Locality::toLocation).collect(toList())));
    return usages.asMap();
  }

  @Override
  public Void visitIdentificationDivision(IdentificationDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(IDENTIFICATION_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
    ofNullable(ctx.programName())
        .map(RuleContext::getText)
        .map(PreprocessorStringUtils::trimQuotes)
        .ifPresent(
            name -> {
              programName = name;
              outlineTreeBuilder.renameProgram(name, ctx);
              outlineTreeBuilder.addNode(PROGRAM_ID_PREFIX + name, NodeType.PROGRAM_ID, ctx);
            });
    return visitChildren(ctx);
  }

  @Override
  public Void visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(PROCEDURE_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(ENVIRONMENT_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(DATA_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDivisionSection(DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitWorkingStorageSection(WorkingStorageSectionContext ctx) {
    outlineTreeBuilder.addNode(WORKING_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.notifySectionChanged();
    return visitChildren(ctx);
  }

  @Override
  public Void visitProgramUnit(ProgramUnitContext ctx) {
    outlineTreeBuilder.addProgram(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());
    addSectionRange(ctx);
    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE_SECTION, ctx);

    String name = ctx.getStart().getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(locality -> groupContext.addSectionDefinition(name, locality));
    return visitChildren(ctx);
  }

  @Override
  public Void visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());
    addParagraphRange(ctx);

    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE, ctx);
    return visitChildren(ctx);
  }

  private void addSectionRange(ParserRuleContext ctx) {
    String name = ctx.getStart().getText().toUpperCase();
    getRange(ctx).ifPresent(range -> groupContext.addSectionRange(name, range));
  }

  private void addParagraphRange(ParserRuleContext ctx) {
    String name = ctx.getStart().getText().toUpperCase();
    getRange(ctx).ifPresent(range -> groupContext.addParagraphRange(name, range));
  }

  private Optional<Location> getRange(ParserRuleContext ctx) {
    Optional<Locality> start = getLocality(ctx.getStart());
    Optional<Locality> end = getLocality(ctx.getStop());

    if (start.isPresent() && end.isPresent()) {
      Range range = new Range(start.get().getRange().getStart(), end.get().getRange().getEnd());
      return Optional.of(new Location(start.get().getUri(), range));
    }
    return Optional.empty();
  }

  @Override
  public Void visitFileDescriptionEntry(FileDescriptionEntryContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(ctx.fileName().getText(), NodeType.FILE, ctx);
    return visitChildren(ctx);
  }

  /**
   * In this method, first condition is checking if there is any other element present on the same
   * line as DECLARATIVES token and throws an error if the condition is true; In the PROCEDURE
   * DIVISION, each of the keywords DECLARATIVES and END DECLARATIVES must begin in Area A and be
   * followed immediately by a separator period; no other text can appear on the same line. After
   * the keywords END DECLARATIVES, no text can appear before the following section header.
   */
  @Override
  public Void visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
    Token firstDeclarative = ctx.getStart();
    int firstDeclLine = firstDeclarative.getLine();
    Token declarativeBody = ctx.procedureDeclarative(0).getStart();
    Token endToken = ctx.END().getSymbol();

    if (firstDeclLine == declarativeBody.getLine()) {
      getLocality(declarativeBody)
          .ifPresent(
              locality ->
                  throwException(declarativeBody.getText(), locality, DECLARATIVE_SAME_MSG));
    }

    areaAWarning(firstDeclarative);
    areaAWarning(endToken);
    return visitChildren(ctx);
  }

  @Override
  public Void visitEndProgramStatement(EndProgramStatementContext ctx) {
    Token endProgramNameToken = ctx.programName().getStart();
    checkProgramName(endProgramNameToken);
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitConfigurationSection(ConfigurationSectionContext ctx) {
    outlineTreeBuilder.addNode(CONFIGURATION_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitInputOutputSection(InputOutputSectionContext ctx) {
    outlineTreeBuilder.addNode(INPUT_OUTPUT_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitSelectClause(SelectClauseContext ctx) {
    outlineTreeBuilder.addNode(ctx.fileName().getText(), NodeType.FILE, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitFileSection(FileSectionContext ctx) {
    outlineTreeBuilder.addNode(FILE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.notifySectionChanged();
    return visitChildren(ctx);
  }

  @Override
  public Void visitLinkageSection(LinkageSectionContext ctx) {
    outlineTreeBuilder.addNode(LINKAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.notifySectionChanged();
    return visitChildren(ctx);
  }

  @Override
  public Void visitLocalStorageSection(LocalStorageSectionContext ctx) {
    outlineTreeBuilder.addNode(LOCAL_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.notifySectionChanged();
    return visitChildren(ctx);
  }

  @Override
  public Void visitStatement(StatementContext ctx) {
    List<Token> tokenList =
        tokenStream.getTokens(ctx.getStart().getTokenIndex(), ctx.getStop().getTokenIndex());
    areaBWarning(tokenList);

    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitIfThen(IfThenContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitIfElse(IfElseContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitSentence(SentenceContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Void visitParagraphName(ParagraphNameContext ctx) {
    String name = ctx.getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(locality -> groupContext.addParagraphDefinition(name, locality));
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    variablesDelegate.defineVariable(ctx);
    String name =
        ofNullable(ctx.entryName())
            .map(EntryNameContext::dataName1)
            .map(RuleContext::getText)
            .orElse(FILLER_NAME);
    String levelNumber = ctx.LEVEL_NUMBER().getText();
    int level = Integer.parseInt(levelNumber);
    outlineTreeBuilder.addVariable(level, name, getDataDescriptionNodeType(ctx), ctx);
    return visitChildren(ctx);
  }

  private NodeType getDataDescriptionNodeType(DataDescriptionEntryFormat1Context ctx) {
    // Data description with a pic clause is a FIELD
    if (!ctx.dataPictureClause().isEmpty()) {
      return NodeType.FIELD;
    }
    // Data description with a redefines clause is a REDEFINES
    if (!ctx.dataRedefinesClause().isEmpty()) {
      return NodeType.REDEFINES;
    }
    // Data description is a STRUCT in other cases
    return NodeType.STRUCT;
  }

  @Override
  public Void visitEnvironmentSwitchNameClause(EnvironmentSwitchNameClauseContext ctx) {
    variablesDelegate.defineVariable(ctx);
    String name = ofNullable(ctx.mnemonicName()).map(RuleContext::getText).orElse(FILLER_NAME);
    outlineTreeBuilder.addNode(name, NodeType.MNEMONIC_NAME, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    variablesDelegate.defineVariable(ctx);
    String name =
        ofNullable(ctx.entryName())
            .map(EntryNameContext::dataName1)
            .map(RuleContext::getText)
            .orElse(FILLER_NAME);
    outlineTreeBuilder.addVariable(LEVEL_66, name, NodeType.FIELD_66, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    variablesDelegate.defineVariable(ctx);
    String name =
        ofNullable(ctx.entryName())
            .map(EntryNameContext::dataName1)
            .map(RuleContext::getText)
            .orElse(FILLER_NAME);
    outlineTreeBuilder.addVariable(LEVEL_88, name, NodeType.FIELD_88, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDescriptionEntryFormat1Level77(
      DataDescriptionEntryFormat1Level77Context ctx) {
    variablesDelegate.defineVariable(ctx);
    String name =
        ofNullable(ctx.entryName())
            .map(EntryNameContext::dataName1)
            .map(RuleContext::getText)
            .orElse(FILLER_NAME);

    outlineTreeBuilder.addVariable(LEVEL_77, name, NodeType.FIELD, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitParagraphNameUsage(ParagraphNameUsageContext ctx) {
    String name = ctx.getText().toUpperCase();
    getLocality(ctx.getStart()).ifPresent(l -> groupContext.addCandidateUsage(name, l));
    return visitChildren(ctx);
  }

  private List<DocumentSymbol> buildOutlineTree() {
    return outlineTreeBuilder.build(copybooks.getUsages());
  }

  @Override
  public Void visitQualifiedDataNameFormat1(QualifiedDataNameFormat1Context ctx) {
    String dataName =
        ofNullable(ctx.dataName()).map(RuleContext::getText).map(String::toUpperCase).orElse("");
    getLocality(ctx.dataName().getStart())
        .ifPresent(
            locality -> {
              if (constants.contains(dataName)) constants.addUsage(dataName, locality.toLocation());
              else variableUsageDelegate.handleDataName(dataName, locality, ctx);
            });
    return visitChildren(ctx);
  }

  @Override
  public Void visitTableCall(TableCallContext ctx) {
    String dataName =
        ofNullable(ctx.dataName2()).map(RuleContext::getText).map(String::toUpperCase).orElse("");
    getLocality(ctx.dataName2().getStart())
        .ifPresent(
            locality -> {
              if (constants.contains(dataName)) constants.addUsage(dataName, locality.toLocation());
              else variableUsageDelegate.handleTableCall(dataName, locality);
            });
    return visitChildren(ctx);
  }

  @Override
  public Void visitConditionNameReference(ConditionNameReferenceContext ctx) {
    String dataName =
        ofNullable(ctx.conditionName())
            .map(RuleContext::getText)
            .map(String::toUpperCase)
            .orElse("");
    getLocality(ctx.conditionName().getStart())
        .ifPresent(
            locality -> {
              if (constants.contains(dataName)) constants.addUsage(dataName, locality.toLocation());
              else variableUsageDelegate.handleConditionCall(dataName, locality, ctx);
            });
    return visitChildren(ctx);
  }

  @Override
  public Void visitCallStatement(CallStatementContext ctx) {
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

  private Optional<Locality> getLocality(Token childToken) {
    return ofNullable(positionMapping.get(childToken));
  }

  private Locality getIntervalPosition(Locality start, Locality stop) {
    return Locality.builder()
        .uri(start.getUri())
        .range(new Range(start.getRange().getStart(), stop.getRange().getEnd()))
        .recognizer(CobolVisitor.class)
        .copybookId(start.getCopybookId())
        .build();
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
    MisspelledKeywordDistance.calculateDistance(token.getText().toUpperCase())
            .filter(it -> !it.equalsIgnoreCase(token.getText()))
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
    getLocality(token)
        .filter(it -> it.getRange().getStart().getCharacter() > AREA_A_FINISH)
        .ifPresent(
            it ->
                throwException(
                    token.getText(),
                    it,
                    messageService.getMessage("CobolVisitor.AreaAWarningMsg")));
  }

  private void areaBWarning(@NonNull List<Token> tokenList) {
    tokenList.forEach(
        token ->
            getLocality(token)
                .ifPresent(
                    locality -> {
                      int charPosition = locality.getRange().getStart().getCharacter();
                      if (charPosition > 6 && charPosition < 11 && token.getChannel() != 1) {
                        throwException(
                            token.getText(),
                            locality,
                            messageService.getMessage("CobolVisitor.AreaBWarningMsg"));
                      }
                    }));
  }

  private void checkProgramName(Token token) {
    if (programName == null) {
      getLocality(token)
          .ifPresent(
              it ->
                  throwException("", it, messageService.getMessage("CobolVisitor.progIDIssueMsg")));
    } else {
      checkProgramNameIdentical(token);
    }
  }

  private void checkProgramNameIdentical(Token token) {
    String text = PreprocessorStringUtils.trimQuotes(token.getText());
    if (!programName.equalsIgnoreCase(text)) {
      getLocality(token)
          .ifPresent(
              it ->
                  throwException(
                      programName, it, messageService.getMessage("CobolVisitor.identicalProgMsg")));
    }
  }

  // NOTE: CobolVisitor is not managed by Guice DI, so can't use annotation here.
  @Override
  public Void visitChildren(RuleNode node) {
    if (Thread.interrupted()) {
      LOG.debug("visitChildren method interrupted by user");
      throw new ParseCancellationException("Parsing interrupted by user.");
    }
    return super.visitChildren(node);
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
}
