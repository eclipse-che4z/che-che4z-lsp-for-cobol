/*
 * Copyright (c) 2023 Broadcom.
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

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Replacement text strategy for multiline case
 */
class MultilineReplaceStrategy implements ReplaceStrategy {
  @Override
  public boolean execute(ExtendedText extendedText, Range range, String newText, Location originalLocation) {
    if (range.getEnd().getLine() != range.getStart().getLine()) {
      extendedText.delete(range);
      String[] newLines = MappingHelper.split(newText);
      addLines(extendedText, range.getStart().getLine(), newLines, originalLocation);
      return true;
    }
    return false;
  }

  private void addLines(ExtendedText extendedText, int firstLine, String[] newLines, Location instantLocation) {
    if (newLines.length == 1) {
      extendedText.append(firstLine, new ExtendedTextLine(newLines[0], instantLocation, extendedText.getUri()));
    } else if (newLines.length > 1) {
      extendedText.append(firstLine, new ExtendedTextLine(newLines[0], instantLocation, extendedText.getUri()));
      extendedText.insert(new Position(firstLine + 1, 0), new ExtendedTextLine(newLines[newLines.length - 1],
          instantLocation, extendedText.getUri()));
      for (int i = 1; i < newLines.length - 2; i++) {
        extendedText.insert(firstLine + i, new ExtendedTextLine(newLines[i], instantLocation, extendedText.getUri()));
      }
    } else {
      extendedText.append(firstLine, extendedText.getLines().get(firstLine + 1));
      extendedText.delete(firstLine + 1);
    }
  }
}
