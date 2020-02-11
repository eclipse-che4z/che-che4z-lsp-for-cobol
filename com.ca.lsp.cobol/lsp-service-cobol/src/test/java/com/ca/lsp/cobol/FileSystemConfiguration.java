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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;

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
  public static final String PROFILE_NAME = "CA11";
  public static final String DS_NAME = "ZACAN01.DSNAME1";

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
          │   └── HLQ.DSN.NAME/
          │       └── copybook.cpy
          └── copy2.cpy
  ***************************************
  */

  //  private Path copybooksPath =
  //          Paths.get(System.getProperty("java.io.tmpdir"), "WORKSPACE", ".copybooks");
  private Path dependencyFolderPath = null;
  private Path workspaceFolder = null;

  protected List<WorkspaceFolder> initWorkspaceFolderList() {
    // initialize workspace folder
    workspaceFolder =
        createFolderStructure(Paths.get(System.getProperty("java.io.tmpdir"), "WORKSPACE"));

    // initialize depfile structure
    if (workspaceFolder != null) {
      dependencyFolderPath =
          createFolderStructure(Paths.get(workspaceFolder.toString(), PROFILE_NAME, DS_NAME));

      generateDummyContentForFile(
          Paths.get(workspaceFolder + filesystemSeparator() + ".copybooks"));

      generateDummyContentForFile(
          Paths.get(dependencyFolderPath + filesystemSeparator() + DEP_FILE_COST_NAME + ".dep"));
    }

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(String.valueOf(getWorkspaceFolderPath().toUri()));
    // setWorkspaceFolderPath(this.workspaceFolder.toUri());

    return Collections.singletonList(workspaceFolder);
  }

  private Path createFolderStructure(Path copybooksPath) {
    try {
      return Files.createDirectories(copybooksPath);
    } catch (IOException e) {
      log.error(e.getMessage());
      return null;
    }
  }

  // TODO: convert uri to path..
  protected Path getWorkspaceFolderPath() {
    return workspaceFolder;
  }

  protected String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  private void generateDummyContentForFile(Path copybookFolderPath) {
    Path copybookFile = null;
    // create the file if doesn't exists
    if (!Files.exists(copybookFolderPath)) {
      try {
        Files.createDirectory(copybookFolderPath);

        copybookFile =
            Files.createFile(
                Paths.get(
                    copybookFolderPath + filesystemSeparator() + CPY_INNER_FILE_NAME_WITH_EXT));
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    if (copybookFile != null) {
      File file = copybookFile.toFile();
      FileOutputStream fileOutputStream;
      try {
        fileOutputStream = new FileOutputStream(file, true);
        BufferedOutputStream bufferedOutputStream =
            new BufferedOutputStream(fileOutputStream, 128 * 100);
        bufferedOutputStream.write(COPYBOOK_CONTENT.getBytes());
        bufferedOutputStream.flush();
        fileOutputStream.close();
      } catch (IOException e) {
        log.error(e.getMessage());
      }
    }
  }
}
