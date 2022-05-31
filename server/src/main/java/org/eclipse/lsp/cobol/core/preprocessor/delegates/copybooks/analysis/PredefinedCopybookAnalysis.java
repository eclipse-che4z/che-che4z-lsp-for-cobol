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

import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProvider;

import java.util.Optional;
import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.IMPLICIT_PATH;
import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.PREF_IMPLICIT;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} resolves the DFHEIBLC and SPECIALREGISTERS copybook
 * under the LINKAGE and WORKING_STORAGE SECTION respectively.
 */
@Slf4j
class PredefinedCopybookAnalysis extends AbstractCopybookAnalysis {
  private final ContentProvider contentProvider;

  PredefinedCopybookAnalysis(
      TextPreprocessor preprocessor,
      ContentProvider contentProvider,
      MessageService messageService) {

    super(preprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
    this.contentProvider = contentProvider;
  }

  @Override
  protected Consumer<NamedSubContext> storeCopyStatementSemantics(
      CopybookMetaData metaData, ExtendedDocument copybookDocument) {
    return it -> {};
  }

  @Override
  protected CopybookModel getCopybookModel(CopybookName copybookName, String programDocumentUri, String documentUri, CopybookConfig copybookConfig) {
    CopybookModel emptyModel = new CopybookModel(copybookName, null, null);
    return tryResolveInjectedCode(copybookName, copybookConfig).orElse(emptyModel);
  }

  /**
   * Retrieve optional {@link CopybookModel} of the implicit for the given name
   * if it is predefined.
   *
   * @param copybookName - the name of copybook to check
   * @param copybookConfig - configuration for copybook resolution
   * @return optional model of a predefined copybook if it exists
   */
  private Optional<CopybookModel> tryResolveInjectedCode(
      CopybookName copybookName, CopybookConfig copybookConfig) {
    LOG.debug(
        "Trying to resolve implicit copybook {}, using config {}", copybookName, copybookConfig);

    String uri = IMPLICIT_PATH + copybookName.getDisplayName() + ".cpy";
    final Optional<CopybookModel> copybookModel = Optional.ofNullable(contentProvider.read(copybookConfig, uri))
        .map(content -> new CopybookModel(copybookName, PREF_IMPLICIT + uri, content));

    LOG.debug("Implicit copybook: {}", copybookModel);
    return copybookModel;
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
