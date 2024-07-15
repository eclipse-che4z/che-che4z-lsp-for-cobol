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
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.Callable;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cli.processorgroups.ProcessorGroupsResolver;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkService;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.benchmark.Measurement;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;

import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.common.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.dialects.TrueDialectServiceImpl;
import picocli.CommandLine;

import static org.eclipse.lsp.cobol.cli.command.CliUtils.setupPipeline;

/**
 * The Cli class represents a Command Line Interface (CLI) for interacting with the application.
 */
@CommandLine.Command(description = "COBOL Analysis CLI tools.", mixinStandardHelpOptions = true, scope = CommandLine.ScopeType.INHERIT,
    subcommands = {
        ListSources.class,
        ListCopybooks.class,
        CliAnalysis.class,
        CliCFAST.class
    })
@Slf4j
public class Cli implements Callable<Integer> {
  static final int SUCCESS = 0;
  static final int FAILURE = 1;

  ProcessorGroupsResolver processorGroupsResolver;

  /**
   * Prints the file name to the console and returns result code.
   *
   * @return 0 indicating success.
   * @throws Exception if an error occurs during the method execution.
   */
  @Override
  public Integer call() throws Exception {
    return SUCCESS;
  }

  Result runAnalysis(File src, CobolLanguageId dialect, Injector diCtx, boolean isAnalysisRequired) throws IOException {
    String documentUri = src.toURI().toString();
    Pipeline<AnalysisContext> pipeline = setupPipeline(diCtx, isAnalysisRequired, dialect);

    // Cleaning up
    CleanerPreprocessor preprocessor = diCtx.getInstance(TrueDialectServiceImpl.class).getPreprocessor(dialect);
    BenchmarkService benchmarkService = diCtx.getInstance(BenchmarkService.class);

    String text = new String(Files.readAllBytes(src.toPath()));
    ResultWithErrors<ExtendedText> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx = new AnalysisContext(new ExtendedDocument(resultWithErrors.getResult(), text), createAnalysisConfiguration(), benchmarkService.startSession(), documentUri, text, dialect);
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());
    PipelineResult pipelineResult = pipeline.run(ctx);
    return new Result(ctx, pipelineResult);
  }

  /**
   * Result of analysis
   */
  static class Result {
    final AnalysisContext ctx;
    final PipelineResult pipelineResult;

    Result(AnalysisContext ctx, PipelineResult pipelineResult) {
      this.ctx = ctx;
      this.pipelineResult = pipelineResult;
    }
  }

  void initProcessorGroupsReader(Path workspace) throws IOException {
    if (workspace == null) {
      return;
    }
    Path programConfig = workspace.resolve(Paths.get(".cobolplugin", "pgm_conf.json"));
    Path groupsConfig = workspace.resolve(Paths.get(".cobolplugin", "proc_grps.json"));
    if (Files.exists(programConfig) && Files.exists(groupsConfig)) {
      try {
        processorGroupsResolver = new ProcessorGroupsResolver(new String(Files.readAllBytes(programConfig)), new String(Files.readAllBytes(groupsConfig)));
      } catch (IOException e) {
        LOG.error("Processor group configuration read error", e);
        throw e;
      }
    } else {
      LOG.warn("Processor group configuration is missing");
      throw new FileNotFoundException("Processor group configuration is missing");
    }
  }

  void addTiming(JsonObject result, BenchmarkSession benchmarkSession) {
    JsonObject tObj = new JsonObject();
    benchmarkSession.getMeasurements().forEach(m -> tObj.add(m.getId(), new JsonPrimitive(m.getTime() / 1_000_000_000.0)));
    result.add("timings", tObj);
    benchmarkSession.getMeasurements().stream().map(Measurement::getTime).reduce(Long::sum).ifPresent(totalTime -> tObj.add("total", new JsonPrimitive(totalTime / 1_000_000_000.0)));
  }

  private static AnalysisConfig createAnalysisConfiguration() {
    return AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED);
  }
}
