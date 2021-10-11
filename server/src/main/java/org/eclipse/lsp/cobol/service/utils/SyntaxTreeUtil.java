/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.service.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.semantics.outline.RangeUtils;
import org.eclipse.lsp4j.TextDocumentPositionParams;

import java.util.Optional;

/**
 * Contains helper functions to work with the syntax tree.
 */
@UtilityClass
public class SyntaxTreeUtil {

  /**
   * Find the syntax tree node that contains the position.
   *
   * @param node a root node for finding
   * @param position a cursor position
   * @return the found node
   */
  public static Optional<Node> findNodeByPosition(Node node, TextDocumentPositionParams position) {
    Optional<Node> child = node.getChildren().stream()
        .filter(it -> RangeUtils.isInside(position, it.getLocality().toLocation()))
        .findAny()
        .flatMap(it -> findNodeByPosition(it, position));
    if (child.isPresent()) return child;
    return Optional.of(node).filter(it -> RangeUtils.isInside(position, it.getLocality().toLocation()));
  }
}
