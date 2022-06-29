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
import org.eclipse.lsp4j.Range;

import java.util.*;

/**
 * This value class represents the extended document hierarchy.
 * It's possible to construct extended source based on this data.
 */
@Data
@RequiredArgsConstructor
public class TextTransformations {
  private final String text;
  private final String uri;
  private final Map<Range, TextTransformations> extensions = new HashMap<>();
  private final Map<Range, String> replacements = new HashMap<>();
  private final List<CopyNode> copyNodes = new ArrayList<>();

  /**
   * Apply all transformations and form resulting text
   * @return text with all transformations
   */
  public String calculateExtendedText() {
    StringBuilder sb = new StringBuilder();
    LinkedList<Range> ranges = new LinkedList<>(extensions.keySet());
    ranges.addAll(replacements.keySet());
    ranges.sort(Comparator.comparingInt(e -> e.getStart().getLine()));
    String[] lines = text.split("\r?\n");
    int lineNumber = 0;
    Range currentRange = ranges.isEmpty() ? null : ranges.removeFirst();
    while (currentRange != null && lineNumber < lines.length) {
      if (currentRange.getStart().getLine() > lineNumber) {
        sb.append(lines[lineNumber]);
        sb.append("\n");
      } else if (currentRange.getStart().getLine() == lineNumber) {
        sb.append(lines[lineNumber], 0, currentRange.getStart().getCharacter());
        String replace = extensions.containsKey(currentRange)
                ? extensions.get(currentRange).calculateExtendedText()
                : replacements.get(currentRange);
        sb.append(replace);
        lineNumber = currentRange.getEnd().getLine();
        sb.append(lines[lineNumber].substring(currentRange.getEnd().getCharacter()));
        sb.append("\n");
        currentRange = ranges.isEmpty() ? null : ranges.removeFirst();
      }
      lineNumber++;
    }
    for (int i = lineNumber; i < lines.length; i++) {
      sb.append(lines[i]);
      if (i < lines.length - 1) {
        sb.append("\n");
      }
    }
    return sb.toString();
  }

  /**
   * Replace copy statement with result of copybook substitution
   * @param copyNode node representation of copybook
   * @param textTransformations Copybook's transformations
   */
  public void extend(CopyNode copyNode, TextTransformations textTransformations) {
    copyNodes.add(copyNode);
    extensions.put(copyNode.getLocality().getRange(), textTransformations);
  }

  /**
   * Substitute location of original document with a new content.
   * @param range location
   * @param newText new content
   */
  public void replace(Range range, String newText) {
    replacements.put(range, newText);
  }

  /**
   * Static constructor for transformations
   * @param text original text
   * @param uri uri of the document
   * @return an empty transformations object
   */
  public static TextTransformations of(String text, String uri) {
    return new TextTransformations(text, uri);
  }
}
