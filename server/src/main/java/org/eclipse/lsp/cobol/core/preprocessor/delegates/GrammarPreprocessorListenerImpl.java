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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookService;
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
      "Syntax error by GrammarPreprocessorListenerImpl#checkCopybookName: ";
  @Getter private final List<SyntaxError> errors = new ArrayList<>();
  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final List<Pair<String, String>> copyReplacingClauses = new ArrayList<>();
  private final List<Pair<String, String>> replacingClauses;
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();
  // used for both copy and sql-include statements
  private final Map<String, Locality> copybookStatements = new HashMap<>();

  private String documentUri;
  private BufferedTokenStream tokens;
  private CopybookConfig copybookConfig;
  private TextPreprocessor preprocessor;
  private CopybookService copybookService;
  private Deque<CopybookUsage> copybookStack;
  private ReplacingService replacingService;
  private MessageService messageService;
  private Deque<List<Pair<String, String>>> recursiveReplaceStmtStack;

  @Inject
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
    textAccumulator.push(new StringBuilder());
    this.messageService = messageService;
    this.recursiveReplaceStmtStack = recursiveReplaceStmtStack;
    this.replacingClauses = replacingClauses;
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
  public void enterCopyIdmsStatement(CopyIdmsStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyIdmsStatement(@NonNull CopyIdmsStatementContext ctx) {

    collectAndAccumulateCopybookData(
            ctx.copyIdmsOptions().copyIdmsSource().copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }

  @Override
  public void enterCopyMaidStatement(CopyMaidStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyMaidStatement(CopyMaidStatementContext ctx) {
    collectAndAccumulateCopybookData(
            ctx.copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx.copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }

  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    collectAndAccumulateCopybookData(
        ctx.copySource(), retrieveCopybookStatementPosition(ctx), ctx.getSourceInterval());
  }

  private void collectAndAccumulateCopybookData(
      CopySourceContext copySource, Locality copybookStatementPosition, Interval sourceInterval) {
    if (!copybookConfig.getCopybookProcessingMode().analyze) {
      pop();
      return;
    }
    String copybookName = retrieveCopybookName(copySource);
    Locality locality = retrievePosition(copySource);
    CopybookModel model = getCopyBookContent(copybookName, locality, copybookConfig);
    String uri = model.getUri();
    String content = model.getContent();

    String copybookId = randomUUID().toString();
    // In a chain of copy statement, there could be only one replacing phrase

    if (!copyReplacingClauses.isEmpty()) {
      recursiveReplaceStmtStack.add(new ArrayList<>(copyReplacingClauses));
      copyReplacingClauses.clear();
    }
    if (!recursiveReplaceStmtStack.isEmpty()) {
      for (List<Pair<String, String>> clause : recursiveReplaceStmtStack)
        content = applyReplacing(content, clause);
    }

    checkRecursiveReplaceStatement(recursiveReplaceStmtStack.size(), copybookName, locality);

    ExtendedDocument copybookDocument =
        processCopybook(copybookName, uri, copybookId, content, locality);
    String copybookContent = copybookDocument.getText();

    checkCopybookName(copybookName, locality);
    addCopybookUsage(copybookName, locality);
    addCopybookDefinition(copybookName, uri);

    collectCopybookStatement(copybookId, copybookStatementPosition);
    collectNestedSemanticData(uri, copybookId, copybookDocument);
    writeCopybook(copybookId, copybookContent);

    accumulateCopybookShift(sourceInterval);
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
      clauseResponse
          .getErrors()
          .forEach(
              error -> {
                Locality locality = retrievePosition(ctx);
                errors.add(
                    SyntaxError.syntaxError()
                        .severity(ERROR)
                        .suggestion(
                            messageService.getMessage(
                                clauseResponse.getErrors().get(0).getSuggestion()))
                        .locality(locality)
                        .build());
                LOG.error("pseudo text can't have COPY ");
              });
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
    accumulateExcludedStatementShift(ctx.getSourceInterval());
  }

  @Override
  public void enterReplaceOffStatement(ReplaceOffStatementContext ctx) {
    push();
  }

  @Override
  public void exitReplaceOffStatement(ReplaceOffStatementContext ctx) {
    replacingClauses.clear();
    pop();
    accumulateExcludedStatementShift(ctx.getSourceInterval());
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

  private void accumulateCopybookShift(Interval sourceInterval) {
    shifts.put(sourceInterval.a - 1, sourceInterval.b - sourceInterval.a + 1);
  }

  private void accumulateExcludedStatementShift(Interval sourceInterval) {
    shifts.put(sourceInterval.a - 1, sourceInterval.b - sourceInterval.a + 2);
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

  private CopybookModel getCopyBookContent(String copybookName, Locality locality, CopybookConfig copybookConfig) {

    if (copybookName.isEmpty()) return emptyModel(copybookName);

    if (hasRecursion(copybookName)) {
      copybookStack.forEach(this::reportRecursiveCopybook);
      return emptyModel(copybookName);
    }

    CopybookModel copybook =
        copybookService.resolve(copybookName, documentUri, copybookConfig);
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
            .process(
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
    addCopybookError(
        usage.getName(),
        usage.getLocality(),
        ERROR,
        "GrammarPreprocessorListener.recursionDetected",
        "Syntax error by GrammarPreprocessorListenerImpl#reportRecursiveCopybook: ");
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
    LOG.debug(
        "Syntax error by GrammarPreprocessorListenerImpl#reportMissingCopybooks: "
            + error.toString());
    errors.add(error);
  }

  private void checkCopybookName(String copybookName, Locality locality) {
    if (copybookName.length() > 8) {
      addCopybookError(
          copybookName,
          locality,
          INFO,
          "GrammarPreprocessorListener.copyBkOver8Chars",
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
}
