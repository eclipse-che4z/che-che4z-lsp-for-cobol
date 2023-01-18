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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * This implementation of the {@link AbstractInjectCodeAnalysis} resolves the DFHEIBLC and SPECIALREGISTERS copybook
 * under the LINKAGE and WORKING_STORAGE SECTION respectively.
 */
@Slf4j
class InjectCodeImplicitAnalysis extends AbstractInjectCodeAnalysis {
  InjectCodeImplicitAnalysis(
      TextPreprocessor preprocessor,
      GrammarPreprocessor grammarPreprocessor,
      MessageService messageService) {

    super(preprocessor, grammarPreprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  protected void storeCopyStatementSemantics(CopybookMetaData metaData,
                                             OldExtendedDocument copybookDocument,
                                             CopybooksRepository copybooksRepository) {
    // no-op
  }

  @Override
  protected void beforeWriting(PreprocessorStack stack) {
    // no-op
  }

  @Override
  protected void afterWriting(ParserRuleContext context, PreprocessorStack stack) {
    // no-op
  }
}
