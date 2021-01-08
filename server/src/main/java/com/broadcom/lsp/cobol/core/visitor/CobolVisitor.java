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

package com.broadcom.lsp.cobol.core.visitor;

import com.broadcom.lsp.cobol.core.CobolParser;
import com.broadcom.lsp.cobol.core.CobolParserBaseVisitor;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.ErrorSeverity;
import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.model.variables.Variable;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import com.broadcom.lsp.cobol.core.semantics.*;
import com.broadcom.lsp.cobol.core.semantics.outline.NodeType;
import com.broadcom.lsp.cobol.core.semantics.outline.OutlineNodeNames;
import com.broadcom.lsp.cobol.core.semantics.outline.OutlineTreeBuilder;
import com.broadcom.lsp.cobol.service.SubroutineService;
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

import static com.broadcom.lsp.cobol.core.CobolParser.*;
import static com.broadcom.lsp.cobol.core.visitor.DataDivisionSection.FILE;
import static com.broadcom.lsp.cobol.core.visitor.VariableDefinitionDelegate.*;
import static java.util.Optional.ofNullable;
import static java.util.function.Predicate.not;
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

  private final Collection<Variable> definedVariables = new ArrayList<>();
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
  }

  /**
   * Get the semantic context of the document as an output of th semantic analysis
   *
   * @return the semantic context of the document, containing all the definitions and usages of
   *     paragraphs, variables and copybooks
   */
  @NonNull
  public ResultWithErrors<SemanticContext> finishAnalysis() {
    if (!variablesDelegate.isResultCollected()) finishVariableDefinition();
    errors.addAll(groupContext.generateParagraphErrors(messageService));
    return new ResultWithErrors<>(
        SemanticContext.builder()
            .variableDefinitions(collectVariableDefinitions())
            .variableUsages(collectVariableUsages())
            .paragraphDefinitions(groupContext.getParagraphDefinitions())
            .paragraphUsages(groupContext.getParagraphUsages())
            .sectionDefinitions(groupContext.getSectionDefinitions())
            .sectionUsages(groupContext.getSectionUsages())
            .constantDefinitions(constants.getDefinitions().asMap())
            .constantUsages(constants.getUsages().asMap())
            .copybookDefinitions(copybooks.getDefinitions().asMap())
            .copybookUsages(copybooks.getUsages().asMap())
            .subroutinesDefinitions(getSubroutineDefinition())
            .subroutinesUsages(subroutineUsages.asMap())
            .outlineTree(buildOutlineTree())
            .build(),
        errors);
  }

  private Map<String, Collection<Location>> collectVariableDefinitions() {
    Multimap<String, Location> definitions = HashMultimap.create();
    definedVariables.stream()
        .filter(not(it -> it.getName().equals(OutlineNodeNames.FILLER_NAME)))
        .forEach(it -> definitions.put(it.getName(), it.getDefinition().toLocation()));
    return definitions.asMap();
  }

  private Map<String, Collection<Location>> collectVariableUsages() {
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
    outlineTreeBuilder.addNode(OutlineNodeNames.IDENTIFICATION_DIVISION, NodeType.DIVISION, ctx);
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
              outlineTreeBuilder.addNode(
                  OutlineNodeNames.PROGRAM_ID_PREFIX + name, NodeType.PROGRAM_ID, ctx);
            });
    return visitChildren(ctx);
  }

  @Override
  public Void visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.PROCEDURE_DIVISION, NodeType.DIVISION, ctx);
    finishVariableDefinition();
    return visitChildren(ctx);
  }

  private void finishVariableDefinition() {
    definedVariables.addAll(variablesDelegate.finishDefinitionAnalysis().unwrap(errors::addAll));
  }

  @Override
  public Void visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.ENVIRONMENT_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.DATA_DIVISION, NodeType.DIVISION, ctx);
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
    outlineTreeBuilder.addNode(OutlineNodeNames.WORKING_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.switchSection(DataDivisionSection.WORKING_STORAGE);
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
    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE_SECTION, ctx);

    String name = ctx.getStart().getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(locality -> groupContext.addSectionDefinition(name, locality));
    return visitChildren(ctx);
  }

  @Override
  public Void visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE, ctx);
    return visitChildren(ctx);
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
    outlineTreeBuilder.addNode(OutlineNodeNames.CONFIGURATION_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitInputOutputSection(InputOutputSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.INPUT_OUTPUT_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitSelectClause(SelectClauseContext ctx) {
    outlineTreeBuilder.addNode(ctx.fileName().getText(), NodeType.FILE, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Void visitFileSection(FileSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.FILE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.switchSection(FILE);
    return visitChildren(ctx);
  }

  @Override
  public Void visitLinkageSection(LinkageSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.LINKAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.switchSection(DataDivisionSection.LINKAGE);
    return visitChildren(ctx);
  }

  @Override
  public Void visitLocalStorageSection(LocalStorageSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.LOCAL_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    variablesDelegate.switchSection(DataDivisionSection.LOCAL_STORAGE);
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
            .orElse(OutlineNodeNames.FILLER_NAME);
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
  public Void visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    variablesDelegate.defineVariable(ctx);
    String name =
        ofNullable(ctx.entryName())
            .map(EntryNameContext::dataName1)
            .map(RuleContext::getText)
            .orElse(OutlineNodeNames.FILLER_NAME);
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
            .orElse(OutlineNodeNames.FILLER_NAME);
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
            .orElse(OutlineNodeNames.FILLER_NAME);

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
    Locality locality = getLocality(ctx.dataName().getStart()).orElse(null);
    if (constants.contains(dataName)) {
      constants.addUsage(dataName, locality.toLocation());
      return visitChildren(ctx);
    }
    List<QualifiedInDataContext> hierarchy = ctx.qualifiedInData();
    List<Variable> foundVariables = findVariable(createQualifier(dataName, hierarchy));

    if (foundVariables.size() == 1) {
      Variable variable = foundVariables.get(0);
      variable.addUsage(locality);

      addParentVariablesUsage(collectParentVariables(hierarchy), variable);
    } else {
      reportInvalidDefinition(dataName, locality);
    }
    return visitChildren(ctx);
  }

  @Override
  public Void visitTableCall(TableCallContext ctx) {
    String dataName =
        ofNullable(ctx.dataName2()).map(RuleContext::getText).map(String::toUpperCase).orElse("");
    Locality locality = getLocality(ctx.dataName2().getStart()).orElse(null);
    if (constants.contains(dataName)) {
      constants.addUsage(dataName, locality.toLocation());
      return visitChildren(ctx);
    }
    String qualifier = ".* " + dataName;
    List<Variable> foundVariables = findVariable(qualifier);

    if (foundVariables.size() == 1) {
      Variable variable = foundVariables.get(0);
      variable.addUsage(locality);
    } else {
      reportInvalidDefinition(dataName, locality);
    }
    return visitChildren(ctx);
  }

  private List<Variable> findVariable(String qualifier) {
    return definedVariables.stream()
        .filter(it -> it.getQualifier().matches(qualifier))
        .collect(toList());
  }

  private void addParentVariablesUsage(Map<String, Token> parentVariables, Variable variable) {
    Variable parent = variable.getParent();
    while (parent != null) {
      ofNullable(parentVariables.get(parent.getName()))
          .map(positionMapping::get)
          .ifPresent(parent::addUsage);
      parent = parent.getParent();
    }
  }

  private Map<String, Token> collectParentVariables(List<QualifiedInDataContext> hierarchy) {
    Map<String, Token> parentVariables =
        hierarchy.stream()
            .map(QualifiedInDataContext::inData)
            .filter(Objects::nonNull)
            .map(InDataContext::dataName2)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart));

    parentVariables.putAll(
        hierarchy.stream()
            .map(QualifiedInDataContext::inTable)
            .filter(Objects::nonNull)
            .map(InTableContext::tableCall)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart)));
    return parentVariables;
  }

  private String createQualifier(String dataName, List<QualifiedInDataContext> hierarchy) {
    String hierarchicalQualifier =
        hierarchy.stream()
            .map(this::getDataName2Context)
            .map(RuleContext::getText)
            .map(String::toUpperCase)
            .reduce((s1, s2) -> s2 + " .* " + s1)
            .orElse("");

    return hierarchicalQualifier.isEmpty()
        ? ".* " + dataName
        : ".* " + hierarchicalQualifier + " .* " + dataName;
  }

  @Override
  public Void visitCallStatement(CallStatementContext ctx) {
    if (ctx.literal() != null) {
      String subroutineName =
          PreprocessorStringUtils.trimQuotes(ctx.literal().getText()).toUpperCase();
      var locality = getLocality(ctx.literal().getStart());
      locality.ifPresent(
          it -> {
            if (subroutineService.getUri(subroutineName).isEmpty()) {
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

    LOG.debug("Syntax error by CobolVisitor#throwException: " + error.toString());
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  private Optional<Locality> getLocality(Token childToken) {
    return ofNullable(positionMapping.get(childToken));
  }

  private DataName2Context getDataName2Context(QualifiedInDataContext node) {
    return ofNullable(node.inData())
        .map(InDataContext::dataName2)
        .orElseGet(
            () ->
                ofNullable(node.inTable())
                    .map(InTableContext::tableCall)
                    .map(TableCallContext::dataName2)
                    .orElse(null));
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
    LOG.debug("Syntax error by CobolVisitor#reportSubroutineNotDefined: " + error.toString());
    errors.add(error);
  }

  private void reportInvalidDefinition(String dataName, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(messageService.getMessage("CobolVisitor.invalidDefMsg", dataName))
            .severity(ErrorSeverity.ERROR)
            .locality(locality)
            .build();
    LOG.debug("Syntax error by CobolVisitor#reportInvalidDefinition: " + error.toString());
    errors.add(error);
  }

  private void throwWarning(Token token) {
    MisspelledKeywordDistance.calculateDistance(token.getText().toUpperCase())
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
    LOG.debug("Syntax error by CobolVisitor#reportMisspelledKeyword: " + error.toString());
    errors.add(error);
  }

  private void areaAWarning(Token token) {
    getLocality(token)
        .filter(it -> it.getRange().getStart().getCharacter() > 10)
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
    return List.of(
        new Location(subroutinePair.getValue().get(), new Range(new Position(), new Position())));
  }
}
