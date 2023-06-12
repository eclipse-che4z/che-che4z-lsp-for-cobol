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

package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.Optional;

/** The utility class for work with document positions and ranges. */
@UtilityClass
public class RangeUtils {

  /**
   * Find the syntax tree node that contains the position.
   *
   * @param uri the uri of the node locality
   * @param node a root node for finding
   * @param position a cursor position
   * @return the found node
   */
  public static Optional<Node> findNodeByPosition(Node node, String uri, Position position) {
    Node candidate = null;
    if (isInside(uri, position, node.getLocality())) {
      if (node.getChildren().isEmpty()) {
        return Optional.of(node);
      }
      candidate = node;
    }

    for (Node child : node.getChildren()) {
      Optional<Node> nodeByPosition = findNodeByPosition(child, uri, position);
      if (nodeByPosition.isPresent()) {
        return nodeByPosition;
      }
    }
    return candidate == null ? Optional.empty() : Optional.of(candidate);
  }

  /**
   * Test if one position is after the another position.
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
   * Test if one position is before the another position.
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
   * Check if a range is in a scope
   * @param range range that should be in scope
   * @param scope a scope
   * @return is range in scope
   */
  public boolean isInside(Range range, Range scope) {
    if (scope.getStart() != null && compareTo(range.getStart(), scope.getStart()) < 0) {
      return false;
    }
    if (scope.getEnd() != null && compareTo(range.getEnd(), scope.getEnd()) > 0) {
      return false;
    }
    return true;
  }

  /**
   * Test if text document position resides inside the location.
   *
   * @param uri the uri of the node
   * @param position the position of the node to add
   * @param location the locality of the wrapping node
   * @return true if position is inside the location.
   */
  private boolean isInside(String uri, Position position, Locality location) {
    return uri.equals(location.getUri())
        && !isBefore(position, location.getRange().getStart())
        && !isAfter(position, location.getRange().getEnd());
  }

  private int compareTo(Position first, Position second) {
    int lineComparison = Integer.compare(first.getLine(), second.getLine());
    return lineComparison == 0
        ? Integer.compare(first.getCharacter(), second.getCharacter())
        : lineComparison;
  }

  /**
   * Shifts range with a given position
   * @param position a starting position
   * @param range is an original range
   * @return shifted range
   */
  public Range shiftRangeWithPosition(Position position, Range range) {
    int shift = range.getStart().getLine() == 0 ? position.getCharacter() : 0;
    return new Range(
        new Position(position.getLine() + range.getStart().getLine(), range.getStart().getCharacter() + shift),
        new Position(position.getLine() + range.getEnd().getLine(), range.getEnd().getCharacter() + shift)
    );
  }

  /**
   * Moves the end of the range on defined character's count
   * @param range - range to extend
   * @param count - character's count
   * @return a new range
   */
  public Range extendByCharacter(Range range, int count) {
    return new Range(range.getStart(),
        new Position(range.getEnd().getLine(), range.getEnd().getCharacter() + count));
  }

  /**
   * Moves the end of the range on defined lines's count
   * @param range - range to extend
   * @param count - line's count
   * @return a new range
   */
  public Range moveByLine(Range range, int count) {
    return new Range(new Position(range.getStart().getLine() + count, range.getStart().getCharacter()),
        new Position(range.getEnd().getLine() + count, range.getEnd().getCharacter()));
  }

  /**
   * Returns character size of the range
   * @param range - range
   * @return character size
   */
  public int charSize(Range range) {
    return range.getEnd().getCharacter() - range.getStart().getCharacter() + 1;
  }
}
