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
package org.eclipse.lsp.cobol.core.model.tree.logic.implicit;

import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.engine.processors.implicit.SRImplicitVariablesGenerator;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for SRImplicitVariablesGenerator
 */
class CICSSRImplicitVariablesGeneratorTest {
  @Test
  void test() {
    List<VariableNode> variableNodes = SRImplicitVariablesGenerator.generate();
    assertEquals("DEBUG-ITEM", variableNodes.get(0).getName());
  }
}
