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

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp4j.Location;

import java.util.List;
import java.util.function.Function;

/**
 * Enrich code block name node with necessary data
 */
@AllArgsConstructor
public class CodeBlockUsageNodeEnricher implements Processor<CodeBlockUsageNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(CodeBlockUsageNode node, ProcessingContext processingContext) {
    node.setDefinitions(getLocations(node, CodeBlockReference::getDefinitions));
    node.setUsages(getLocations(node, CodeBlockReference::getUsage));
  }

  private List<Location> getLocations(CodeBlockUsageNode node, Function<CodeBlockReference, List<Location>> retriveLocations) {
    return node.getProgram()
        .map(p -> symbolAccumulatorService.getCodeBlockReference(p, node.getName()))
        .map(retriveLocations)
        .orElse(ImmutableList.of());
  }

}
