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
package org.eclipse.lsp.cobol.core.engine;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;

/**
 * This value class represents the extended document hierarchy. It's possible to construct extended
 * source based on this data.
 */
@Data
@RequiredArgsConstructor
public class TextTransformations {
  public static final String REGEX_KEEP_NEW_LINES = "(?<=\\r?\\n)";
  private final String text;
  private final String uri;
  private final Map<Range, TextTransformations> extensions = new HashMap<>();
  private final Map<Range, String> replacements = new HashMap<>();
  private final List<CopyNode> copyNodes = new ArrayList<>();

  private final Map<Range, Location> extToOriginalMap = new HashMap<>();

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String calculateExtendedText() {
    extToOriginalMap.clear();
    ExtendDocumentAccumulator eda = new ExtendDocumentAccumulator();

    LinkedList<Range> ranges = new LinkedList<>(extensions.keySet());
    ranges.addAll(replacements.keySet());
    ranges.sort(
        Comparator.comparingInt((Range c) -> c.getStart().getLine())
            .thenComparingInt(c -> c.getStart().getCharacter()));

    String[] lines = text.split(REGEX_KEEP_NEW_LINES);
    int lineNumber = 0;
    int linePos = 0;
    Range currentRange = ranges.isEmpty() ? null : ranges.removeFirst();
    Range prevRange = null;
    while (currentRange != null && lineNumber < lines.length) {
      if (currentRange.getStart().getLine() > lineNumber) {
        if (prevRange != null && prevRange.getEnd().getLine() == lineNumber) {
          eda.append(
              lines[lineNumber], prevRange.getEnd().getCharacter(), lines[lineNumber].length());
        } else {
          eda.append(lines[lineNumber]);
        }
        lineNumber++;
      } else if (currentRange.getStart().getLine() == lineNumber) {
        if (prevRange != null && prevRange.getEnd().getLine() == lineNumber) {
          linePos = prevRange.getEnd().getCharacter();
        } else {
          linePos = 0;
        }
        eda.append(lines[lineNumber], linePos, currentRange.getStart().getCharacter());
        String uri =
            extensions.containsKey(currentRange) ? extensions.get(currentRange).getUri() : getUri();
        String replace =
            extensions.containsKey(currentRange)
                ? extensions.get(currentRange).calculateExtendedText()
                : replacements.get(currentRange);
        Position start = eda.getPosition();
        eda.append(replace);
        Position end = eda.getPosition();
        Range extRange = new Range(start, end);
        if (!isRangeEmpty(extRange)) {
          extToOriginalMap.put(extRange, new Location(uri, currentRange));
        }
        lineNumber = currentRange.getEnd().getLine();
        prevRange = currentRange;
        currentRange = ranges.isEmpty() ? null : ranges.removeFirst();
      }
    }
    for (int i = lineNumber; i < lines.length; i++) {
      if (prevRange != null && prevRange.getEnd().getLine() == i) {
        eda.append(lines[i], prevRange.getEnd().getCharacter(), lines[i].length());
      } else {
        eda.append(lines[i]);
      }
    }
    return eda.toString();
  }

  private boolean isRangeEmpty(Range range) {
    return range.getStart().equals(range.getEnd());
  }

  /**
   * Get a map of extended document. It will be populated after calculateExtendedText call
   *
   * @return a map of extended document.
   */
  public Map<Range, Location> getExtendedDocumentMap() {
    return extToOriginalMap;
  }

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param textTransformations Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations textTransformations) {
    copyNodes.add(copyNode);
    Range range = copyNode.getLocality().getRange();
    range =
        new Range(
            new Position(range.getStart().getLine(), 0),
            new Position(range.getEnd().getLine(), range.getEnd().getCharacter()));
    extensions.put(range, textTransformations);
  }

  /**
   * Substitute location of original document with a new content.
   *
   * @param range location
   * @param newText new content
   */
  public void replace(Range range, String newText) {
    replacements.put(range, newText);
  }

  /**
   * Static constructor for transformations
   *
   * @param text original text
   * @param uri uri of the document
   * @return an empty transformations object
   */
  public static TextTransformations of(String text, String uri) {
    return new TextTransformations(text, uri);
  }

  /**
   * Calculates a list of all copy nodes include nested
   *
   * @return a list of all copy nodes
   */
  public List<CopyNode> calculateCopyNodes() {
    List<CopyNode> result = new LinkedList<>();
    extensions.values().forEach(v -> result.addAll(v.calculateCopyNodes()));
    result.addAll(copyNodes);
    return result;
  }

  private static class ExtendDocumentAccumulator {
    private final StringBuilder sb = new StringBuilder();
    private int column = 0;
    private int line = 0;

    void append(String string) {
      if (!string.isEmpty()) {
        String[] strings = string.split(REGEX_KEEP_NEW_LINES);
        line += strings.length - 1;
        column += strings[strings.length - 1].length();
      }
      sb.append(string);
    }

    void append(String string, int start, int end) {
      append(string.substring(start, end));
    }

    Position getPosition() {
      return new Position(line, column);
    }

    @Override
    public String toString() {
      return sb.toString();
    }
  }
}
