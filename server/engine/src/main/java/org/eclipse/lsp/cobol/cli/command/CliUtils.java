/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.cli.command;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.inject.Injector;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.dialects.TrueDialectServiceImpl;
import org.eclipse.lsp.cobol.dialects.hp.HpCleanupStage;
import org.eclipse.lsp.cobol.dialects.hp.HpCopybookProcessingStage;
import org.eclipse.lsp.cobol.dialects.ibm.*;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.ExperimentalParserStage;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

import java.util.Optional;

/**
 * CLI related utils
 */
public class CliUtils {

  public static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();

  /**
   * Init CLI pipeline
   *
   * @param diCtx              DI context
   * @param isAnalysisRequired do we need analysis in the pipeline
   * @param dialect            cobol dialect
   * @return new pipeline
   */
  public static Pipeline<AnalysisContext> setupPipeline(Injector diCtx, boolean isAnalysisRequired, CobolLanguageId dialect) {
    switch (dialect) {
      case COBOL:
        return getPipelineForCobolDialect(diCtx, isAnalysisRequired);
      case EXPERIMENTAL_COBOL:
        return getPipelineForExpCobol(diCtx, isAnalysisRequired);
      case HP_COBOL:
        return getPipelineForHpCobol(diCtx, isAnalysisRequired);
      default:
        return new Pipeline<>();
    }
  }

  /**
   * Convert diagnostics to json format
   *
   * @param syntaxError error object
   * @return Json object
   */
  public static JsonObject diagnosticToJson(SyntaxError syntaxError) {
    JsonObject diagnostic = new JsonObject();
    Optional.ofNullable(syntaxError.getErrorCode()).ifPresent(code -> diagnostic.add("code", new JsonPrimitive(code.getLabel())));
    Optional.ofNullable(syntaxError.getErrorSource()).ifPresent(es -> diagnostic.add("source", new JsonPrimitive(es.getText())));
    Optional.ofNullable(syntaxError.getLocation()).ifPresent(l -> diagnostic.add("location", GSON.toJsonTree(l)));
    Optional.ofNullable(syntaxError.getSeverity()).ifPresent(s -> diagnostic.add("severity", new JsonPrimitive(s.name())));
    Optional.ofNullable(syntaxError.getSuggestion()).ifPresent(s -> diagnostic.add("suggestion", new JsonPrimitive(s)));
    Optional.ofNullable(syntaxError.getRelatedInformation()).ifPresent(ri -> diagnostic.add("related", GSON.toJsonTree(ri)));
    return diagnostic;
  }


  private static Pipeline<AnalysisContext> getPipelineForHpCobol(Injector diCtx, boolean isAnalysisRequired) {
    Pipeline<AnalysisContext> pipeline = new Pipeline<>();
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    MessageService messageService = diCtx.getInstance(MessageService.class);
    CleanerPreprocessor preprocessor = diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(CobolLanguageId.HP_COBOL);

    pipeline.add(new HpCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new HpCopybookProcessingStage(messageService, diCtx.getInstance(CopybookService.class)));
    pipeline.add(new PreprocessorStage(diCtx.getInstance(GrammarPreprocessor.class), preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ParserStage(messageService, diCtx.getInstance(ParseTreeListener.class)));
      pipeline.add(new TransformTreeStage(diCtx.getInstance(SymbolsRepository.class), messageService, diCtx.getInstance(SubroutineService.class), diCtx.getInstance(CachingConfigurationService.class), dialectService, diCtx.getInstance(AstProcessor.class), diCtx.getInstance(CodeLayoutStore.class)));
    }
    return pipeline;
  }

  private static Pipeline<AnalysisContext> getPipelineForExpCobol(Injector diCtx, boolean isAnalysisRequired) {
    MessageService messageService = diCtx.getInstance(MessageService.class);
    CleanerPreprocessor preprocessor = diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(CobolLanguageId.EXPERIMENTAL_COBOL);
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    Pipeline<AnalysisContext> pipeline = new Pipeline<>();

    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService, preprocessor));
    pipeline.add(new PreprocessorStage(diCtx.getInstance(GrammarPreprocessor.class), preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ExperimentalParserStage(messageService, diCtx.getInstance(ParseTreeListener.class)));
      pipeline.add(new TransformTreeStage(diCtx.getInstance(SymbolsRepository.class), messageService, diCtx.getInstance(SubroutineService.class), diCtx.getInstance(CachingConfigurationService.class), dialectService, diCtx.getInstance(AstProcessor.class), diCtx.getInstance(CodeLayoutStore.class)));
    }
    return pipeline;
  }

  private static Pipeline<AnalysisContext> getPipelineForCobolDialect(Injector diCtx, boolean isAnalysisRequired) {
    Pipeline<AnalysisContext> pipeline = new Pipeline<>();
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    MessageService messageService = diCtx.getInstance(MessageService.class);
    GrammarPreprocessor grammarPreprocessor = diCtx.getInstance(GrammarPreprocessor.class);
    CleanerPreprocessor preprocessor = diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(CobolLanguageId.COBOL);

    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService, preprocessor));
    pipeline.add(new PreprocessorStage(grammarPreprocessor, preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ParserStage(messageService, diCtx.getInstance(ParseTreeListener.class)));
      pipeline.add(new TransformTreeStage(diCtx.getInstance(SymbolsRepository.class), messageService, diCtx.getInstance(SubroutineService.class), diCtx.getInstance(CachingConfigurationService.class), dialectService, diCtx.getInstance(AstProcessor.class), diCtx.getInstance(CodeLayoutStore.class)));
    }
    return pipeline;
  }
}
