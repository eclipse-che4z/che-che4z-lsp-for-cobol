/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import com.google.common.collect.ImmutableList;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/** This tests the logic of {@link WorkingSectionDynamicGenerator} */

class WorkingSectionDynamicGeneratorTest {
  @Test
  void testEmptyNodes_returnsEmptyCode() {
    assertEquals(0, WorkingSectionDynamicGenerator.generate("", ImmutableList.of()).size());
  }

  @Test
  void testVariablesNotMatches_returnsEmptyCode() {
    assertEquals(0, WorkingSectionDynamicGenerator.generate("", ImmutableList.of(setupNodeMock("NODE"))).size());
  }

  @Test
  void testTBFVariable_returnsGeneratedCode() {
    List<Pair<String, String>> result = WorkingSectionDynamicGenerator
        .generate("", ImmutableList.of(setupNodeMock("TBFABC-XLK")));

    assertEquals(1, result.size());
    assertEquals(12, result.get(0).getValue().indexOf("RCUABC-BLK"));
  }

  @Test
  void testTBLVariable_returnsGeneratedCode() {
    List<Pair<String, String>> result = WorkingSectionDynamicGenerator
        .generate("", ImmutableList.of(setupNodeMock("TBLAAA-XOO")));

    assertEquals(1, result.size());
    assertEquals(12, result.get(0).getValue().indexOf("RCUAAA-BOO"));
  }

  private Node setupNodeMock(String name) {
    return VariableDefinitionNode.builder()
        .variableNameAndLocality(new VariableNameAndLocality(name, null))
        .build();
  }
}
