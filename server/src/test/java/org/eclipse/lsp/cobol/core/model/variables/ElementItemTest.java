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
 * Test {@link ElementItem}
 */
class ElementItemTest {
  @Test
  void getFormattedDisplayLine() {
    ElementItem variable = new ElementItem(3, "ELEM", null, false, null, null, "", UsageFormat.UNDEFINED);
    assertEquals("03 ELEM.", variable.getFormattedDisplayLine());
  }

  @Test
  void getFormattedDisplayLineFull() {
    ElementItem variable = new ElementItem(3, "ELEM", null, false, null, "9(9)", "123", UsageFormat.COMP);
    assertEquals("03 ELEM PIC 9(9) USAGE COMP VALUE 123.", variable.getFormattedDisplayLine());
  }
}
