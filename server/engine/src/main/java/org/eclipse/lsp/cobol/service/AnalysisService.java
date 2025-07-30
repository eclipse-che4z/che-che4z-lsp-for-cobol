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

import static java.lang.String.format;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;

/** Provides async document analysis functionality */
@Slf4j
@Singleton
public class AnalysisService {
  private final LanguageEngineFacade engine;
  private final ConfigurationService configurationService;
  private final CopybookIdentificationService copybookIdentificationService;
  private final CountDownLatch waitConfig = new CountDownLatch(1);
  private List<String> copybookExtensions;

  @Inject
  AnalysisService(
      LanguageEngineFacade engine,
      ConfigurationService configurationService,
      @Named("combinedStrategy") CopybookIdentificationService copybookIdentificationService) {
    this.engine = engine;
    this.configurationService = configurationService;
    this.copybookIdentificationService = copybookIdentificationService;
  }

  /**
   * Check if given document is copybook or not
   *
   * @param uri - document uri
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
   * @param uri Source URI
   * @param text Content
   * @param isNew Is document just opened, or it's reanalyse request.
   * @param langId - document language id
   * @return Analysis results
   */
  public AnalysisResult analyzeDocument(String uri, String text, boolean isNew, String langId) {
    String logPrefix = isNew ? "[analyzeDocument] Document " : "[reanalyzeDocument] Document ";
    LOG.debug(logPrefix + uri + " opened");

    if (isCopybook(uri, text)) {
      LOG.debug(logPrefix + uri + " treated as a copybook, skipping analysis");
      return null;
    }
    LOG.debug(logPrefix + uri + " treated as a program, start analyzing");
    return analyzeDocumentWithCopybooks(uri, text, langId);
  }

  /**
   * Asynchronously analyze document with copybooks
   *
   * @param uri - document uri
   * @param text - document text
   * @param langId - document language id
   * @return a list of program nodes
   */
  private AnalysisResult analyzeDocumentWithCopybooks(String uri, String text, String langId) {
    try {
      CopybookProcessingMode copybookProcessingMode =
          CopybookProcessingMode.getCopybookProcessingMode(uri, CopybookProcessingMode.ENABLED);
      AnalysisConfig config = configurationService.getConfig(uri, copybookProcessingMode);
      ThreadInterruptionUtil.checkThreadInterrupted();
      AnalysisResult result = engine.analyze(uri, text, config, langId);
      LOG.debug("[doAnalysis] Document " + uri + " analyzed: " + result.getDiagnostics());
      return result;

    } catch (Exception e) {
      LOG.debug(format("An exception thrown while applying %s for %s:", "analysis", uri));
      LOG.error(format("An exception thrown while applying %s for %s:", "analysis", uri), e);
      throw e;
    }
  }
}
