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
package org.eclipse.lsp.cobol.cli;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.cli.processorgroups.ProcessorGroupsResolver;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test processor groups support.
 */
class CliProcessorGroupsTest {
  @Test
  void test() {
    String groupsString = "{\n"
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
    String programsString = "{\n"
            + "    \"pgms\": [        \n"
            + "        {\"program\": \"COBPGM/*\", \"pgroup\": \"SLICK\"}\n"
            + "    ]\n"
            + "}";

    ProcessorGroupsResolver pg = new ProcessorGroupsResolver(programsString, groupsString);
    assertEquals(Paths.get("/root/COBCOPY/IBM"), pg.resolveCopybooksPaths(Paths.get("/root/COBPGM/SLICKP3"), Paths.get("/root")).get(0));
    assertEquals(ImmutableList.of("", ".CPY"), pg.resolveCopybooksExtensions(Paths.get("/root/COBPGM/SLICKP3"), Paths.get("/root")));
  }
}
