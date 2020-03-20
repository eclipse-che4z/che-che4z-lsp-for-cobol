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

/**
 * This class provide support methods for FileSystemService and doesn't test anything. More in
 * detail create the workspace folder in the user tmp folder with some copybooks and dependency file
 * there.
 */
@Slf4j
public class FileSystemConfiguration extends ConfigurableTest {
  protected static final String WORKSPACE_FOLDER_NAME = "test";
  protected static final String DOCUMENT_URI = "file:///C:/Users/test/Test.cbl";

  protected static final String PROFILE_NAME = "PRF11";
  protected static final String DSNAME_1 = "HLQLF01.DSNAME1";
  protected static final String DSNAME_2 = "HLQLF01.DSNAME2";

  protected static final String CPY_OUTER_NAME_ONLY2 = "copy2";
  protected static final String COPYBOOK_NOT_PRESENT = "ANTHRCPY";
  protected static final String EMPTY_COPYBOOK_NAME = " ";
  protected static final String CPY_INNER_FILE_NAME_WITH_EXT = "copy2.cpy";

  protected static final String DEP_FILE_COST_NAME = "SOMEPROG";
  protected static final String DEP_EXTENSION = ".dep";

  protected static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  protected static final String NESTED_COPYBOOK_CONTENT = "000230 COPY CPYNEST2.";

  protected Path workspaceFolder = null;
  protected Path copybooksFolderPath = null;
  protected Path depenencyFileFolderPath = null;

  protected SettingsProvider settingsProvider = Mockito.mock(SettingsProvider.class);

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
  */

  /**
   * This method initialize the filesystem and the settings configuration that will be used to test
   * the filesystem service capabilities using the physical filesystem
   */
  @Before
  public void buildTempFilesystem() {
    intializeSettingsWithSomeContent();

    createWorkspaceFolderStructure();
    createCopybookFolders();
    createDependencyFolder();

    createCopybookFiles();
    createNestedCopybooks();
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

  private void intializeSettingsWithSomeContent() {
    configurationSettingsStorable =
        new ConfigurationSettingsStorable(
            PROFILE_NAME, Collections.unmodifiableList(Arrays.asList(DSNAME_1, DSNAME_2)));

    settingsProvider.set(configurationSettingsStorable);
    when(settingsProvider.get()).thenReturn(configurationSettingsStorable);
  }

  protected List<WorkspaceFolder> createWorkspaceFolders() {
    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(String.valueOf(getWorkspaceFolderPath().toUri()));
    return Collections.singletonList(workspaceFolder);
  }

  protected void createWorkspaceFolderStructure() {
    workspaceFolder = createFolders(Paths.get(System.getProperty("java.io.tmpdir"), "WORKSPACE"));
  }

  private void createCopybookFolders() {
    copybooksFolderPath =
        createFolders(Paths.get(workspaceFolder + filesystemSeparator() + ".copybooks"));

    createFoldersFromDatasetSettings();
  }

  private void createFoldersFromDatasetSettings() {
    List<Path> datasetPathList = getPathListFromSettings();
    datasetPathList.forEach(this::createFolders);
  }

  protected void createDependencyFolder() {
    depenencyFileFolderPath =
        createFolders(Paths.get(workspaceFolder + filesystemSeparator() + ".cobdeps"));
  }

  private void createDependencyFile() {
    writeContentOnFile(
        createFile(depenencyFileFolderPath, DEP_FILE_COST_NAME + ".dep"), CPY_OUTER_NAME_ONLY2);
  }

  private void createCopybookFiles() {
    getPathListFromSettings()
        .forEach(
            targetPath ->
                writeContentOnFile(
                    createFile(targetPath, CPY_INNER_FILE_NAME_WITH_EXT), COPYBOOK_CONTENT));
  }

  private void createNestedCopybooks() {
    writeContentOnFile(createFile(copybooksFolderPath, "CBLNEST.cpy"), NESTED_COPYBOOK_CONTENT);
  }

  private List<Path> getPathListFromSettings() {
    ConfigurationSettingsStorable configSettings = settingsProvider.get();
    String profile = (String) configSettings.getProfiles();
    List<String> targetDatasets = configSettings.getPaths();

    return targetDatasets.stream()
        .map(
            it ->
                Paths.get(
                    copybooksFolderPath
                        + filesystemSeparator()
                        + profile
                        + filesystemSeparator()
                        + it))
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

  protected String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
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
