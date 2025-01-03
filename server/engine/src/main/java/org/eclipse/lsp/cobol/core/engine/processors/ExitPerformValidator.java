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

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.ExitPerformNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

/**
 * Checks if EXIT PERFORM statement situated inside the inline perform block
 */
public class ExitPerformValidator implements Processor<ExitPerformNode> {
  @Override
  public void accept(ExitPerformNode exitPerformNode, ProcessingContext processingContext) {
      if (!exitPerformNode.isInsideInlinePerform()) {
          processingContext.getErrors()
                  .add(SyntaxError.syntaxError()
                          .errorSource(ErrorSource.PARSING)
                          .location(exitPerformNode.getLocality().toOriginalLocation())
                          .severity(ErrorSeverity.WARNING)
                          .messageTemplate(MessageTemplate.of("semantic.exitPerformIsIgnored"))
                          .build());
      }
  }
}
