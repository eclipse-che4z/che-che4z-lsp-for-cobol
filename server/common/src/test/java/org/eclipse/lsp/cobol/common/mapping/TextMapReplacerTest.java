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

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrowsExactly;

import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests for TextMapReplacer * */
class TextMapReplacerTest {
  @Test
  void testValidateParameters_statementMap_empty() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "", "{TOKEN}"));
    assertEquals("Map cannot be empty", exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_empty_token() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{}", "{TOKEN}"));
    assertEquals(
        "Statement map error: token name cannot be empty. Line: 0, character: 0",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_no_tokens() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "TEXT TEXT", "{TOKEN}"));
    assertEquals("Statement map must contain at least 1 token name", exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_duplicated_tokens() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{AAA} {AAA}", "{TOKEN}"));
    assertEquals(
        "Statement map contains duplicated token \"AAA\". Line: 0, character: 7",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_leave_brace_opened() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{AAA} {AAA", "{TOKEN}"));
    assertEquals(
        "Statement map error: opening brace { has no matching closing brace. Line: 0, character: 9",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_brace_opened_twice_1() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{A{", "{TOKEN}"));
    assertEquals(
        "Statement map error: expected \"}\" instead of \"{\". Line: 0, character: 2",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_brace_opened_twice_2() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{{", "{TOKEN}"));
    assertEquals(
        "Statement map error: expected \"}\" instead of \"{\". Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_brace_closed_before_opened() {
    TextMapReplacer replacer = new TextMapReplacer(new ExtendedText("text", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{A}B}", "{TOKEN}"));
    assertEquals(
        "Statement map error: expected \"{\" instead of \"}\". Line: 0, character: 4",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_opened_twice_1() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{A{"));
    assertEquals(
        "Replacement map error: expected \"}\" instead of \"{\". Line: 0, character: 2",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_opened_twice_2() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{{"));
    assertEquals(
        "Replacement map error: expected \"}\" instead of \"{\". Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_closed_before_opened() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{TOKEN}B}"));
    assertEquals(
        "Replacement map error: expected \"{\" instead of \"}\". Line: 0, character: 8",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_leave_brace_opened() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{TOKEN} {AAA"));
    assertEquals(
        "Replacement map error: opening brace { has no matching closing brace. Line: 0, character: "
            + "11",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_token_not_found() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{AAA|BBB}{B}"));
    assertEquals(
        "Replacement map error: token \"AAA\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_duplicate_separator() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{TOKEN|BBB|CCC}"));
    assertEquals(
        "Replacement map error: duplicated separator symbol \"|\". Line: 0, character: 10",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_misplaced_separator_1() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{TOKEN|}"));
    assertEquals(
        "Replacement map error: token value cannot be empty. Line: 0, character: 7",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_misplaced_separator_2() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{|TOKEN}"));
    assertEquals(
        "Replacement map error: token \"\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_empty_token() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "{}"));
    assertEquals(
        "Replacement map error: token \"\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_dangling_escape_character() {
    TextMapReplacer replacer =
        new TextMapReplacer(new ExtendedText("Extended text document", "uri"));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () -> replacer.execute(createRange(), createRange(), "{TOKEN}", "STATEMENT {TOKEN}&"));
    assertEquals(
        "Replacement map error: Dangling escape character in the input string. Line: 0, character: 17",
        exception.getMessage());
  }

  private Range createRange() {
    return new Range(new Position(0, 0), new Position(0, 5));
  }
}
