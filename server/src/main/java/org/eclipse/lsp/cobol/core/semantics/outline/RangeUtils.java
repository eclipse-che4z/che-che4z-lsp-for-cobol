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

package org.eclipse.lsp.cobol.core.semantics.outline;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.*;

/**
 * The utility class for work with document positions and ranges.
 */
@UtilityClass
public class RangeUtils {

  /**
   * Tests if innerSymbol programming construct is placed inside the outerSymbol programming
   * construct, by comparing its ranges.
   *
   * @param outerSymbol the possible wrapping DocumentSymbol.
   * @param innerSymbol the possible nested DocumentSymbol.
   * @return true if and only if the innerSymbol's range is inside the outerSymbol's range.
   */
  public boolean isInsideRange(DocumentSymbol outerSymbol, DocumentSymbol innerSymbol) {
    return isInsideRange(outerSymbol.getRange(), innerSymbol.getRange());
  }

  /**
   * Tests if inner range is nested into the outer range.
   *
   * @param outerRange an outline range.
   * @param innerRange an outline range.
   * @return true if and only if the start of inner range is after the outer range and the end of
   *     inner range is before the outer range.
   */
  public boolean isInsideRange(Range outerRange, Range innerRange) {
    return isBefore(outerRange.getStart(), innerRange.getStart())
        && isAfter(outerRange.getEnd(), innerRange.getEnd());
  }

  /**
   * Compare two document positions. The line is compared first. The character will be compared if
   * lines are the same.
   *
   * @param first the first position to be compared.
   * @param second the second position to be compared.
   * @return the value 0 if the argument position is equal to this position; a value less than 0 if
   *     this position is located before the argument position; and a value greater than 0 if this
   *     position is located after the argument position.
   */
  public int compareTo(Position first, Position second) {
    int lineComparison = Integer.compare(first.getLine(), second.getLine());
    return lineComparison == 0
        ? Integer.compare(first.getCharacter(), second.getCharacter())
        : lineComparison;
  }

  /**
   * Tests if one position is after the another position.
   *
   * @param before a position.
   * @param after a position.
   * @return true if and only if before position is strictly earlier in document than the after
   *     position.
   */
  public boolean isAfter(Position before, Position after) {
    return compareTo(before, after) > 0;
  }

  /**
   * Tests if one position is before the another position.
   *
   * @param after a position.
   * @param before a position.
   * @return true if and only if after position is strictly later in document than the before
   *     position.
   */
  public boolean isBefore(Position after, Position before) {
    return compareTo(after, before) < 0;
  }

  /**
   * Tests if text document position located inside the location.
   * @param position - the document position
   * @param location - en element location
   * @return true if position is inside the location.
   */
  public boolean isInside(TextDocumentPositionParams position, Location location) {
    return position.getTextDocument().getUri().equals(location.getUri())
        && !isBefore(position.getPosition(), location.getRange().getStart())
        && !isAfter(position.getPosition(), location.getRange().getEnd());
  }
}
