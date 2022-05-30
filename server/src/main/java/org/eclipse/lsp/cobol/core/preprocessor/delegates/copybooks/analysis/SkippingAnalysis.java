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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} doesn't resolve copybook content, and
 * only collects the usage of the copybook
 */
class SkippingAnalysis extends AbstractCopybookAnalysis {
  SkippingAnalysis(
      TextPreprocessor preprocessor,
      MessageService messageService) {
    super(preprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  public PreprocessorFunctor handleCopybook(
      CopybookName copybookName,
      ParserRuleContext context,
      ParserRuleContext copySource,
      CopybookConfig config,
      String documentUri) {
    return hierarchy ->
        stack -> {
          stack.pop();
          return subContext -> nestedMappings -> allErrors -> {};
        };
  }

  @Override
  protected CopybookModel getCopybookModel(CopybookName copybookName, String programDocumentUri, String documentUri, CopybookConfig copybookConfig) {
    return new CopybookModel(copybookName, null, null);
  }
}
