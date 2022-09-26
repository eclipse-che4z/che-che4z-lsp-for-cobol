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

import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.model.tree.DeclarativeProcedureSectionNode;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.Optional;

/** DeclarativeProcedureSectionNode processor */
public class DeclarativeProcedureSectionRegister
    implements Processor<DeclarativeProcedureSectionNode> {
  @Override
  public void accept(DeclarativeProcedureSectionNode node, ProcessingContext processingContext) {
    Optional<ProgramNode> programOpt = node.getProgram();
    if (!programOpt.isPresent()) {
      // TODO: error?
      return;
    }
    ProgramNode program = programOpt.get();
    program.registerCodeBlock(node);
    program.registerParagraphNameNode(new ParagraphNameNode(node.getLocality(), node.getName()));
  }
}
