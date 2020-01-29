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

import javax.annotation.Nonnull;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Slf4j
public class FileSystemTestImpl extends ConfigurableTest {
  protected static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";
  protected static final String WORKSPACE_FOLDER_NAME = "test";
  protected static final String WS_FOLDER_NAME = "WORKSPACE";
  protected static final String CPYB_FOLDER_NAME = "COPYBOOKS";
  protected static final String CPYB_INNER_NAME = "INNER";
  protected static final String CPY_OUTER_NAME_ONLY2 = "copy2";

  protected static final String CPY_OUTER_FILE_NAME_WITH_EXT = "copy.cpy";
  protected static final String CPY_OUTER_ANOTHER_FILE_NAME_WITH_EXT = "copy3.out";
  protected static final String CPY_INNER_FILE_NAME_WITH_EXT = "copy2.cpy";
  protected static final String DEP_FILE_COST_NAME = "SOMEPROG";
  private URI workspaceFolderPath = null;
  private Path innerCopybooksPath = null;
  protected Path workspacePath = createPathOfName(WS_FOLDER_NAME, Optional.empty());

  /*
  STRUCTURE FOLDER USED FOR TEST PURPOSES
  ***************************************
  TEMP/
  └── WORKSPACE/
      ├── .cobdeps
      │   └── SOMEPROG.dep
      └─── COPYBOOKS
          ├── INNER/
          │   └── copy2.cpy
          ├── copy3.out
          └── copy.cpy
  ***************************************
  */

  protected List<WorkspaceFolder> initWorkspaceFolderList() {
    Path copybooksPath = createPathOfName(CPYB_FOLDER_NAME, Optional.of(workspacePath));
    Path cpyFilePath = createPathOfName(CPY_OUTER_FILE_NAME_WITH_EXT, Optional.of(copybooksPath));
    Path anotherCpyFilePath =
        createPathOfName(CPY_OUTER_ANOTHER_FILE_NAME_WITH_EXT, Optional.of(copybooksPath));
    innerCopybooksPath = createPathOfName(CPYB_INNER_NAME, Optional.of(copybooksPath));

    // create two cpy files
    createTempDirAndFile(workspacePath, copybooksPath, cpyFilePath, anotherCpyFilePath);
    createInnerFolderAndFile(
        copybooksPath,
        createPathOfName(CPY_INNER_FILE_NAME_WITH_EXT, Optional.of(innerCopybooksPath)));

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(adjustURI(getWorkspaceFolderPath().toString()));
    setWorkspaceFolderPath(workspacePath.toUri());

    return Collections.singletonList(workspaceFolder);
  }

  protected URI getWorkspaceFolderPath() {
    return workspaceFolderPath;
  }

  private void setWorkspaceFolderPath(URI workspaceFolderPath) {
    this.workspaceFolderPath = workspaceFolderPath;
  }

  /*
  Remove the last slash from the URI path in order to replicate the behaviour of the client IDE that send to the server
  the path of the opened workspace without the last slash.
   */
  private String adjustURI(String originalUri) {
    return originalUri.substring(0, originalUri.length() - 1);
  }

  @Nonnull
  private Path createPathOfName(String folderName, Optional<Path> parentFolder) {

    // creck if the workspace folder already exists (parent folder)..
    return parentFolder
        .map(
            path ->
                Paths.get(parentFolder.get() + System.getProperty("file.separator") + folderName))
        .orElseGet(
            () ->
                Paths.get(
                    System.getProperty("java.io.tmpdir")
                        + System.getProperty("file.separator")
                        + folderName));
  }

  // util methods to create dummy cobol code inside copybook file
  private void createInnerFolderAndFile(Path parentFolder, Path copybookFile) {
    try {
      // create parent folder
      if (Files.exists(parentFolder)) {
        if (!Files.exists(copybookFile)) {
          Files.createDirectory(innerCopybooksPath);
          // create file into it
          Path copybookFilePath = Files.createFile(copybookFile);
          generateDummyContentForFile(copybookFilePath);
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void createTempDirAndFile(
      Path workspacePath, Path copybookFolderPath, Path cpyFilePath, Path anotherCpyFilePath) {
    try {
      if (!Files.exists(workspacePath)) {
        Files.createDirectory(workspacePath);
        if (!Files.exists(copybookFolderPath)) {
          Files.createDirectory(copybookFolderPath);
        }
      }

    } catch (IOException e) {
      e.printStackTrace();
    }
    setWorkspaceFolderPath(workspacePath.toUri());
  }

  private void generateDummyContentForFile(Path copybookFilePath) {
    File copybookFile = copybookFilePath.toFile();
    FileOutputStream fileOutputStream;
    try {
      fileOutputStream = new FileOutputStream(copybookFile, true);
      BufferedOutputStream bufferedOutputStream =
          new BufferedOutputStream(fileOutputStream, 128 * 100);
      bufferedOutputStream.write(COPYBOOK_CONTENT.getBytes());
      bufferedOutputStream.flush();
      fileOutputStream.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
