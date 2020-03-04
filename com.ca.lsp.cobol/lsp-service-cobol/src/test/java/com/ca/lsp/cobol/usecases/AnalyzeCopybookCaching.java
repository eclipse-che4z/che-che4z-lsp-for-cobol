/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.cobol.usecases;

import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.AnalyseCopybookTask;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Guice;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static junit.framework.TestCase.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This test checks the logic of caching logic performed by copybook analyzer. The cache invalidated
 * before each test run. The runAnalysis() method starts the analyzing task synchronously, and after
 * finish the content of the copybook should appear in cache managing by databus. After accessing
 * the cache element its hit counter should increase to maintain the element persistence. Also, all
 * the objects in cache expected to be serializable.
 */
@Slf4j
public class AnalyzeCopybookCaching {
  private final String COPYBOOK_NAME = "copy";
  private final String COPYBOOK_CONTENT = "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private final Position POSITION_FIRST_OCCURRENCE = new Position(null, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(null, 10, 10, 10, 10);
  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  private final DataBusBroker databus =
      Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);

  private CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);

  @Before
  public void init() {
    initParagraphDefinitions();
    predefineCache();
    initWorkspaceService();
    when(preprocessor.process(
            any(), any(String.class), any(SemanticContext.class), any(String.class)))
        .thenReturn(
            new ResultWithErrors<>(new PreprocessedInput(COPYBOOK_CONTENT, null), emptyList()));
  }

  private void initParagraphDefinitions() {
    String PARAGRAPH_NAME = "PARNAME";
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
  }

  private void predefineCache() {
    databus.storeData(
        CopybookStorable.builder()
            .name(COPYBOOK_NAME)
            .uri(COPYBOOK_NAME)
            .content(COPYBOOK_CONTENT)
            .build());
  }

  private void initWorkspaceService() {
    MockWorkspaceService mockWorkspaceService = new MockWorkspaceService(databus);
    mockWorkspaceService.setCopybooks(
        () -> singletonList(new CobolText(COPYBOOK_NAME, COPYBOOK_CONTENT)));
  }

  @After
  public void cleanup() {
    databus.invalidateCache();
  }

  @Test
  public void serializeMultiMapInString() {
    log.info("Test serialization in String");
    assertTrue(MultiMapSerializableHelper.serializeInString(paragraphDefinitions).length() > 0);
  }

  @Test
  public void serializeMultiMapInHashMap() {
    log.info("Test serialization in HashMap");
    assertTrue(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions).size() > 0);
  }

  /** This test verifies that after the analysis a specific copybook is retrivied from the cache */
  @Test
  public void analyzeCopybookFromCache() {
    // test the behavior on DID_OPEN
    assertDidOpenAnalysisFromCache();
    // test the behavior on DID_CHANGE
    assertDidChangeAnalysisFromCache();
  }

  /**
   * This test verify that when the cache is empty as first attempt the copybook is loaded from the
   * filesystem and then is available in the cache.
   */
  @Test
  public void analyzeCopybookFromFileSystemService() {
    // test the behavior on DID_OPEN
    assertDidOpenFromFileSystemService();
    // test the behavior on DID_CHANGE
    assertDidChangeFromFileSystemService();
  }

  private void assertDidOpenAnalysisFromCache() {
    log.info(databus.printCache());
    runAnalysisInDidOpen();
    log.info(databus.printCache());
    assertPositiveHitFromCache();
  }

  private void assertDidChangeAnalysisFromCache() {
    log.info(databus.printCache());
    runAnalysisInDidChange();
    log.info(databus.printCache());
    assertPositiveHitFromCache();
  }

  private void assertDidOpenFromFileSystemService() {
    // invalidate cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysisInDidOpen();
    assertStoredInCache();
  }

  private void assertDidChangeFromFileSystemService() {
    // invalidate cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysisInDidChange();
    assertStoredInCache();
  }

  private void assertStoredInCache() {
    assertTrue(databus.isStored(CopybookRepository.calculateUUID(COPYBOOK_NAME)));
  }

  private void assertPositiveHitFromCache() {
    assertTrue(
        databus.getData(CopybookRepository.calculateUUID(new StringBuilder(COPYBOOK_NAME))).getHit()
            > 0);
  }

  private void runAnalysisInDidChange() {
    AnalyseCopybookTask analyseCopybookTask =
        new AnalyseCopybookTask(
            databus,
            preprocessor,
            null,
            new CopybookUsage(COPYBOOK_NAME, null, null),
            emptyList(),
            "DID_CHANGE");
    analyseCopybookTask.compute();
  }

  private void runAnalysisInDidOpen() {
    AnalyseCopybookTask analyseCopybookTask =
        new AnalyseCopybookTask(
            databus,
            preprocessor,
            null,
            new CopybookUsage(COPYBOOK_NAME, null, null),
            emptyList(),
            "DID_OPEN");
    analyseCopybookTask.compute();
  }
}
