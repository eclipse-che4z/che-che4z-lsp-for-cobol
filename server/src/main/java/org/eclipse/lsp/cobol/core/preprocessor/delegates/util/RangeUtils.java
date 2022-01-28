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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp4j.Position;

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
    if (!isInside(uri, position, node.getLocality())) return Optional.empty();
    if (node.getChildren().isEmpty()) return Optional.of(node);

    return node.getChildren().stream()
        .filter(it -> isInside(uri, position, it.getLocality()))
        .map(it -> findNodeByPosition(it, uri, position))
        .filter(Optional::isPresent)
        .findFirst()
        .orElse(Optional.of(node));
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
}
