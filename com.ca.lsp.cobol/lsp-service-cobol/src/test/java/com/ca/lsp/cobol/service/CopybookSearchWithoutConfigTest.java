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
 *
 */

package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.dependency.CopybookDependencyService;
import com.google.inject.Provider;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static com.ca.lsp.cobol.service.delegates.communications.CopybookMessageInfo.*;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.*;

/**
 * This class cover the scenario when user try to use the server functionalities without an
 * appropriate filesystem configuration under the hood. Example of unit test defined here are
 * related to the search copybook without a copybook folder or without settings, and write/update
 * dependency file without a dependency folder.
 */
public class CopybookSearchWithoutConfigTest {
  public static final String CPY_NAME = "ACPYTEST";
  DataBusBroker dataBusBroker = mock(DataBusBroker.class);
  Provider settingsProvider = mock(Provider.class);
  CopybookDependencyService dependencyService = mock(CopybookDependencyService.class);
  Communications communications = mock(Communications.class);
  private CopybookServiceImpl copybookService;
  Path workspaceFolderPath = null;
  /** Initialize the copybook service and dependency service but not the relevant folders */
  @Before
  public void init() {
    workspaceFolderPath =
        createFolderStructure(Paths.get(System.getProperty("java.io.tmpdir"), "WORKSPACE"));

    copybookService =
        new CopybookServiceImpl(dataBusBroker, settingsProvider, dependencyService, communications);
    copybookService.setWorkspaceFolders(generateWorkspaceFolder());
  }

  @After
  public void cleanupTempFolder() {
    try {
      Files.walk(workspaceFolderPath)
          .sorted(Comparator.reverseOrder())
          .map(Path::toFile)
          .forEach(File::delete);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * This test will verify that when the profile/dataset settings are not provided to the user the
   * server will not crash and a syntax error copybook not found is shown to the user
   */
  @Test
  public void findCopybookWithoutSettingsDefined() {
    // simulate that user have not provided settings for profile and datasetlist but the
    // preprocessor found a copybook.

    // when asking for a setting config we'll give an empty object as defined in the API
    when(settingsProvider.get()).thenReturn(ConfigurationSettingsStorable.builder().build());

    try {
      copybookService.observerCallback(RequiredCopybookEvent.builder().name(CPY_NAME).build());
      verify(communications, times(1)).notifyCopybookMessageInfo(NO_SETTINGS);
    } catch (Exception e) {
      fail();
    }
  }

  /**
   * This test verify that when the settings configuration contains just the profile name the server
   * will not crash and a syntax error of copybook not found is shown to the user.
   */
  @Test
  public void findCopybookWithOnlyProfileDefined() {
    // simulate that user have not provided settings for profile and datasetlist but the
    // preprocessor found a copybook.

    when(settingsProvider.get()).thenReturn(new ConfigurationSettingsStorable("myProfile", null));

    try {
      copybookService.observerCallback(RequiredCopybookEvent.builder().name(CPY_NAME).build());
      verify(communications, times(1)).notifyCopybookMessageInfo(NO_DATASET_IN_SETTINGS);
    } catch (Exception e) {
      fail();
    }
  }

  /**
   * This test will verify that without the definition of a copybook folder the server will not
   * crash and a syntax error copybook not found is shown to the user
   */
  @Test
  public void findCopybookWithoutCopybookFolderDefined() {
    when(settingsProvider.get())
        .thenReturn(
            ConfigurationSettingsStorable.builder()
                .profiles("PRF")
                .paths(Collections.singletonList("HLQ.DS1"))
                .build());
    try {
      copybookService.observerCallback(RequiredCopybookEvent.builder().name(CPY_NAME).build());
      verify(communications, times(1)).notifyCopybookMessageInfo(COPYBOOK_FOLDER_MISS);
    } catch (Exception e) {
      fail();
    }
  }

  private List<WorkspaceFolder> generateWorkspaceFolder() {

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName("TEST");
    workspaceFolder.setUri(String.valueOf(workspaceFolderPath.toUri()));
    return Collections.singletonList(workspaceFolder);
  }

  private Path createFolderStructure(Path copybooksPath) {
    try {
      return Files.createDirectories(copybooksPath);
    } catch (IOException e) {
      return null;
    }
  }
}
