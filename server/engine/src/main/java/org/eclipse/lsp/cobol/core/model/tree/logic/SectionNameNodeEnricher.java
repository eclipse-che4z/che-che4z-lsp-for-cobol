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
package org.eclipse.lsp.cobol.core.model.tree.logic;

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.model.tree.SectionNameNode;

/**
 * Enrich section name node with necessary data
 */
@AllArgsConstructor
public class SectionNameNodeEnricher implements Processor<SectionNameNode> {
  private final SymbolService symbolService;

  @Override
  public void accept(SectionNameNode sectionNameNode, ProcessingContext processingContext) {
    sectionNameNode.setDefinitions(symbolService.getSectionLocations(sectionNameNode, CodeBlockReference::getDefinitions));
    sectionNameNode.setUsages(symbolService.getSectionLocations(sectionNameNode, CodeBlockReference::getUsage));
  }
}
