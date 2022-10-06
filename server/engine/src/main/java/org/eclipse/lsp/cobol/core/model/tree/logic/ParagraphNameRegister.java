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

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;

/** ParagraphNameNode processor */
public class ParagraphNameRegister implements Processor<ParagraphNameNode> {
  private final SymbolService symbolService;

  public ParagraphNameRegister(SymbolService symbolService) {
    this.symbolService = symbolService;
  }

  @Override
  public void accept(ParagraphNameNode node, ProcessingContext ctx) {
    node.getProgram()
        .flatMap(parent -> symbolService.registerParagraphNameNode(parent, node))
        .map(ImmutableList::of)
        .orElseGet(ImmutableList::of)
        .forEach(ctx.getErrors()::add);
  }
}
