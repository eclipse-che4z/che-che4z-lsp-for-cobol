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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.*;
import com.ca.lsp.core.cobol.parser.CobolPreprocessor.*;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import com.ca.lsp.core.cobol.preprocessor.sub.document.GrammarPreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
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

import javax.annotation.Nonnull;
import java.util.*;
import java.util.function.Function;

import static com.ca.lsp.core.cobol.model.ErrorCode.MISSING_COPYBOOK;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.lang.String.format;
import static java.util.Optional.ofNullable;
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
  private final List<Pair<String, String>> replaceClauses = new ArrayList<>();
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();

  private String documentUri;
  private BufferedTokenStream tokens;
  private String copybookProcessingMode;
  private CobolPreprocessor preprocessor;
  private Provider<CopybookResolution> resolutions;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted("uri") String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted("copybookProcessingMode") String copybookProcessingMode,
      CobolPreprocessor preprocessor,
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
    return new ExtendedDocument(read(), copybooks, nestedMappings);
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
    String content = applyReplacing(read(), replaceClauses);

    replaceClauses.clear();
    pop();
    write(content);
  }

  @Override
  public void enterCopyStatement(@Nonnull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@Nonnull CopyStatementContext ctx) {
    if ("DISABLED".equals(copybookProcessingMode)) {
      pop();
      return;
    }
    CopySourceContext copySource = ctx.copySource();

    String copybookName = retrieveCopybookName(copySource);
    Position position = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, position);

    String uri = model.getUri();
    String rawContent = model.getContent();
    String copybookId = getCopybookId(uri, replaceClauses);
    String replacedContent = applyReplacing(rawContent, replaceClauses);
    replaceClauses.clear();

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, replacedContent, position);
    String copybookContent = copybookDocument.getText();

    checkCopybookNameLength(copybookName, position);
    addCopybookUsage(copybookName, position);
    addCopybookDefinition(copybookName, uri);

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
    replaceClauses.add(replacingService.getTokenReplacingPattern(read()));
    pop();
  }

  @Override
  public void enterReplacePseudoText(ReplacePseudoTextContext ctx) {
    push();
  }

  @Override
  public void exitReplacePseudoText(ReplacePseudoTextContext ctx) {
    replaceClauses.add(replacingService.getPseudoTextReplacingPattern(read()));
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

  private void collectNestedSemanticData(
      String uri, String copybookId, ExtendedDocument copybookDocument) {
    copybooks.merge(copybookDocument.getCopybooks());
    nestedMappings.putAll(copybookDocument.getDocumentMapping());
    nestedMappings.putIfAbsent(copybookId, nestedMappings.get(uri));
  }

  private void writeCopybook(String copybookId, String copybookContent) {
    // throw away COPY terminals
    pop();
    // write copybook beginning trigger
    write(CPY_ENTER_TAG);
    write(CPY_URI_OPEN);
    write(copybookId);
    write(CPY_URI_CLOSE);
    write(copybookContent);
    // write copybook closing trigger
    write(CPY_EXIT_TAG);
  }

  private String applyReplacing(String rawContent, List<Pair<String, String>> replacePatterns) {
    return replacingService.applyReplacing(rawContent, replacePatterns);
  }

  private String getCopybookId(
      String copybookURI, List<Pair<String, String>> replacingPhraseContexts) {
    return copybookURI
        + replacingPhraseContexts.stream()
            .map(Object::toString)
            .reduce(String::concat)
            .orElse("")
            .replaceAll("[^a-zA-Z0-9]+", "")
            .trim();
  }

  private CopybookModel getCopyBookContent(String copybookName, Position position) {

    if (copybookName.isEmpty()) return emptyModel(copybookName);

    if (hasRecursion(copybookName)) {
      copybookStack.forEach(this::reportRecursiveCopybook);
      return emptyModel(copybookName);
    }

    CopybookModel copybook =
        resolutions.get().resolve(copybookName, documentUri, copybookProcessingMode);

    if (copybook == null || copybook.getContent() == null) {
      reportMissingCopybooks(copybookName, position);
      return emptyModel(copybookName);
    }

    return copybook;
  }

  private boolean hasRecursion(String copybookName) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals);
  }

  private ExtendedDocument processCopybook(
      String copybookName, String uri, String content, Position position) {
    copybookStack.push(new CopybookUsage(copybookName, position));
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

  private void addCopybookUsage(@Nonnull String copybookName, @Nonnull Position position) {
    copybooks.addUsage(copybookName, position);
  }

  private void addCopybookDefinition(String copybookName, String uri) {
    if (!(isEmpty(copybookName) || isEmpty(uri))) {
      copybooks.define(copybookName, new Position(uri, 0, -1, 1, 0, null));
    }
  }

  @Nonnull
  private Position retrievePosition(@Nonnull ParserRuleContext ctx) {
    return new Position(
        documentUri,
        ctx.getStart().getStartIndex(),
        ctx.getStop().getStopIndex(),
        ctx.getStart().getLine(),
        ctx.getStart().getCharPositionInLine(),
        ctx.getStart().getText());
  }

  @Nonnull
  private Function<Token, Position> toPosition() {
    return token ->
        new Position(
            documentUri,
            token.getStartIndex(),
            token.getStopIndex(),
            token.getLine(),
            token.getCharPositionInLine(),
            token.getText());
  }

  private void reportRecursiveCopybook(CopybookUsage usage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(format(RECURSION_DETECTED, usage.getName()))
            .position(usage.getPosition())
            .build();
    LOG.debug(
        "Syntax error by GrammarPreprocessorListenerImpl#reportRecursiveCopybook: "
            + error.toString());
    errors.add(error);
  }

  private void reportMissingCopybooks(String copybookName, Position position) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .position(position)
            .suggestion(format(ERROR_SUGGESTION, copybookName))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build();
    LOG.debug(
        "Syntax error by GrammarPreprocessorListenerImpl#reportMissingCopybooks: "
            + error.toString());
    errors.add(error);
  }

  private void checkCopybookNameLength(String copybookName, Position position) {
    if (copybookName.length() > 8) {
      SyntaxError error =
          SyntaxError.syntaxError()
              .severity(INFO)
              .suggestion(format(COPYBOOK_OVER_8_CHARACTERS, copybookName))
              .position(position)
              .build();
      LOG.debug(
          "Syntax error by GrammarPreprocessorListenerImpl#checkCopybookNameLength: "
              + error.toString());
      errors.add(error);
    }
  }
}
