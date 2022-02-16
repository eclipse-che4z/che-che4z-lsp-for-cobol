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
import java.util.function.Consumer;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
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
    implements GrammarPreprocessorListener<ExtendedDocument> {

  private static final int DEFAULT_TOKEN_SHIFT = 2;
  private static final int TOKEN_SHIFT_WITH_LINEBREAK = 3;

  private final List<SyntaxError> errors = new ArrayList<>();
  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final NamedSubContext copybooks = new NamedSubContext();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();

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
  /**
   * Get the extended document of the COBOL file and the used copybooks.
   *
   * @return extended document
   */
  @NonNull
  @Override
  public ResultWithErrors<ExtendedDocument> getResult() {
    nestedMappings.put(
        documentUri,
        new DocumentMapping(
            tokens.getTokens().stream()
                .map(LocalityUtils.toLocality(documentUri, hierarchy.getCurrentCopybookId()))
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
              .locality(retrieveLocality(ctx))
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
    analyzeCopybook(PREDEFINED, ctx, ctx, DialectType.COBOL);
  }

  @Override
  public void enterCopyIdmsStatement(CopyIdmsStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyIdmsStatement(@NonNull CopyIdmsStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    Optional.ofNullable(ctx.LEVEL_NUMBER())
        .map(ParseTree::getText)
        .map(Integer::parseInt)
        .ifPresent(hierarchy::setLevelNumber);
    analyzeCopybook(
        DIALECT, ctx, ctx.copyIdmsOptions().copyIdmsSource().copySource(), DialectType.IDMS);
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
          .ifPresent(
              it -> {
                hierarchy.setLevelNumber(it);
                analyzeCopybook(DIALECT, ctx, copySource, DialectType.MAID);
              });
    else analyzeCopybook(SKIPPING, ctx, copySource, DialectType.MAID);
  }

  @Override
  public void enterPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(PANVALET, ctx, ctx.copySource(), DialectType.COBOL);
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(COBOL, ctx, ctx.copySource(), DialectType.COBOL);
  }

  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    analyzeCopybook(COBOL, ctx, ctx.copySource(), DialectType.COBOL);
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
      AnalysisTypes type,
      ParserRuleContext context,
      ParserRuleContext copyContext,
      DialectType dialectType) {
    analysisFactory
        .getInstanceFor(type)
        .handleCopybook(context, copyContext, copybookConfig, documentUri, dialectType)
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
    replacingService
        .retrievePseudoTextReplacingPattern(read(), retrieveLocality(ctx))
        .processIfNoErrorsFound(consumeReplacePattern(ctx), errors::addAll);
    pop();
  }

  private Consumer<Pair<String, String>> consumeReplacePattern(ReplacePseudoTextContext ctx) {
    return ctx.getParent() instanceof ReplaceClauseContext
        ? hierarchy::addCopyReplacing
        : hierarchy::addTextReplacing;
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
    pop();
    accumulateTokenShift(ctx);
  }

  @Override
  public void visitTerminal(@NonNull TerminalNode node) {
    TokenUtils.writeHiddenTokens(tokens, this::write).accept(node);
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

  private void reportInvalidArgument(ControlCblContext ctx) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .severity(ERROR)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.controlDirectiveWrongArgs", ctx.getText()))
            .locality(retrieveLocality(ctx))
            .build();
    errors.add(error);
    LOG.debug("Syntax error by reportInvalidArgument: {}", error.toString());
  }

  private Locality retrieveLocality(ParserRuleContext ctx) {
    return LocalityUtils.buildLocality(ctx, documentUri, hierarchy.getCurrentCopybookId());
  }
}
