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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.cdi.EngineModule;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CopybookResolutionProvider;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.awaitility.Duration;
import org.awaitility.core.ConditionTimeoutException;
import org.junit.Before;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Paths;

import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;
import static org.awaitility.Awaitility.await;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/**
 * This class contains all the unit tests that perform the publishing/subscribing activities for
 * generating the dependency file.
 */
@Slf4j
public class CopybookServiceE2ETest extends FileSystemConfiguration {
  private DataBusBroker broker = null;
  private CopybookResolutionProvider resolution = null;

  @Before
  public void initActivities() {
    Injector injector = Guice.createInjector(new DatabusModule(), new EngineModule());
    broker = injector.getInstance(DataBusBroker.class);
    resolution = injector.getInstance(CopybookResolutionProvider.class);

    CopybookDependencyService dependencyService = new CopybookDependencyServiceImpl(broker, null);

    CopybookServiceImpl copybookService =
        new CopybookServiceImpl(broker, createProfileConfiguration(), dependencyService);
    copybookService.setWorkspaceFolders(createWorkspaceFolders());
  }

  private Provider<ConfigurationSettingsStorable> createProfileConfiguration() {
    return () -> new ConfigurationSettingsStorable(unmodifiableList(asList(FULL_PATH, FULL_PATH2)));
  }

  /**
   * This test verifies that when the preprocessor publishes a required copybook event specifying
   * the TextDocumentSync type, the FileSystem service subscribed to it react generating the
   * dependency file.
   */
  @Test
  public void publishRequestOfCopybook_createDependencyFile() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(COBOL_FILE_DOCUMENT_URI)
            .textDocumentSyncType("DID_OPEN")
            .build());

    // after one second it is expected to find the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.TRUE);
  }

  /**
   * This test verifies that when the preprocessor publishes a required copybook event without
   * specifying the TextDocumentSync type, the FileSystem service will not write/update any
   * dependency file.
   */
  @Test
  public void noTextDocSyncTypeDefined_NoDependencyFileIsCreated() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(COBOL_FILE_DOCUMENT_URI)
            .build());

    // after one second it is expected to found the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.FALSE);
  }

  /**
   * This test verifies that when the preprocessor publishes a required copybook event when the
   * document is in DID_CHANGE mode, and the FileSystem service will not write/update any dependency
   * file.
   */
  @Test
  public void DocumentInDidChangeMode_NoDepFileIsCreated() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(COBOL_FILE_DOCUMENT_URI)
            .textDocumentSyncType("DID_CHANGE")
            .build());
    // after one second it is expected to found the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.FALSE);
  }

  /**
   * This test verifies that when a non required event published on the databus, the dependency file
   * not created. This test assumes that .cobdep folder exists but no depfile is created.
   */
  @Test
  public void unknownEventPublished_NoDepFileIsCreated() {
    // generate a required copybook event
    broker.postData(UnknownEvent.builder().build());
    // after one second not expected to find the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.FALSE);
  }

  private boolean depFileExists() {
    return Files.exists(
        Paths.get(
            getWorkspaceFolderPath()
                + filesystemSeparator()
                + ".cobdeps"
                + filesystemSeparator()
                + "Test.dep"));
  }

  private void waitAndAssert_DepFileIsCreated(Boolean expected) {
    try {
      await()
          .atMost(Duration.ONE_SECOND)
          .untilAsserted(() -> assertEquals(depFileExists(), expected));
    } catch (ConditionTimeoutException e) {
      fail(e.getMessage());
    }
  }

  /**
   * This test verifies that when a nested copybook processed a new dependency file created. So in
   * total there are two dep file, one contains the outer copybook found in the cobol file processed
   * and one contains the inner copybook found inside the outer copybook.
   */
  @Test
  public void nestedCopybooks_GenerateTwoDependencyFile() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPYNEST_CPY)
            .documentUri(COBOL_FILE_DOCUMENT_URI)
            .textDocumentSyncType("DID_OPEN")
            .build());

    runAnalysisOnCopybook();

    waitAndAssert_DepsFileAreCreated();
  }

  private void runAnalysisOnCopybook() {
    resolution.get().resolve("CPYNEST2", CPY_DOCUMENT_URI, "DID_CHANGE");
  }

  private void waitAndAssert_DepsFileAreCreated() {
    try {
      await()
          .atMost(Duration.TWO_SECONDS)
          .untilAsserted(
              () -> {
                assertEquals(Boolean.TRUE, depFileExists());
                assertEquals(Boolean.TRUE, innerDepFileExists());
              });
    } catch (ConditionTimeoutException e) {
      fail(e.getMessage());
    }
  }

  private Boolean innerDepFileExists() {
    return Files.exists(
        Paths.get(
            getWorkspaceFolderPath()
                + filesystemSeparator()
                + ".cobdeps"
                + filesystemSeparator()
                + "CPYNEST.dep"));
  }
}
