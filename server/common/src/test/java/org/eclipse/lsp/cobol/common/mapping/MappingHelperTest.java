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
  void testValidateRange_null() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(null));
    assertEquals("range is marked non-null but is null", exception.getMessage());
  }

  @Test
  void testValidateRange_start_null() {
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(new Range()));
    assertEquals("Range start is null", exception.getMessage());
  }

  @Test
  void testValidateRange_end_null() {
    Exception exception =
        assertThrowsExactly(
            NullPointerException.class,
            () -> MappingHelper.validateRange(new Range(new Position(), null)));
    assertEquals("Property must not be null: end", exception.getMessage());
  }

  @Test
  void testValidateRange_line_start_greater_line_end() {
    Range range = new Range(new Position(5, 0), new Position(4, 0));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }

  @Test
  void testValidateRange_character_start_greater_character_end_same_line() {
    MappingHelper.validateRange(new Range(new Position(0, 7), new Position(4, 2)));
  }

  @Test
  void testValidateRange_character_start_greater_character_end() {
    Range range = new Range(new Position(0, 7), new Position(0, 2));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }

  @Test
  void testValidateRange_line_start_less_zero() {
    Range range = new Range(new Position(-2, 0), new Position(4, 0));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }

  @Test
  void testValidateRange_line_end_less_zero() {
    Range range = new Range(new Position(0, 0), new Position(-4, 0));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }

  @Test
  void testValidateRange_char_start_less_zero() {
    Range range = new Range(new Position(0, -7), new Position(4, 2));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }

  @Test
  void testValidateRange_char_end_less_zero() {
    Range range = new Range(new Position(0, 0), new Position(4, -2));
    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class, () -> MappingHelper.validateRange(range));
    assertEquals("Invalid range: " + range, exception.getMessage());
  }
}
