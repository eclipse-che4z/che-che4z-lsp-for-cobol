package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.model.CblFetchEvent;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

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
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;

@Slf4j
public class WorkspaceServiceTest {
  private static final String WORKSPACE_FOLDER_NAME = "test";
  private static final String CPY_FILE_NAME_WITH_EXT = "copy.cpy";
  private static final String CPY_FILE_ONLY_NAME = "copy";

  private static final String COPYBOOK_CONTENT =
      "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private URI workspaceFolderPath = null;
  private final CobolWorkspaceServiceImpl cobolWorkspaceService =
      CobolWorkspaceServiceImpl.getInstance();
  private List<WorkspaceFolder> workspaceFolderList = null;

  @Before
  public void scanWorkspaceForCopybooks() {
    Path workspacePath =
        Paths.get(
            System.getProperty("java.io.tmpdir")
                + System.getProperty("file.separator")
                + "WORKSPACE");
    Path copybooksPath =
        Paths.get(workspacePath + System.getProperty("file.separator") + "COPYBOOKS");
    Path cpyFilePath =
        Paths.get(copybooksPath + System.getProperty("file.separator") + CPY_FILE_NAME_WITH_EXT);

    createTempDirAndFile(workspacePath, copybooksPath, cpyFilePath);
    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(WORKSPACE_FOLDER_NAME);
    workspaceFolder.setUri(adjustURI(getWorkspaceFolderPath().toString()));
    workspaceFolderList = Collections.singletonList(workspaceFolder);
    cobolWorkspaceService.setWorkspaceFolders(workspaceFolderList);
  }

  /*
  This unit test verify that from a given workspaceFolder URI the WorkspaceManager is able to retrieve all the copybooks
  present in the COPYBOOK folder.
  In the real implementation this operation is expensive and not performed.
   */
  @Test
  public void getCopyBookList() {
    cobolWorkspaceService.scanWorkspaceForCopybooks(workspaceFolderList);
    assertEquals(1, cobolWorkspaceService.getCopybookPathsList().size());
  }

  @Test
  public void getUriByName() {
    assertTrue(
        cobolWorkspaceService.getURIByFileName(CPY_FILE_ONLY_NAME).toUri().toString().length() > 0);
  }

  /*
   * This test took in input a copybook name, retrieve the URI of the file (if it exists) and in case affermative return the
   * content, null otherwise.
   */
  @Test
  public void getContentByCopybookName() {
    assertTrue(cobolWorkspaceService.getContentByURI(CPY_FILE_ONLY_NAME).toArray().length > 0);
  }

  @Test
  public void fulfillDatabusAndCheckResult() {
    CblFetchEvent fetchEventItem = CblFetchEvent.builder().build();
    fetchEventItem.setName(CPY_FILE_ONLY_NAME);
    fetchEventItem.setUri(
        cobolWorkspaceService.getURIByFileName(CPY_FILE_ONLY_NAME).toUri().toString());
    Stream<String> contentStream = cobolWorkspaceService.getContentByURI(CPY_FILE_ONLY_NAME);
    fetchEventItem.setContent(contentStream.collect(Collectors.joining()));

    assertTrue(fetchEventItem.getUri().length() > 0 && fetchEventItem.getContent().length() > 0);
  }

  @After
  public void cleanupTempFolder() {
    removeAllCopybooksFilesAtShutdown(getWorkspaceFolderPath());
  }

  private void removeAllCopybooksFilesAtShutdown(URI outerDirectoryPath) {
    try {
      Files.walk(Paths.get(outerDirectoryPath))
          .sorted(Comparator.reverseOrder())
          .map(Path::toFile)
          .forEach(File::delete);

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void createTempDirAndFile(Path workspacePath, Path copybookFolderPath, Path cpyFilePath) {
    try {
      if (!Files.exists(workspacePath)) {
        Files.createDirectory(workspacePath);
      }

      if (!Files.exists(copybookFolderPath)) {
        Files.createDirectory(copybookFolderPath);
      }

      Path copybookFilePath = Files.createFile(cpyFilePath);
      generateDummyContentForFile(copybookFilePath);
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
}
