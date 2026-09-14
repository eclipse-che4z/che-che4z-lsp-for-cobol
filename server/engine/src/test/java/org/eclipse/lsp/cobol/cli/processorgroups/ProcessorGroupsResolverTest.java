/*
 * Copyright (c) 2026 Broadcom.
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

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

/**
 * Test that {@link ProcessorGroupsResolver} keeps proc_grps.json "libs" search roots contained
 * within the analyzed workspace by default, since that file is untrusted analyzed-workspace content
 * (e.g. a contributor-supplied PR in a CI pipeline) rather than operator-supplied configuration,
 * while still allowing an explicit opt-in for legitimate shared copybook/macro libraries that live
 * outside the workspace.
 */
class ProcessorGroupsResolverTest {

  private static final String PROGRAMS =
      "{\"pgms\": [{\"program\": \"*.cbl\", \"pgroup\": \"pg1\"}]}";

  @TempDir private Path workspace;

  @Test
  void relativeLibWithinWorkspaceIsKept() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"copybooks\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, false);

    assertEquals(1, paths.size());
    assertEquals(workspace.resolve("copybooks").normalize(), paths.get(0));
  }

  @Test
  void relativeLibEscapingWorkspaceViaDotDotIsIgnoredByDefault() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"../../../../etc\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, false);

    assertTrue(paths.isEmpty());
  }

  @Test
  void absoluteLibOutsideWorkspaceIsIgnoredByDefault() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"/etc\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, false);

    assertTrue(paths.isEmpty());
  }

  @Test
  void absoluteLibOutsideWorkspaceIsKeptWhenExternalLibsAllowed() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"/etc\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, true);

    assertEquals(1, paths.size());
    assertEquals(Paths.get("/etc").toAbsolutePath().normalize(), paths.get(0));
  }

  @Test
  void relativeLibEscapingWorkspaceViaDotDotIsKeptWhenExternalLibsAllowed() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"../shared-copybooks\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, true);

    assertEquals(1, paths.size());
    assertEquals(
        workspace.resolve("../shared-copybooks").toAbsolutePath().normalize(), paths.get(0));
  }

  @Test
  void absoluteLibInsideWorkspaceIsKept() {
    Path absoluteInsideWorkspace = workspace.resolve("copybooks").toAbsolutePath();
    String groups =
        String.format(
            "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"%s\"], \"copybook-extensions\": [\".cpy\"]}]}",
            absoluteInsideWorkspace.toString().replace("\\", "\\\\"));
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.cbl"), workspace, false);

    assertEquals(1, paths.size());
    assertEquals(absoluteInsideWorkspace.normalize(), paths.get(0));
  }

  @Test
  void noMatchingProgramResolvesToEmptyList() {
    String groups =
        "{\"pgroups\": [{\"name\": \"pg1\", \"libs\": [\"copybooks\"], \"copybook-extensions\": [\".cpy\"]}]}";
    ProcessorGroupsResolver resolver = new ProcessorGroupsResolver(PROGRAMS, groups);

    List<Path> paths =
        resolver.resolveCopybooksPaths(workspace.resolve("PROG.txt"), workspace, false);

    assertTrue(paths.isEmpty());
  }
}
