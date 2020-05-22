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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.After;
import org.junit.Before;
import org.mockito.Mockito;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static org.mockito.Mockito.when;
import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;

/**
 * This class provide support methods for FileSystemService and doesn't test anything. More in
 * detail create the workspace folder in the user tmp folder with some copybooks and dependency file
 * there.
 */
@Slf4j
public class FileSystemConfiguration extends ConfigurableTest {
  protected static final String WORKSPACE_FOLDER_NAME = "test";
  protected static final String COBOL_FILE_DOCUMENT_URI = "file:///C:/Users/test/Test.cbl";
  protected static final String CPY_DOCUMENT_URI = "file:///C:/Users/test/CPYNEST.cpy";

  protected static final String PROFILE_NAME = "PRF11";
  protected static final String DSNAME_1 = "HLQLF01.DSNAME1";
  protected static final String DSNAME_2 = "HLQLF01.DSNAME2";
  protected static final String DSNAME_3 = "HLQLF02.DSNAME1";

  protected static final String CPY_NAME_WITHOUT_EXT = "copy2";
  protected static final String FULL_PATH = createFullPath(PROFILE_NAME, DSNAME_1);
  protected static final String FULL_PATH2 = createFullPath(PROFILE_NAME, DSNAME_2);
  protected static final String WRONG_PATH = createFullPath(PROFILE_NAME, DSNAME_3);
  protected static final String COPYBOOK_NOT_PRESENT = "ANTHRCPY";
  protected static final String EMPTY_COPYBOOK_NAME = " ";
  protected static final String COBOL_FILE_NAME = "Test";
  protected static final String CPY_INNER_FILE_NAME_WITH_EXT = "copy2.cpy";
  public static final String CPYNEST_CPY = "CPYNEST.cpy";
  protected static final String DEP_FILE_COST_NAME = "SOMEPROG";
  protected static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";
  protected static final String NESTED_COPYBOOK_CONTENT = "000230 COPY CPYNEST2.";

  protected Path workspaceFolder = null;
  protected Path copybooksFolderPath = null;
  protected Path dependencyFileFolderPath = null;

  protected SettingsProvider settingsProvider = Mockito.mock(SettingsProvider.class);

  // this field represent the predefined setting used for test purposes
  protected ConfigurationSettingsStorable configurationSettingsStorable = null;
  /*
    STRUCTURE FOLDER USED FOR TEST PURPOSES
    ***************************************
    TEMP/
    └── WORKSPACE/
        └── .c4z
            └── .cobdeps
                ├── TEST.dep
                └── SOMEPROG.dep
                .copybooks
                ├── PROFILE_NAME/
                │   ├── HLQ.DSN.NAME1/
                │   │   └── copybook.cpy
                │   └── HLQ.DSN.NAME2/
                │       └── copybook.cpy
                └── copy2.cpy
    ***************************************
  */

  /**
   * This method initialize the filesystem and the settings configuration that will be used to test
   * the filesystem service capabilities using the physical filesystem
   */
  @Before
  public void buildTempFilesystem() {
    intializeSettings();

    createWorkspaceFolderStructure();
    createCopybookFolders();
    createDependencyFolder();

    // populate copybook folder and dependency file with some content
    createCopybookFiles();
    createDependencyFile();
  }

  @After
  public void cleanupTempFilesystem() {
    try {
      deleteFolders();
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }

  private void deleteFolders() throws IOException {
    Files.walk(getWorkspaceFolderPath())
        .sorted(Comparator.reverseOrder())
        .map(Path::toFile)
        .forEach(File::delete);
  }

  /**
   * This method define the steps necessary to emulate the json settings provided by the user in the
   * settings.json
   */
  private void intializeSettings() {
    configurationSettingsStorable =
        new ConfigurationSettingsStorable(
            Collections.unmodifiableList(Arrays.asList(FULL_PATH, FULL_PATH2)));

    settingsProvider.set(configurationSettingsStorable);
    when(settingsProvider.get()).thenReturn(configurationSettingsStorable);
  }

  protected static String createFullPath(String profile, String dataset) {
    return filesystemSeparator() + profile + filesystemSeparator() + dataset;
  }

  protected List<WorkspaceFolder> createWorkspaceFolders() {
    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(String.valueOf(getWorkspaceFolderPath().toUri()));
    return Collections.singletonList(workspaceFolder);
  }

  protected void createWorkspaceFolderStructure() {
    workspaceFolder = createFolders(Paths.get(System.getProperty("java.io.tmpdir"), WORKSPACE_FOLDER));
  }

  private void createCopybookFolders() {
    copybooksFolderPath =  createFolders(Paths.get(getCopybookFolderPath(workspaceFolder.toString()).toString()));

    createFoldersFromDatasetSettings();
  }

  private void createFoldersFromDatasetSettings() {
    List<Path> datasetPathList = getPathListFromSettings();
    datasetPathList.forEach(this::createFolders);
  }

  protected void createDependencyFolder() {
    dependencyFileFolderPath =
        createFolders(Paths.get(getCobolDependencyFolderPath(workspaceFolder.toString()).toString()));
  }

  private void createDependencyFile() {
    writeContentOnFile(
        createFile(dependencyFileFolderPath, DEP_FILE_COST_NAME + DEP_EXTENSION), CPY_NAME_WITHOUT_EXT);
  }

  private void createCopybookFiles() {
    getPathListFromSettings()
        .forEach(
            targetPath ->
                writeContentOnFile(
                    createFile(targetPath, CPY_INNER_FILE_NAME_WITH_EXT), COPYBOOK_CONTENT));
  }

  private List<Path> getPathListFromSettings() {
    ConfigurationSettingsStorable configSettings = settingsProvider.get();

    List<String> targetDatasets = configSettings.getPaths();

    return targetDatasets.stream()
        .map(it -> Paths.get(copybooksFolderPath + it))
        .collect(Collectors.toList());
  }

  private Path createFolders(Path copybooksPath) {
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


  private Path createFile(Path targetDirectory, String filenameAndExtension) {
    try {
      return Files.createFile(
          Paths.get(targetDirectory + filesystemSeparator() + filenameAndExtension));
    } catch (IOException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  private void writeContentOnFile(Path filePath, String content) {
    try {
      Files.write(filePath, (content + "\n").getBytes(), StandardOpenOption.APPEND);
    } catch (IOException e) {
      log.error(e.getMessage());
    }
  }
}
