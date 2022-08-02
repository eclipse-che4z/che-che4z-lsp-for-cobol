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
package org.eclipse.lsp.cobol.core.engine.mapping;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
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

  /**
   * Apply all transformations and form resulting text
   *
   * @return text with all transformations
   */
  public String calculateExtendedText() {
    StringBuilder eda = new StringBuilder();

    LinkedList<Range> ranges = new LinkedList<>(extensions.keySet());
    ranges.addAll(replacements.keySet());
    ranges.sort(
        Comparator.comparingInt((Range c) -> c.getStart().getLine())
            .thenComparingInt(c -> c.getStart().getCharacter()));

    String[] lines = text.split(REGEX_KEEP_NEW_LINES, -1);
    int lineNumber = 0;
    int linePos;
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
        String replace;
        if (extensions.containsKey(currentRange)) {
          TextTransformations mappable = extensions.get(currentRange);
          replace = mappable.calculateExtendedText();
        } else {
          replace = replacements.get(currentRange);
        }
        eda.append(replace);
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

  /**
   * Replace copy statement with result of copybook substitution
   *
   * @param copyNode node representation of copybook
   * @param range a range in the original document
   * @param mappable Copybook's transformations
   */
  public void extend(CopyNode copyNode, Range range, TextTransformations mappable) {
    copyNodes.add(copyNode);
    Range extRange =
        new Range(
            new Position(range.getStart().getLine(), 0),
            new Position(range.getEnd().getLine(), range.getEnd().getCharacter()));
    extensions.put(extRange, mappable);
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
}
