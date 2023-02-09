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
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for {@link TreeScanner}
 */
public class TreeScannerTest {
  @Test
  void testScan() {
    Locality locality = Locality.builder().build();
    ProgramNode programNode = new ProgramNode(locality);

    programNode.addChild(new VariableDefinitionNameNode(locality, "TBF123-XAB"));
    programNode.addChild(new VariableDefinitionNameNode(locality, "TBL123-XAB"));
    programNode.addChild(new VariableDefinitionNameNode(locality, "BLAH-BLAH"));

    List<VariableNameInfo> result = TreeScanner.scan(programNode);
    assertEquals(2, result.size());
    assertEquals("123", result.get(0).getName());
    assertEquals("AB", result.get(0).getSuffix());
  }
}
