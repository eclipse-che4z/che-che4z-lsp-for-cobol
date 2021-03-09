/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.variables;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test {@link IndependentDataItem}
 */
class IndependentDataItemTest {

  @Test
  void getFormattedDisplayLine() {
    IndependentDataItem variable = new IndependentDataItem("DATA", null, null, null);
    assertEquals("77 DATA.", variable.getFormattedDisplayLine());
  }

  @Test
  void getFormattedDisplayLineFull() {
    IndependentDataItem variable = new IndependentDataItem("DATA", null, "9", "3");
    assertEquals("77 DATA PIC 9 VALUE 3.", variable.getFormattedDisplayLine());
  }
}
