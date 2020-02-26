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
package com.ca.lsp.cobol;

import com.ca.lsp.cobol.model.ConfigurationSettingsStorable;
import com.ca.lsp.cobol.service.providers.SettingsProvider;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.Before;
import org.mockito.Mockito;

import java.io.IOException;
import java.nio.file.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import static org.mockito.Mockito.when;

/**
 * This class provide support methods for FileSystemService and doesn't test anything. More in
 * detail create the workspace folder in the user tmp folder with some copybooks there
 */
@Slf4j
public class FileSystemConfiguration extends ConfigurableTest {
  protected static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";
  protected static final String WORKSPACE_FOLDER_NAME = "test";
  protected static final String CPY_OUTER_NAME_ONLY2 = "copy2";
  protected static final String EMPTY_COPYBOOK_NAME = " ";
  public static final String DOCUMENT_URI = "file:///C:/Users/test/Test.cbl";
  protected static final String CPY_INNER_FILE_NAME_WITH_EXT = "copy2.cpy";
  protected static final String DEP_FILE_COST_NAME = "SOMEPROG";
  public static final String PROFILE_NAME = "PRF11";
  public static final String DSNAME_1 = "HLQLF01.DSNAME1";
  public static final String DSNAME_2 = "HLQLF01.DSNAME2";

  private Path workspaceFolder = null;
  protected Path copybooksPath = null;
  protected Provider<SettingsProvider> configurationSettingsProvider = Mockito.mock(Provider.class);

  // this field represent the predefined setting used for test purposes
  protected ConfigurationSettingsStorable configurationSettingsStorable = null;
  /*
  STRUCTURE FOLDER USED FOR TEST PURPOSES
  ***************************************
  TEMP/
  └── WORKSPACE/
      ├── .cobdeps
      │   ├── TEST.dep
      │   └── SOMEPROG.dep
      └─── .copybooks
          ├── PROFILE_NAME/
          │   ├── HLQ.DSN.NAME1/
          │   │   └── copybook.cpy
          │   └── HLQ.DSN.NAME2/
          │       └── copybook.cpy
          └── copy2.cpy
  ***************************************

  /** Before each unit test configure the settings with a proprer mock */
  // TODO: Remove similar implementation in others unit tests
  @Before
  public void initSettings() {
    SettingsProvider settingsProvider = new SettingsProvider();

    configurationSettingsStorable =
        new ConfigurationSettingsStorable(PROFILE_NAME, Arrays.asList(DSNAME_1, DSNAME_2));

    settingsProvider.set(configurationSettingsStorable);
    when(configurationSettingsProvider.get()).thenReturn(settingsProvider);
  }

  // TODO: Should be renamed as a builder and moved to the @Before
  // routine the initialize structures
  protected List<WorkspaceFolder> initWorkspaceFolderList() {
    initWorkspaceFolderStructure();
    initCopybooksWithProfileAndDataset(copybooksPath, configurationSettingsProvider.get());
    initDepFileStructure();

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(String.valueOf(getWorkspaceFolderPath().toUri()));
    return Collections.singletonList(workspaceFolder);
  }

  private void initWorkspaceFolderStructure() {
    workspaceFolder =
        createFolderStructure(Paths.get(System.getProperty("java.io.tmpdir"), "WORKSPACE"));
    // generate the path where to store copybooks
    copybooksPath = Paths.get(workspaceFolder + filesystemSeparator() + ".copybooks");
  }

  private void initDepFileStructure() {
    Path cobdepFolder = Paths.get(workspaceFolder + filesystemSeparator() + ".cobdeps");

    if (workspaceFolder != null) {
      Path dependencyFolderPath = createFolderStructure(cobdepFolder);
      generateDummyContentForFile(copybooksPath, CPY_INNER_FILE_NAME_WITH_EXT, COPYBOOK_CONTENT);

      generateDummyContentForFile(
          Paths.get(String.valueOf(dependencyFolderPath)),
          DEP_FILE_COST_NAME + ".dep",
          CPY_OUTER_NAME_ONLY2);
    }
  }

  private void initCopybooksWithProfileAndDataset(
      Path path, SettingsProvider configurationSettingsProvider) {
    ConfigurationSettingsStorable configSettings = configurationSettingsProvider.get();

    String profile = (String) configSettings.getProfiles();
    List<String> targetDatasets = configSettings.getPaths();

    List<Path> retriviedPaths =
        targetDatasets.stream()
            .map(
                it ->
                    Paths.get(path + filesystemSeparator() + profile + filesystemSeparator() + it))
            .collect(Collectors.toList());

    retriviedPaths.forEach(this::createFolderStructure);
    retriviedPaths.forEach(
        targetPath ->
            generateDummyContentForFile(
                targetPath, CPY_INNER_FILE_NAME_WITH_EXT, COPYBOOK_CONTENT));
  }

  private Path createFolderStructure(Path copybooksPath) {
    try {
      return Files.createDirectories(copybooksPath);
    } catch (IOException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  protected Path getWorkspaceFolderPath() {
    return workspaceFolder;
  }

  protected String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  private void generateDummyContentForFile(
      Path targetDirectory, String filenameAndExtension, String content) {
    Path filePath;
    // check the folder exist if no create it
    if (!Files.exists(targetDirectory)) {
      try {
        Files.createDirectory(targetDirectory);
      } catch (IOException e) {
        log.error(e.getMessage() + "Cannot create forlder " + targetDirectory);
        return;
      }
    }

    // create the file
    try {
      filePath =
          Files.createFile(
              Paths.get(targetDirectory + filesystemSeparator() + filenameAndExtension));
    } catch (IOException e) {
      log.error(
          e.getMessage()
              + String.format(
                  "Failed create file  %s under folder %s" + filenameAndExtension,
                  targetDirectory.toString()));
      return;
    }

    writeContentOnFile(filePath, content);
  }

  private void writeContentOnFile(Path filePath, String content) {
    try {
      Files.write(filePath, (content + "\n").getBytes(), StandardOpenOption.APPEND);
    } catch (IOException e) {
      log.error("IO Exception on write" + e.getLocalizedMessage());
    }
  }
}
