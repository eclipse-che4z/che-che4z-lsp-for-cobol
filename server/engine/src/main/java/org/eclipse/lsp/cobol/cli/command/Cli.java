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

import com.google.gson.*;
import com.google.inject.Injector;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.Callable;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cli.processorgroups.ProcessorGroupsResolver;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.benchmark.Measurement;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.common.pipeline.PipelineResult;
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
import picocli.CommandLine;

/** The Cli class represents a Command Line Interface (CLI) for interacting with the application. */
@CommandLine.Command(
    description = "COBOL Analysis CLI tools.",
    mixinStandardHelpOptions = true,
    scope = CommandLine.ScopeType.INHERIT,
    subcommands = {ListSources.class, ListCopybooks.class, CliAnalysis.class})
@Slf4j
public class Cli implements Callable<Integer> {
  ProcessorGroupsResolver processorGroupsResolver;

  /**
   * Prints the file name to the console and returns result code.
   *
   * @return 0 indicating success.
   * @throws Exception if an error occurs during the method execution.
   */
  @Override
  public Integer call() throws Exception {
    return 0;
  }

  Result runAnalysis(File src, CobolLanguageId dialect, Injector diCtx, boolean isAnalysisRequired)
      throws IOException {
    String documentUri = src.toURI().toString();
    Pipeline<AnalysisContext> pipeline = setupPipeline(diCtx, isAnalysisRequired, dialect);

    // Cleaning up
    CleanerPreprocessor preprocessor =
        diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(dialect);
    BenchmarkService benchmarkService = diCtx.getInstance(BenchmarkService.class);

    String text = new String(Files.readAllBytes(src.toPath()));
    ResultWithErrors<ExtendedText> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx =
        new AnalysisContext(
            new ExtendedDocument(resultWithErrors.getResult(), text),
            createAnalysisConfiguration(),
            benchmarkService.startSession(),
            documentUri,
            text,
            dialect);
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());
    PipelineResult pipelineResult = pipeline.run(ctx);
    return new Result(ctx, pipelineResult);
  }

  /** Result of analysis */
  static class Result {
    final AnalysisContext ctx;
    final PipelineResult pipelineResult;

    Result(AnalysisContext ctx, PipelineResult pipelineResult) {
      this.ctx = ctx;
      this.pipelineResult = pipelineResult;
    }
  }

  void initProcessorGroupsReader(Path workspace) {
    if (workspace == null) {
      return;
    }
    Path programConfig = workspace.resolve(Paths.get(".cobolplugin", "pgm_conf.json"));
    Path groupsConfig = workspace.resolve(Paths.get(".cobolplugin", "proc_grps.json"));
    if (Files.exists(programConfig) && Files.exists(groupsConfig)) {
      try {
        processorGroupsResolver =
            new ProcessorGroupsResolver(
                new String(Files.readAllBytes(programConfig)),
                new String(Files.readAllBytes(groupsConfig)));
      } catch (IOException e) {
        LOG.error("Processor group configuration read error", e);
      }
    } else {
      LOG.warn("Processor group configuration is missing");
    }
  }

  JsonObject toJson(SyntaxError syntaxError, Gson gson) {
    JsonObject diagnostic = new JsonObject();
    Optional.ofNullable(syntaxError.getErrorCode())
        .ifPresent(code -> diagnostic.add("code", new JsonPrimitive(code.getLabel())));
    Optional.ofNullable(syntaxError.getErrorSource())
        .ifPresent(es -> diagnostic.add("source", new JsonPrimitive(es.getText())));
    Optional.ofNullable(syntaxError.getLocation())
        .ifPresent(l -> diagnostic.add("location", gson.toJsonTree(l)));
    Optional.ofNullable(syntaxError.getSeverity())
        .ifPresent(s -> diagnostic.add("severity", new JsonPrimitive(s.name())));
    Optional.ofNullable(syntaxError.getSuggestion())
        .ifPresent(s -> diagnostic.add("suggestion", new JsonPrimitive(s)));
    Optional.ofNullable(syntaxError.getRelatedInformation())
        .ifPresent(ri -> diagnostic.add("related", gson.toJsonTree(ri)));
    return diagnostic;
  }

  void addTiming(JsonObject result, BenchmarkSession benchmarkSession) {
    JsonObject tObj = new JsonObject();
    benchmarkSession
        .getMeasurements()
        .forEach(m -> tObj.add(m.getId(), new JsonPrimitive(m.getTime() / 1_000_000_000.0)));
    result.add("timings", tObj);
    benchmarkSession.getMeasurements().stream()
        .map(Measurement::getTime)
        .reduce(Long::sum)
        .ifPresent(totalTime -> tObj.add("total", new JsonPrimitive(totalTime / 1_000_000_000.0)));
  }

  private static AnalysisConfig createAnalysisConfiguration() {
    return AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED);
  }

  private static Pipeline<AnalysisContext> setupPipeline(
      Injector diCtx, boolean isAnalysisRequired, CobolLanguageId dialect) {
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    MessageService messageService = diCtx.getInstance(MessageService.class);
    GrammarPreprocessor grammarPreprocessor = diCtx.getInstance(GrammarPreprocessor.class);
    ParseTreeListener parseTreeListener = diCtx.getInstance(ParseTreeListener.class);
    SymbolsRepository symbolsRepository = diCtx.getInstance(SymbolsRepository.class);
    SubroutineService subroutineService = diCtx.getInstance(SubroutineService.class);
    CleanerPreprocessor preprocessor =
        diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(dialect);
    CachingConfigurationService cachingConfigurationService =
        diCtx.getInstance(CachingConfigurationService.class);
    AstProcessor astProcessor = diCtx.getInstance(AstProcessor.class);
    CodeLayoutStore layoutStore = diCtx.getInstance(CodeLayoutStore.class);
    CopybookService copybookService = diCtx.getInstance(CopybookService.class);

    Pipeline<AnalysisContext> pipeline = new Pipeline<>();
    switch (dialect) {
      case COBOL:
        return getPipelineForCobolDialect(
            isAnalysisRequired,
            pipeline,
            preprocessor,
            messageService,
            dialectService,
            grammarPreprocessor,
            parseTreeListener,
            symbolsRepository,
            subroutineService,
            cachingConfigurationService,
            astProcessor,
            layoutStore);
      case EXPERIMENTAL_COBOL:
        return getPipelineForExpCobol(
            isAnalysisRequired,
            pipeline,
            preprocessor,
            messageService,
            dialectService,
            grammarPreprocessor,
            parseTreeListener,
            symbolsRepository,
            subroutineService,
            cachingConfigurationService,
            astProcessor,
            layoutStore);
      case HP_COBOL:
        return getPipelineForHpCobol(
            isAnalysisRequired,
            pipeline,
            preprocessor,
            messageService,
            copybookService,
            grammarPreprocessor,
            dialectService,
            parseTreeListener,
            symbolsRepository,
            subroutineService,
            cachingConfigurationService,
            astProcessor,
            layoutStore);
      default:
        return pipeline;
    }
  }

  private static Pipeline<AnalysisContext> getPipelineForHpCobol(
      boolean isAnalysisRequired,
      Pipeline<AnalysisContext> pipeline,
      CleanerPreprocessor preprocessor,
      MessageService messageService,
      CopybookService copybookService,
      GrammarPreprocessor grammarPreprocessor,
      DialectService dialectService,
      ParseTreeListener parseTreeListener,
      SymbolsRepository symbolsRepository,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      AstProcessor astProcessor,
      CodeLayoutStore layoutStore) {
    pipeline.add(new HpCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new HpCopybookProcessingStage(messageService, copybookService));
    pipeline.add(new PreprocessorStage(grammarPreprocessor, preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ParserStage(messageService, parseTreeListener));
      pipeline.add(
          new TransformTreeStage(
              symbolsRepository,
              messageService,
              subroutineService,
              cachingConfigurationService,
              dialectService,
              astProcessor,
              layoutStore));
    }
    return pipeline;
  }

  private static Pipeline<AnalysisContext> getPipelineForExpCobol(
      boolean isAnalysisRequired,
      Pipeline<AnalysisContext> pipeline,
      CleanerPreprocessor preprocessor,
      MessageService messageService,
      DialectService dialectService,
      GrammarPreprocessor grammarPreprocessor,
      ParseTreeListener parseTreeListener,
      SymbolsRepository symbolsRepository,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      AstProcessor astProcessor,
      CodeLayoutStore layoutStore) {
    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService, preprocessor));
    pipeline.add(new PreprocessorStage(grammarPreprocessor, preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ExperimentalParserStage(messageService, parseTreeListener));
      pipeline.add(
          new TransformTreeStage(
              symbolsRepository,
              messageService,
              subroutineService,
              cachingConfigurationService,
              dialectService,
              astProcessor,
              layoutStore));
    }
    return pipeline;
  }

  private static Pipeline<AnalysisContext> getPipelineForCobolDialect(
      boolean isAnalysisRequired,
      Pipeline<AnalysisContext> pipeline,
      CleanerPreprocessor preprocessor,
      MessageService messageService,
      DialectService dialectService,
      GrammarPreprocessor grammarPreprocessor,
      ParseTreeListener parseTreeListener,
      SymbolsRepository symbolsRepository,
      SubroutineService subroutineService,
      CachingConfigurationService cachingConfigurationService,
      AstProcessor astProcessor,
      CodeLayoutStore layoutStore) {
    pipeline.add(new IbmCleanupStage(preprocessor));
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService, preprocessor));
    pipeline.add(new PreprocessorStage(grammarPreprocessor, preprocessor));
    if (isAnalysisRequired) {
      pipeline.add(new ImplicitDialectProcessingStage(dialectService));
      pipeline.add(new ParserStage(messageService, parseTreeListener));
      pipeline.add(
          new TransformTreeStage(
              symbolsRepository,
              messageService,
              subroutineService,
              cachingConfigurationService,
              dialectService,
              astProcessor,
              layoutStore));
    }
    return pipeline;
  }
}
