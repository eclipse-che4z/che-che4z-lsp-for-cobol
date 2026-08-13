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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.Value;
import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Replacer of the text with the replacement map. Replacement text is also a map that contains token
 * names. The actual replacement data will be calculated using token names. And the original value
 * of the token, situated in the appropriate range. For example: text document contains the line:
 * "this and this text will be replaced" (*). The statement map can be: Token 1: name: "this",
 * range: (0, 0); (0, 4) Token 2: name: "that", range: (0, 9); (0, 13) "this" token points to 1st
 * "this" original token and "that" points to the 2nd "this" original token. These token names:
 * "this" and "that" now can be replaced with the replacement map. Replacement map can be: "{this}
 * and even {that} text was replaced" (2). When TextMapReplacer apply replacement using (1)
 * statement map and replacement map (2) to the document line "this and this text will be replaced"
 * the result will be: "this and even that text was replaced", so token name "that" was substituted
 * with actual token value "this". The mapping location for the 1st "this" token will be pointing to
 * the 1st original "this" token and for the 2nd "this" token mapping will be pointing to the 2nd
 * original "this" token. All other characters will be pointed to the provided range
 */
@UtilityClass
public class TextMapReplacer {
  private static final char BRACE_OPEN = '{';
  private static final char BRACE_CLOSE = '}';
  private static final char ESCAPE_CHAR = '&';
  private static final char VALUE_REPLACEMENT_CHAR = '|';

  /**
   * Replaces given range of text with a new text using replacement map
   *
   * @param extendedText - the extended text object
   * @param range - range of text to replace
   * @param statementRange - a statement range within the text range
   * @param statementMap - a map of token names and its default values and locations from the
   *     original text
   * @param replacementMap - a new text replacement map
   * @return a HashMap of mapped tokens
   */
  public Map<String, Token> execute(
      ExtendedText extendedText,
      Range range,
      Range statementRange,
      Map<String, Token> statementMap,
      String replacementMap) {

    MappingHelper.validateRange(range);
    MappingHelper.validateRange(statementRange);
    validateMapSize(replacementMap);
    validateDocumentRange(extendedText, range, "Replacing range error: ");
    validateDocumentRange(extendedText, statementRange, "Statement range error: ");
    if (statementMap.isEmpty()) {
      throw new IllegalArgumentException("Statement map must contain at least 1 token name");
    }

    Map<String, Token> tokens = mapStatementTokens(extendedText, statementMap);
    Map<Range, Token> tokenReplacements = new HashMap<>();
    String processedText =
        scanForReplacements(range.getStart(), tokens, replacementMap, tokenReplacements);

    Location statementLocation = extendedText.mapLocation(statementRange);
    extendedText.replace(range, processedText, statementLocation);
    tokenReplacements.forEach(
        (r, t) -> {
          extendedText.delete(r);
          extendedText.insert(
              r.getStart(), new ExtendedTextLine(t.getValue(), t.getOriginalLocation()));
        });
    return tokens;
  }

  /**
   * Builds a new block of text using a replacement map, preserving original locations for
   * substituted tokens. Unlike {@link #execute}, there is no existing range being replaced - a
   * brand new block of text is produced instead, anchored at (0, 0) so it can be spliced in as
   * whole new lines.
   *
   * @param extendedText - the extended text object
   * @param statementRange - a range in the original text this text logically originates from, used
   *     as the fallback location for the generated (non-token) portions of the result
   * @param statementMap - a map of token names and its default values and locations from the
   *     original text
   * @param replacementMap - a new text replacement map
   * @return the processed text together with the fallback location and per-token replacements
   */
  public InsertionResult prepareInsert(
      ExtendedText extendedText,
      Range statementRange,
      Map<String, Token> statementMap,
      String replacementMap) {

    MappingHelper.validateRange(statementRange);
    validateMapSize(replacementMap);
    validateDocumentRange(extendedText, statementRange, "Statement range error: ");
    if (statementMap.isEmpty()) {
      throw new IllegalArgumentException("Statement map must contain at least 1 token name");
    }

    Map<String, Token> tokens = mapStatementTokens(extendedText, statementMap);

    Map<Range, Token> tokenReplacements = new HashMap<>();
    String processedText =
        scanForReplacements(new Position(0, 0), tokens, replacementMap, tokenReplacements);

    Location statementLocation = extendedText.mapLocation(statementRange);
    return new InsertionResult(processedText, statementLocation, tokenReplacements, tokens);
  }

  /** Result of building a new block of text from a replacement map */
  @Value
  public static class InsertionResult {
    String text;
    Location statementLocation;
    Map<Range, Token> tokenReplacements;
    Map<String, Token> tokens;
  }

  private Map<String, Token> mapStatementTokens(
      ExtendedText extendedText, Map<String, Token> statementMap) {
    Map<String, Token> result = new HashMap<>();

    statementMap.forEach(
        (tokenName, token) -> {
          String value = token.getValue();
          Location originalLocation = token.getOriginalLocation();
          Range originalRange = originalLocation.getRange();
          if (extendedText.getUri().equals(originalLocation.getUri())) {
            validateTokenName(extendedText, tokenName, originalRange);

            originalLocation = extendedText.mapLocation(originalRange);
            if (value == null) {
              ExtendedTextLine extendedTextLine =
                  extendedText.getLines().get(originalRange.getStart().getLine());
              value =
                  extendedTextLine
                      .subline(
                          originalRange.getStart().getCharacter(),
                          originalRange.getEnd().getCharacter())
                      .toString();
            }
          }
          result.put(tokenName, new Token(value, originalLocation));
        });
    return result;
  }

