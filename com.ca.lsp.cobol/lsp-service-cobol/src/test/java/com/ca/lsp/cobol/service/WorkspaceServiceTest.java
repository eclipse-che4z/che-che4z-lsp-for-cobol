/*
 * Copyright (c) 2019 Broadcom.
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
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.cdi.module.service.ServiceModule;
import com.broadcom.lsp.domain.cobol.model.CblFetchEvent;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.jetbrains.annotations.NotNull;
import org.junit.*;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import static junit.framework.TestCase.*;

@Slf4j
public class WorkspaceServiceTest {
  private static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private static final String WORKSPACE_FOLDER_NAME = "test";
  private static final String WS_FOLDER_NAME = "WORKSPACE";
  private static final String CPYB_FOLDER_NAME = "COPYBOOKS";
  private static final String CPYB_INNER_NAME = "INNER";

  private static final String CPY_OUTER_NAME_ONLY = "copy";
  private static final String CPY_OUTER_FILE_NAME_WITH_EXT = "copy.cpy";
  private static final String CPY_INNER_FILE_NAME_WITH_EXT = "copy2.cpy";

  private URI workspaceFolderPath = null;
  private Path innerCopybooksPath = null;
  private static CobolWorkspaceServiceImpl cobolWorkspaceService;

  @BeforeClass
  public static void setUp() {
    cobolWorkspaceService =
        LangServerCtx.getGuiceCtx(new ServiceModule(), new DatabusModule())
            .getInjector()
            .getInstance(CobolWorkspaceServiceImpl.class);
  }

  @AfterClass
  public static void tearDown() {
    LangServerCtx.shutdown();
  }

  // Activities performed
  // 1 - Create folder structure in temp folder - Create two copybooks in the provided structure
  // 2 - Create two copybooks in the provided structure
  // 3 - Initialize the workspaceFolder to reproduce what client does when a new workspace is opened
  //     on the IDE
  // 4 - Initialize the list of workspaces (workspace roots) that WorkspaceManager should have to
  //     apply search operations
  @Before
  public void initActivities() {
    /*
    CREATE THREE FOLDER WITH THIS STRUCTURE
    ***************************************
    TEMP/
    ├── WORKSPACE/
        ├── INNER/
        │   └── copy2.cpy
        └── copy.cpy
    ***************************************
    */
    Path workspacePath = createPathOfName(WS_FOLDER_NAME, Optional.empty());
    Path copybooksPath = createPathOfName(CPYB_FOLDER_NAME, Optional.of(workspacePath));
    Path cpyFilePath = createPathOfName(CPY_OUTER_FILE_NAME_WITH_EXT, Optional.of(copybooksPath));
    innerCopybooksPath = createPathOfName(CPYB_INNER_NAME, Optional.of(copybooksPath));

    // create two cpy files
    createTempDirAndFile(workspacePath, copybooksPath, cpyFilePath);
    createInnerFolderAndFile(
        copybooksPath,
        createPathOfName(CPY_INNER_FILE_NAME_WITH_EXT, Optional.of(innerCopybooksPath)));

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(adjustURI(getWorkspaceFolderPath().toString()));
    List<WorkspaceFolder> workspaceFolderList = Collections.singletonList(workspaceFolder);
    cobolWorkspaceService.setWorkspaceFolders(workspaceFolderList);
  }

  @After
  public void cleanupTempFolder() {
    try {
      Files.walk(Paths.get(getWorkspaceFolderPath()))
          .sorted(Comparator.reverseOrder())
          .map(Path::toFile)
          .forEach(File::delete);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /*
   * This test take in input a copybook name, retrieve the URI of the file (if it exists) and in case affermative return the
   * content, null otherwise.
   */
  @Test
  public void getContentByCopybookName() {
    assertTrue(cobolWorkspaceService.getContentByCopybookName(CPY_OUTER_NAME_ONLY).length() > 0);
  }

  @Test
  public void getNullWithNotCopybookNotFound() {
    assertNull(cobolWorkspaceService.getContentByCopybookName("ANTHR_CPY"));
  }

  @Test
  public void testGetUriByCopyBookName() {
    assertNotNull(cobolWorkspaceService.getURIByCopybookName(CPY_OUTER_NAME_ONLY));
  }

  @Test
  public void testDataSentOnDatabus() {
    String copybookContent = cobolWorkspaceService.getContentByCopybookName(CPY_OUTER_NAME_ONLY);
    CblFetchEvent cblFetchEvent =
        CblFetchEvent.builder().name(CPY_OUTER_NAME_ONLY).content(copybookContent).build();
    assertTrue(cblFetchEvent.getName().length() > 0 && cblFetchEvent.getContent().length() > 0);
  }

  private URI getWorkspaceFolderPath() {
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

  @NotNull
  private Path createPathOfName(String folderName, Optional<Path> parentFolder) {

    // creck if the workspace folder already exists (parent folder)..
    // Path adjustedPath = adjustIfFolderAlreadyExists(parentFolder.orElse(null));

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
        Files.createDirectory(innerCopybooksPath);
        // create file into it
        Path copybookFilePath = Files.createFile(copybookFile);
        generateDummyContentForFile(copybookFilePath);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void createTempDirAndFile(Path workspacePath, Path copybookFolderPath, Path cpyFilePath) {
    try {
      if (!Files.exists(workspacePath)) {
        Files.createDirectory(workspacePath);
        if (!Files.exists(copybookFolderPath)) {
          Files.createDirectory(copybookFolderPath);
        }
      }
      if (!Files.exists(cpyFilePath)) {
        Path copybookFilePath = Files.createFile(cpyFilePath);
        generateDummyContentForFile(copybookFilePath);
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
