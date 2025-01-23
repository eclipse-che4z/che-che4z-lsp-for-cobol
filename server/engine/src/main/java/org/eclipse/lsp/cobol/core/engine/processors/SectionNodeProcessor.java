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

import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.processors.utils.SectionNodeProcessorHelper;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/** SectionNode processor */
public class SectionNodeProcessor implements Processor<SectionNode> {
  private final SymbolAccumulator symbolAccumulator;

  public SectionNodeProcessor(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(SectionNode node, ProcessingContext ctx) {
    ctx.getErrors().addAll(SectionNodeProcessorHelper.processNodeWithVariableDefinitions(node));
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    node.getChildren().stream()
            .flatMap(Node::getDepthFirstStream)
            .filter(hasType(NodeType.VARIABLE))
            .map(VariableNode.class::cast)
            .forEach(v -> symbolAccumulator.addVariable(ctx.getCurrentProgramNode(), v));
  }
}
