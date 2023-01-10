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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.DocumentMap;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.CobolPreprocessorLexer;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.InjectDescriptor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.InjectService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysis;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;

import java.util.*;
import java.util.function.Consumer;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener<OldExtendedDocument> {
  private static final int DEFAULT_TOKEN_SHIFT = 2;
  private static final int TOKEN_SHIFT_WITH_LINEBREAK = 3;

  private final List<SyntaxError> errors = new ArrayList<>();
  private final Deque<StringBuilder> textAccumulator = new ArrayDeque<>();
  private final CopybooksRepository copybooks = new CopybooksRepository();
  private final Map<String, DocumentMapping> nestedMappings = new HashMap<>();
  private final Map<Integer, Integer> shifts = new HashMap<>();

  private final DocumentMap documentMap;
  private final BufferedTokenStream tokens;
  private final CopybookConfig copybookConfig;
  private final ReplacingService replacingService;
  private final MessageService messageService;
  private final CopybookHierarchy hierarchy;
  private final InjectService injectService;
  private final CopybookNameService copybookNameService;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted DocumentMap documentMap,
      @Assisted BufferedTokenStream tokens,
      @Assisted CopybookConfig copybookConfig,
      @Assisted CopybookHierarchy hierarchy,
      ReplacingService replacingService,
      MessageService messageService,
      CopybookNameService copybookNameService,
      InjectService injectService) {
    this.documentMap = documentMap;
    this.tokens = tokens;
    this.copybookConfig = copybookConfig;
    this.replacingService = replacingService;
    this.messageService = messageService;
    this.injectService = injectService;
    this.hierarchy = hierarchy;
    this.copybookNameService = copybookNameService;
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
  public ResultWithErrors<OldExtendedDocument> getResult() {
    String uri = documentMap.getUri();
    List<Locality> localities = tokens.getTokens().stream()
            .map(LocalityUtils.toLocality(uri, hierarchy.getCurrentCopybookId()))
            .collect(toList());
    nestedMappings.put(uri, new DocumentMapping(localities, shifts));

    return new ResultWithErrors<>(new OldExtendedDocument(uri, accumulate(), copybooks, nestedMappings), errors);
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
              .errorSource(ErrorSource.EXTENDED_DOCUMENT)
              .location(retrieveLocality(ctx).toOriginalLocation())
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
  public void enterPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    injectCode(injectService.getInjectors(ctx), ctx, ctx.copySource());
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {
    push();
  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    injectCode(injectService.getInjectors(ctx), ctx, ctx.copySource());
  }

  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {
    push();
  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    injectCode(injectService.getInjectors(ctx), ctx, ctx.copySource());
  }

  private boolean requiresEarlyReturn(ParserRuleContext context) {
    if (!copybookConfig.getCopybookProcessingMode().analyze) {
      accumulateTokenShift(context);
      pop();
      return true;
    }
    return false;
  }

  private void injectCode(
      List<InjectDescriptor> descriptors,
      ParserRuleContext context,
      ParserRuleContext copyContext) {
    for (InjectDescriptor c : descriptors) {
      InjectCodeAnalysis injectCodeAnalysis = c.getInjectCodeAnalysis();
      CopybookName injectedSourceName = copybookNameService.findByName(c.getInjectedSourceName())
              .orElse(new CopybookName(c.getInjectedSourceName()));
      injectCodeAnalysis.injectCode(
              c.getCopybookContentProvider(),
              injectedSourceName,
              context, copyContext, copybookConfig, documentMap.getUri(),
              hierarchy, this, copybooks, nestedMappings,
              documentMap,
              errors
      );
    }
  }

  @Override
  public void enterReplaceLiteral(ReplaceLiteralContext ctx) {
    push();
  }

  @Override
  public void exitReplaceLiteral(ReplaceLiteralContext ctx) {
    if (ctx.replaceable().pseudoReplaceable() != null) {
      replacingService
              .retrievePseudoTextReplacingPattern(read(), retrieveLocality(ctx.replaceable().pseudoReplaceable()))
              .processIfNoErrorsFound(hierarchy::addCopyReplacing, errors::addAll);
    } else {
      hierarchy.addCopyReplacing(replacingService.retrieveTokenReplacingPattern(read()));
    }
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
            .errorSource(ErrorSource.PREPROCESSING)
            .severity(ERROR)
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.controlDirectiveWrongArgs", ctx.getText()))
            .location(retrieveLocality(ctx).toOriginalLocation())
            .build();
    errors.add(error);
    LOG.debug("Syntax error by reportInvalidArgument: {}", error.toString());
  }

  private Locality retrieveLocality(ParserRuleContext ctx) {
    return LocalityUtils.buildLocality(ctx, documentMap.getUri(), hierarchy.getCurrentCopybookId());
  }
}
