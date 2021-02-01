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

package com.broadcom.lsp.cobol.usecases.engine;

import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import com.broadcom.usecase.UseCasePreprocessorBaseListener;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.NonNull;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Collectors;

import static com.broadcom.usecase.UseCasePreprocessorParser.*;
import static java.util.Collections.singletonList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.antlr.v4.runtime.Lexer.HIDDEN;

/**
 * This ANTLR listener removes all the technical tokens from the given text, extracts semantic
 * context and diagnostics applying correct positions. The grammar for this listener written inside
 * UseCasePreprocessor.g4
 */
public class UseCasePreprocessorListener extends UseCasePreprocessorBaseListener {
  private static final List<String> PREDEFINED_VARIABLES =
      ImmutableList.of(
          "EIBAID",
          "EIBATT",
          "EIBCALEN",
          "EIBCOMPL",
          "EIBCONF",
          "EIBCPOSN",
          "EIBDATE",
          "EIBDS",
          "EIBEOC",
          "EIBERR",
          "EIBERRCD",
          "EIBFMH",
          "EIBFN",
          "EIBFREE",
          "EIBNODAT",
          "EIBRCODE",
          "EIBRECV",
          "EIBREQID",
          "EIBRESP",
          "EIBRESP2",
          "EIBRLDBK",
          "EIBRSRCE",
          "EIBSIG",
          "EIBSYNC",
          "EIBSYNRB",
          "EIBTASKN",
          "EIBTIME",
          "EIBTRMID",
          "EIBTRNID",
          "XML-CODE",
          "XML-EVENT",
          "XML-NAMESPACE",
          "XML-NNAMESPACE",
          "XML-NAMESPACE-PREFIX",
          "XML-NNAMESPACE-PREFIX",
          "XML-NTEXT",
          "XML-TEXT",
          "JNIENVPTR",
          "JSON-CODE",
          "JSON-STATUS");
  private Map<String, List<Diagnostic>> diagnostics = new HashMap<>();
  private Map<String, List<Location>> variableDefinitions = new HashMap<>();
  private Map<String, List<Location>> variableUsages = new HashMap<>();
  private Map<String, List<Location>> paragraphDefinitions = new HashMap<>();
  private Map<String, List<Location>> paragraphUsages = new HashMap<>();
  private Map<String, List<Location>> sectionDefinitions = new HashMap<>();
  private Map<String, List<Location>> sectionUsages = new HashMap<>();
  private Map<String, List<Location>> constantUsages = new HashMap<>();
  private Map<String, List<Location>> copybookDefinitions = new HashMap<>();
  private Map<String, List<Location>> copybookUsages = new HashMap<>();
  private Map<String, List<Location>> subroutineUsages = new HashMap<>();

  private Deque<StringBuilder> contexts = new ArrayDeque<>();

  private int[] lineShifts;
  private CommonTokenStream tokens;
  private String documentUri;
  private String copybookName;
  private Map<String, Diagnostic> expectedDiagnostics;

  UseCasePreprocessorListener(
      CommonTokenStream tokens,
      String documentName,
      String documentUri,
      int numberOfLines,
      Map<String, Diagnostic> expectedDiagnostics) {
    this.tokens = tokens;
    this.documentUri = documentUri;
    this.copybookName = documentName;
    lineShifts = new int[numberOfLines];
    this.expectedDiagnostics = expectedDiagnostics;
    contexts.push(new StringBuilder());
    diagnostics.put(documentUri, new ArrayList<>());
    ofNullable(documentName).ifPresent(defineCopybook(documentUri));
  }

  /**
   * Get result of processing, including cleaned-up text, semantic context and diagnostics
   *
   * @return a {@link TestData} of the processing
   */
  @NonNull
  TestData getProcessingResult() {
    return new TestData(
        peek().toString(),
        copybookName,
        diagnostics,
        variableDefinitions,
        variableUsages,
        paragraphDefinitions,
        paragraphUsages,
        sectionDefinitions,
        sectionUsages,
        getConstantDefinitions(),
        constantUsages,
        copybookDefinitions,
        copybookUsages,
        ImmutableMap.of(),
        subroutineUsages);
  }

  @Override
  public void enterErrorStatement(ErrorStatementContext ctx) {
    push();
  }

  @Override
  public void exitErrorStatement(ErrorStatementContext ctx) {
    pop();
    ReplacementContext replacementContext =
        ofNullable(ctx.word()).map(WordContext::replacement).orElse(null);
    String text =
        ofNullable(ctx.word())
            .map(WordContext::identifier)
            .map(RuleContext::getText)
            .orElse(
                ofNullable(ctx.STRINGLITERAL())
                    .map(ParseTree::getText)
                    .orElse(ofNullable(ctx.TEXT()).map(ParseTree::getText).orElse("")));

    processToken(text, ctx, replacementContext, null, ctx.diagnostic());
  }

