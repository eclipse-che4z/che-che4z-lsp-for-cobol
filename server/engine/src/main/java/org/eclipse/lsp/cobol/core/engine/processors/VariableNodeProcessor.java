/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** Registers each variable definition as it is visited in the transformed tree. */
public class VariableNodeProcessor implements Processor<VariableNode> {
  private final SymbolAccumulator symbolAccumulator;

  public VariableNodeProcessor(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(VariableNode node, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() != null) {
      symbolAccumulator.addVariableDefinition(ctx.getCurrentProgramNode(), node);
    }
  }
}
