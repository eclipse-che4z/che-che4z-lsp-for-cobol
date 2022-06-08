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
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

import java.util.function.Consumer;

/**
 * This implementation of the {@link AbstractInjectCodeAnalysis} resolves the DFHEIBLC and SPECIALREGISTERS copybook
 * under the LINKAGE and WORKING_STORAGE SECTION respectively.
 */
@Slf4j
class InjectCodeImplicitAnalysis extends AbstractInjectCodeAnalysis {
  InjectCodeImplicitAnalysis(
      TextPreprocessor preprocessor,
      MessageService messageService) {

    super(preprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  protected Consumer<CopybooksRepository> storeCopyStatementSemantics(
      CopybookMetaData metaData, ExtendedDocument copybookDocument) {
    return it -> {};
  }

  @Override
  protected Consumer<PreprocessorStack> beforeWriting() {
    return it -> {};
  }

  @Override
  protected Consumer<PreprocessorStack> afterWriting(ParserRuleContext context) {
    return it -> {};
  }
}
