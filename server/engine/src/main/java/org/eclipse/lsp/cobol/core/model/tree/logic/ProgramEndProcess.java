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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.ProgramEndNode;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;

import java.util.function.BiConsumer;

/** ProgramEndNode processor */
@Slf4j
public class ProgramEndProcess implements BiConsumer<ProgramEndNode, ProcessingContext> {
  @Override
  public void accept(ProgramEndNode programEndNode, ProcessingContext ctx) {
    if (!programEndNode.getProgram().isPresent()) {
      // TODO an error
      return;
    }
    ProgramNode node = programEndNode.getProgram().get();
    if (node.getProgramName() == null) {
      LOG.debug("Syntax error: Program name is empty");
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .locality(programEndNode.getLocality())
                  .severity(ErrorSeverity.WARNING)
                  .messageTemplate(MessageTemplate.of("CobolVisitor.progIDIssueMsg"))
                  .build());
    } else if (!node.getProgramName().equalsIgnoreCase(programEndNode.getProgramId())) {
      LOG.debug(
          "Syntax error: program name is '{}', but END PROGRAM refers to '{}'",
          node.getProgramName(),
          programEndNode.getProgramId());
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .locality(programEndNode.getLocality())
                  .severity(ErrorSeverity.WARNING)
                  .messageTemplate(
                      MessageTemplate.of("CobolVisitor.identicalProgMsg", node.getProgramName()))
                  .build());
    }
  }
}
