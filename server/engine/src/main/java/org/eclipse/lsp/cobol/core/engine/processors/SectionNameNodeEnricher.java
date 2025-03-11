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

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp.cobol.common.model.tree.SectionNameNode;

import java.util.List;

/**
 * Enrich section name node with necessary data
 */
@AllArgsConstructor
public class SectionNameNodeEnricher implements Processor<SectionNameNode> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(SectionNameNode sectionNameNode, ProcessingContext ctx) {
    if (ctx.getCurrentProgramNode() == null) {
      return;
    }
    SymbolTable symTable = symbolAccumulator.getSymbolTable(ctx.getCurrentProgramNode());
    if (symTable == null) {
      return;
    }
    List<CodeBlockReference> sections = symTable.resolveProcedures(sectionNameNode.getName(), null);
    if (sections.isEmpty()) {
      return;
    }
    sections.forEach(s -> {
      sectionNameNode.getDefinitions().addAll(s.getDefinitions());
      sectionNameNode.getUsages().addAll(s.getUsage());
    });
  }
}
