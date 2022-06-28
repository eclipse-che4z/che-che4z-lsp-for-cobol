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
package org.eclipse.lsp.cobol.core.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;

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
  private final Map<Locality, TextTransformations> extensions = new HashMap<>();
  private final Map<Locality, String> replacements = new HashMap<>();
  private final List<CopyNode> copyNodes = new ArrayList<>();

  public String calculateExtendedText() {
    StringBuilder sb = new StringBuilder();
    LinkedList<Locality> localities = new LinkedList<>(replacements.keySet());
    localities.sort(Comparator.comparingInt(e -> e.getRange().getStart().getLine()));
    String[] lines = text.split("\r?\n");
    int lineNumber = 0;
    Locality currentLocality = localities.isEmpty() ? null : localities.removeFirst();
    while (currentLocality != null && lineNumber < lines.length) {
      if (currentLocality.getRange().getStart().getLine() > lineNumber) {
        sb.append(lines[lineNumber]);
        sb.append("\n");
      } else if (currentLocality.getRange().getStart().getLine() == lineNumber) {
        sb.append(lines[lineNumber], 0, currentLocality.getRange().getStart().getCharacter());
        sb.append(extensions.get(currentLocality).calculateExtendedText());
        lineNumber = currentLocality.getRange().getEnd().getLine();
        sb.append(lines[lineNumber].substring(currentLocality.getRange().getEnd().getCharacter()));
        sb.append("\n");
        currentLocality = localities.isEmpty() ? null : localities.removeFirst();
      }
      lineNumber++;
    }
    for (int i = lineNumber; i < lines.length; i++) {
      sb.append(lines[i]);
      if(i < lines.length -1) {
        sb.append("\n");
      }
    }
    return sb.toString();
  }

  public void extend(CopyNode copyNode, TextTransformations textTransformations) {
    copyNodes.add(copyNode);
    extensions.put(copyNode.getLocality(), textTransformations);
  }
  public void replace(Locality locality, String newText) {
    replacements.put(locality, newText);
  }

  public static TextTransformations of(String text, String uri) {
    return new TextTransformations(text, uri);
  }
}
