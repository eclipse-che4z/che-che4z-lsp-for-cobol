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
package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.RootNode;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.RangeUtils;
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
        it ->
            RangeUtils.findNodeByPosition(
                    node, it.getLocality().getUri(), it.getLocality().getRange().getStart())
                .orElse(node)
                .addChild(it));

    node.getDepthFirstStream()
        .filter(Node.hasType(NodeType.COPY))
        .map(CopyNode.class::cast)
        .forEach(copyNode -> registerCopyUsage(node, copyNode));
  }

  private void registerCopyUsage(RootNode node, CopyNode copyNode) {
    String copyBookId =
        copyNode.getDialect() == null
            ? copyNode.getName()
            : copyNode.getName() + '!' + copyNode.getDialect();
    node.getCopyDefinitionMap()
        .putIfAbsent(
            copyBookId,
            new CopyDefinition(
                new Location(ImplicitCodeUtils.createLocation(), new Range()), copyNode.getName()));
    CopyDefinition foundDefinition = node.getCopyDefinitionMap().get(copyBookId);
    foundDefinition.addUsages(copyNode);
    copyNode.setDefinition(foundDefinition);
  }
}
