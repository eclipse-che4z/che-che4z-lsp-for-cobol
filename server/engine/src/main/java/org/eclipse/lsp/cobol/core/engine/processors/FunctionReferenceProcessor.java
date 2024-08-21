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

import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;

/** FunctionReference processor */
public class FunctionReferenceProcessor implements Processor<FunctionReference> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public FunctionReferenceProcessor(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(FunctionReference node, ProcessingContext ctx) {
    node.getProgram()
        .flatMap(p -> symbolAccumulatorService.registerFunctionReferenceNode(p, node))
        .ifPresent(err -> ctx.getErrors().add(err));
  }
}
