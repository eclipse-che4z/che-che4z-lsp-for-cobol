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
import org.eclipse.lsp.cobol.common.model.tree.ProgramIdNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramSubtype;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.FunctionInfo;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** Enrich ProgramId nodes */
@AllArgsConstructor
public class ProgramIdEnricher implements Processor<ProgramIdNode> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(ProgramIdNode node, ProcessingContext ctx) {
    if (node.getSubtype() != ProgramSubtype.Function || ctx.getCurrentProgramNode() == null) {
      return;
    }

    FunctionInfo fi =
        node.getProgram()
            .map(
                p ->
                    symbolAccumulator.getUserDefinedFunctionReference(
                        ctx.getCurrentProgramNode().getProgramName()))
            .orElse(null);
    if (fi == null) return;
    node.setDefinitions(fi.getDefinition());
    node.setUsages(fi.getReferences());
  }
}
