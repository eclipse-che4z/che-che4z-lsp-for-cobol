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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.cli.command;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.stream.Stream;
import picocli.CommandLine;

/** list sources cli command */
@CommandLine.Command(name = "list_sources", description = "list sources")
public class ListSources implements Callable<Integer> {

  @CommandLine.ParentCommand private Cli parent;

  @CommandLine.Option(
      description = "Path to workspace folder.",
      names = {"-ws", "--workspace"})
  private Path workspace;

  @CommandLine.Option(
      description = "show absolute path of sources",
      names = {"-ap", "--absolutePath"},
      arity = "0")
  private boolean showAbsolutePath;

  /**
   * execute list source command
   *
   * @return returns a return code
   * @throws Exception
   */
  public Integer call() throws Exception {
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    try {
      parent.initProcessorGroupsReader(workspace);
    } catch (Exception e) {
      return Cli.FAILURE;
    }
    JsonObject result = new JsonObject();
    JsonArray sources = new JsonArray();
    if (Objects.nonNull(workspace) && Objects.nonNull(parent.processorGroupsResolver)) {
      try (Stream<Path> paths = Files.walk(workspace)) {
        Stream<Path> pathStream =
            paths
                .filter(Files::isRegularFile)
                .filter(f -> this.isSourceFile(workspace.relativize(f)));
        if (!showAbsolutePath) {
          pathStream = pathStream.map(f -> workspace.relativize(f));
        }
        pathStream.map(Path::toString).forEach(sources::add);
      }
    }
    result.add("sources", sources);
    System.out.println(gson.toJson(result));
    return Cli.SUCCESS;
  }

  private boolean isSourceFile(Path f) {
    return parent.processorGroupsResolver.isSourceFile(f);
  }
}
