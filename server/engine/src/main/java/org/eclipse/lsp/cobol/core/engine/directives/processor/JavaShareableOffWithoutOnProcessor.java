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
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.directives.node.JavaShareableOffWithoutOnNode;

/** Validate JavaShareableWorkingSectionNode position */
@AllArgsConstructor
public class JavaShareableOffWithoutOnProcessor
    implements Processor<JavaShareableOffWithoutOnNode> {

  @Override
  public void accept(JavaShareableOffWithoutOnNode node, ProcessingContext processingContext) {
    if (!node.isJavaShareableOn()) {
      throwError(node, processingContext);
    }
  }

  private void throwError(
          JavaShareableOffWithoutOnNode node, ProcessingContext processingContext) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .location(node.getLocality().toOriginalLocation())
                .severity(ErrorSeverity.ERROR)
                .errorSource(ErrorSource.PARSING)
                .messageTemplate(MessageTemplate.of("compilerDirective.validation.javaShareableOff", node.getText()))
                .build());
  }
}