  private String scanForReplacements(
      Position startPosition,
      Map<String, Token> tokens,
      String replacementMap,
      Map<Range, Token> tokenReplacements) {
    StringBuilder result = new StringBuilder();
    String[] replacementMapArray = MappingHelper.split(replacementMap);

    for (int mapLine = 0; mapLine < replacementMapArray.length; mapLine++) {
      char[] replacementLine = replacementMapArray[mapLine].toCharArray();
      StringBuilder outputLine =
          buildOutputLine(tokens, tokenReplacements, replacementLine, mapLine, startPosition);
      if (mapLine != replacementMapArray.length - 1) {
        outputLine.append("\n");
      }
      result.append(outputLine);
    }
    return result.toString();
  }

  private StringBuilder buildOutputLine(
      Map<String, Token> tokens,
      Map<Range, Token> tokenReplacements,
      char[] replacementLine,
      int mapLine,
      Position startPosition) {
    int bracesIndicator = 0;
    boolean escapeCharacter = false;
    StringBuilder tokenName = new StringBuilder();

    StringBuilder outputLine = new StringBuilder();
    for (int i = 0; i < replacementLine.length; i++) {
      char c = replacementLine[i];
      if (c == ESCAPE_CHAR && !escapeCharacter) {
        escapeCharacter = true;
        continue;
      }
      if (escapeCharacter) {
        outputLine.append(c);
        escapeCharacter = false;
        continue;
      }
      if (c == BRACE_OPEN) {
        if (bracesIndicator > 0) {
          String message =
              String.format("expected \"%s\" instead of \"%s\"", BRACE_CLOSE, BRACE_OPEN);
          throwInvalidParameters(message, mapLine, i);
        }
        bracesIndicator++;
        continue;
      }
      if (c == BRACE_CLOSE) {
        if (bracesIndicator <= 0) {
          String message =
              String.format("expected \"%s\" instead of \"%s\"", BRACE_OPEN, BRACE_CLOSE);
          throwInvalidParameters(message, mapLine, i);
        }
        bracesIndicator--;

        ImmutablePair<String, String> tokenNameAndValue =
            getTokenNameAndValue(tokenName.toString(), mapLine, i - tokenName.length());

        Token token = tokens.get(tokenNameAndValue.getLeft());

        if (token == null) {
          String message = String.format("token \"%s\" not found", tokenNameAndValue.getLeft());
          throwInvalidParameters(message, mapLine, i - tokenName.length());
        }
        String value = Optional.ofNullable(tokenNameAndValue.getRight()).orElse(token.getValue());
        int character = outputLine.length() + (mapLine == 0 ? startPosition.getCharacter() : 0);
        Range range =
            new Range(
                new Position(startPosition.getLine() + mapLine, character),
                new Position(startPosition.getLine() + mapLine, character + value.length()));
        tokenReplacements.put(range, new Token(value, token.getOriginalLocation()));
        outputLine.append(value);

        tokenName.setLength(0);
        continue;
      }
      if (bracesIndicator > 0) {
        tokenName.append(c);
      } else {
        outputLine.append(c);
      }
    }
    if (bracesIndicator > 0) {
      throwInvalidParameters(
          "opening brace { has no matching closing brace", mapLine, replacementLine.length - 1);
    }
    if (escapeCharacter) {
      throwInvalidParameters(
          "Dangling escape character in the input string", mapLine, replacementLine.length - 1);
    }
    return outputLine;
  }

  private ImmutablePair<String, String> getTokenNameAndValue(
      String token, int line, int character) {
    int indexOfSeparator = token.indexOf(VALUE_REPLACEMENT_CHAR);
    if (indexOfSeparator >= 0) {
      String name = token.substring(0, indexOfSeparator);
      String value = token.substring(indexOfSeparator + 1);

      if (value.isEmpty()) {
        throwInvalidParameters("token value cannot be empty", line, character + name.length() + 1);
      }
      return new ImmutablePair<>(name, value);
    }
    return new ImmutablePair<>(token, null);
  }

  private String generatePositionString(int line, int character) {
    return String.format("Line: %d, character: %d", line, character);
  }

  private void validateMapSize(String map) {
    if (Optional.ofNullable(map).map(String::length).orElse(0) <= 0) {
      throw new IllegalArgumentException("Map cannot be empty");
    }
  }

  private void validateDocumentRange(ExtendedText extendedText, Range range, String entityName) {
    List<ExtendedTextLine> lines = extendedText.getLines();
    if (range.getStart().getLine() >= lines.size()) {
      throw new IllegalArgumentException(entityName + "range start line out of bounds");
    }
    if (range.getStart().getCharacter() > lines.get(range.getStart().getLine()).size()) {
      throw new IllegalArgumentException(entityName + "range start character out of bounds");
    }
    if (range.getEnd().getLine() >= lines.size()) {
      throw new IllegalArgumentException(entityName + "range end line out of bounds");
    }
    if (range.getEnd().getCharacter() > lines.get(range.getEnd().getLine()).size()) {
      throw new IllegalArgumentException(entityName + "range end character out of bounds");
    }
  }

  private void validateTokenName(ExtendedText extendedText, String tokenName, Range range) {
    MappingHelper.validateRange(range);
    if (range.getStart().getLine() != range.getEnd().getLine()) {
      throw new IllegalArgumentException("Token name " + tokenName + " must be on the same line");
    }
    if (tokenName.isEmpty()) {
      throw new IllegalArgumentException("Token name cannot be empty");
    }
    validateDocumentRange(extendedText, range, "Token name \"" + tokenName + "\" range error: ");
  }

  private void throwInvalidParameters(String message, int line, int character) {
    throw new IllegalArgumentException(
        String.format(
            "%s: %s. %s",
            "Replacement map error", message, generatePositionString(line, character)));
  }
}
