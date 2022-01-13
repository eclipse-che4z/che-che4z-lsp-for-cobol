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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.CobolPreprocessorLexer;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;

import java.util.*;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Token.EOF;
import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysisFactory.AnalysisTypes;
import static org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysisFactory.AnalysisTypes.*;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener {

  private static final int DEFAULT_TOKEN_SHIFT = 2;
  private static final int TOKEN_SHIFT_WITH_LINEBREAK = 3;

  private final List<SyntaxError> errors = new ArrayList<>();
  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();
  // used for both copy and sql-include statements

  private final String documentUri;
  private final BufferedTokenStream tokens;
  private final CopybookConfig copybookConfig;
  private final ReplacingService replacingService;
  private final MessageService messageService;
  private final CopybookAnalysisFactory analysisFactory;
  private final CopybookHierarchy hierarchy;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted String documentUri,
      @Assisted BufferedTokenStream tokens,
      @Assisted CopybookConfig copybookConfig,
      @Assisted CopybookHierarchy hierarchy,
      ReplacingService replacingService,
      MessageService messageService,
      CopybookAnalysisFactory analysisFactory) {
    this.documentUri = documentUri;
    this.tokens = tokens;
    this.copybookConfig = copybookConfig;
    this.replacingService = replacingService;
    this.messageService = messageService;
    this.analysisFactory = analysisFactory;
    this.hierarchy = hierarchy;
    textAccumulator.push(new StringBuilder());
  }

  @Override
  public Deque<StringBuilder> getTextAccumulator() {
    return textAccumulator;
  }

  @NonNull
  @Override
  public ResultWithErrors<ExtendedDocument> getResult() {
    if (hierarchy.requiresReplacing()) {
      String replaceableStmt = peek().toString();
      String content = handleReplace(replaceableStmt, hierarchy.getTextReplacingClauses());
      mergeAndUpdateTopTwoElement(content);
    }
    nestedMappings.put(
        documentUri,
        new DocumentMapping(
            tokens.getTokens().stream()
                .map(LocalityUtils.toLocality(documentUri, hierarchy.getCurrentCopybook()))
                .collect(toList()),
            shifts));
    return new ResultWithErrors<>(
        new ExtendedDocument(documentUri, accumulate(), copybooks, nestedMappings), errors);
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
              .locality(getLocality(ctx))
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
    analyzeCopybook(PREDEFINED, ctx, ctx);
  }

  @Override
  public void enterCopyIdmsStatement(CopyIdmsStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyIdmsStatement(@NonNull CopyIdmsStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(DIALECT, ctx, ctx.copyIdmsOptions().copyIdmsSource().copySource());
  }

  @Override
  public void enterCopyMaidStatement(CopyMaidStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyMaidStatement(CopyMaidStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    final Optional<TerminalNode> levelNumber = ofNullable(ctx.LEVEL_NUMBER());
    final CopySourceContext copySource = ctx.copySource();
    if (levelNumber.isPresent())
      levelNumber
          .map(ParseTree::getText)
          .map(Integer::parseInt)
          .ifPresent(it -> analyzeCopybook(DIALECT, ctx, copySource));
    else analyzeCopybook(SKIPPING, ctx, copySource);
  }

  @Override
  public void enterPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(PANVALET, ctx, ctx.copySource());
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(COBOL, ctx, ctx.copySource());
  }

  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(COBOL, ctx, ctx.copySource());
  }

  private boolean requiresEarlyReturn(ParserRuleContext context) {
    if (!copybookConfig.getCopybookProcessingMode().analyze) {
      accumulateTokenShift(context);
      pop();
      return true;
    }
    return false;
  }

  private void analyzeCopybook(
      AnalysisTypes type, ParserRuleContext context, ParserRuleContext copyContext) {
    analysisFactory
        .getInstanceFor(type)
        .handleCopybook(context, copyContext, copybookConfig, documentUri)
        .apply(hierarchy)
        .apply(this)
        .apply(copybooks)
        .apply(nestedMappings)
        .accept(errors);
  }

  @Override
  public void enterReplaceLiteral(ReplaceLiteralContext ctx) {
    push();
  }

  @Override
  public void exitReplaceLiteral(ReplaceLiteralContext ctx) {
    hierarchy.addCopyReplacing(replacingService.retrieveTokenReplacingPattern(read()));
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
        hierarchy.addCopyReplacing(clauseResponse.getResult());
      else hierarchy.addTextReplacing(clauseResponse.getResult());
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
    hierarchy.finishReplace();
    pop();
    accumulateTokenShift(ctx);
  }

  private String handleReplace(
      String replaceableStmt, List<Pair<String, String>> replacingClauses) {
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

  @Override
  public void accumulateTokenShift(ParserRuleContext context) {
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

  private String applyReplacing(String rawContent, List<Pair<String, String>> replacePatterns) {
    return replacingService.applyReplacing(rawContent, replacePatterns);
  }

  private void reportPseudoTextError(ReplacePseudoTextContext ctx, SyntaxError it) {
    final SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(messageService.getMessage(it.getSuggestion()))
            .locality(getLocality(ctx))
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
            .locality(getLocality(ctx))
            .build();
    errors.add(error);
    LOG.debug("Syntax error by reportInvalidArgument: {}", error.toString());
  }

  private Locality getLocality(ParserRuleContext ctx) {
    return LocalityUtils.buildLocality(ctx, documentUri, hierarchy.getCurrentCopybook());
  }
}
