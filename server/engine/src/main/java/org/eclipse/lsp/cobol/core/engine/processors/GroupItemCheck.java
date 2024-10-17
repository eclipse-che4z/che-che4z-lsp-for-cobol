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

import org.eclipse.lsp.cobol.common.VariableConstants;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

import com.google.common.base.Strings;

import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.MultiTableDataNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;

import static org.eclipse.lsp.cobol.common.VariableConstants.EMPTY_STRUCTURE_MSG;
import static org.eclipse.lsp.cobol.common.VariableConstants.PICTURE_NOT_ALLOWED;

import java.util.List;

/** GroupItemNode processor */
public class GroupItemCheck implements Processor<GroupItemNode> {
  @Override
  public void accept(GroupItemNode node, ProcessingContext ctx) {
    if (node.getUsageFormat() == UsageFormat.UNDEFINED
        && !node.isRedefines()
        && node.getChildren().stream().noneMatch(Node.hasType(NodeType.VARIABLE))) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }

    final List<Node> children = node.getChildren();
    for (int nodeIndex = 0; nodeIndex < children.size() - 1; ++nodeIndex) {
      final Node child = children.get(nodeIndex);
      if (!(child instanceof ElementaryNode))
        continue;
      final ElementaryNode childE = (ElementaryNode) child;
      if (Strings.isNullOrEmpty(childE.getPicClause()))
        continue;
      final Node nextNode = children.get(nodeIndex + 1);
      if (nextNode.getNodeType() != NodeType.VARIABLE
          || !(nextNode instanceof VariableWithLevelNode)
          || nextNode instanceof MultiTableDataNameNode)
        continue;

      int nextVariableLevel = VariableWithLevelNode.class.cast(nextNode).getLevel();
      if (nextVariableLevel == VariableConstants.LEVEL_66
          || nextVariableLevel == VariableConstants.LEVEL_77
          || nextVariableLevel == VariableConstants.LEVEL_88
          || childE.getLevel() >= nextVariableLevel)
        continue;

      ctx.getErrors().add(childE.getError(MessageTemplate.of(PICTURE_NOT_ALLOWED, childE.getName())));
    }
  }
}
