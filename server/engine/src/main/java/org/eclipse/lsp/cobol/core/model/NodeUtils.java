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

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.EffectiveDataType;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;

/**
 * This class provides few utility methods for {@link org.eclipse.lsp.cobol.common.model.tree.Node}
 */
@UtilityClass
public class NodeUtils {
  // TODO: remove undetermined once effective data type calculation is corrected
  public static final ImmutableList<EffectiveDataType> ALPHANUMERIC_DATA_TYPES =
      ImmutableList.of(
          EffectiveDataType.STRING, EffectiveDataType.INTEGER, EffectiveDataType.UNDETERMINED);

  /**
   * Checks if the passed node is a Alphanumeric variable node
   * @param node Node to check
   * @return True if node is an alphanumeric variable, false otherwise
   */
  public boolean isNodeAlphanumeric(Node node) {
    return node.getDepthFirstStream()
        .filter(ElementaryItemNode.class::isInstance)
        .map(ElementaryItemNode.class::cast)
        .anyMatch(
            node1 ->
                ALPHANUMERIC_DATA_TYPES.contains(node1.getEffectiveDataType())
                    || node1.getUsageFormat() == UsageFormat.NATIONAL);
  }

  /**
   * checks is the passed node is a dynamic group item variable
   * @param node Node to check
   * @return True if node is an dynamic group variable, false otherwise
   */
  public boolean checkIfNodeHasDynamicGroupItem(Node node) {
    return node.getDepthFirstStream()
        .filter(ElementaryItemNode.class::isInstance)
        .map(ElementaryItemNode.class::cast)
        .anyMatch(ElementaryNode::isDynamicLength);
  }

  /**
   * checks if the passed node is a justified group item
   * @param node to check
   * @return True if node is an justified group variable, false otherwise
   */
  public boolean checkIfNodeHasJustifiedGroupItem(Node node) {
    return node.getDepthFirstStream()
        .filter(ElementaryItemNode.class::isInstance)
        .map(ElementaryItemNode.class::cast)
        .anyMatch(ElementaryNode::isJustified);
  }
}
