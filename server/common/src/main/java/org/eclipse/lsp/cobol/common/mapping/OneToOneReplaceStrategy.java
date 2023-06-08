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

import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

/**
 * Replacement text strategy for single line when the original size of the text is equals to the replacement size
 */
class OneToOneReplaceStrategy implements ReplaceStrategy {
  @Override
  public boolean execute(ExtendedText extendedText, Range range, String newText, Location originalLocation) {
    // Single line
    if (range.getEnd().getLine() == range.getStart().getLine()) {
      String[] newLines = MappingHelper.split(newText);
      // Replace the same length string
      if (newLines.length == 1 && newLines[0].length() == RangeUtils.charSize(range)) {
        extendedText.getLines().get(range.getStart().getLine()).replace(range.getStart().getCharacter(), newLines[0]);
        return true;
      }
    }
    return false;
  }
}
