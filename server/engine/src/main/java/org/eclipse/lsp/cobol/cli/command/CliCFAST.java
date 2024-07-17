/*
 * Copyright (c) 2024 Broadcom.
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

import com.google.common.io.Files;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.cli.di.CliModule;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.dialects.ibm.ProcessingResult;
import picocli.CommandLine;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Objects;
import java.util.concurrent.Callable;

/**
 * Generates CFAST representation of the COBOL program in the defined folder
 */
@CommandLine.Command(name = "cfast", description = "generate cfast from cobol source")
public class CliCFAST  implements Callable<Integer> {

  @CommandLine.ParentCommand
  private Cli parent;

  @CommandLine.Option(
      description = "Path to the source folder.",
      names = {"-sf", "--source_folder"})
  private Path workspace;

  @Override
  public Integer call() throws Exception {
    try {
      if (Objects.nonNull(workspace)) {
        Injector diCtx = Guice.createInjector(new CliModule());
        CFASTBuilder builder = diCtx.getInstance(CFASTBuilder.class);

        File[] paths = workspace.toFile().listFiles();
        if (paths == null) {
          throw new Exception("Cannot find folder: " + workspace.toFile().getAbsolutePath());
        }

        Gson gson = new GsonBuilder().setPrettyPrinting().create();

        Arrays.stream(paths)
            .filter(CliCFAST::isCobolFile)
            .forEach(file -> generateCFAST(file, builder, gson, diCtx));
      }
    } catch (Exception e) {
      System.out.println("Failed to generate CFAST: " + e.getMessage());
      return Cli.FAILURE;
    }

    return Cli.SUCCESS;
  }

  private void generateCFAST(File file, CFASTBuilder builder, Gson gson, Injector diCtx) {
    try {
      Cli.Result analysisResult = parent.runAnalysis(file.getCanonicalFile(), CobolLanguageId.COBOL, diCtx, true);
      StageResult<ProcessingResult> result = (StageResult<ProcessingResult>) analysisResult.pipelineResult.getLastStageResult();
      Node rootNode = result.getData().getRootNode();

      String json = gson.toJson(builder.build(rootNode).getControlFlowAST());

      try (FileWriter writer = new FileWriter(getCFASTFileName(file.toPath()))) {
        writer.write(json);
        writer.flush();
      }

    } catch (IOException e) {
      System.out.println("Error processing file: " + file.getAbsolutePath() + " \n" + e.getMessage());
    }
  }

  private static boolean isCobolFile(File file) {
    return "cbl".equals(Files.getFileExtension(file.getAbsolutePath()));
  }

  private static String getCFASTFileName(Path file) {
    String fileName = file.toAbsolutePath().toString();
    return fileName.substring(0, fileName.length() - ".cbl".length()) + ".cfast.json";
  }
}
