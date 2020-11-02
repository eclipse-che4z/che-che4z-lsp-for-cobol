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

import com.broadcom.lsp.cobol.core.CobolPreprocessorBaseListener;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.*;
import com.broadcom.lsp.cobol.core.preprocessor.ProcessingConstants;
import com.broadcom.lsp.cobol.core.preprocessor.TextPreprocessor;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import com.broadcom.lsp.cobol.core.semantics.NamedSubContext;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.service.CopybookService;
import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import lombok.Getter;
import lombok.NonNull;
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

import java.util.*;
import java.util.function.Function;

import static com.broadcom.lsp.cobol.core.CobolPreprocessor.*;
import static com.broadcom.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.INFO;
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

  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final List<Pair<String, String>> replacingClauses = new ArrayList<>();
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();
  //used for both copy and sql-include statements
  private final Map<String, Locality> copybookStatements = new HashMap<>();

  private String documentUri;
  private BufferedTokenStream tokens;
  private CopybookProcessingMode copybookProcessingMode;
  private TextPreprocessor preprocessor;
  private CopybookService copybookService;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;
  private MessageService messageService;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted CopybookProcessingMode copybookProcessingMode,
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      ReplacingService replacingService,
      MessageService messageService) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookStack = copybookStack;
    this.copybookProcessingMode = copybookProcessingMode;
    this.preprocessor = preprocessor;
    this.copybookService = copybookService;
    this.replacingService = replacingService;
    textAccumulator.push(new StringBuilder());
    this.messageService = messageService;
  }

  @NonNull
  @Override
  public ExtendedDocument getResult() {
    nestedMappings.put(
        documentUri,
        new DocumentMapping(
            tokens.getTokens().stream().map(toPosition()).collect(toList()), shifts));
    return new ExtendedDocument(read(), copybooks, nestedMappings, copybookStatements);
  }

  @Override
  public void enterCompilerOptions(@NonNull CompilerOptionsContext ctx) {
    // push a new context for the COMPILER OPTIONS terminals
    push();
  }

  @Override
  public void exitCompilerOptions(@NonNull CompilerOptionsContext ctx) {
    // throw away COMPILER OPTIONS terminals
    pop();
    accumulateExcludedStatementShift(ctx.getSourceInterval());
  }

  @Override
  public void enterReplaceArea(@NonNull ReplaceAreaContext ctx) {
    push();
  }

  @Override
  public void exitReplaceArea(@NonNull ReplaceAreaContext ctx) {
    String content = applyReplacing(read(), replacingClauses);
    replacingClauses.clear();

    pop();
    write(content);
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    collectAndAccumulateCopybookData(ctx.copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }


  @Override public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    collectAndAccumulateCopybookData(ctx.copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }

  private void collectAndAccumulateCopybookData(CopySourceContext copySource, Locality copybookStatementPosition,  Interval sourceInterval) {
    if (!copybookProcessingMode.analyze) {
      pop();
      return;
    }

    String copybookName = retrieveCopybookName(copySource);
    Locality locality = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, locality);

    String uri = model.getUri();
    String content = model.getContent();

    if (!replacingClauses.isEmpty()) {
      content = applyReplacing(content, replacingClauses);
      replacingClauses.clear();
    }

    String copybookId = randomUUID().toString();
    ExtendedDocument copybookDocument =
            processCopybook(copybookName, uri, copybookId, content, locality);
    String copybookContent = copybookDocument.getText();

    checkCopybookNameLength(copybookName, locality);
    addCopybookUsage(copybookName, locality);
    addCopybookDefinition(copybookName, uri);

    collectCopybookStatement(copybookId, copybookStatementPosition);
    collectNestedSemanticData(uri, copybookId, copybookDocument);
    writeCopybook(copybookId, copybookContent);

    accumulateCopybookShift(sourceInterval);
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
  public void visitTerminal(@NonNull TerminalNode node) {
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

  @NonNull
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

  private void write(@NonNull String text) {
    peek().append(text);
  }

  private String read() {
    return peek().toString();
  }

  private void collectCopybookStatement(String copybookId, Locality locality) {
    copybookStatements.put(copybookId, locality);
  }

  private void collectNestedSemanticData(
      String uri, String copybookId, ExtendedDocument copybookDocument) {
    copybooks.merge(copybookDocument.getCopybooks());
    copybookStatements.putAll(copybookDocument.getCopyStatements());
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
        copybookService.resolve(copybookName, documentUri, copybookProcessingMode);

    if (copybook.getContent() == null) {
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
    ExtendedDocument result =
        preprocessor
            .process(uri, content, copybookStack, copybookProcessingMode)
            .unwrap(errors::addAll);
    copybookStack.pop();
    return result;
  }

  private CopybookModel emptyModel(String copybookName) {
    return new CopybookModel(copybookName, "", "");
  }

  @NonNull
  private String retrieveCopybookName(@NonNull CopySourceContext copySource) {
    return retrieveCopybookName(
        Optional.<RuleContext>ofNullable(copySource.cobolWord()).orElse(copySource.literal()));
  }

  private String retrieveCopybookName(@NonNull RuleContext context) {
    return context.getText().toUpperCase();
  }

  private String retrieveCopybookId() {
    return ofNullable(copybookStack)
        .map(Deque::peek)
        .map(CopybookUsage::getCopybookId)
        .orElse(null);
  }

  private void addCopybookUsage(@NonNull String copybookName, @NonNull Locality locality) {
    copybooks.addUsage(copybookName, locality.toLocation());
  }

  private void addCopybookDefinition(String copybookName, String uri) {
    if (!(isEmpty(copybookName) || isEmpty(uri))) {
      copybooks.define(
          copybookName, new Location(uri, new Range(new Position(0, 0), new Position(0, 0))));
    }
  }

  @NonNull
  private Locality retrieveCopybookStatementPosition(@NonNull ParserRuleContext ctx) {
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

  @NonNull
  private Locality retrievePosition(@NonNull ParserRuleContext ctx) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(retrieveCopybookId())
        .range(new Range(getStartPosition(ctx.getStart()), getStopPosition(ctx.getStop())))
        .recognizer(GrammarPreprocessorListenerImpl.class)
        .build();
  }

  @NonNull
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
            .suggestion(messageService.getMessage("GrammarPreprocessorListener.recursionDetected",usage.getName()))
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
            .suggestion(messageService.getMessage("GrammarPreprocessorListener.errorSuggestion", copybookName))
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
              .suggestion(messageService.getMessage("GrammarPreprocessorListener.copyBkOver8Chars", copybookName))
              .locality(locality)
              .build();
      LOG.debug(
          "Syntax error by GrammarPreprocessorListenerImpl#checkCopybookNameLength: "
              + error.toString());
      errors.add(error);
    }
  }
}