  @Override
  public void enterCopybookStatement(CopybookStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopybookStatement(CopybookStatementContext ctx) {
    pop();
    ofNullable(ctx.copybookUsage())
        .map(CopybookUsageContext::cpyIdentifier)
        .ifPresent(processCopybook(ctx, copybookUsages));
    ofNullable(ctx.copybookDefinition())
        .map(CopybookDefinitionContext::cpyIdentifier)
        .ifPresent(processCopybook(ctx, copybookDefinitions));
  }

  private Consumer<CpyIdentifierContext> processCopybook(
      CopybookStatementContext ctx, Map<String, List<Location>> copybookUsages) {
    return it ->
        processToken(
            PreprocessorStringUtils.trimQuotes(it.cpyName().getText().toUpperCase()), ctx, it.replacement(), copybookUsages, ctx.diagnostic());
  }

  @Override
  public void enterVariableStatement(VariableStatementContext ctx) {
    push();
  }

  @Override
  public void exitVariableStatement(VariableStatementContext ctx) {
    pop();
    ofNullable(ctx.variableUsage())
        .map(VariableUsageContext::word)
        .ifPresent(
            it ->
                processToken(
                    it.identifier().getText(),
                    ctx,
                    it.replacement(),
                    variableUsages,
                    ctx.diagnostic()));
    ofNullable(ctx.variableDefinition())
        .map(VariableDefinitionContext::word)
        .ifPresent(
            it ->
                processToken(
                    it.identifier().getText(),
                    ctx,
                    it.replacement(),
                    variableDefinitions,
                    ctx.diagnostic()));
  }

  @Override
  public void enterParagraphStatement(ParagraphStatementContext ctx) {
    push();
  }

  @Override
  public void exitParagraphStatement(ParagraphStatementContext ctx) {
    pop();
    ofNullable(ctx.paragraphUsage())
        .map(ParagraphUsageContext::word)
        .ifPresent(
            it ->
                processToken(
                    it.identifier().getText(),
                    ctx,
                    it.replacement(),
                    paragraphUsages,
                    ctx.diagnostic()));
    ofNullable(ctx.paragraphDefinition())
        .map(ParagraphDefinitionContext::word)
        .ifPresent(
            it ->
                processToken(
                    it.identifier().getText(),
                    ctx,
                    it.replacement(),
                    paragraphDefinitions,
                    ctx.diagnostic()));
  }

  @Override
  public void enterSectionStatement(SectionStatementContext ctx) {
    push();
  }

  @Override
  public void exitSectionStatement(SectionStatementContext ctx) {
    pop();
    ofNullable(ctx.sectionUsage())
            .map(SectionUsageContext::word)
            .ifPresent(
                    it ->
                            processToken(
                                    it.identifier().getText(),
                                    ctx,
                                    it.replacement(),
                                    sectionUsages,
                                    ctx.diagnostic()));
    ofNullable(ctx.sectionDefinition())
            .map(SectionDefinitionContext::word)
            .ifPresent(
                    it ->
                            processToken(
                                    it.identifier().getText(),
                                    ctx,
                                    it.replacement(),
                                    sectionDefinitions,
                                    ctx.diagnostic()));
  }

  @Override
  public void enterConstantStatement(ConstantStatementContext ctx) {
    push();
  }

  @Override
  public void exitConstantStatement(ConstantStatementContext ctx) {
    pop();
    ofNullable(ctx.constantUsage())
        .map(ConstantUsageContext::word)
        .ifPresent(
            it ->
                processToken(
                    it.identifier().getText(),
                    ctx,
                    it.replacement(),
                    constantUsages,
                    ctx.diagnostic()));
  }

  @Override
  public void enterSubroutineStatement(SubroutineStatementContext ctx) {
    push();
  }

  @Override
  public void exitSubroutineStatement(SubroutineStatementContext ctx) {
    pop();
    ofNullable(ctx.subroutineUsage())
        .ifPresent(
            it ->
                processToken(
                    it.STRINGLITERAL().getText(),
                    ctx,
                    it.replacement(),
                    subroutineUsages,
                    ctx.diagnostic(),
                    true
                ));
  }

  @Override
  public void enterMultiTokenError(MultiTokenErrorContext ctx) {
    // Write preceding hidden tokens here to simplify logic of position extraction
    write(getHiddenText(tokens.getHiddenTokensToLeft(ctx.start.getTokenIndex(), HIDDEN)));
    push();
    // Accumulate the length of the opening mark of multi-token error definition to calculate the
    // nested tokens positions correctly
    lineShifts[getLine(ctx.getStart())] += ctx.start.getText().length();
  }

  @Override
  public void exitMultiTokenError(MultiTokenErrorContext ctx) {
    String multiTokenText = peek().toString().replaceAll("\\{_", "").replaceAll("_}", "");
    String affectedTokens = multiTokenText.substring(0, multiTokenText.indexOf('|')).trim();

    // Closing mark of the last token in multi-token error definition is an effective pivot of the
    // entire statement to calculate its stop position
    Token closingOfMultiToken = ctx.multiToken().stop;
    int line = getLine(ctx.getStart());
    int stopMarkLen = closingOfMultiToken.getText().length();
    int stop = closingOfMultiToken.getCharPositionInLine() + stopMarkLen - lineShifts[line];
    int start = stop - affectedTokens.length();
    lineShifts[line] += stopMarkLen;

    registerDiagnostics(
        new Range(new Position(line, start), new Position(line, stop)), ctx.diagnostic());
    pop();
    write(affectedTokens);
  }

  @Override
  public void visitTerminal(TerminalNode node) {
    write(
        ofNullable(tokens.getHiddenTokensToLeft(node.getSourceInterval().a, HIDDEN))
            .map(this::getHiddenText)
            .orElse(""));
    if (node.getSymbol().getType() != EOF) {
      write(node.getText());
    }
  }

  private Map<String, List<Location>> getConstantDefinitions() {
    List<Location> defaultLocation = ImmutableList.of(new Location());
    return PREDEFINED_VARIABLES.stream()
        .collect(Collectors.toMap(it -> it, it -> defaultLocation));
  }

  @NonNull
  private StringBuilder peek() {
    return ofNullable(contexts.peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  private void pop() {
    contexts.pop();
  }

  private void push() {
    contexts.push(new StringBuilder());
  }

  private void write(@NonNull String text) {
    peek().append(text);
  }

  /**
   * Add copybook definition. In the current implementation, copybook definition points to the
   * beginning of the copybook file.
   *
   * @param uri - URI of the copybook
   * @return consumer that turns the given copybook name into a definition using given URI
   */
  private Consumer<String> defineCopybook(String uri) {
    return copybookName ->
        copybookDefinitions.put(
            copybookName,
            singletonList(new Location(uri, new Range(new Position(0, 0), new Position(0, 0)))));
  }

  private void processToken(
      String text,
      ParserRuleContext ctx,
      ReplacementContext replacement,
      Map<String, List<Location>> storage,
      List<DiagnosticContext> diagnosticIds) {
    processToken(text, ctx, replacement, storage, diagnosticIds, false);
  }

  private void processToken(
      String text,
      ParserRuleContext ctx,
      ReplacementContext replacement,
      Map<String, List<Location>> storage,
      List<DiagnosticContext> diagnosticIds,
      boolean stripQuotes) {

    String replacementText =
        ofNullable(replacement).map(it -> it.identifier().getText()).orElse(text);
    Range range = retrieveRange(ctx, replacementText);
    ofNullable(storage).ifPresent(it -> {
      String storedText = replacementText;
      if (stripQuotes) {
        storedText = PreprocessorStringUtils.trimQuotes(storedText);
      }
      addTokenLocation(it, storedText.toUpperCase(), range);
    });

    ofNullable(replacement).ifPresent(addPositionShift());
    lineShifts[getLine(ctx.start)] += text.length() - replacementText.length();
    registerDiagnostics(range, diagnosticIds);
    write(getHiddenText(tokens.getHiddenTokensToLeft(ctx.start.getTokenIndex())));
    write(text);
  }

  private void addTokenLocation(Map<String, List<Location>> storage, String text, Range range) {
    Location location = new Location(documentUri, range);
    if (storage.containsKey(text)) {
      storage.get(text).add(location);
    } else {
      List<Location> list = new ArrayList<>();
      list.add(location);
      storage.put(text, list);
    }
  }

  private String getHiddenText(List<Token> hiddenTokensToLeft) {
    return ofNullable(hiddenTokensToLeft)
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }

  private void registerDiagnostics(Range range, List<DiagnosticContext> diagnostic) {
    diagnostic.stream()
        .peek(addPositionShift())
        .map(DiagnosticContext::identifier)
        .map(RuleContext::getText)
        .map(expectedDiagnostics::get)
        .forEach(registerDiagnostic(range));
  }

  private Consumer<ParserRuleContext> addPositionShift() {
    return it ->
        lineShifts[getLine(it.start)] += it.start.getText().length() + it.stop.getText().length();
  }

  private Consumer<Diagnostic> registerDiagnostic(Range range) {
    return it ->
        diagnostics
            .get(documentUri)
            .add(
                new Diagnostic(
                    range, it.getMessage(), it.getSeverity(), it.getSource(), it.getCode()));
  }

  private Range retrieveRange(ParserRuleContext ctx, String text) {
    int line = getLine(ctx.getStart());
    int start = ctx.start.getCharPositionInLine() - lineShifts[line];
    // accumulate lengths of removable symbols (opening and closing marks) to calculate the trailing
    // positions in the line correctly
    lineShifts[line] += ctx.start.getText().length() + ctx.stop.getText().length();
    return new Range(new Position(line, start), new Position(line, start + text.length()));
  }

  /**
   * Get number of line of the given token. ANTLR counts lines from 1, and IDEs count them from 0,
   * so for user-visible positions this number should be less on 1
   *
   * @param token - token to retrieve the line number
   * @return 0-based line number
   */
  private int getLine(Token token) {
    return token.getLine() - 1;
  }
}
