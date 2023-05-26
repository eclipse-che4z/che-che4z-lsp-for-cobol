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
package org.eclipse.lsp.cobol.core.engine;

import com.google.common.collect.ImmutableMap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.*;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.EmbeddedCodeService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.errors.ErrorFinalizerService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.*;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.utils.ServerTypeUtil;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.error.ErrorSource.WORKSPACE_SETTINGS;
import static org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext.Activity.*;

/**
 * This class is responsible for run the syntax and semantic analysis of an input cobol document.
 * Its run method used by the service facade layer CobolLanguageEngineFacade.
 */
@Slf4j
@Singleton
@SuppressWarnings("WeakerAccess")
public class CobolLanguageEngine {

  private final TextPreprocessor preprocessor;
  private final MessageService messageService;
  private final ErrorFinalizerService errorFinalizerService;
  private final GrammarPreprocessor grammarPreprocessor;
  private final ParseTreeListener treeListener;
  private final SubroutineService subroutineService;
  private final CachingConfigurationService cachingConfigurationService;
  private final DialectService dialectService;
  private final AstProcessor astProcessor;
  private final SymbolsRepository symbolsRepository;
  private final EmbeddedCodeService embeddedCodeService;
  private final Pipeline pipeline;

  @Inject
  public CobolLanguageEngine(
      TextPreprocessor preprocessor,
      GrammarPreprocessor grammarPreprocessor,
      MessageService messageService,
      ParseTreeListener treeListener,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      DialectService dialectService,
      AstProcessor astProcessor,
      SymbolsRepository symbolsRepository,
      EmbeddedCodeService embeddedCodeService,
      ErrorFinalizerService errorFinalizerService) {
    this.preprocessor = preprocessor;
    this.messageService = messageService;
    this.errorFinalizerService = errorFinalizerService;
    this.grammarPreprocessor = grammarPreprocessor;
    this.treeListener = treeListener;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.dialectService = dialectService;
    this.astProcessor = astProcessor;
    this.symbolsRepository = symbolsRepository;
    this.embeddedCodeService = embeddedCodeService;

    this.pipeline = new Pipeline();
    this.pipeline.add(new DialectProcessingStage(dialectService));
    this.pipeline.add(new PreprocessorStage(grammarPreprocessor));
    this.pipeline.add(new ParserStage(messageService, treeListener));
    this.pipeline.add(new EmbeddedCodeStage(embeddedCodeService, treeListener));
    this.pipeline.add(new TransformTreeStage(symbolsRepository, messageService, subroutineService, cachingConfigurationService, dialectService, astProcessor));
  }

  /**
   * Perform syntax and semantic analysis for the given text document
   *
   * @param documentUri unique resource identifier of the processed document
   * @param text the content of the document that should be processed
   * @param analysisConfig contains analysis processing features info and copybook config with
   *     following information: target backend sql server, copybook processing mode which reflect
   *     the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return Semantic information wrapper object and list of syntax error that might send back to
   *     the client
   */
  @NonNull
  public ResultWithErrors<AnalysisResult> run(
      @NonNull String documentUri, @NonNull String text, @NonNull AnalysisConfig analysisConfig) {
    ThreadInterruptionUtil.checkThreadInterrupted();

    if (ServerTypeUtil.isInCompatibleServerTypeRegistered(analysisConfig)) {
      return getErrorForIncompatibleServerTypeAndDialects(documentUri);
    }

    // Cleaning up
    ResultWithErrors<TextTransformations> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx = new AnalysisContext(new ExtendedSource(resultWithErrors.getResult()), analysisConfig, documentUri);
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());

    PipelineResult<?> result = pipeline.run(ctx);

    if (result.stopProcessing() || !(result.getData() instanceof ProcessingResult)) {
      return new ResultWithErrors<>(
          AnalysisResult.builder()
              .rootNode(null)
              .symbolTableMap(ImmutableMap.of())
              .build(),
          ctx.getAccumulatedErrors().stream().map(errorFinalizerService::localizeErrorMessage).collect(toList()));
    } else {
      ProcessingResult processingResult = (ProcessingResult) result.getData();

      ctx.measure(LATE_ERROR_PROCESSING,
          () -> errorFinalizerService.processLateErrors(ctx, ctx.getCopybooksRepository()));

      if (LOG.isDebugEnabled()) {
        ctx.logTiming();
      }

      return new ResultWithErrors<>(
          AnalysisResult.builder()
              .rootNode(processingResult.getRootNode())
              .symbolTableMap(processingResult.getSymbolTableMap())
              .build(),
          ctx.getAccumulatedErrors().stream().map(errorFinalizerService::localizeErrorMessage).collect(toList()));
    }
  }

  private ResultWithErrors<AnalysisResult> getErrorForIncompatibleServerTypeAndDialects(String documentUri) {
    return new ResultWithErrors<>(AnalysisResult.builder().build(),
            Collections.singletonList(SyntaxError.syntaxError()
                    .severity(ErrorSeverity.ERROR)
                    .suggestion(messageService.getMessage("workspaceError.ServerType"))
                    .errorSource(WORKSPACE_SETTINGS)
                    .errorCode(ErrorCodes.INCOMPATIBLE_SERVER_TYPE)
                    .location(new OriginalLocation(
                            new Location(documentUri,
                                    new Range(new Position(0, 0), new Position(0, 6))),
                            null)).build()
            ));
  }

}
