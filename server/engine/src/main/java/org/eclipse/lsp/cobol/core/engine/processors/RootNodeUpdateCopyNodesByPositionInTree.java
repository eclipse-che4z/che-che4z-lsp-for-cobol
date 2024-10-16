/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.List;

import static java.util.stream.Collectors.toList;

/** RootNode processor */
public class RootNodeUpdateCopyNodesByPositionInTree implements Processor<RootNode> {
  @Override
  public void accept(RootNode node, ProcessingContext ctx) {
    updateCopyNodes(node);
  }

  private void updateCopyNodes(RootNode node) {
    List<Node> nodes =
        node.getChildren().stream().filter(Node.hasType(NodeType.COPY)).collect(toList());
    nodes.forEach(node::removeChild);
    nodes.forEach(
        it -> {
          Node parentNode =
              RangeUtils.findNodeByPosition(
                      node, it.getLocality().getUri(), it.getLocality().getRange().getStart())
                  .orElse(node);
            parentNode.addChildAt(getNodeInsertionIndex(parentNode.getChildren(), it), it);
        });

    List<CopyNode> copyNodes = node.getDepthFirstStream()
        .filter(Node.hasType(NodeType.COPY))
        .map(CopyNode.class::cast)
        .collect(toList());

    copyNodes.forEach(c -> registerCopyUsage(copyNodes, c.getNameLocation(), c.getUri()));
  }

  private int getNodeInsertionIndex(List<Node> nodes, Node nodeToInsert) {
    int nodeSize = nodes.size();
    Uri nodeToInsertUri = nodeToInsert.getLocality().getUri();
    Range nodeToInsertRange = nodeToInsert.getLocality().getRange();
    int nodeToInsertLine = nodeToInsertRange.getStart().getLine();
    int nodeToInsertCharacter = nodeToInsertRange.getStart().getCharacter();

    for (int index = 0; index < nodeSize; index++) {
      Node currentNode = nodes.get(index);
      if (currentNode.getLocality().getUri().equals(nodeToInsertUri)) {
        Range currentNodeRange = currentNode.getLocality().getRange();
        int currentNodeLine = currentNodeRange.getStart().getLine();
        int currentNodeCharacter = currentNodeRange.getStart().getCharacter();

        if (currentNodeLine == nodeToInsertLine) {
          if (currentNodeCharacter > nodeToInsertCharacter) {
            return index;
          }
        } else if (currentNodeLine > nodeToInsertLine) {
          return index;
        }
      }
    }
    return nodeSize;
  }

  private void registerCopyUsage(List<CopyNode> node, Location nameLocation, Uri uri) {
    node.forEach(n -> {
      if (n.getUri() != null && !n.getNameLocation().equals(nameLocation) && n.getUri().equals(uri)) {
        n.addUsage(nameLocation);
      }
    });
  }
}
