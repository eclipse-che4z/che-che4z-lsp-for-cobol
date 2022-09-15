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
import org.eclipse.lsp.cobol.core.model.tree.FileEntryNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;

import java.util.Optional;
import java.util.function.BiConsumer;
/** FileEntryNode processor */
public class FileEntryProcess implements BiConsumer<FileEntryNode, ProcessingContext> {
  @Override
  public void accept(FileEntryNode node, ProcessingContext ctx) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      // TODO: error?
      return;
    }
    ProgramNode program = programOpt.get();
    program
        .getDepthFirstStream()
        .filter(Node.hasType(NodeType.VARIABLE_DEFINITION))
        .map(VariableDefinitionNode.class::cast)
        .filter(n -> n.getLevel() == VariableDefinitionUtil.LEVEL_FD_SD)
        .filter(n -> n.getVariableName().getName().equals(node.getFileName()))
        .forEach(n -> n.setFileControlClause(node.getFileControlClause()));
  }
}
