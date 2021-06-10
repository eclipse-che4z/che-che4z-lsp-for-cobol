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
 * Test {@link TableDataName}
 */
class TableDataNameTest {

  @Test
  void getFormattedDisplayLine() {
    TableDataName variable = new TableDataName(5, "TBL", null, false, null, null, "",
        3, ImmutableList.of(), UsageFormat.UNDEFINED);
    assertEquals("05 TBL OCCURS 3 TIMES.", variable.getFormattedDisplayLine());
  }

  @Test
  void getFormattedDisplayLineFull() {
    TableDataName variable = new TableDataName(5, "TBL", null, false, null, "9(9)", "123",
        3, ImmutableList.of(), UsageFormat.BINARY);
    assertEquals("05 TBL OCCURS 3 TIMES PIC 9(9) USAGE BINARY VALUE 123.", variable.getFormattedDisplayLine());
  }
}
