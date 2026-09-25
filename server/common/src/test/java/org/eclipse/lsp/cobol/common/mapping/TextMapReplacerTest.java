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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.mapping;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrowsExactly;

import com.google.common.collect.ImmutableMap;
import java.util.Map;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests for TextMapReplacer * */
class TextMapReplacerTest {
  @Test
  void testValidateParameters_statementMap_empty() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), ImmutableMap.of(), "{TOKEN}"));
    assertEquals("Statement map must contain at least 1 token name", exception.getMessage());
  }

  @Test
  void testValidateParameters_statementMap_empty_token() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of("", new Token(new Location(extendedText.getUri(), createRange())));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{TOKEN}"));
    assertEquals("Token name cannot be empty", exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_opened_twice_1() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{A{"));
    assertEquals(
        "Replacement map error: expected \"}\" instead of \"{\". Line: 0, character: 2",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_opened_twice_2() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{{"));
    assertEquals(
        "Replacement map error: expected \"}\" instead of \"{\". Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_brace_closed_before_opened() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{TOKEN}B}"));
    assertEquals(
        "Replacement map error: expected \"{\" instead of \"}\". Line: 0, character: 8",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_leave_brace_opened() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{TOKEN} {AAA"));
    assertEquals(
        "Replacement map error: opening brace { has no matching closing brace. Line: 0, character: "
            + "11",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_token_not_found() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{AAA|BBB}{B}"));
    assertEquals(
        "Replacement map error: token \"AAA\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_allow_duplicate_separator() {
    ExtendedText extendedText = new ExtendedText("TOKEN in the extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    TextMapReplacer.execute(
        extendedText, createRange(), createRange(), statementMap, "{TOKEN|BBB|CCC}");
    assertEquals(extendedText.toString(), "BBB|CCC in the extended text document");
  }

  @Test
  void testValidateParameters_replacementMap_misplaced_separator_1() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{TOKEN|}"));
    assertEquals(
        "Replacement map error: token value cannot be empty. Line: 0, character: 7",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_misplaced_separator_2() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{|TOKEN}"));
    assertEquals(
        "Replacement map error: token \"\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_empty_token() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText, createRange(), createRange(), statementMap, "{}"));
    assertEquals(
        "Replacement map error: token \"\" not found. Line: 0, character: 1",
        exception.getMessage());
  }

  @Test
  void testValidateParameters_replacementMap_dangling_escape_character() {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "TOKEN",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 0), new Position(0, 8)))));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText,
                    createRange(),
                    createRange(),
                    statementMap,
                    "STATEMENT {TOKEN}&"));
    assertEquals(
        "Replacement map error: Dangling escape character in the input string. Line: 0, character:"
            + " 17",
        exception.getMessage());
  }

  @Test
  void testValidateReplacementRange_start_line() {
    testValidateRange(
        new Range(new Position(1, 0), new Position(1, 5)),
        new Range(new Position(0, 0), new Position(0, 8)),
        "Replacing range error: range start line out of bounds");
  }

  @Test
  void testValidateReplacementRange_start_character() {
    testValidateRange(
        new Range(new Position(0, 30), new Position(0, 35)),
        new Range(new Position(0, 0), new Position(0, 8)),
        "Replacing range error: range start character out of bounds");
  }

  @Test
  void testValidateReplacementRange_end_line() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(4, 5)),
        new Range(new Position(0, 0), new Position(0, 8)),
        "Replacing range error: range end line out of bounds");
  }

  @Test
  void testValidateReplacementRange_end_character() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(0, 50)),
        new Range(new Position(0, 0), new Position(0, 8)),
        "Replacing range error: range end character out of bounds");
  }

  @Test
  void testValidateTokenRange_start_line() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(0, 14)),
        new Range(new Position(1, 0), new Position(1, 8)),
        "Token name \"TOKEN\" range error: range start line out of bounds");
  }

  @Test
  void testValidateTokenRange_start_character() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(0, 14)),
        new Range(new Position(0, 30), new Position(0, 38)),
        "Token name \"TOKEN\" range error: range start character out of bounds");
  }

  @Test
  void testValidateTokenRange_same_line() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(0, 14)),
        new Range(new Position(0, 0), new Position(1, 8)),
        "Token name TOKEN must be on the same line");
  }

  @Test
  void testValidateTokenRange_end_character() {
    testValidateRange(
        new Range(new Position(0, 0), new Position(0, 14)),
        new Range(new Position(0, 0), new Position(0, 38)),
        "Token name \"TOKEN\" range error: range end character out of bounds");
  }

  private Range createRange() {
    return new Range(new Position(0, 0), new Position(0, 5));
  }

  private void testValidateRange(Range statementRange, Range tokenRange, String message) {
    ExtendedText extendedText = new ExtendedText("Extended text document", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of("TOKEN", new Token(new Location(extendedText.getUri(), tokenRange)));

    Exception exception =
        assertThrowsExactly(
            IllegalArgumentException.class,
            () ->
                TextMapReplacer.execute(
                    extendedText,
                    statementRange,
                    createRange(),
                    statementMap,
                    "STATEMENT {TOKEN}&"));
    assertEquals(message, exception.getMessage());
  }
}
