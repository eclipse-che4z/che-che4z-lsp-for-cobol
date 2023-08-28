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

import lombok.AllArgsConstructor;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.CICSTranslatorNode;
import org.eclipse.lsp.cobol.common.AnalysisConfig;

/** Handles logic to enable disable CICS Translator options */
@AllArgsConstructor
public class CICSTranslatorProcessor implements Processor<CICSTranslatorNode> {

  final AnalysisConfig analysisConfig;
  final MessageService messageService;
  /**
   * Handles logic to enable disable CICS Translator options based on settings.
   *
   * @param cicsTranslatorNode {@link CICSTranslatorNode}
   * @param processingContext {@link ProcessingContext}
   */
  @Override
  public void accept(CICSTranslatorNode cicsTranslatorNode, ProcessingContext processingContext) {
    if (!analysisConfig.isCicsTranslatorEnabled()) {
      processingContext
          .getErrors()
          .add(
              SyntaxError.syntaxError()
                  .location(cicsTranslatorNode.getLocality().toOriginalLocation())
                  .severity(ErrorSeverity.ERROR)
                  .errorSource(ErrorSource.PARSING)
                  .suggestion(messageService.getMessage("cics.enableTranslator"))
                  .build());
    }
  }
}
