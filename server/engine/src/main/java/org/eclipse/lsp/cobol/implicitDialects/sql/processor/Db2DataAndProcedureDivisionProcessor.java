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
package org.eclipse.lsp.cobol.implicitDialects.sql.processor;

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
import org.eclipse.lsp.cobol.implicitDialects.sql.node.Db2DataAndProcedureDivisionNode;

import java.util.Optional;

/**
 * Validate Db2DataAndProcedureDivisionNode
 */
@AllArgsConstructor
public class Db2DataAndProcedureDivisionProcessor
    implements Processor<Db2DataAndProcedureDivisionNode> {
  final MessageService messageService;

  @Override
  public void accept(Db2DataAndProcedureDivisionNode node, ProcessingContext processingContext) {
    Optional<Node> nearestParentByType = node.getNearestParentByType(NodeType.DIVISION);
    if (nearestParentByType.isPresent()) {
      DivisionNode divisionNode = (DivisionNode) nearestParentByType.get();
      if (divisionNode.getDivisionType() != DivisionType.DATA_DIVISION
          && divisionNode.getDivisionType() != DivisionType.PROCEDURE_DIVISION) {
        throwError(node, processingContext);
      }
    } else {
      throwError(node, processingContext);
    }
  }

  private void throwError(
      Db2DataAndProcedureDivisionNode node, ProcessingContext processingContext) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .location(node.getLocality().toOriginalLocation())
                .severity(ErrorSeverity.ERROR)
                .errorSource(ErrorSource.DIALECT)
                .suggestion(messageService.getMessage("db2Parser.validation.allStatement"))
                .build());
  }
}
