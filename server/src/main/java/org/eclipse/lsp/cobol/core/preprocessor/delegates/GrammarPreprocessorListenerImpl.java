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
package org.eclipse.lsp.cobol.core.preprocessor.delegates;

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
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.CobolPreprocessorLexer;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;
import org.eclipse.lsp.cobol.service.PredefinedCopybooks;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.UUID.randomUUID;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Token.EOF;
import static org.apache.commons.lang3.StringUtils.isEmpty;
import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;
import static org.eclipse.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.INFO;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.*;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.Copybook.DFHEIBLC;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener {

  private static final String HYPHEN = "-";
  private static final String UNDERSCORE = "_";
  private static final String SYNTAX_ERROR_CHECK_COPYBOOK_NAME =
      "Syntax error by checkCopybookName: {}";
  private static final int DEFAULT_TOKEN_SHIFT = 2;
  private static final int TOKEN_SHIFT_WITH_LINEBREAK = 3;
  private static final int MAX_COPYBOOK_NAME_LENGTH_DEFAULT = Integer.MAX_VALUE;
  private static final int MAX_COPYBOOK_NAME_LENGTH_DATASET = 8;
  private static final int MAX_COPYBOOK_NAME_LENGTH_PANVALETLIB = 10;

  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final List<Pair<String, String>> copyReplacingClauses = new ArrayList<>();
  private final List<Pair<String, String>> replacingClauses;
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();
  // used for both copy and sql-include statements
  private final Map<String, Locality> copybookStatements = new HashMap<>();

  private final String documentUri;
  private final BufferedTokenStream tokens;
  private final CopybookConfig copybookConfig;
  private final TextPreprocessor preprocessor;
  private final CopybookService copybookService;
  private final Deque<CopybookUsage> copybookStack;
  private final ReplacingService replacingService;
  private final MessageService messageService;
  private final Deque<List<Pair<String, String>>> recursiveReplaceStmtStack;

  @Inject
  @SuppressWarnings("squid:S107")
  public GrammarPreprocessorListenerImpl(
      @Assisted String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted Deque<CopybookUsage> copybookStack,
      @Assisted CopybookConfig copybookConfig,
      @Assisted Deque<List<Pair<String, String>>> recursiveReplaceStmtStack,
      @Assisted List<Pair<String, String>> replacingClauses,
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      ReplacingService replacingService,
      MessageService messageService) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookStack = copybookStack;
    this.copybookConfig = copybookConfig;
    this.preprocessor = preprocessor;
    this.copybookService = copybookService;
    this.replacingService = replacingService;
    this.messageService = messageService;
    this.recursiveReplaceStmtStack = recursiveReplaceStmtStack;
    this.replacingClauses = replacingClauses;
    textAccumulator.push(new StringBuilder());
  }

  @Override
  public Deque<StringBuilder> getTextAccumulator() {
    return textAccumulator;
  }

  @NonNull
  @Override
  public ExtendedDocument getResult() {
    if (!replacingClauses.isEmpty()) {
      String replaceableStmt = peek().toString();
      String content = handleReplace(replaceableStmt);
      mergeAndUpdateTopTwoElement(content);
    }
    nestedMappings.put(
        documentUri,
        new DocumentMapping(
            tokens.getTokens().stream().map(toPosition()).collect(toList()), shifts));
    return new ExtendedDocument(accumulate(), copybooks, nestedMappings, copybookStatements);
  }

  @Override
  public void enterTitleDirective(TitleDirectiveContext ctx) {
    push();
  }

  @Override
  public void exitTitleDirective(TitleDirectiveContext ctx) {
    pop();
    accumulateTokenShift(ctx);
  }

  @Override
  public void enterEnterDirective(EnterDirectiveContext ctx) {
    push();
  }

  @Override
  public void exitEnterDirective(EnterDirectiveContext ctx) {
    pop();
    final LanguageNameContext languageNameContext = ctx.languageName();
    if (languageNameContext == null) {
      final SyntaxError error =
          SyntaxError.syntaxError()
              .locality(retrievePosition(ctx))
              .severity(ERROR)
              .suggestion(
                  messageService.getMessage(
                      "GrammarPreprocessorListener.langMissingEnterDirective"))
              .build();
      LOG.debug("Syntax error by exitEnterDirective: {}", error);
      errors.add(error);
    }

    accumulateTokenShift(ctx);
  }

  @Override
  public void enterControlDirective(ControlDirectiveContext ctx) {
    push();
  }

  @Override
  public void exitControlDirective(ControlDirectiveContext ctx) {
    pop();
    if (ctx.controlOptions().isEmpty()) reportInvalidArgument(ctx.controlCbl());
    accumulateTokenShift(ctx);
  }

  @Override
  public void exitLinkageSection(LinkageSectionContext ctx) {
    String copybookName = DFHEIBLC.name();
    Locality locality = retrievePosition(ctx);
    CopybookModel model = getCopyBookContent(copybookName, locality, copybookConfig);
    String uri = model.getUri();

    String content = preprocessor.cleanUpCode(uri, model.getContent()).unwrap(errors::addAll);

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, copybookName, content, locality);
    String copybookContent = copybookDocument.getText();

    collectNestedSemanticData(uri, copybookName, copybookDocument);
    writeCopybook(copybookName, copybookContent);
  }

  @Override
  public void enterCopyIdmsStatement(CopyIdmsStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyIdmsStatement(@NonNull CopyIdmsStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx,
        ctx.copyIdmsOptions().copyIdmsSource().copySource(),
        retrieveCopybookStatementPosition(ctx),
        MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  public void enterCopyMaidStatement(CopyMaidStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyMaidStatement(CopyMaidStatementContext ctx) {
    final Optional<TerminalNode> levelNumber = ofNullable(ctx.LEVEL_NUMBER());
    final Locality copybookStatementPosition = retrieveCopybookStatementPosition(ctx);
    final CopySourceContext copySource = ctx.copySource();
    if (levelNumber.isPresent())
      levelNumber
          .map(ParseTree::getText)
          .map(Integer::parseInt)
          .ifPresent(
              it ->
                  collectAndAccumulateCopybookData(
                      ctx,
                      copySource,
                      copybookStatementPosition,
                      MAX_COPYBOOK_NAME_LENGTH_DEFAULT));
    else skipCopybook(ctx, copySource, copybookStatementPosition, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  public void enterPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx,
        ctx.copySource(),
        retrieveCopybookStatementPosition(ctx),
        MAX_COPYBOOK_NAME_LENGTH_PANVALETLIB);
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx,
        ctx.copySource(),
        retrieveCopybookStatementPosition(ctx),
        MAX_COPYBOOK_NAME_LENGTH_DATASET);
  }

  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx,
        ctx.copySource(),
        retrieveCopybookStatementPosition(ctx),
        MAX_COPYBOOK_NAME_LENGTH_DATASET);
  }

  private void skipCopybook(
      ParserRuleContext context,
      CopySourceContext copySource,
      Locality copybookStatementPosition,
      int maxLength) {

    String copybookName = retrieveCopybookName(copySource);
    Locality locality = retrievePosition(copySource);

    String copybookId = randomUUID().toString();

    checkCopybookName(copybookName, locality, maxLength);
    addCopybookUsage(copybookName, locality);

    collectCopybookStatement(copybookId, copybookStatementPosition);

    pop();
    accumulateTokenShift(context);
  }

  private void collectAndAccumulateCopybookData(
      ParserRuleContext context,
      CopySourceContext copySource,
      Locality copybookStatementPosition,
      int maxLength) {
    if (requiresEarlyReturn(context)) {
      return;
    }
    String copybookName = retrieveCopybookName(copySource);
    Locality locality = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, locality, copybookConfig);
    String uri = model.getUri();
    String copybookId = randomUUID().toString();

    String content = handleReplacing(copybookName, model.getContent(), uri, locality);

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, copybookId, content, locality);

    checkCopybookName(copybookName, locality, maxLength);
    addCopybookUsage(copybookName, locality);
    addCopybookDefinition(copybookName, uri);

    collectCopybookStatement(copybookId, copybookStatementPosition);
    collectNestedSemanticData(uri, copybookId, copybookDocument);
    // throw away COPY terminals
    pop();
    writeCopybook(copybookId, copybookDocument.getText());
    accumulateTokenShift(context);
  }

  private boolean requiresEarlyReturn(ParserRuleContext context) {
    if (!copybookConfig.getCopybookProcessingMode().analyze) {
      accumulateTokenShift(context);
      pop();
      return true;
    }
    return false;
  }

  private String handleReplacing(
      String copybookName, String copybookContent, String uri, Locality locality) {
    // Do preprocessor cleanup, before replacements.
    String text = preprocessor.cleanUpCode(uri, copybookContent).unwrap(errors::addAll);

    // In a chain of copy statement, there could be only one replacing phrase

    if (!copyReplacingClauses.isEmpty()) {
      recursiveReplaceStmtStack.add(new ArrayList<>(copyReplacingClauses));
      copyReplacingClauses.clear();
    }

    if (!recursiveReplaceStmtStack.isEmpty()) {
      for (List<Pair<String, String>> clause : recursiveReplaceStmtStack)
        text = applyReplacing(text, clause);
    }

    checkRecursiveReplaceStatement(recursiveReplaceStmtStack.size(), copybookName, locality);
    return text;
  }

  private void checkRecursiveReplaceStatement(
      int recursiveReplaceCount, String copybookName, Locality locality) {
    if (recursiveReplaceCount > 1 && !copybookStack.isEmpty())
      addCopybookError(
          copybookName,
          locality,
          ERROR,
          "GrammarPreprocessorListener.copyBkNestedReplaceStmt",
          SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
  }

  @Override
  public void enterReplaceLiteral(ReplaceLiteralContext ctx) {
    push();
  }

  @Override
  public void exitReplaceLiteral(ReplaceLiteralContext ctx) {
    copyReplacingClauses.add(replacingService.retrieveTokenReplacingPattern(read()));
    pop();
  }

  @Override
  public void enterReplacePseudoText(ReplacePseudoTextContext ctx) {
    push();
  }

  @Override
  public void exitReplacePseudoText(ReplacePseudoTextContext ctx) {
    @NonNull
    ResultWithErrors<Pair<String, String>> clauseResponse =
        replacingService.retrievePseudoTextReplacingPattern(read());
    if (clauseResponse.getErrors().isEmpty()) {
      if (ctx.getParent() instanceof ReplaceClauseContext)
        copyReplacingClauses.add(clauseResponse.getResult());
      else replacingClauses.add(clauseResponse.getResult());
    } else {
      clauseResponse.getErrors().forEach(it -> reportPseudoTextError(ctx, it));
    }
    pop();
  }

  @Override
  public void enterReplaceAreaStart(ReplaceAreaStartContext ctx) {
    push();
  }

  @Override
  public void exitReplaceAreaStart(ReplaceAreaStartContext ctx) {
    pop();
    accumulateTokenShift(ctx);
  }

  @Override
  public void enterReplaceOffStatement(ReplaceOffStatementContext ctx) {
    push();
  }

  @Override
  public void exitReplaceOffStatement(ReplaceOffStatementContext ctx) {
    replacingClauses.clear();
    pop();
    accumulateTokenShift(ctx);
  }

  private String handleReplace(String replaceableStmt) {
    return applyReplacing(replaceableStmt, replacingClauses);
  }

  @Override
  public void visitTerminal(@NonNull TerminalNode node) {
    int tokPos = node.getSourceInterval().a;
    write(TokenUtils.retrieveHiddenTextToLeft(tokPos, tokens));

    if (node.getSymbol().getType() != EOF) {
      write(node.getText());
    } else {
      write(TokenUtils.retrieveHiddenTextToRight(tokPos, tokens));
    }
  }

  private void accumulateTokenShift(ParserRuleContext context) {
    final Interval sourceInterval = context.getSourceInterval();
    shifts.put(
        sourceInterval.a - 1, sourceInterval.b - sourceInterval.a + calculateTokenShift(context));
  }

  private int calculateTokenShift(ParserRuleContext context) {
    return tokens.getHiddenTokensToLeft(context.start.getTokenIndex()).stream()
        .map(Token::getType)
        .filter(it -> it == CobolPreprocessorLexer.NEWLINE)
        .findAny()
        .map(it -> TOKEN_SHIFT_WITH_LINEBREAK)
        .orElse(DEFAULT_TOKEN_SHIFT);
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
    // write copybook beginning trigger
    write(CPY_ENTER_TAG);
    write(copybookId);
    write(CPY_URI_CLOSE);
    write(copybookContent);
    // write copybook closing trigger
    write(CPY_EXIT_TAG);
  }

  private String applyReplacing(String rawContent, List<Pair<String, String>> replacePatterns) {
    return replacingService.applyReplacing(rawContent, replacePatterns);
  }

  private CopybookModel getCopyBookContent(
      String copybookName, Locality locality, CopybookConfig copybookConfig) {

    if (copybookName.isEmpty()) return emptyModel(copybookName);

    if (hasRecursion(copybookName)) {
      copybookStack.forEach(this::reportRecursiveCopybook);
      return emptyModel(copybookName);
    }

    CopybookModel copybook = copybookService.resolve(copybookName, documentUri, copybookConfig);
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
            .processCleanCode(
                uri,
                content,
                copybookStack,
                copybookConfig,
                recursiveReplaceStmtStack,
                replacingClauses)
            .unwrap(errors::addAll);
    copybookStack.pop();
    if (Objects.nonNull(recursiveReplaceStmtStack.peek())) recursiveReplaceStmtStack.pop();
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
    return PreprocessorStringUtils.trimQuotes(context.getText().toUpperCase());
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
    if (!(isEmpty(copybookName) || isEmpty(uri) || isPredefined(uri))) {
      copybooks.define(
          copybookName, new Location(uri, new Range(new Position(0, 0), new Position(0, 0))));
    }
  }

  private boolean isPredefined(String uri) {
    return PredefinedCopybooks.isCopybookPredefined(uri);
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

  private void reportPseudoTextError(ReplacePseudoTextContext ctx, SyntaxError it) {
    final SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(messageService.getMessage(it.getSuggestion()))
            .locality(retrievePosition(ctx))
            .build();
    errors.add(error);
    LOG.debug("Syntax error by reportPseudoTextError: {}", error.toString());
  }

  private void reportInvalidArgument(ControlCblContext ctx) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.controlDirectiveWrongArgs", ctx.getText()))
            .locality(retrievePosition(ctx))
            .build();
    errors.add(error);
    LOG.debug("Syntax error by reportInvalidArgument: {}", error.toString());
  }

  private void reportRecursiveCopybook(CopybookUsage usage) {
    addCopybookError(
        usage.getName(),
        usage.getLocality(),
        ERROR,
        "GrammarPreprocessorListener.recursionDetected",
        "Syntax error by reportRecursiveCopybook: {}");
  }

  private void reportMissingCopybooks(String copybookName, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.errorSuggestion", copybookName))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build();
    LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    errors.add(error);
  }

  private void checkCopybookName(String copybookName, Locality locality, int maxLength) {
    if (copybookName.length() > maxLength) {
      addCopybookError(
          copybookName,
          maxLength,
          locality,
          INFO,
          "GrammarPreprocessorListener.copyBkOverMaxChars",
          SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
    }
    // The first or last character must not be a hyphen.
    if (copybookName.startsWith(HYPHEN) || copybookName.endsWith(HYPHEN)) {
      addCopybookError(
          copybookName,
          locality,
          ERROR,
          "GrammarPreprocessorListener.copyBkStartsOrEndsWithHyphen",
          SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
    }

    // copybook Name can't contain _
    if (copybookName.contains(UNDERSCORE))
      addCopybookError(
          copybookName,
          locality,
          ERROR,
          "GrammarPreprocessorListener.copyBkContainsUnderScore",
          SYNTAX_ERROR_CHECK_COPYBOOK_NAME);
  }

  private void addCopybookError(
      String copybookName,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(info)
            .suggestion(messageService.getMessage(messageID, copybookName))
            .locality(locality)
            .build();
    LOG.debug(logMessage + error.toString());
    errors.add(error);
  }

  private void addCopybookError(
      String copybookName,
      int maxNameLength,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(info)
            .suggestion(messageService.getMessage(messageID, maxNameLength, copybookName))
            .locality(locality)
            .build();
    LOG.debug(logMessage + error.toString());
    errors.add(error);
  }
}
