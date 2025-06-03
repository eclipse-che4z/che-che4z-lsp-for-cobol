/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.cics;

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.CicsTranslatorOptionNode;

/** Validate CICS translator option. */
public class CICSTranslatorOptionValidator implements Processor<Node> {
  private final MessageService messageService;
  private boolean afterIdentificationDivision = false;

  public CICSTranslatorOptionValidator(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void accept(Node node, ProcessingContext processingContext) {
    if (node instanceof CicsTranslatorOptionNode && afterIdentificationDivision) {
      processingContext
          .getErrors()
          .add(
              SyntaxError.syntaxError()
                  .location(node.getLocality().toOriginalLocation())
                  .severity(ErrorSeverity.ERROR)
                  .errorSource(ErrorSource.PARSING)
                  .suggestion(
                      messageService.getMessage(
                          "cics.translaterOption.mustBeBeforeIdentificationDivision"))
                  .build());
    }
    if (node instanceof ProgramNode) {
      afterIdentificationDivision = true;
    }
  }
}
