/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.common.mapping;

import static org.junit.jupiter.api.Assertions.*;

import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests for MappingHelper * */
public class MappingHelperTest {
  @Test
  void testValidateRange_line_start_greater_line_end() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(5, 0), new Position(4, 0))));
    assertEquals("Invalid range", exception.getMessage());
  }

  @Test
  void testValidateRange_character_start_greater_character_end_same_line() {
    MappingHelper.validateRange(new Range(new Position(0, 7), new Position(4, 2)));
  }

  @Test
  void testValidateRange_character_start_greater_character_end() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(0, 7), new Position(0, 2))));
    assertEquals("Invalid range", exception.getMessage());
  }

  @Test
  void testValidateRange_line_start_less_zero() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(-2, 0), new Position(4, 0))));
    assertEquals("Invalid range", exception.getMessage());
  }

  @Test
  void testValidateRange_line_end_less_zero() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(0, 0), new Position(-4, 0))));
    assertEquals("Invalid range", exception.getMessage());
  }

  @Test
  void testValidateRange_char_start_less_zero() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(0, -7), new Position(4, 2))));
    assertEquals("Invalid range", exception.getMessage());
  }

  @Test
  void testValidateRange_char_end_less_zero() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> MappingHelper.validateRange(new Range(new Position(0, 0), new Position(4, -2))));
    assertEquals("Invalid range", exception.getMessage());
  }
}
