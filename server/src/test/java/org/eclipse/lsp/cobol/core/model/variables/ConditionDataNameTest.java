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
 * Test {@link ConditionDataName}
 */
class ConditionDataNameTest {
  @Test
  void getFormattedDisplayLine() {
    ConditionDataName variable = new ConditionDataName("TEST", null, null, "FOO", null);
    assertEquals("88 TEST VALUE FOO.", variable.getFormattedDisplayLine());
  }

  @Test
  void getFormattedDisplayLineWithThru() {
    ConditionDataName variable = new ConditionDataName("TEST", null, null, "FOO", "BAR");
    assertEquals("88 TEST VALUE FOO THRU BAR.", variable.getFormattedDisplayLine());
  }
}
