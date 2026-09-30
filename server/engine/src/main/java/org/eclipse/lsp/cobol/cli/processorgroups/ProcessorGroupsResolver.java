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
package org.eclipse.lsp.cobol.cli.processorgroups;

import com.google.gson.Gson;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.PatternSyntaxException;
import java.util.stream.Collectors;
import lombok.Getter;

/** Resolve settings based on processor groups configuration */
@Getter
public class ProcessorGroupsResolver {
  private static final Gson GSON = new Gson();

  /**
   * Patterns with more wildcard segments than this are rejected instead of compiled, since glob
   * patterns are translated to regex and pathological combinations of wildcards can make matching
   * take super-linear time on directories with many long, similar file names.
   */
  private static final int MAX_WILDCARD_COUNT = 20;

  private final List<Program> programList;
  private final List<ProcessorGroup> processorGroupList;
  private final Map<Program, PathMatcher> compiledMatchers;

  public ProcessorGroupsResolver(String programs, String groups) {
    this.programList = GSON.fromJson(programs, ProgramsJson.class).getPgms();
    this.processorGroupList = GSON.fromJson(groups, ProcessorGroupsJson.class).getPgroups();
    this.compiledMatchers = compileMatchers(this.programList);
  }

  private static Map<Program, PathMatcher> compileMatchers(List<Program> programs) {
    Map<Program, PathMatcher> result = new LinkedHashMap<>();
    for (Program program : programs) {
      String pattern = program.getProgram();
      if (Objects.isNull(pattern)) {
        continue;
      }
      long wildcardCount = pattern.chars().filter(c -> c == '*' || c == '?').count();
      if (wildcardCount > MAX_WILDCARD_COUNT) {
        throw new IllegalArgumentException(
            String.format(
                "Invalid program pattern '%s': too many wildcards (%d), maximum allowed is %d",
                pattern, wildcardCount, MAX_WILDCARD_COUNT));
      }
      try {
        result.put(program, FileSystems.getDefault().getPathMatcher("glob:" + pattern));
      } catch (PatternSyntaxException | UnsupportedOperationException e) {
        throw new IllegalArgumentException(
            String.format("Invalid program glob pattern '%s': %s", pattern, e.getMessage()), e);
      }
    }
    return result;
  }

  /**
   * List of copybooks paths
   *
   * @param srcPath path to the COBOL source code.
   * @param workspacePath path to workspace.
   * @return list of copybooks paths.
   */
  public List<Path> resolveCopybooksPaths(Path srcPath, Path workspacePath) {
    Optional<Program> first =
        programList.stream().filter(p -> match(p, srcPath, workspacePath)).findFirst();
    return first
        .map(
            program ->
                findProcessorGroup(program.getProcessorGroup()).getLibs().stream()
                    .map(Paths::get)
                    .map(p -> p.isAbsolute() ? p : workspacePath.resolve(p))
                    .collect(Collectors.toList()))
        .orElse(Collections.emptyList());
  }

  /**
   * List of copybooks extensions
   *
   * @param srcPath path to the COBOL source code.
   * @param workspacePath path to workspace.
   * @return list of copybooks extensions.
   */
  public List<String> resolveCopybooksExtensions(Path srcPath, Path workspacePath) {
    Optional<Program> first =
        programList.stream().filter(p -> match(p, srcPath, workspacePath)).findFirst();
    return first
        .map(program -> findProcessorGroup(program.getProcessorGroup()).getCopybookExtensions())
        .orElse(Collections.emptyList());
  }

  private boolean match(Program p, Path srcPath, Path workspacePath) {
    PathMatcher matcher = compiledMatchers.get(p);
    if (Objects.isNull(matcher)) {
      return false;
    }
    if (srcPath.startsWith(workspacePath)) {
      srcPath = workspacePath.relativize(srcPath);
    }
    return matcher.matches(srcPath);
  }

  /**
   * Checks whether the given workspace-relative path matches any configured program pattern.
   *
   * @param relativeSrcPath path relative to the workspace.
   * @return true if any program pattern matches the path.
   */
  public boolean isSourceFile(Path relativeSrcPath) {
    return compiledMatchers.values().stream().anyMatch(m -> m.matches(relativeSrcPath));
  }

  private ProcessorGroup findProcessorGroup(String pgName) {
    return processorGroupList.stream()
        .filter(pg -> Objects.equals(pg.getName(), pgName))
        .findFirst()
        .orElse(null);
  }
}
