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

import java.util.Optional;
import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** Enrich FunctionReference nodes */
@AllArgsConstructor
public class FunctionReferenceEnricher implements Processor<FunctionReference> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(FunctionReference node, ProcessingContext ctx) {
    Optional.ofNullable(ctx.getCurrentProgramNode())
        .map(
            programNode ->
                symbolAccumulator.getFunctionReference(
                    node.getName(), programNode, node.isFunctionPrefixed()))
        .ifPresent(
            fi -> {
              node.setDefinitions(fi.getDefinition());
              node.setUsages(fi.getReferences());
            });
  }
}
