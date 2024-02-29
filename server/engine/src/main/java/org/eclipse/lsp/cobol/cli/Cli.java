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
package org.eclipse.lsp.cobol.cli;

import com.google.common.collect.Multimap;
import com.google.gson.*;
import com.google.inject.Guice;
import com.google.inject.Injector;
import java.io.File;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.Callable;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cli.di.CliModule;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.benchmark.Measurement;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.*;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp4j.Location;
import picocli.CommandLine;

/**
 * The Cli class represents a Command Line Interface (CLI) for interacting with the application.
 */
@CommandLine.Command(description = "COBOL Analysis CLI tools.")
@Slf4j
public class Cli implements Callable<Integer> {
  private enum Action {
    list_copybooks,
    analysis
  }

  @CommandLine.Parameters(description = "Values: ${COMPLETION-CANDIDATES}")
  Action action = null;

  @CommandLine.Option(
      names = {"-s", "--source"},
      required = true,
      description = "The COBOL program file.")
  private File src;

  @CommandLine.Option(
      names = {"-cf", "--copybook-folder"},
      description = "Path to the copybook folder.")
  private File[] cpyPaths;

  @CommandLine.Option(
      names = {"-ce", "--copybook-extension"},
      description = "List of copybook paths.")
  private String[] cpyExt = {"", ".cpy"};

  /**
   * Prints the file name to the console and returns result code.
   *
   * @return 0 indicating success.
   * @throws Exception if an error occurs during the method execution.
   */
  @Override
  public Integer call() throws Exception {
    Injector diCtx = Guice.createInjector(new CliModule());
    Pipeline pipeline = setupPipeline(diCtx, action);

    CliClientProvider cliClientProvider = diCtx.getInstance(CliClientProvider.class);
    if (cpyPaths != null) {
      cliClientProvider.setCpyPaths(Arrays.asList(cpyPaths));
    }
    cliClientProvider.setCpyExt(Arrays.asList(cpyExt));

    // Cleaning up
    TextPreprocessor preprocessor = diCtx.getInstance(TextPreprocessor.class);
    BenchmarkService benchmarkService = diCtx.getInstance(BenchmarkService.class);

    if (src == null) {
      LOG.error("src must be provided");
      return 1;
    }
    String documentUri = src.toURI().toString();
    String text = new String(Files.readAllBytes(src.toPath()));
    ResultWithErrors<ExtendedText> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx =
        new AnalysisContext(
            new ExtendedDocument(resultWithErrors.getResult(), text),
            createAnalysisConfiguration(),
            benchmarkService.startSession());
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());
    PipelineResult pipelineResult = pipeline.run(ctx);
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    JsonObject result = new JsonObject();
    addTiming(result, ctx.getBenchmarkSession());
    switch (action) {
      case analysis:
        StageResult<ProcessingResult> analysisResult =
            (StageResult<ProcessingResult>) pipelineResult.getLastStageResult();
        JsonArray diagnostics = new JsonArray();
        ctx.getAccumulatedErrors()
            .forEach(
                err -> {
                  JsonObject diagnostic = toJson(err, gson);
                  diagnostics.add(diagnostic);
                });
        //        result.add("diagnostics", diagnostics);
        break;
      case list_copybooks:
        StageResult<CopybooksRepository> copybooksResult =
            (StageResult<CopybooksRepository>) pipelineResult.getLastStageResult();
        Multimap<String, String> definitions = copybooksResult.getData().getDefinitions();
        Multimap<String, Location> usages = copybooksResult.getData().getUsages();
        Set<String> missing = new HashSet<>(usages.keySet());
        missing.removeAll(definitions.keySet());

        JsonArray copybookUris = new JsonArray();
        JsonArray missingCopybooks = new JsonArray();
        missing.forEach(missingCopybooks::add);
        definitions.values().forEach(copybookUris::add);
        result.add("copybookUris", copybookUris);
        result.add("missingCopybooks", missingCopybooks);
        break;
      default:
        break;
    }
    System.out.println(gson.toJson(result));
    return 0;
  }

  private JsonObject toJson(SyntaxError syntaxError, Gson gson) {
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

  private void addTiming(JsonObject result, BenchmarkSession benchmarkSession) {
    JsonObject tObj = new JsonObject();
    benchmarkSession.getMeasurements()
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

  private static Pipeline setupPipeline(Injector diCtx, Action action) {
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    MessageService messageService = diCtx.getInstance(MessageService.class);
    GrammarPreprocessor grammarPreprocessor = diCtx.getInstance(GrammarPreprocessor.class);
    ParseTreeListener parseTreeListener = diCtx.getInstance(ParseTreeListener.class);
    SymbolsRepository symbolsRepository = diCtx.getInstance(SymbolsRepository.class);
    SubroutineService subroutineService = diCtx.getInstance(SubroutineService.class);
    CachingConfigurationService cachingConfigurationService =
        diCtx.getInstance(CachingConfigurationService.class);
    AstProcessor astProcessor = diCtx.getInstance(AstProcessor.class);
    CodeLayoutStore layoutStore = diCtx.getInstance(CodeLayoutStore.class);

    Pipeline pipeline = new Pipeline();
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService));
    pipeline.add(new PreprocessorStage(grammarPreprocessor));
    if (action == Action.analysis) {
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
