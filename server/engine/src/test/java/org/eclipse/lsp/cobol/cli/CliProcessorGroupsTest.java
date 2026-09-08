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
package org.eclipse.lsp.cobol.cli;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;

import com.google.common.collect.ImmutableList;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.nio.file.Paths;
import java.util.Map;
import org.eclipse.lsp.cobol.cli.processorgroups.Program;
import org.eclipse.lsp.cobol.cli.processorgroups.ProcessorGroupsResolver;
import org.junit.jupiter.api.Test;

/** Test processor groups support. */
class CliProcessorGroupsTest {
  @Test
  void test() {
    String groupsString =
        "{\n"
            + "    \"pgroups\": [\n"
            + "        {\n"
            + "            \"name\": \"SLICK\",\n"
            + "            \"copybook-extensions\": [\"\", \".CPY\"],\n"
            + "            \"libs\": [\n"
            + "                        \"COBCOPY/IBM\",\n"
            + "                        \"COBCOPY\"\n"
            + "                    ]\n"
            + "        }\n"
            + "    ]   \n"
            + "}";
    String programsString =
        "{\n"
            + "    \"pgms\": [        \n"
            + "        {\"program\": \"COBPGM/*\", \"pgroup\": \"SLICK\"}\n"
            + "    ]\n"
            + "}";

    ProcessorGroupsResolver pg = new ProcessorGroupsResolver(programsString, groupsString);
    assertEquals(
        Paths.get("/root/COBCOPY/IBM"),
        pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/SLICKP3"), Paths.get("/root")).get(0));
    assertEquals(
        ImmutableList.of("", ".CPY"),
        pg.resolveCopybooksExtensions(Paths.get("/root/COBPGM/SLICKP3"), Paths.get("/root")));
  }

  @Test
  void cachedGlobPattern() {
    String groups =
        "{\n"
            + "    \"pgroups\": [\n"
            + "        {\"name\": \"GROUP_A\", \"copybook-extensions\": [\".CPY\"], \"libs\": [\"COBCOPY/A\"]},\n"
            + "        {\"name\": \"GROUP_B\", \"copybook-extensions\": [\".CPY\"], \"libs\": [\"COBCOPY/B\"]}\n"
            + "    ]\n"
            + "}";
    String programs =
        "{\n"
            + "    \"pgms\": [\n"
            + "        {\"program\": \"COBPGM/A*\", \"pgroup\": \"GROUP_A\"},\n"
            + "        {\"program\": \"COBPGM/B*\", \"pgroup\": \"GROUP_B\"}\n"
            + "    ]\n"
            + "}";

    ProcessorGroupsResolver pg = new ProcessorGroupsResolver(programs, groups);
    Map<Program, PathMatcher> compiledMatchers = pg.getCompiledMatchers();

    assertEquals(2, pg.getProgramList().size());
    assertEquals(
        2, compiledMatchers.size(), "each program pattern should be compiled into its own entry");

    Path workspace = Paths.get("/root");
    assertEquals(
        Paths.get("/root/COBCOPY/A"),
        pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/APGM1"), workspace).get(0));
    assertEquals(
        Paths.get("/root/COBCOPY/B"),
        pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/BPGM1"), workspace).get(0));

    // no recompilation
    Program firstProgram = pg.getProgramList().get(0);
    PathMatcher matcherBefore = compiledMatchers.get(firstProgram);
    pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/APGM2"), workspace);
    pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/BPGM2"), workspace);
    PathMatcher matcherAfter = pg.getCompiledMatchers().get(firstProgram);
    assertSame(matcherBefore, matcherAfter, "compiled glob pattern must be cached, not recompiled");
  }
}
