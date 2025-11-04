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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp4j.DiagnosticTag;

/** Check presence of a returning clause of a function */
public class UnusedVariableCheck implements Processor<RootNode> {
  SymbolAccumulator symbolAccumulator;

  public UnusedVariableCheck(SymbolAccumulator symbolAccumulator) {
    this.symbolAccumulator = symbolAccumulator;
  }

  @Override
  public void accept(RootNode r, ProcessingContext ctx) {
    symbolAccumulator
        .getProgramSymbols()
        .forEach(
            (program, syms) -> {
              syms.getVariables().stream()
                  .filter(ElementaryItemNode.class::isInstance)
                  .map(ElementaryItemNode.class::cast)
                  .filter(
                      varNode -> varNode.getLocality().getUri().equals(r.getLocality().getUri()))
                  .filter(varNode -> varNode.getUsages().isEmpty())
                  .map(
                      node ->
                          SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(ErrorSeverity.WARNING)
                              .suggestion("Unused variable")
                              .tags(ImmutableList.of(DiagnosticTag.Unnecessary))
                              .location(node.getLocality().toOriginalLocation())
                              .build())
                  .forEach(ctx.getErrors()::add);
            });
  }
}
