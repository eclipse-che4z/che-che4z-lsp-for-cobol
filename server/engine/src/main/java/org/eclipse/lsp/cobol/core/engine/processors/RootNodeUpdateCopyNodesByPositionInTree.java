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

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp4j.Range;

import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/** RootNode processor */
public class RootNodeUpdateCopyNodesByPositionInTree implements Processor<RootNode> {
  @Override
  public void accept(RootNode node, ProcessingContext ctx) {
    updateCopyNodes(node);
  }

  private void updateCopyNodes(RootNode root) {
    List<Node> cpyNodes = root.getChildren().stream().filter(Node.hasType(NodeType.COPY)).collect(toList());
    root.getChildren().removeAll(cpyNodes);
    for (Node cpyNode : cpyNodes) {
      Locality l = cpyNode.getLocality();
      Node parentNode = RangeUtils.findNodeByPosition(root, l.getUri(), l.getRange().getStart()).orElse(root);
      parentNode.addChildAt(getNodeInsertionIndex(parentNode.getChildren(), cpyNode), cpyNode);
    }

    List<Node> copyNodes = root.getDepthFirstList(n ->
            n.getNodeType() == NodeType.COPY && ((CopyNode) n).getUri() != null);
    for (Node c : copyNodes) {
      for (Node n : copyNodes) {
        CopyNode cn1 = (CopyNode) c;
        CopyNode cn2 = (CopyNode) n;
        if (!Objects.equals(cn2.getNameLocation(), cn1.getNameLocation())
                && Objects.equals(cn2.getUri(), cn1.getUri())) {
          cn2.addUsage(cn1.getNameLocation());
        }
      }
    }
  }

  private int getNodeInsertionIndex(List<Node> nodes, Node nodeToInsert) {
    int nodeSize = nodes.size();
    String nodeToInsertUri = nodeToInsert.getLocality().getUri();
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

}
