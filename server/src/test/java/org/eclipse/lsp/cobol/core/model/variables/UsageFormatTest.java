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

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks the logic of {@link UsageFormat} instance determining logic. */
class UsageFormatTest {
  @Test
  void testFormatDeterminingPositive() {
    assertEquals(UsageFormat.BINARY, UsageFormat.of("BINARY"));
  }

  @Test
  void testFormatDeterminingNegative() {
    assertEquals(UsageFormat.UNDEFINED, UsageFormat.of(""));
  }

  @Test
  void testFormatDeterminingCaseInsensitive() {
    assertEquals(UsageFormat.POINTER, UsageFormat.of("Pointer"));
  }

  @Test
  void testFormatDeterminingWithMinus() {
    assertEquals(UsageFormat.COMP_3, UsageFormat.of("COMP-3"));
  }
}
