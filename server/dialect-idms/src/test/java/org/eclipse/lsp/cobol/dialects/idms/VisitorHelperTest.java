/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms;

import org.antlr.v4.runtime.tree.TerminalNode;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for VisitorHelper
 */
class VisitorHelperTest {

  @Test
  void testGetLevel() {
    TerminalNode terminalNode = mock(TerminalNode.class);
    when(terminalNode.getText()).thenReturn("2");
    assertEquals(2, VisitorHelper.getLevel(terminalNode));
  }

  @Test
  void testGetFillerNameForEntryName() {
    IdmsCopyParser.EntryNameContext node = mock(IdmsCopyParser.EntryNameContext.class);
    assertEquals(FILLER_NAME, VisitorHelper.getName(node));
  }

  @Test
  void testGetNameForEntryName() {
    IdmsCopyParser.EntryNameContext node = mock(IdmsCopyParser.EntryNameContext.class);
    IdmsCopyParser.DataNameContext dataName = mock(IdmsCopyParser.DataNameContext.class);
    when(node.dataName()).thenReturn(dataName);
    when(dataName.getText()).thenReturn("uppercase_name");

    assertEquals("UPPERCASE_NAME", VisitorHelper.getName(node));
  }

}
