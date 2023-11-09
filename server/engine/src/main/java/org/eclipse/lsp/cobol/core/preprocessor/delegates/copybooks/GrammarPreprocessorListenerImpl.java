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

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.CobolPreprocessor.*;

import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import java.util.*;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacementContext;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacementHelper;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * ANTLR listener, which builds an extended document from the given COBOL program by executing COPY
 * and REPLACE statements and removing non-processable sections starting with EXEC statements.
 */
@Slf4j
public class GrammarPreprocessorListenerImpl extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener<CopybooksRepository> {
  private static final int MAX_COPYBOOK_NAME_LENGTH_10 = 10;
  private static final int MAX_COPYBOOK_NAME_LENGTH_8 = 8;

  private final List<SyntaxError> errors = new ArrayList<>();

  private final CopybookProcessingMode copybookConfig;
  private final MessageService messageService;
  private final CopybookPreprocessorService preprocessorService;
  private final ReplacingService replacingService;

  private List<ReplacementContext> replacementContext;

  @Inject
  GrammarPreprocessorListenerImpl(
      @Assisted PreprocessorContext context,
      GrammarPreprocessor grammarPreprocessor,
      CopybookService copybookService,
      MessageService messageService,
      ReplacingService replacingService) {
    this.copybookConfig = context.getCopybookProcessingMode();
    this.messageService = messageService;
    this.preprocessorService = new CopybookPreprocessorService(context.getProgramDocumentUri(),
        grammarPreprocessor,
        context.getCurrentDocument(),
        copybookService,
        copybookConfig,
        context.getCopybooksRepository(),
        context.getHierarchy(),
        messageService,
        replacingService);
    this.replacingService = replacingService;
  }

  /**
   * Get the extended document of the COBOL file and the used copybooks.
   *
   * @return extended document
   */
  @NonNull
  @Override
  public ResultWithErrors<CopybooksRepository> getResult() {
    List<SyntaxError> result = new ArrayList<>(preprocessorService.getErrors());
    result.addAll(errors);
    return new ResultWithErrors<>(preprocessorService.getCopybooks(), result);
  }

  @Override
  public void enterTitleDirective(TitleDirectiveContext ctx) {
    preprocessorService.replaceWithSpaces(ctx);
  }

  @Override
  public void exitTitleDirective(TitleDirectiveContext ctx) {
    preprocessorService.replaceWithSpaces(ctx);
  }

  @Override
  public void enterEnterDirective(EnterDirectiveContext ctx) {
    preprocessorService.replaceWithSpaces(ctx);
  }

  @Override
  public void exitEnterDirective(EnterDirectiveContext ctx) {
    final LanguageNameContext languageNameContext = ctx.languageName();
    if (languageNameContext == null) {
      final SyntaxError error =
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.EXTENDED_DOCUMENT)
              .location(preprocessorService.retrieveLocality(ctx).toOriginalLocation())
              .severity(ERROR)
              .suggestion(
                  messageService.getMessage(
                      "GrammarPreprocessorListener.langMissingEnterDirective"))
              .build();
      LOG.debug("Syntax error by exitEnterDirective: {}", error);
      errors.add(error);
    }
  }

  @Override
  public void enterControlDirective(ControlDirectiveContext ctx) {
    preprocessorService.replaceWithSpaces(ctx);
  }

  @Override
  public void exitControlDirective(ControlDirectiveContext ctx) {
    if (ctx.controlOptions().isEmpty()) preprocessorService.reportInvalidArgument(ctx.controlCbl());
  }

  @Override
  public void exitPlusplusIncludeStatement(PlusplusIncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    preprocessorService.addCopybook(ctx, ctx.copySource(), MAX_COPYBOOK_NAME_LENGTH_10, replacementContext);
  }

  @Override
  public void enterCopyStatement(@NonNull CopyStatementContext ctx) {

  }

  @Override
  public void exitCopyStatement(@NonNull CopyStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    preprocessorService.addCopybook(ctx, ctx.copySource(), MAX_COPYBOOK_NAME_LENGTH_8, replacementContext);
  }


  @Override
  public void enterIncludeStatement(@NonNull IncludeStatementContext ctx) {

  }

  @Override
  public void exitIncludeStatement(@NonNull IncludeStatementContext ctx) {
    if (requiresEarlyReturn(ctx)) return;
    preprocessorService.addCopybook(ctx, ctx.copySource(), MAX_COPYBOOK_NAME_LENGTH_8, replacementContext);
  }

  private boolean requiresEarlyReturn(ParserRuleContext ctx) {
    if (!copybookConfig.analyze) {
      preprocessorService.replaceWithSpaces(ctx);
      return true;
    }
    return false;
  }

  @Override
  public void enterReplaceAreaStart(ReplaceAreaStartContext ctx) {
    Locality locality = preprocessorService.retrieveLocality(ctx);
    replacementContext = ctx.replacePseudoText().stream()
        .map(ReplacementHelper::createClause)
        .map(c -> replacingService.retrievePseudoTextReplacingPattern(c, locality))
        .map(r -> r.unwrap(errors::addAll))
        .map(r -> new ReplacementContext(r, locality))
        .collect(Collectors.toList());

    preprocessorService.replaceWithSpaces(ctx);
  }

  @Override
  public void enterReplaceOffStatement(ReplaceOffStatementContext ctx) {
    preprocessorService.replaceWithSpaces(ctx);
    replacementContext = null;
  }
}
