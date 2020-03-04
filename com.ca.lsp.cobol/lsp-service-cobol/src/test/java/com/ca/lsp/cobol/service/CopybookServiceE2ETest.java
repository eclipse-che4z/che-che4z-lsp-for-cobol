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

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import com.ca.lsp.cobol.FileSystemConfiguration;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyServiceImpl;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.awaitility.Duration;
import org.awaitility.core.ConditionTimeoutException;
import org.junit.Before;
import org.junit.Test;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

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
  private DataBusBroker broker = new DefaultDataBusBroker();

  // TODO
  /*
    - remove popup
  - when delete copybook we should see syntax error

     */

  private Provider<ConfigurationSettingsStorable> configurationSettingsProvider =
      mock(Provider.class);

  private Communications communications = mock(Communications.class);
  private CopybookDependencyService dependencyService = new CopybookDependencyServiceImpl();

  @Before
  public void initActivities() {
    // the delegate will prepare the structure and this method will just setup the list of workspace
    // folders
    when(configurationSettingsProvider.get())
        .thenReturn(
            new ConfigurationSettingsStorable("myProfile", Arrays.asList(DSNAME_1, DSNAME_2)));

    CopybookServiceImpl copybookService =
        new CopybookServiceImpl(
            broker, configurationSettingsProvider, dependencyService, communications);
    copybookService.setWorkspaceFolders(generateWorkspaceFolder());
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event specifying the
   * TextDocumentSync type, the FileSystem service subscribed to it react generating the dependency
   * file.
   */
  @Test
  public void generateDependencyFileOnCallbackPositiveTest() {

    // generate a required copybook event
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType("DID_OPEN")
            .build());
    // after one second is expected to found the dep file on filesystem
    waitAndAssert(Boolean.TRUE);
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event without specifying
   * the TextDocumentSync type, the FileSystem service will not write/update any dependency file.
   */
  @Test
  public void NotGenerateDependencyFileOnCallbackNegativeTest() {
    // generate a required copybook event
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .build());
    // after one second is expected to found the dep file on filesystem
    waitAndAssert(Boolean.FALSE);
  }

  /**
   * This test verify that when the preprocessor publish a require copybook event when the document
   * is in DID_CHANGE mode and the FileSystem service will not write/update any dependency file.
   */
  @Test
  public void NotGenerateDependencyFileOnDidChangeTest() {
    // generate a required copybook event
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(CPY_NAME_WITHOUT_EXT)
            .documentUri(DOCUMENT_URI)
            .textDocumentSyncType("DID_CHANGE")
            .build());
    // after one second is expected to found the dep file on filesystem
    waitAndAssert(Boolean.FALSE);
  }

  /**
   * This test verify that when a non required event is published on the databus, the dependency
   * file is not created. This test assume that .cobdep folder exists but no depfile is created.
   */
  @Test
  public void noDependencyFileWithOtherEvent() {
    // generate a required copybook event
    broker.postData(UnknownEvent.builder().build());
    // after one second is not expected to found the dep file on filesystem
    waitAndAssert(Boolean.FALSE);
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

  private void waitAndAssert(Boolean expected) {
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
}
