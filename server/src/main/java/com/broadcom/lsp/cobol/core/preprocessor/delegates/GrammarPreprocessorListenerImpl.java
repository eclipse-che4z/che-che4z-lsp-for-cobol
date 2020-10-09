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
package com.broadcom.lsp.cobol.core.preprocessor.delegates;

import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.model.*;
import com.broadcom.lsp.cobol.core.preprocessor.ProcessingConstants;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.resolution.CopybookResolution;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import com.broadcom.lsp.cobol.core.semantics.NamedSubContext;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.ca.lsp.core.cobol.parser.CobolPreprocessor.*;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.assistedinject.Assisted;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nonnull;
import java.util.*;
import java.util.function.Function;

import static com.broadcom.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.INFO;
import static java.lang.String.format;
import static java.util.Optional.ofNullable;
import static java.util.UUID.randomUUID;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Lexer.HIDDEN;
import static org.antlr.v4.runtime.Token.EOF;
import static org.apache.commons.lang3.StringUtils.isEmpty;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener {

  private static final String RECURSION_DETECTED = "Recursive copybook declaration for: %s";
  private static final String COPYBOOK_OVER_8_CHARACTERS =
      "Copybook declaration has more than 8 characters for: %s";
  private static final String ERROR_SUGGESTION = "%s: Copybook not found";

  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final List<Pair<String, String>> replacingClauses = new ArrayList<>();
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();
  private final Map<String, Locality> copyStatements = new HashMap<>();

  private String documentUri;
  private BufferedTokenStream tokens;
  private CopybookProcessingMode copybookProcessingMode;
  private TextPreprocessor preprocessor;
  private Provider<CopybookResolution> resolutions;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted CopybookProcessingMode copybookProcessingMode,
      TextPreprocessor preprocessor,
      Provider<CopybookResolution> resolutions,
      ReplacingService replacingService) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookStack = copybookStack;
    this.copybookProcessingMode = copybookProcessingMode;
    this.preprocessor = preprocessor;
    this.resolutions = resolutions;
    this.replacingService = replacingService;
    textAccumulator.push(new StringBuilder());
  }

  @Nonnull
  @Override
  public ExtendedDocument getResult() {
    nestedMappings.put(
        documentUri,
        new DocumentMapping(
            tokens.getTokens().stream().map(toPosition()).collect(toList()), shifts));
    return new ExtendedDocument(read(), copybooks, nestedMappings, copyStatements);
  }

  @Override
  public void enterCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // push a new context for the COMPILER OPTIONS terminals
    push();
  }

  @Override
  public void exitCompilerOptions(@Nonnull CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    pop();
    accumulateExcludedStatementShift(ctx.getSourceInterval());
  }

  @Override
  public void enterReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    push();
  }

  @Override
  public void exitReplaceArea(@Nonnull ReplaceAreaContext ctx) {
    String content = applyReplacing(read(), replacingClauses);
    replacingClauses.clear();

    pop();
    write(content);
  }

  @Override
  public void enterCopyStatement(@Nonnull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@Nonnull CopyStatementContext ctx) {
    if (!copybookProcessingMode.analyze) {
      pop();
      return;
    }
    CopySourceContext copySource = ctx.copySource();

    String copybookName = retrieveCopybookName(copySource);
    Locality locality = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, locality);

    String uri = model.getUri();
    String rawContent = model.getContent();

    String copybookId = randomUUID().toString();
    String replacedContent = applyReplacing(rawContent, replacingClauses);
    replacingClauses.clear();

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, copybookId, replacedContent, locality);
    String copybookContent = copybookDocument.getText();

    checkCopybookNameLength(copybookName, locality);
    addCopybookUsage(copybookName, locality);
    addCopybookDefinition(copybookName, uri);

    collectCopyStatement(copybookId, retrieveCopybookStatementPosition(ctx));
    collectNestedSemanticData(uri, copybookId, copybookDocument);
    writeCopybook(copybookId, copybookContent);

    accumulateCopybookShift(ctx.getSourceInterval());
  }

  @Override
  public void enterReplaceLiteral(ReplaceLiteralContext ctx) {
    push();
  }

  @Override
  public void exitReplaceLiteral(ReplaceLiteralContext ctx) {
    replacingClauses.add(replacingService.retrieveTokenReplacingPattern(read()));
    pop();
  }

  @Override
  public void enterReplacePseudoText(ReplacePseudoTextContext ctx) {
    push();
  }

  @Override
  public void exitReplacePseudoText(ReplacePseudoTextContext ctx) {
    replacingClauses.add(replacingService.retrievePseudoTextReplacingPattern(read()));
    pop();
  }

  @Override
  public void visitTerminal(@Nonnull TerminalNode node) {
    int tokPos = node.getSourceInterval().a;
    write(retrieveHiddenTextToLeft(tokPos, tokens));

    if (node.getSymbol().getType() != EOF) {
      write(node.getText());
    }
  }

  private String retrieveHiddenTextToLeft(int tokPos, BufferedTokenStream tokens) {

    return ofNullable(tokens.getHiddenTokensToLeft(tokPos, HIDDEN))
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }

  private void accumulateCopybookShift(Interval sourceInterval) {
    shifts.put(sourceInterval.a - 1, sourceInterval.b - sourceInterval.a + 1);
  }

  private void accumulateExcludedStatementShift(Interval sourceInterval) {
    shifts.put(sourceInterval.a - 1, sourceInterval.b - sourceInterval.a + 2);
  }

  @Nonnull
  private StringBuilder peek() {
    return ofNullable(textAccumulator.peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  private void pop() {
    textAccumulator.pop();
  }

  private void push() {
    textAccumulator.push(new StringBuilder());
  }

  private void write(@Nonnull String text) {
    peek().append(text);
  }

  @Nonnull
  private String read() {
    return peek().toString();
  }

  private void collectCopyStatement(String copybookId, Locality locality) {
    copyStatements.put(copybookId, locality);
  }

  private void collectNestedSemanticData(
      String uri, String copybookId, ExtendedDocument copybookDocument) {
    copybooks.merge(copybookDocument.getCopybooks());
    copyStatements.putAll(copybookDocument.getCopyStatements());
    nestedMappings.putAll(copybookDocument.getDocumentMapping());
    nestedMappings.putIfAbsent(copybookId, nestedMappings.get(uri));
  }

  private void writeCopybook(String copybookId, String copybookContent) {
    // throw away COPY terminals
    pop();
    // write copybook beginning trigger
    write(ProcessingConstants.CPY_ENTER_TAG);
    write(ProcessingConstants.CPY_URI_OPEN);
    write(copybookId);
    write(ProcessingConstants.CPY_URI_CLOSE);
    write(copybookContent);
    // write copybook closing trigger
    write(ProcessingConstants.CPY_EXIT_TAG);
  }

  private String applyReplacing(String rawContent, List<Pair<String, String>> replacePatterns) {
    return replacingService.applyReplacing(rawContent, replacePatterns);
  }

  private CopybookModel getCopyBookContent(String copybookName, Locality locality) {

    if (copybookName.isEmpty()) return emptyModel(copybookName);

    if (hasRecursion(copybookName)) {
      copybookStack.forEach(this::reportRecursiveCopybook);
      return emptyModel(copybookName);
    }

    CopybookModel copybook =
        resolutions.get().resolve(copybookName, documentUri, copybookProcessingMode);

    if (copybook == null || copybook.getContent() == null) {
      reportMissingCopybooks(copybookName, locality);
      return emptyModel(copybookName);
    }

    return copybook;
  }

  private boolean hasRecursion(String copybookName) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals);
  }

  private ExtendedDocument processCopybook(
      String copybookName, String uri, String copybookId, String content, Locality locality) {
    copybookStack.push(new CopybookUsage(copybookName, copybookId, locality));
    ResultWithErrors<ExtendedDocument> result =
        preprocessor.process(uri, content, copybookStack, copybookProcessingMode);
    copybookStack.pop();

    errors.addAll(result.getErrors());

    return result.getResult();
  }

  private CopybookModel emptyModel(String copybookName) {
    return new CopybookModel(copybookName, "", "");
  }

  @Nonnull
  private String retrieveCopybookName(@Nonnull CopySourceContext copySource) {
    return retrieveCopybookName(
        Optional.<RuleContext>ofNullable(copySource.cobolWord()).orElse(copySource.literal()));
  }

  private String retrieveCopybookName(@Nonnull RuleContext context) {
    return context.getText().toUpperCase();
  }

  private String retrieveCopybookId() {
    return ofNullable(copybookStack)
        .map(Deque::peek)
        .map(CopybookUsage::getCopybookId)
        .orElse(null);
  }

  private void addCopybookUsage(@Nonnull String copybookName, @Nonnull Locality locality) {
    copybooks.addUsage(copybookName, locality.toLocation());
  }

  private void addCopybookDefinition(String copybookName, String uri) {
    if (!(isEmpty(copybookName) || isEmpty(uri))) {
      copybooks.define(
          copybookName, new Location(uri, new Range(new Position(0, 0), new Position(0, 0))));
    }
  }

  @Nonnull
  private Locality retrieveCopybookStatementPosition(@Nonnull ParserRuleContext ctx) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(retrieveCopybookId())
        .range(
            new Range(
                getStartPosition(ctx.getStart()),
                new Position(
                    ctx.getStop().getLine() - 1,
                    ctx.getStop().getCharPositionInLine()
                        + ctx.getStop().getText().trim().length())))
        .recognizer(GrammarPreprocessorListenerImpl.class)
        .build();
  }

  @Nonnull
  private Locality retrievePosition(@Nonnull ParserRuleContext ctx) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(retrieveCopybookId())
        .range(new Range(getStartPosition(ctx.getStart()), getStopPosition(ctx.getStop())))
        .recognizer(GrammarPreprocessorListenerImpl.class)
        .build();
  }

  @Nonnull
  private Function<Token, Locality> toPosition() {
    return token ->
        Locality.builder()
            .uri(documentUri)
            .copybookId(retrieveCopybookId())
            .range(new Range(getStartPosition(token), getStopPosition(token)))
            .token(token.getText())
            .recognizer(GrammarPreprocessorListenerImpl.class)
            .build();
  }

  private Position getStartPosition(Token token) {
    return new Position(token.getLine() - 1, token.getCharPositionInLine());
  }

  private Position getStopPosition(Token token) {
    return new Position(
        token.getLine() - 1,
        token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
  }

  private void reportRecursiveCopybook(CopybookUsage usage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(format(RECURSION_DETECTED, usage.getName()))
            .locality(usage.getLocality())
            .build();
    LOG.debug(
        "Syntax error by GrammarPreprocessorListenerImpl#reportRecursiveCopybook: "
            + error.toString());
    errors.add(error);
  }

  private void reportMissingCopybooks(String copybookName, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .suggestion(format(ERROR_SUGGESTION, copybookName))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build();
    LOG.debug(
        "Syntax error by GrammarPreprocessorListenerImpl#reportMissingCopybooks: "
            + error.toString());
    errors.add(error);
  }

  private void checkCopybookNameLength(String copybookName, Locality locality) {
    if (copybookName.length() > 8) {
      SyntaxError error =
          SyntaxError.syntaxError()
              .severity(INFO)
              .suggestion(format(COPYBOOK_OVER_8_CHARACTERS, copybookName))
              .locality(locality)
              .build();
      LOG.debug(
          "Syntax error by GrammarPreprocessorListenerImpl#checkCopybookNameLength: "
              + error.toString());
      errors.add(error);
    }
  }
}
