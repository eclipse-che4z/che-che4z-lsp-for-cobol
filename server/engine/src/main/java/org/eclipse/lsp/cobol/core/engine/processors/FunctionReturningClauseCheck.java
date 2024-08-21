/*
 * Copyright (c) 2024 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramSubtype;

/** Check presence of a returning clause of a function */
public class FunctionReturningClauseCheck implements Processor<ProcedureDivisionNode> {
  @Override
  public void accept(ProcedureDivisionNode proc, ProcessingContext ctx) {
    ProgramNode node = proc.getProgram().orElseThrow(RuntimeException::new);
    if (node.getSubtype() != ProgramSubtype.Function || proc.hasReturningClause)
      return;

    ctx.getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .location(proc.clausesLocation.toOriginalLocation())
                .severity(ErrorSeverity.ERROR)
                .messageTemplate(MessageTemplate.of("CobolVisitor.functionReturningMsg"))
                .build());
  }
}
