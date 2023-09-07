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

import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.common.model.tree.DeclarativeProcedureSectionNode;
import org.eclipse.lsp.cobol.common.model.tree.ParagraphNameNode;

import java.util.Optional;

/** DeclarativeProcedureSectionNode processor */
public class DeclarativeProcedureSectionRegister
    implements Processor<DeclarativeProcedureSectionNode> {

  private final SymbolAccumulatorService symbolAccumulatorService;

  public DeclarativeProcedureSectionRegister(
      SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(DeclarativeProcedureSectionNode node, ProcessingContext processingContext) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      // TODO: error?
      return;
    }
    ProgramNode program = programOpt.get();
    symbolAccumulatorService.registerCodeBlock(program, node);
    symbolAccumulatorService.registerParagraphNameNode(
        program, new ParagraphNameNode(node.getLocality(), node.getName()));
  }
}
