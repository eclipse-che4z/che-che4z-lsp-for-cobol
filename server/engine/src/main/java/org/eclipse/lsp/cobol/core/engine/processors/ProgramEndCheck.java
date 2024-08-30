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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.ProgramEndNode;

/** ProgramEndNode processor */
@Slf4j
public class ProgramEndCheck implements Processor<ProgramEndNode> {
  @Override
  public void accept(ProgramEndNode programEndNode, ProcessingContext ctx) {
    ProgramNode node = programEndNode.getProgram().orElseThrow(RuntimeException::new);
    if (node.getProgramName() == null) {
      LOG.debug("Syntax error: Program name is empty");
      ctx.getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .location(programEndNode.getLocality().toOriginalLocation())
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
                  .location(programEndNode.getLocality().toOriginalLocation())
                  .severity(ErrorSeverity.WARNING)
                  .messageTemplate(
                      MessageTemplate.of("CobolVisitor.identicalProgMsg", node.getProgramName()))
                  .build());
    }
  }
}
