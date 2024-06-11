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
package org.eclipse.lsp.cobol.cli.processorgroups;

import com.google.gson.Gson;
import lombok.Getter;

import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Resolve settings based on processor groups configuration
 */
@Getter
public class ProcessorGroupsResolver {
  private static final Gson GSON = new Gson();

  private final List<Program> programList;
  private final List<ProcessorGroup> processorGroupList;

  public ProcessorGroupsResolver(String programs, String groups) {
    this.programList = GSON.fromJson(programs, ProgramsJson.class).getPgms();
    this.processorGroupList = GSON.fromJson(groups, ProcessorGroupsJson.class).getPgroups();
  }

  /**
   * List of copybooks paths
   * @param srcPath path to the COBOL source code.
   * @param workspacePath  path to workspace.
   * @return list of copybooks paths.
   */
  public List<Path> resolveCopybooksPaths(Path srcPath, Path workspacePath) {
    Optional<Program> first = programList.stream().filter(p -> match(p, srcPath, workspacePath)).findFirst();
    return first.map(program -> findProcessorGroup(program.getProcessorGroup())
                    .getLibs().stream()
                    .map(Paths::get)
                    .map(p -> p.isAbsolute() ? p : workspacePath.resolve(p))
                    .collect(Collectors.toList()))
            .orElse(Collections.emptyList());
  }

  /**
   * List of copybooks extensions
   * @param srcPath path to the COBOL source code.
   * @param workspacePath  path to workspace.
   * @return list of copybooks extensions.
   */
  public List<String> resolveCopybooksExtensions(Path srcPath, Path workspacePath) {
    Optional<Program> first = programList.stream().filter(p -> match(p, srcPath, workspacePath)).findFirst();
    return first
            .map(program -> findProcessorGroup(program.getProcessorGroup()).getCopybookExtensions())
            .orElse(Collections.emptyList());
  }

  private boolean match(Program p, Path srcPath, Path workspacePath) {
    if (srcPath.startsWith(workspacePath)) {
      srcPath = workspacePath.relativize(srcPath);
    }
    return FileSystems.getDefault().getPathMatcher("glob:" + p.getProgram()).matches(srcPath);
  }

  private ProcessorGroup findProcessorGroup(String pgName) {
    return processorGroupList.stream().filter(pg -> Objects.equals(pg.getName(), pgName)).findFirst()
            .orElse(null);
  }
}
