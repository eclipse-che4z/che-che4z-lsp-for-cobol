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

import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

/** Processor for ProcedureDivisionBodyNode and ParagraphsNode nodes */
public class DefineCodeBlock implements Processor<Node> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public DefineCodeBlock(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(Node node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    if ((!(node instanceof ProcedureDivisionBodyNode)) && (!(node instanceof ParagraphsNode))) {
      return;
    }
    for (Node child : node.getChildren()) {
      if (child.getNodeType() == NodeType.PARAGRAPH
              || child.getNodeType() == NodeType.PROCEDURE_SECTION) {
        symbolAccumulatorService.registerCodeBlock(ctx.getCurrentProgramNode(), (CodeBlockDefinitionNode) child);
      }
    }
  }
}
