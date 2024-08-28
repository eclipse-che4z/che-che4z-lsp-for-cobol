/*
 * Copyright (c) 2024 Broadcom.
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

import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramSubtype;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

/** FunctionNode processor */
public class FunctionNodeProcess implements Processor<ProgramNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public FunctionNodeProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(ProgramNode node, ProcessingContext ctx) {
    if (node.getSubtype() != ProgramSubtype.Function)
      return;
    symbolAccumulatorService.registerFunctionNode(node).ifPresent(e -> ctx.getErrors().add(e));
  }
}
