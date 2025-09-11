/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/** Processor for register variable usage */
@Slf4j
public class IdmsVariableUsageProcessor implements Processor<IdmsVariableNode> {
  private final MessageService messageService;

  public IdmsVariableUsageProcessor(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void accept(IdmsVariableNode ignoredVariableNode, ProcessingContext processingContext) {

    List<ProgramNode> programNodes =
        processingContext.getCurrentProgramNodeStack().stream()
            .filter(n -> n.getNodeType() == NodeType.PROGRAM)
            .collect(Collectors.toList());
    if (!programNodes.isEmpty()) {
      ProgramNode programNode = programNodes.get(0);
      Collection<VariableNode> variables =
          processingContext
              .getVariableAccumulator()
              .getSymbolTable(programNode)
              .findVariables(ignoredVariableNode.getName());
      if (!variables.isEmpty()) {
        Optional<VariableNode> first = variables.stream().findFirst();
        first
            .get()
            .addUsage(
                new VariableUsageNode(
                    ignoredVariableNode.getName(), ignoredVariableNode.getLocality()));
      }
    }
  }
}
