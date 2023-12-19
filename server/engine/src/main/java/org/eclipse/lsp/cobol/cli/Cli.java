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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cli.di.CliModule;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.pipeline.PipelineResult;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.CompilerDirectivesStage;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.DialectProcessingStage;
import org.eclipse.lsp.cobol.core.engine.pipeline.stages.PreprocessorStage;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;
import picocli.CommandLine;

import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Callable;

/**
 * The Cli class represents a Command Line Interface (CLI) for interacting with the application.
 */
@CommandLine.Command(description = "COBOL Analysis CLI tools.")
@Slf4j
public class Cli implements Callable<Integer> {
  private enum Action {
    list_copybooks
  }

  @CommandLine.Parameters(description = "Values: ${COMPLETION-CANDIDATES}")
  Action action = null;
  @CommandLine.Option(names = {"-s", "--source"}, required = true, description = "The COBOL program file.")
  private File src;
  @CommandLine.Option(names = {"-cf", "--copybook-folder"}, description = "Path to the copybook folder.")
  private File[] cpyPaths;

  @CommandLine.Option(names = {"-ce", "--copybook-extension"}, description = "List of copybook paths.")
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
    Pipeline pipeline = setupPipeline(diCtx);

    CliClientProvider cliClientProvider = diCtx.getInstance(CliClientProvider.class);
    if (cpyPaths != null) {
      cliClientProvider.setCpyPaths(Arrays.asList(cpyPaths));
    }
    cliClientProvider.setCpyExt(Arrays.asList(cpyExt));


    // Cleaning up
    TextPreprocessor preprocessor = diCtx.getInstance(TextPreprocessor.class);
    if (src == null) {
      LOG.error("src must be provided");
      return 1;
    }
    String documentUri = src.toURI().toString();
    String text = new String(Files.readAllBytes(src.toPath()));
    ResultWithErrors<ExtendedText> resultWithErrors = preprocessor.cleanUpCode(documentUri, text);
    AnalysisContext ctx = new AnalysisContext(new ExtendedDocument(resultWithErrors.getResult(), text), createAnalysisConfiguration());
    ctx.getAccumulatedErrors().addAll(resultWithErrors.getErrors());

    PipelineResult<CopybooksRepository> pipelineResult = (PipelineResult<CopybooksRepository>) pipeline.run(ctx);
    Multimap<String, String> definitions = pipelineResult.getData().getDefinitions();
    Multimap<String, Location> usages = pipelineResult.getData().getUsages();
    Set<String> missing = new HashSet<>(usages.keySet());
    missing.removeAll(definitions.keySet());

    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    JsonObject result = new JsonObject();
    JsonArray copybookUris = new JsonArray();
    JsonArray missingCopybooks = new JsonArray();
    missing.forEach(missingCopybooks::add);
    definitions.values().forEach(copybookUris::add);
    result.add("copybookUris", copybookUris);
    result.add("missingCopybooks", missingCopybooks);
    System.out.println(gson.toJson(result));
    return 0;
  }

  private static AnalysisConfig createAnalysisConfiguration() {
    return AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED);
  }

  private static Pipeline setupPipeline(Injector diCtx) {
    DialectService dialectService = diCtx.getInstance(DialectService.class);
    MessageService messageService = diCtx.getInstance(MessageService.class);
    GrammarPreprocessor grammarPreprocessor = diCtx.getInstance(GrammarPreprocessor.class);

    Pipeline pipeline = new Pipeline();
    pipeline.add(new CompilerDirectivesStage(messageService));
    pipeline.add(new DialectProcessingStage(dialectService));
    pipeline.add(new PreprocessorStage(grammarPreprocessor));
    return pipeline;
  }
}
