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
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;
import org.eclipse.lsp.cobol.service.copybooks.CopybookCache;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks;
import org.eclipse.lsp.cobol.service.copybooks.providers.ContentProvider;
import org.eclipse.lsp.cobol.service.copybooks.providers.ContentProviderFactory;

import java.util.Optional;
import java.util.concurrent.ExecutionException;
import java.util.function.Consumer;

import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.Copybook.PLABEL;
import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.PREF_IMPLICIT;

/**
 * This implementation of the {@link AbstractCopybookAnalysis} resolves the DFHEIBLC and SPECIALREGISTERS copybook
 * under the LINKAGE and WORKING_STORAGE SECTION respectively.
 */
@Slf4j
class PredefinedCopybookAnalysis extends AbstractCopybookAnalysis {
  @Getter
  private final String predefinedCopybookName;
  private final ContentProviderFactory contentProviderFactory;
  private final CopybookCache copybookCache;

  PredefinedCopybookAnalysis(
      TextPreprocessor preprocessor,
      ContentProviderFactory contentProviderFactory,
      MessageService messageService,
      CopybookCache copybookCache,
      String copybookName) {

    super(preprocessor, messageService, MAX_COPYBOOK_NAME_LENGTH_DEFAULT);
    predefinedCopybookName = copybookName;
    this.contentProviderFactory = contentProviderFactory;
    this.copybookCache = copybookCache;
  }

  @Override
  protected CopybookName retrieveCopybookName(
      ParserRuleContext ctx, String dialect) {
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
  protected CopybookModel getCopybookModel(CopybookName copybookName, String programDocumentUri, String documentUri, CopybookConfig copybookConfig) {
    CopybookModel emptyModel = new CopybookModel(copybookName, null, null);
    try {
      return copybookCache.get(copybookName, programDocumentUri,  () ->
          tryResolvePredefinedCopybook(copybookName, copybookConfig).orElse(emptyModel));
    } catch (ExecutionException e) {
      e.printStackTrace();
      return emptyModel;
    }
  }

  /**
   * Retrieve optional {@link CopybookModel} of the {@link PredefinedCopybooks} for the given name
   * if it is predefined.
   *
   * @param copybookName - the name of copybook to check
   * @param copybookConfig - configuration for copybook resolution
   * @return optional model of a predefined copybook if it exists
   */
  private Optional<CopybookModel> tryResolvePredefinedCopybook(
      CopybookName copybookName, CopybookConfig copybookConfig) {
    LOG.debug(
        "Trying to resolve predefined copybook {}, using config {}", copybookName, copybookConfig);
    final Optional<CopybookModel> copybookModel =
        Optional.ofNullable(PredefinedCopybooks.forName(copybookName.getQualifiedName()))
            .map(it -> {
              String uri = it.uriForBackend(copybookConfig.getSqlBackend());
              ContentProvider contentProvider = contentProviderFactory.getInstanceFor(it.getContentType());
              return new CopybookModel(copybookName, PREF_IMPLICIT + uri, contentProvider.read(copybookConfig, uri));
            });
    LOG.debug("Predefined copybook: {}", copybookModel);
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
