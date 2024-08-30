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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for {@link WorkingSectionDynamicGenerator}
 */
public class WorkingSectionDynamicGeneratorTest {
  @Test
  void testGenerate() {
    Locality locality = Locality.builder().build();
    ProgramNode programNode = new ProgramNode(locality);

    programNode.addChild(new VariableDefinitionNameNode(locality, "TBF123-XAB"));
    programNode.addChild(new VariableDefinitionNameNode(locality, "TBL456-XCD"));

    List<VariableNode> result = WorkingSectionDynamicGenerator.generate(programNode);
    assertEquals(10, result.size());
  }
}
