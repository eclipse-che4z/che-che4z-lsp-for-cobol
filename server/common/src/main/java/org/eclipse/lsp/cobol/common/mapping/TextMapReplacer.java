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

import java.util.HashMap;
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
 * "this and this text will be replaced" (*). The statement map can be: "{this} and {that}" (1).
 * {this} points to 1st "this" token and {that} points to the 2nd "this" token. These token names:
 * {this} and {that} now can be replaced with the replacement map. Replacement map can be: "{this}
 * and even {that} text was replaced" (2). When TextMapReplacer apply replacement using (1)
 * statement map and replacement map (2) to the document line "this and this text will be replaced"
 * the result will be: "this and even that text was replaced", so token name {that} was substituted
 * with actual token value "this". The mapping location for the 1st "this" token will be pointing to
 * the 1st original "this" token and for the 2nd "this" token mapping will be pointing to the 2nd
 * original "this" token. All other characters will be pointed to the provided range
 */
@UtilityClass
class TextMapReplacer {
  private static final char BRACE_OPEN = '{';
  private static final char BRACE_CLOSE = '}';
  private static final char ESCAPE_CHAR = '&';
  private static final char VALUE_REPLACEMENT_CHAR = '|';

  @Value
  private static class Token {
    String value;
    Location originalLocation;
  }

  /**
   * Replaces given range of text with a new text using replacement map
   *
   * @param extendedText - the extended text object
   * @param range - range of text to replace
   * @param statementRange - a statement range within the text range
   * @param statementMap - an original text map
   * @param replacementMap - a new text replacement map
   */
  public void execute(
      ExtendedText extendedText,
      Range range,
      Range statementRange,
      String statementMap,
      String replacementMap) {
    Map<String, Token> tokens = new HashMap<>();

    MappingHelper.validateRange(range);
    MappingHelper.validateRange(statementRange);
    validateMapSize(statementMap);
    validateMapSize(replacementMap);

    String[] statementMapArray = MappingHelper.split(statementMap);
    for (int i = 0; i < statementMapArray.length; i++) {
      scanForTokens(
          extendedText,
          tokens,
          statementMapArray[i].toCharArray(),
          i,
          range.getStart().getLine() + i,
          i == 0 ? range.getStart().getCharacter() : 0);
    }
    if (tokens.isEmpty()) {
      throw new IllegalArgumentException("Statement map must contain at least 1 token name");
    }

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
  }

  private void scanForTokens(
      ExtendedText extendedText,
      Map<String, Token> tokens,
      char[] statementLine,
      int mapLine,
      int line,
      int startCharacter) {
    int bracesIndicator = 0;
    int symbolCount = 0;
    StringBuilder temp = new StringBuilder();

    for (int i = 0; i < statementLine.length; i++) {
      if (statementLine[i] == BRACE_OPEN) {
        if (bracesIndicator > 0) {
          String message =
              String.format("expected \"%s\" instead of \"%s\"", BRACE_CLOSE, BRACE_OPEN);
          throwInvalidParameters("Statement map error", message, mapLine, i);
        }
        bracesIndicator++;
        symbolCount++;
      } else if (statementLine[i] == BRACE_CLOSE) {
        if (bracesIndicator <= 0) {
          String message =
              String.format("expected \"%s\" instead of \"%s\"", BRACE_OPEN, BRACE_CLOSE);
          throwInvalidParameters("Statement map error", message, mapLine, i);
        }
        bracesIndicator--;

        String tokenName = temp.toString();
        int character = i - symbolCount - tokenName.length() + startCharacter;

        if (tokenName.isEmpty()) {
          throwInvalidParameters(
              "Statement map error", "token name cannot be empty", mapLine, i - 1);
        }
        if (tokens.containsKey(tokenName)) {
          throwInvalidParameters(
              String.format("Statement map contains duplicated token \"%s\"", tokenName),
              mapLine,
              i - tokenName.length());
        }

        Location originalLocation =
            extendedText.mapLocation(
                new Range(
                    new Position(line, character),
                    new Position(line, character + tokenName.length())));
        ExtendedTextLine extendedTextLine = extendedText.getLines().get(line);
        String value =
            extendedTextLine.subline(character, character + tokenName.length() - 1).toString();

        tokens.put(tokenName, new Token(value, originalLocation));

        symbolCount++;
        temp.setLength(0);
      } else if (bracesIndicator == 1) {
        temp.append(statementLine[i]);
      }
    }
    if (bracesIndicator > 0) {
      throwInvalidParameters(
          "Statement map error",
          "opening brace { has no matching closing brace",
          mapLine,
          statementLine.length - 1);
    }
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
          throwInvalidParameters("Replacement map error", message, mapLine, i);
        }
        bracesIndicator++;
        continue;
      }
      if (c == BRACE_CLOSE) {
        if (bracesIndicator <= 0) {
          String message =
              String.format("expected \"%s\" instead of \"%s\"", BRACE_OPEN, BRACE_CLOSE);
          throwInvalidParameters("Replacement map error", message, mapLine, i);
        }
        bracesIndicator--;

        ImmutablePair<String, String> tokenNameAndValue =
            getTokenNameAndValue(tokenName.toString(), mapLine, i - tokenName.length());

        Token token = tokens.get(tokenNameAndValue.getLeft());

        if (token == null) {
          String message = String.format("token \"%s\" not found", tokenNameAndValue.getLeft());
          throwInvalidParameters("Replacement map error", message, mapLine, i - tokenName.length());
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
          "Replacement map error",
          "opening brace { has no matching closing brace",
          mapLine,
          replacementLine.length - 1);
    }
    if (escapeCharacter) {
      throwInvalidParameters(
          "Replacement map error",
          "Dangling escape character in the input string",
          mapLine,
          replacementLine.length - 1);
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
        throwInvalidParameters(
            "Replacement map error",
            "token value cannot be empty",
            line,
            character + name.length() + 1);
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

  private void throwInvalidParameters(String header, String message, int line, int character) {
    throw new IllegalArgumentException(
        String.format("%s: %s. %s", header, message, generatePositionString(line, character)));
  }

  private void throwInvalidParameters(String message, int line, int character) {
    throw new IllegalArgumentException(
        String.format("%s. %s", message, generatePositionString(line, character)));
  }
}
