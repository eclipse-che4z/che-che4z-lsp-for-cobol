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
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.FileEntryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;

import java.util.List;

/** FileEntryNode processor */
public class FileEntryProcess implements Processor<FileEntryNode> {
  @Override
  public void accept(FileEntryNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      // TODO: error?
      return;
    }
    List<Node> collected = ctx.getCurrentProgramNode().getDepthFirstList(n -> {
      if (n.getNodeType() != NodeType.VARIABLE_DEFINITION) {
        return false;
      }
      if (((VariableDefinitionNode) n).getLevel() != VariableConstants.LEVEL_FD_SD) {
        return false;
      }
      return ((VariableDefinitionNode) n).getVariableName().getName().equals(node.getFileName());
    });

    for (Node n : collected) {
      ((VariableDefinitionNode) n).setFileControlClause(node.getFileControlClause());
    }
  }
}
