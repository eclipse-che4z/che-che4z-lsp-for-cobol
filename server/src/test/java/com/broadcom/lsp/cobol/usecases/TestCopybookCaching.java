/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.domain.modules.EngineModule;
import com.broadcom.lsp.cobol.domain.modules.DatabusModule;
import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.broadcom.lsp.cobol.service.mocks.MockCopybookService;
import com.broadcom.lsp.cobol.service.mocks.MockCopybookServiceImpl;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.resolution.CopybookResolutionProvider;
import com.broadcom.lsp.cobol.domain.databus.api.DataBusBroker;
import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.core.model.Locality;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static java.util.Collections.singletonList;
import static junit.framework.TestCase.assertTrue;

/**
 * This test checks the caching logic performed by copybook resolution. The cache invalidated before
 * each test run. The runAnalysis() method starts the resolving task synchronously, and after finish
 * the content of the copybook should appear in cache managing by data bus. After accessing the
 * cache element its hit counter should increase to maintain the element persistence. Also, all the
 * objects in cache expected to be serializable.
 */
@Slf4j
class TestCopybookCaching {
  private static final String COPYBOOK_NAME = "copy";
  private static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private static final Locality FIRST_OCCURRENCE =
      Locality.builder().range(new Range(new Position(0, 0), new Position(0, 0))).build();
  private static final Locality SECOND_OCCURRENCE =
      Locality.builder().range(new Range(new Position(10, 10), new Position(10, 10))).build();
  private static final Multimap<String, Locality> paragraphDefinitions = HashMultimap.create();

  private DataBusBroker databus;
  private CopybookResolutionProvider resolution;

  @BeforeEach
  void init() {
    Injector injector = Guice.createInjector(new DatabusModule(), new EngineModule());
    databus = injector.getInstance(DataBusBroker.class);
    resolution = injector.getInstance(CopybookResolutionProvider.class);
    initParagraphDefinitions();
    predefineCache();
    initWorkspaceService();
  }

  private void initParagraphDefinitions() {
    String paragraphName = "PARNAME";
    paragraphDefinitions.put(paragraphName, FIRST_OCCURRENCE);
    paragraphDefinitions.put(paragraphName, SECOND_OCCURRENCE);
  }

  private void predefineCache() {
    databus.storeData(new CopybookModel(COPYBOOK_NAME, COPYBOOK_NAME, COPYBOOK_CONTENT));
  }

  private void initWorkspaceService() {
    MockCopybookService mockCopybookService = new MockCopybookServiceImpl(databus);
    mockCopybookService.setCopybooks(
        () -> singletonList(new CobolText(COPYBOOK_NAME, COPYBOOK_CONTENT)));
  }

  @AfterEach
  void cleanup() {
    databus.invalidateCache();
  }

  /** This test verifies that after the analysis a specific copybook retrieved from the cache */
  @Test
  void analyzeCopybookFromCache() {
    // test the behavior on DID_OPEN
    assertDidOpenAnalysisFromCache();
    // test the behavior on DID_CHANGE
    assertDidChangeAnalysisFromCache();
  }

  /**
   * This test verifies that when the cache is empty as first attempt the copybook loaded from the
   * filesystem and then is available in the cache.
   */
  @Test
  void analyzeCopybookFromCopybookService() {
    // test the behavior on DID_OPEN
    assertDidOpenFromCopybookService();
    // test the behavior on DID_CHANGE
    assertDidChangeFromCopybookService();
  }

  private void assertDidOpenAnalysisFromCache() {
    LOG.info(databus.printCache());
    runAnalysis(CopybookProcessingMode.ENABLED);
    LOG.info(databus.printCache());
    assertStoredInCache();
  }

  private void assertDidChangeAnalysisFromCache() {
    LOG.info(databus.printCache());
    runAnalysis(CopybookProcessingMode.SKIP);
    LOG.info(databus.printCache());
    assertStoredInCache();
  }

  private void assertDidOpenFromCopybookService() {
    // invalidate the cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysis(CopybookProcessingMode.ENABLED);
    assertStoredInCache();
  }

  private void assertDidChangeFromCopybookService() {
    // invalidate the cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysis(CopybookProcessingMode.SKIP);
    assertStoredInCache();
  }

  private void assertStoredInCache() {
    assertTrue(databus.isStored(COPYBOOK_NAME));
  }

  private void runAnalysis(CopybookProcessingMode copybookProcessingMode) {
    resolution.get().resolve(COPYBOOK_NAME, UseCaseUtils.DOCUMENT_URI, copybookProcessingMode);
  }
}
