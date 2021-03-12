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

import com.google.common.collect.ImmutableList;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test {@link MultiTableDataName}
 */
class MultiTableDataNameTest {

  @Test
  void getFormattedDisplayLine() {
    MultiTableDataName variable = new MultiTableDataName(15, "TAB", null, null, 30, ImmutableList.of(), UsageFormat.UNDEFINED);
    assertEquals("15 TAB OCCURS 30 TIMES.", variable.getFormattedDisplayLine());
  }

  @Test
  void getFormattedDisplayLineFull() {
    MultiTableDataName variable = new MultiTableDataName(15, "TAB", null, null, 30, ImmutableList.of(), UsageFormat.COMP);
    assertEquals("15 TAB OCCURS 30 TIMES USAGE COMP.", variable.getFormattedDisplayLine());
  }
}
