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

import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;

import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.Copybook.PLABEL;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} resolves the DFHEIBLC and SPECIALREGISTERS copybook
 * under the LINKAGE and WORKING_STORAGE SECTION respectively.
 */
class PredefinedCopybookAnalysis extends AbstractCopybookAnalysis {
  @Getter
  private String predefinedCopybookName;

  PredefinedCopybookAnalysis(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService,
      String copybookName) {

    super(preprocessor, copybookService, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
    predefinedCopybookName = copybookName;
  }

  @Override
  protected CopybookName retrieveCopybookName(
      ParserRuleContext ctx, String dialect, CopybookHierarchy hierarchy) {
    if (ctx.getText().toUpperCase().startsWith("PROCEDUREDIVISION")) {
      return new CopybookName(PLABEL.name(), dialect);
    }
    return new CopybookName(getPredefinedCopybookName(), dialect);
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
