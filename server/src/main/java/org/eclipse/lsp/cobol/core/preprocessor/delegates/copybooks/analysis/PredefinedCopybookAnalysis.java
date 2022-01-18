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
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.CopybookService;

import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.Copybook.DFHEIBLC;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} resolves only the DFHEIBLC copybook
 * under the LINKAGE SECTION.
 */
class PredefinedCopybookAnalysis extends AbstractCopybookAnalysis {
  PredefinedCopybookAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService) {
    super(preprocessor, copybookService, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
  }

  @Override
  protected String retrieveCopybookName(ParserRuleContext ctx) {
    return DFHEIBLC.name();
  }

  @Override
  protected Consumer<NamedSubContext> storeCopyStatementSemantics(
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
