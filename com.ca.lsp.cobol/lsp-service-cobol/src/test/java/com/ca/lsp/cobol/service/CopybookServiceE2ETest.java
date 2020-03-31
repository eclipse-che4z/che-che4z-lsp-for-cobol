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

import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.AnalyseCopybookTask;
import com.google.inject.Guice;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.awaitility.Duration;
import org.awaitility.core.ConditionTimeoutException;
import org.junit.Before;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

import static java.util.Collections.emptyList;
import static java.util.Collections.unmodifiableList;
import static org.awaitility.Awaitility.await;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This class contains all the unit test that perform the publish/subscribe acrivities for generate
 * the dependency file.
 */
@Slf4j
public class CopybookServiceE2ETest extends FileSystemConfiguration {
  public static final String CPY_NAME_WITHOUT_EXT = "copy2";
  private final DataBusBroker broker =
      Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);

  private Provider<ConfigurationSettingsStorable> configurationSettingsProvider =
      mock(Provider.class);

  private Communications communications = mock(Communications.class);
  private CopybookDependencyService dependencyService =
      new CopybookDependencyServiceImpl(broker, null);

  @Before
  public void initActivities() {
    createProfileConfiguration();

    CopybookServiceImpl copybookService =
        new CopybookServiceImpl(
            broker, configurationSettingsProvider, dependencyService, communications);
    copybookService.setWorkspaceFolders(createWorkspaceFolders());
  }

  private void createProfileConfiguration() {
    when(configurationSettingsProvider.get())
        .thenReturn(
            new ConfigurationSettingsStorable(
                "myProfile", unmodifiableList(Arrays.asList(DSNAME_1, DSNAME_2))));
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event specifying the
   * TextDocumentSync type, the FileSystem service subscribed to it react generating the dependency
   * file.
   */
  @Test
  public void publishRequestOfCopybook_createDependencyFile() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType("DID_OPEN")
            .build());

    // after one second is expected to found the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.TRUE);
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event without specifying
   * the TextDocumentSync type, the FileSystem service will not write/update any dependency file.
   */
  @Test
  public void noTextDocSyncTypeDefined_NoDependencyFileIsCreated() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .build());

    // after one second is expected to found the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.FALSE);
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event when the document
   * is in DID_CHANGE mode and the FileSystem service will not write/update any dependency file.
   */
  @Test
  public void DocumentInDidChangeMode_NoDepFileIsCreated() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType("DID_CHANGE")
            .build());
    // after one second is expected to found the dep file on filesystem
    waitAndAssert_DepFileIsCreated(Boolean.FALSE);
  }

  /**
   * This test verify that when a non required event is published on the databus, the dependency
   * file is not created. This test assume that .cobdep folder exists but no depfile is created.
   */
  @Test
  public void unknownEventPublished_NoDepFileIsCreated() {
    // generate a required copybook event
    broker.postData(UnknownEvent.builder().build());
    // after one second is not expected to found the dep file on filesystem
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
          .untilAsserted(
              () -> {
                assertEquals(depFileExists(), expected);
              });
    } catch (ConditionTimeoutException e) {
      fail(e.getMessage());
    }
  }

  /**
   * This test verify that when a nested copybook is processed a new dependency file is created. So
   * in total there are two dep file, one that contains the outer copybook found in the cobol file
   * processed and one that contains the inner copybook found inside the outer copybook.
   */
  @Test
  public void nestedCopybooks_GenerateTwoDependencyFile() {
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPYNEST_CPY)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType("DID_OPEN")
            .build());

    runAnalysisOnCopybook();

    waitAndAssert_DepsFileAreCreated();
  }

  private void runAnalysisOnCopybook() {
    CobolPreprocessor preprocessor = mock(CobolPreprocessor.class);
    AnalyseCopybookTask analyseCopybookTask =
        new AnalyseCopybookTask(
            broker,
            preprocessor,
            CPY_DOCUMENT_URI,
            new CopybookUsage("CPYNEST2", null, null),
            emptyList(),
            "DID_CHANGE");
    analyseCopybookTask.compute();
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
