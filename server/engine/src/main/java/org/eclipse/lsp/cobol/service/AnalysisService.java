/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;

import static java.lang.String.format;

/**
 * Provides async document analysis functionality
 */
@Slf4j
@Singleton
public class AnalysisService {
  private final LanguageEngineFacade engine;
  private final ConfigurationService configurationService;
  private final CopybookIdentificationService copybookIdentificationService;
  private final CopybookService copybookService;
  private final CountDownLatch waitConfig = new CountDownLatch(1);
  private List<String> copybookExtensions;

  private final DocumentModelService documentService;

  private final DocumentContentCache contentCache;

  @Inject
  AnalysisService(LanguageEngineFacade engine,
                  ConfigurationService configurationService,
                  @Named("combinedStrategy") CopybookIdentificationService copybookIdentificationService,
                  CopybookService copybookService, DocumentModelService documentService,
                  DocumentContentCache contentCache) {
    this.engine = engine;
    this.configurationService = configurationService;
    this.copybookIdentificationService = copybookIdentificationService;
    this.copybookService = copybookService;
    this.documentService = documentService;
    this.contentCache = contentCache;
  }

  /**
   * Check if given document is copybook or not
   *
   * @param uri  - document uri
   * @param text - document text
   * @return true for copybook and false otherwise
   */
  @SneakyThrows
  public boolean isCopybook(String uri, String text) {
    if (waitConfig.getCount() > 0) {
      LOG.info("Waiting for extension config..");
    }
    waitConfig.await();
    return copybookIdentificationService.isCopybook(uri, text, copybookExtensions);
  }

  /**
   * Set extension config
   *
   * @param copybookExtensions - extension config
   */
  public void setExtensionConfig(List<String> copybookExtensions) {
    this.copybookExtensions = Collections.unmodifiableList(copybookExtensions);
    this.waitConfig.countDown();
  }

  /**
   * Analyze document
   *
   * @param uri    Source URI
   * @param text   Content
   * @param onOpen Is document just opened, or it's reanalyse request.
   */
  public void analyzeDocument(String uri, String text, boolean onOpen) {
    contentCache.store(uri, text);
    if (onOpen) {
      documentService.openDocument(uri, text);
    } else {
      documentService.updateDocument(uri, text);
    }

    String logPrefix = onOpen ? "[analyzeDocument] Document " : "[reanalyzeDocument] Document ";
    LOG.debug(logPrefix + uri + " opened");

    if (isCopybook(uri, text)) {
      LOG.debug(logPrefix + uri + " treated as a copy");
      if (!onOpen) {
        Set<String> affectedOpenedPrograms = documentService.findAffectedDocumentsForCopybook(uri, d -> !isCopybook(d.getUri(), d.getText()));
        documentService.getAll(affectedOpenedPrograms).stream()
                .filter(d -> !isCopybook(d.getUri(), d.getText()))
                .forEach(doc -> analyzeDocumentWithCopybooks(doc.getUri(), doc.getText()));
      }
      LOG.debug(logPrefix + " publish diagnostics: " + documentService.getOpenedDiagnostic());
    } else {
      LOG.debug(logPrefix + uri + " treated as a program, start analyzing");
      analyzeDocumentWithCopybooks(uri, text);
    }
  }

  /**
   * Stop code analysis.
   *
   * @param uri source URI
   */
  public void stopAnalysis(String uri) {
    CobolDocumentModel documentModel = documentService.get(uri);

    documentService.closeDocument(uri);
    LOG.debug("[stopAnalysis] Document " + uri + " closed");

    if (documentModel != null && !isCopybook(uri, documentModel.getText())) {
      documentService.removeDocument(uri);
    }
  }

  /**
   * Asynchronously analyze document with copybooks
   *
   * @param uri  - document uri
   * @param text - document text
   */
  void analyzeDocumentWithCopybooks(String uri, String text) {
    if (isCopybook(uri, text)) {
      return;
    }
    try {
      CopybookProcessingMode processingMode =
              CopybookProcessingMode.getCopybookProcessingMode(uri, CopybookProcessingMode.ENABLED);
      AnalysisConfig config = configurationService.getConfig(uri, processingMode);
      AnalysisResult result = engine.analyze(uri, text, config);
      ThreadInterruptionUtil.checkThreadInterrupted();
      documentService.processAnalysisResult(uri, result);
      copybookService.sendCopybookDownloadRequest(uri, DocumentServiceHelper.extractCopybookUris(result), processingMode);
      LOG.debug("[doAnalysis] Document " + uri + " analyzed: " + result.getDiagnostics());
    } catch (Exception e) {
      LOG.debug(format("An exception thrown while applying %s for %s:", "analysis", uri));
      LOG.error(format("An exception thrown while applying %s for %s:", "analysis", uri), e);
      throw e;
    }
  }

}
