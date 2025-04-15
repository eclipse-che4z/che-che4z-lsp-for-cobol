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
import org.eclipse.lsp.cobol.common.model.tree.ParagraphNameNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.symbols.CodeBlockReference;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;

/** Enrich paragraph name node with necessary data */
@AllArgsConstructor
public class ParagraphNameNodeEnricher implements Processor<ParagraphNameNode> {
  private final SymbolAccumulator symbolAccumulator;

  @Override
  public void accept(ParagraphNameNode paragraphNameNode, ProcessingContext processingContext) {
    paragraphNameNode.setDefinitions(
        symbolAccumulator.getParagraphLocations(
            paragraphNameNode, CodeBlockReference::getDefinitions));
    paragraphNameNode.setUsages(
        symbolAccumulator.getParagraphLocations(paragraphNameNode, CodeBlockReference::getUsage));
  }
}
