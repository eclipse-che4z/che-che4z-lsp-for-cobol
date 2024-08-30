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

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;

/** Enrich FunctionReference nodes */
@AllArgsConstructor
public class FunctionReferenceEnricher implements Processor<FunctionReference> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(FunctionReference node, ProcessingContext processingContext) {
    SymbolAccumulatorService.FunctionInfo fi = symbolAccumulatorService.getFunctionReference(node.getName());
    if (fi == null)
      return;

    node.setDefinitions(fi.getDefinition());
    node.setUsages(fi.getReferences());
  }

}
