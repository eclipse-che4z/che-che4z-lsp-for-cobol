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
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.model.Variable;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import com.broadcom.lsp.cobol.core.semantics.*;
import com.broadcom.lsp.cobol.core.semantics.outline.NodeType;
import com.broadcom.lsp.cobol.core.semantics.outline.OutlineNodeNames;
import com.broadcom.lsp.cobol.core.semantics.outline.OutlineTreeBuilder;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.antlr.v4.runtime.tree.RuleNode;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.*;

import static com.broadcom.lsp.cobol.core.CobolParser.*;
import static com.broadcom.lsp.cobol.core.semantics.CobolVariableContext.LEVEL_77;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final String DECLARATIVE_SAME_MSG =
      "The following token cannot be on the same line as a DECLARATIVE token: ";

  private final List<SyntaxError> errors = new ArrayList<>();

  private final CobolVariableContext variables = new CobolVariableContext();
  private final PredefinedVariableContext constants = new PredefinedVariableContext();
  private final GroupContext groupContext = new GroupContext();

  private String programName = null;

  private final NamedSubContext copybooks;
  private final CommonTokenStream tokenStream;
  private final OutlineTreeBuilder outlineTreeBuilder;
  private final Map<Token, Locality> positionMapping;
  private final MessageService messageService;

  public CobolVisitor(
      @NonNull String documentUri,
      @NonNull NamedSubContext copybooks,
      @NonNull CommonTokenStream tokenStream,
      @NonNull Map<Token, Locality> positionMapping,
      MessageService messageService) {
    this.copybooks = copybooks;
    this.positionMapping = positionMapping;
    this.tokenStream = tokenStream;
    outlineTreeBuilder = new OutlineTreeBuilder(documentUri, positionMapping);
    this.messageService = messageService;
  }

  /**
   * Get the semantic context of the document as an output of th semantic analysis
   *
   * @return the semantic context of the document, containing all the definitions and usages of
   *     paragraphs, variables and copybooks
   */
  @NonNull
  public SemanticContext getSemanticContext() {
    return SemanticContext.builder()
        .variableDefinitions(variables.getDefinitions().asMap())
        .variableUsages(variables.getUsages().asMap())
        .paragraphDefinitions(groupContext.getParagraphDefinitions())
        .paragraphUsages(groupContext.getParagraphUsages())
        .sectionDefinitions(groupContext.getSectionDefinitions())
        .sectionUsages(groupContext.getSectionUsages())
        .constantDefinitions(constants.getDefinitions().asMap())
        .constantUsages(constants.getUsages().asMap())
        .copybookDefinitions(copybooks.getDefinitions().asMap())
        .copybookUsages(copybooks.getUsages().asMap())
        .outlineTree(buildOutlineTree())
        .build();
  }

  @NonNull
  public List<SyntaxError> getErrors() {
    List<SyntaxError> result = new ArrayList<>(errors);
    result.addAll(groupContext.generateParagraphErrors(messageService));

    return result;
  }

  @Override
  public Class visitIdentificationDivision(IdentificationDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.IDENTIFICATION_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
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
  public Class visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.PROCEDURE_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.ENVIRONMENT_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(OutlineNodeNames.DATA_DIVISION, NodeType.DIVISION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivisionSection(DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitWorkingStorageSection(WorkingStorageSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.WORKING_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    return visitChildren(ctx);
  }

  @Override
  public Class visitProgramUnit(ProgramUnitContext ctx) {
    outlineTreeBuilder.addProgram(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());
    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE_SECTION, ctx);

    String name = ctx.getStart().getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(locality -> groupContext.addSectionDefinition(name, locality));
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());
    outlineTreeBuilder.addNode(ctx.getStart().getText(), NodeType.PROCEDURE, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitFileDescriptionEntry(FileDescriptionEntryContext ctx) {
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
  public Class visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
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
  public Class visitEndProgramStatement(EndProgramStatementContext ctx) {
    Token endProgramNameToken = ctx.programName().getStart();
    checkProgramName(endProgramNameToken);
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitConfigurationSection(ConfigurationSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.CONFIGURATION_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitInputOutputSection(InputOutputSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.INPUT_OUTPUT_SECTION, NodeType.SECTION, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitSelectClause(SelectClauseContext ctx) {
    outlineTreeBuilder.addNode(ctx.fileName().getText(), NodeType.FILE, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitFileSection(FileSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.FILE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    return visitChildren(ctx);
  }

  @Override
  public Class visitLinkageSection(LinkageSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.LINKAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    return visitChildren(ctx);
  }

  @Override
  public Class visitLocalStorageSection(LocalStorageSectionContext ctx) {
    outlineTreeBuilder.addNode(OutlineNodeNames.LOCAL_STORAGE_SECTION, NodeType.SECTION, ctx);
    outlineTreeBuilder.initVariables();
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(StatementContext ctx) {
    List<Token> tokenList =
        tokenStream.getTokens(ctx.getStart().getTokenIndex(), ctx.getStop().getTokenIndex());
    areaBWarning(tokenList);

    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfThen(IfThenContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfElse(IfElseContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitSentence(SentenceContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraphName(ParagraphNameContext ctx) {
    String name = ctx.getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(locality -> groupContext.addParagraphDefinition(name, locality));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    Token token = ctx.getStart();
    String tokenText = token.getText();
    if (tokenText.equals("01") || tokenText.equals("1")) {
      areaAWarning(token);
    }
    String levelNumber = ctx.LEVEL_NUMBER().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                getLocality(variable.getStart())
                    .map(Locality::toLocation)
                    .ifPresent(
                        location -> defineVariable(levelNumber, variable.getText(), location)));
    String name =
        ofNullable(ctx.dataName1()).map(RuleContext::getText).orElse(OutlineNodeNames.FILLER_NAME);
    int level = Integer.parseInt(levelNumber);
    outlineTreeBuilder.addVariable(level, name, getDataDescriptionNodeType(ctx), ctx);
    ofNullable(ctx.dataOccursClause())
        .ifPresent(it -> it.forEach(occursClause -> processDataOccursClause(level, occursClause)));
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
  public Class visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    String levelNumber = ctx.LEVEL_NUMBER_66().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                getLocality(variable.getStart())
                    .map(Locality::toLocation)
                    .ifPresent(
                        location -> defineVariable(levelNumber, variable.getText(), location)));
    outlineTreeBuilder.addVariable(
        CobolVariableContext.LEVEL_66, ctx.dataName1().getText(), NodeType.FIELD_66, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    String levelNumber = ctx.LEVEL_NUMBER_88().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                getLocality(variable.getStart())
                    .map(Locality::toLocation)
                    .ifPresent(
                        location -> defineVariable(levelNumber, variable.getText(), location)));
    outlineTreeBuilder.addVariable(
        CobolVariableContext.LEVEL_88, ctx.dataName1().getText(), NodeType.FIELD_88, ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1Level77(
      DataDescriptionEntryFormat1Level77Context ctx) {
    areaAWarning(ctx.getStart());
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                getLocality(variable.getStart())
                    .map(Locality::toLocation)
                    .ifPresent(
                        location ->
                            defineVariable(
                                String.valueOf(LEVEL_77), variable.getText(), location)));
    String name =
        ofNullable(ctx.dataName1()).map(RuleContext::getText).orElse(OutlineNodeNames.FILLER_NAME);

    outlineTreeBuilder.addVariable(LEVEL_77, name, NodeType.FIELD, ctx);
    ofNullable(ctx.dataOccursClause())
        .ifPresent(it -> it.forEach(occursClause -> processDataOccursClause(77, occursClause)));
    return visitChildren(ctx);
  }

  private void defineVariable(String level, String name, @NonNull Location location) {
    variables.define(new Variable(level, name), location);
  }

  private void addVariableUsage(String name, @NonNull Location location) {
    addUsage(constants.contains(name) ? constants : variables, name, location);
  }

  private void addUsage(SubContext<?> langContext, String name, @NonNull Location location) {
    langContext.addUsage(name.toUpperCase(), location);
  }

  @Override
  public Class visitParagraphNameUsage(ParagraphNameUsageContext ctx) {
    String name = ctx.getText().toUpperCase();
    getLocality(ctx.getStart())
        .ifPresent(l -> groupContext.addCandidateUsage(name, l));
    return visitChildren(ctx);
  }

  private List<DocumentSymbol> buildOutlineTree() {
    return outlineTreeBuilder.build(copybooks.getUsages());
  }

  @Override
  public Class visitQualifiedDataNameFormat1(QualifiedDataNameFormat1Context ctx) {
    ofNullable(ctx.dataName())
        .map(it -> it.getText().toUpperCase())
        .ifPresent(variable -> checkForVariable(variable, ctx));
    return visitChildren(ctx);
  }

  @Override
  public Class visitTableCall(TableCallContext ctx) {
    ofNullable(ctx.dataName2())
        .map(RuleContext::getText)
        .map(String::toUpperCase)
        .ifPresent(
            variable -> {
              Optional<Locality> locality = getLocality(ctx.getStart());
              locality.ifPresent(it -> checkVariableDefinition(variable, it));
              locality.map(Locality::toLocation).ifPresent(it -> addVariableUsage(variable, it));
            });
    return visitChildren(ctx);
  }

  private void processDataOccursClause(int levelNumber, DataOccursClauseContext ctx) {
    ctx.indexName()
        .forEach(
            variable -> {
              getLocality(variable.getStart())
                  .map(Locality::toLocation)
                  .ifPresent(
                      location ->
                          defineVariable(
                              Integer.toString(levelNumber), variable.getText(), location));

              outlineTreeBuilder.addVariable(levelNumber, variable.getText(), NodeType.FIELD, ctx);
            });
  }

  private void checkForVariable(String variable, QualifiedDataNameFormat1Context ctx) {
    Optional<Locality> locality = getLocality(ctx.getStart());
    locality.ifPresent(it -> checkVariableDefinition(variable, it));
    locality.map(Locality::toLocation).ifPresent(it -> addVariableUsage(variable, it));

    if (ctx.qualifiedInData() != null) {
      iterateOverQualifiedDataNames(ctx, variable);
    }
  }

  private void iterateOverQualifiedDataNames(QualifiedDataNameFormat1Context ctx, String variable) {
    String child = variable;
    Token childToken = ctx.getStart();
    for (QualifiedInDataContext node : ctx.qualifiedInData()) {

      DataName2Context context = getDataName2Context(node);
      if (context == null) continue;

      String parent = context.getText().toUpperCase();
      Token parentToken = context.getStart();
      Optional<Locality> parentLocality = getLocality(parentToken);

      parentLocality.ifPresent(it -> checkVariableDefinition(parent, it));
      checkVariableStructure(parent, child, childToken, parentToken);

      childToken = parentToken;
      child = parent;

      Location parentLocation = parentLocality.map(Locality::toLocation).orElse(null);
      if (parentLocation != null) addVariableUsage(child, parentLocation);
    }
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

  private void checkVariableDefinition(String name, @NonNull Locality locality) {
    if (!variables.contains(name) && !constants.contains(name)) {
      reportVariableNotDefined(name, locality, locality); // starts and finishes in one token
    }
  }

  private DataName2Context getDataName2Context(QualifiedInDataContext node) {
    return ofNullable(node.inData())
        .map(InDataContext::dataName2)
        .orElse(
            ofNullable(node.inTable())
                .map(InTableContext::tableCall)
                .map(TableCallContext::dataName2)
                .orElse(null));
  }

  private void checkVariableStructure(
      String parent, String child, Token childToken, Token parentToken) {
    Optional<Locality> childLocality = getLocality(childToken);
    Optional<Locality> parentLocality = getLocality(parentToken);

    if (childLocality.isEmpty() || parentLocality.isEmpty()) return;
    if (!variables.parentContainsSpecificChild(parent, child)) {
      reportVariableNotDefined(
          extractErrorStatementText(childToken, parentToken),
          childLocality.get(),
          parentLocality.get());
    }
  }

  private String extractErrorStatementText(@NonNull Token childToken, @NonNull Token parentToken) {
    List<Token> tokenList = tokenStream.getTokens(childToken.getTokenIndex(), parentToken.getTokenIndex());

    return Optional.ofNullable(tokenList).stream()
        .flatMap(Collection::stream)
        .map(Token::getText)
        .collect(joining())
        .replaceAll(" +", " ");
  }

  private Locality getIntervalPosition(Locality start, Locality stop) {
    return Locality.builder()
        .uri(start.getUri())
        .range(new Range(start.getRange().getStart(), stop.getRange().getEnd()))
        .recognizer(CobolVisitor.class)
        .build();
  }

  private void reportVariableNotDefined(String dataName, Locality start, Locality stop) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(messageService.getMessage("CobolVisitor.invalidDefMsg", dataName))
            .severity(ErrorSeverity.INFO)
            .locality(getIntervalPosition(start, stop))
            .build();
    LOG.debug("Syntax error by CobolVisitor#reportVariableNotDefined: " + error.toString());
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
        .ifPresent(it -> throwException(token.getText(), it, messageService.getMessage("CobolVisitor.AreaAWarningMsg")));
  }

  private void areaBWarning(@NonNull List<Token> tokenList) {
    tokenList.forEach(
        token ->
            getLocality(token)
                .ifPresent(
                    locality -> {
                      int charPosition = locality.getRange().getStart().getCharacter();
                      if (charPosition > 6 && charPosition < 11 && token.getChannel() != 1) {
                        throwException(token.getText(), locality, messageService.getMessage("CobolVisitor.AreaBWarningMsg"));
                      }
                    }));
  }

  private void checkProgramName(Token token) {
    if (programName == null) {
      getLocality(token).ifPresent(it -> throwException("", it, messageService.getMessage("CobolVisitor.progIDIssueMsg")));
    } else {
      checkProgramNameIdentical(token);
    }
  }

  private void checkProgramNameIdentical(Token token) {
    String text = PreprocessorStringUtils.trimQuotes(token.getText());
    if (!programName.equals(text)) {
      getLocality(token).ifPresent(it -> throwException(programName, it, messageService.getMessage("CobolVisitor.identicalProgMsg")));
    }
  }

  // NOTE: CobolVisitor is not managed by Guice DI, so can't use annotation here.
  @Override
  public Class visitChildren(RuleNode node) {
    if(Thread.interrupted()) {
      LOG.debug("visitChildren method interrupted by user");
      throw new ParseCancellationException("Parsing interrupted by user.");
    }
    return super.visitChildren(node);
  }
}
