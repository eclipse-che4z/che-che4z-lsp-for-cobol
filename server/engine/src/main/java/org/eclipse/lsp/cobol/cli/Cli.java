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
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cli.di.CliModule;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.cli.processorgroups.ProcessorGroupsResolver;
import org.eclipse.lsp.cobol.cli.processorgroups.Program;
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
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.dialects.TrueDialectServiceImpl;
import org.eclipse.lsp.cobol.dialects.hp.HpCleanupStage;
import org.eclipse.lsp.cobol.dialects.hp.HpCopybookProcessingStage;
import org.eclipse.lsp.cobol.dialects.ibm.*;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.ExperimentalParserStage;
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
    list_sources,
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
  private File[] cpyPaths = {};

  @CommandLine.Option(
          names = {"-ce", "--copybook-extension"},
          description = "List of copybook paths.")
  private String[] cpyExt = {"", ".cpy"};

  @CommandLine.Option(
          description = "Supported dialect values: ${COMPLETION-CANDIDATES}",
          names = {"-d", "--dialect"})
  private CobolLanguageId dialect = CobolLanguageId.COBOL;

  @CommandLine.Option(
          description = "Path to workspace folder.",
          names = {"-ws", "--workspace"}
  )
  private Path workspace;

  private ProcessorGroupsResolver processorGroupsResolver;

  /**
   * Prints the file name to the console and returns result code.
   *
   * @return 0 indicating success.
   * @throws Exception if an error occurs during the method execution.
   */
  @Override
  public Integer call() throws Exception {
    if (src == null) {
      LOG.error("src must be provided");
      return 1;
    }
    initProcessorGroupsReader();
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    JsonObject result = new JsonObject();
    Result analysisResult = null;
    switch (action) {
      case analysis:
        analysisResult = runAnalysis();
        addTiming(result, analysisResult.ctx.getBenchmarkSession());
        JsonArray diagnostics = new JsonArray();
        analysisResult.ctx.getAccumulatedErrors()
                .forEach(
                        err -> {
                          JsonObject diagnostic = toJson(err, gson);
                          diagnostics.add(diagnostic);
                        });
        result.add("diagnostics", diagnostics);
        break;
      case list_copybooks:
        analysisResult = runAnalysis();
        addTiming(result, analysisResult.ctx.getBenchmarkSession());
        StageResult<CopybooksRepository> copybooksResult =
                (StageResult<CopybooksRepository>) analysisResult.pipelineResult.getLastStageResult();
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
      case list_sources:
        JsonArray sources = new JsonArray();
        if (Objects.nonNull(workspace)) {
          try (Stream<Path> paths = Files.walk(workspace)) {
            paths
                .filter(Files::isRegularFile)
                .map(f -> workspace.relativize(f))
                .filter(this::isSourceFile)
                .map(Path::toString)
                .forEach(sources::add);
          }
        } else {
          sources.add(src.toPath().toString());
        }
        result.add("sources", sources);
        break;
      default:
        break;
    }
    System.out.println(gson.toJson(result));
    return 0;
  }

  private Result runAnalysis() throws IOException {
    String documentUri = src.toURI().toString();

    Injector diCtx = Guice.createInjector(new CliModule());
    Pipeline<AnalysisContext> pipeline = setupPipeline(diCtx, action, dialect);

    CliClientProvider cliClientProvider = diCtx.getInstance(CliClientProvider.class);

    cliClientProvider.setCpyPaths(createCopybooksPaths());
    cliClientProvider.setCpyExt(createCopybooksExtensions());

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

  private static class Result {
    public final AnalysisContext ctx;
    public final PipelineResult pipelineResult;

    public Result(AnalysisContext ctx, PipelineResult pipelineResult) {
      this.ctx = ctx;
      this.pipelineResult = pipelineResult;
    }
  }

  private boolean isSourceFile(Path f) {
    if (Objects.isNull(processorGroupsResolver)) {
      return false;
    }
    List<String> programRegexList =
        processorGroupsResolver.getProgramList().stream()
            .map(Program::getProgram)
            .collect(Collectors.toList());
    for (String globPattern : programRegexList) {
      boolean matches = FileSystems.getDefault().getPathMatcher("glob:" + globPattern).matches(f);
      if (matches) {
        return true;
      }
    }
    return false;
  }

  private void initProcessorGroupsReader() {
    if (workspace == null) {
      return;
    }
    Path programConfig = workspace.resolve(Paths.get(".cobolplugin", "pgm_conf.json"));
    Path groupsConfig = workspace.resolve(Paths.get(".cobolplugin", "proc_grps.json"));
    if (Files.exists(programConfig) && Files.exists(groupsConfig)) {
      try {
        processorGroupsResolver = new ProcessorGroupsResolver(
                new String(Files.readAllBytes(programConfig)),
                new String(Files.readAllBytes(groupsConfig)));
      } catch (IOException e) {
        LOG.error("Processor group configuration read error", e);
      }
    } else {
      LOG.warn("Processor group configuration is missing");
    }
  }

  private List<String> createCopybooksExtensions() {
    if (processorGroupsResolver != null) {
      return processorGroupsResolver.resolveCopybooksExtensions(src.toPath(), workspace);
    }
    return Arrays.asList(cpyExt);
  }

  private List<File> createCopybooksPaths() {
    if (processorGroupsResolver != null) {
      return processorGroupsResolver.resolveCopybooksPaths(src.toPath(), workspace).stream()
              .map(Path::toFile).collect(Collectors.toList());
    }
    return Arrays.asList(cpyPaths);
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
          Injector diCtx, Action action, CobolLanguageId dialect) {
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
                action,
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
                action,
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
                action,
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
          Action action,
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

  private static Pipeline<AnalysisContext> getPipelineForExpCobol(
          Action action,
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
    if (action == Action.analysis) {
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
          Action action,
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
