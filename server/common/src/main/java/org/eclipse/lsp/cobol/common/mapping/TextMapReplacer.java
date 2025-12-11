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
import lombok.AllArgsConstructor;
import lombok.Value;
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
@AllArgsConstructor
class TextMapReplacer {
  private final ExtendedText extendedText;

  @Value
  private static class Token {
    String value;
    Location originalLocation;
  }

  /**
   * Replaces given range of text with a new text using replacement map
   *
   * @param range - range of text to replace
   * @param statementRange - a statement range within the text range
   * @param statementMap - an original text map
   * @param replacementMap - a new text replacement map
   */
  public void execute(
      Range range, Range statementRange, String statementMap, String replacementMap) {
    Map<String, Token> tokens = new HashMap<>();

    Location statementLocation = extendedText.mapLocation(statementRange);

    String[] statementMapArray = MappingHelper.split(statementMap);
    String[] replacementMapArray = MappingHelper.split(replacementMap);

    for (int i = 0; i < statementMapArray.length; i++) {
      scanForTokens(tokens, statementMapArray, i, range);
    }

    extendedText.replace(range, replacementMap, statementLocation);

    for (int i = 0; i < replacementMapArray.length; i++) {
      applyReplacementForLine(tokens, replacementMapArray, i, range);
    }
  }

  private void scanForTokens(
      Map<String, Token> tokens, String[] statementMapArray, int index, Range range) {
    char[] statementLine = statementMapArray[index].toCharArray();

    int symbolCount = 0;
    StringBuilder temp = new StringBuilder();

    for (int i = 0; i < statementLine.length; i++) {
      if (symbolCount % 2 == 0) {
        if (statementLine[i] == '{') {
          symbolCount++;
        }
      } else {
        if (statementLine[i] == '}') {
          int line = range.getStart().getLine() + index;
          int character = range.getStart().getCharacter() + i - symbolCount - temp.length();
          Location originalLocation =
              extendedText.mapLocation(
                  new Range(
                      new Position(line, character),
                      new Position(line, character + temp.length() - 1)));
          ExtendedTextLine extendedTextLine = extendedText.getLines().get(line);
          String value =
              extendedTextLine.subline(character, character + temp.length() - 1).toString();

          tokens.put(temp.toString(), new Token(value, originalLocation));

          symbolCount++;
          temp = new StringBuilder();
        } else {
          temp.append(statementLine[i]);
        }
      }
    }
  }

  private void applyReplacementForLine(
      Map<String, Token> tokens, String[] replacementMapArray, int index, Range range) {
    char[] replacementLine = replacementMapArray[index].toCharArray();

    int symbolCount = 0;
    StringBuilder temp = new StringBuilder();

    for (int i = 0; i < replacementLine.length; i++) {
      if (symbolCount % 2 == 0) {
        if (replacementLine[i] == '{') {
          symbolCount++;
        }
      } else {
        if (replacementLine[i] == '}') {
          int line = range.getStart().getLine() + index;
          int character = range.getStart().getCharacter() + i - symbolCount - temp.length();

          Token token = tokens.get(temp.toString());
          Range tokenRange =
              new Range(
                  new Position(line, character), new Position(line, character + temp.length() + 2));
          extendedText.replace(tokenRange, token.getValue(), token.getOriginalLocation());

          symbolCount++;
          temp = new StringBuilder();
        } else {
          temp.append(replacementLine[i]);
        }
      }
    }
  }
}
