/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics.processor;

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.DivisionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.ExecCicsNode;

import java.util.Optional;

/** Semantics check for the EXEC CICS block location */
@AllArgsConstructor
public class CICSExecBlockProcessor implements Processor<ExecCicsNode> {
  final MessageService messageService;

  @Override
  public void accept(ExecCicsNode execCicsNode, ProcessingContext processingContext) {
    Optional<Node> nearestDivision = execCicsNode.getNearestParentByType(NodeType.DIVISION);
    if (nearestDivision.isPresent()) {
      DivisionNode divisionNode = (DivisionNode) nearestDivision.get();
      if (divisionNode.getDivisionType() != DivisionType.PROCEDURE_DIVISION) {
        throwError(execCicsNode, processingContext);
      }
    } else {
      throwError(execCicsNode, processingContext);
    }
  }

  private void throwError(ExecCicsNode execCicsNode, ProcessingContext processingContext) {
    processingContext
            .getErrors()
            .add(
                    SyntaxError.syntaxError()
                            .location(execCicsNode.getLocality().toOriginalLocation())
                            .severity(ErrorSeverity.ERROR)
                            .errorSource(ErrorSource.PARSING)
                            .suggestion(messageService.getMessage("cics.invalidExecBlock"))
                            .build());
  }
}
