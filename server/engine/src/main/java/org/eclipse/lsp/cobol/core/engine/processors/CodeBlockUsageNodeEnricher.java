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
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
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
    List<CodeBlockReference> codeBlockReferences = symbolAccumulator.getCodeBlockReference(programNode, node);
    if (codeBlockReferences.size() == 1) {
      node.setDefinitions(codeBlockReferences.get(0).getDefinitions());
      node.setUsages(codeBlockReferences.get(0).getUsage());
    } else if (codeBlockReferences.size() > 1) {
      // TODO: A lot of ambiguous references will cause performance degradation.
      // Using symbol table instead of CodeBlockUsageNode can resolve this issue.
      List<Location> definitions = new ArrayList<>();
      List<Location> usage = new ArrayList<>();
      for (CodeBlockReference codeBlockReference : codeBlockReferences) {
        definitions.addAll(codeBlockReference.getDefinitions());
        usage.addAll(codeBlockReference.getUsage());
      }
      node.setDefinitions(definitions);
      node.setUsages(usage);
    }
  }
}
