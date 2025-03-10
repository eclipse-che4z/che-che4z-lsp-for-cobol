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
package org.eclipse.lsp.cobol.core.engine.directives.processor;

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaCallableDataWorkingSectionNode;

/** Validate JavaCallableDataWorkingSectionNode position */
@AllArgsConstructor
public class JavaCallableDataWorkingSectionProcessor
    implements Processor<JavaCallableDataWorkingSectionNode> {

  @Override
  public void accept(JavaCallableDataWorkingSectionNode node, ProcessingContext processingContext) {
    if (node.getSection().contains(SectionType.WORKING_STORAGE.getType())
            || node.getSection().contains(DivisionType.DATA_DIVISION.getDivName())) {
      return;
    }
    throwError(node, processingContext);
  }

  private void throwError(
          JavaCallableDataWorkingSectionNode node, ProcessingContext processingContext) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .location(node.getLocality().toOriginalLocation())
                .severity(ErrorSeverity.ERROR)
                .errorSource(ErrorSource.PARSING)
                .messageTemplate(MessageTemplate.of("compilerDirective.validation.dataSection", node.getText()))
                .build());
  }
}
