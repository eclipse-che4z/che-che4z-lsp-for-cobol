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
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockUsageNode;

import java.util.Optional;

/**
 * Enrich code block name node with necessary data
 */
@AllArgsConstructor
public class CodeBlockUsageNodeEnricher implements Processor<CodeBlockUsageNode> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(CodeBlockUsageNode node, ProcessingContext processingContext) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      return;
    }
    ProgramNode programNode = programOpt.get();
    CodeBlockReference codeBlockReference = symbolAccumulator.getCodeBlockReference(programNode, node.getName());
    if (codeBlockReference != null) {
      node.setDefinitions(codeBlockReference.getDefinitions());
      node.setUsages(codeBlockReference.getUsage());
    }
  }
}
