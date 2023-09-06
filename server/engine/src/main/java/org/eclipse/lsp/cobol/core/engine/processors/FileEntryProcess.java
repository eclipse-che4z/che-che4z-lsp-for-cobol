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
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.FileEntryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;

import java.util.Optional;
/** FileEntryNode processor */
public class FileEntryProcess implements Processor<FileEntryNode> {
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
        .filter(n -> n.getLevel() == VariableConstants.LEVEL_FD_SD)
        .filter(n -> n.getVariableName().getName().equals(node.getFileName()))
        .forEach(n -> n.setFileControlClause(node.getFileControlClause()));
  }
}
