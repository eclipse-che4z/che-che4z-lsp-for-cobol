package com.ca.lsp.cobol.service;

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import static junit.framework.TestCase.assertEquals;

@Slf4j
public class WorkspaceServiceTest {
  private static final String FOLDER_NAME = "test";
  private URI workspaceFolderPath = null;
  private List<WorkspaceFolder> workspaceFolderList = new ArrayList<>();

  private CobolWorkspaceServiceImpl cobolWorkspaceService = new CobolWorkspaceServiceImpl();

  @Before
  public void scanWorkspaceForCopybooks() {
    createTempDirAndFile();

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(FOLDER_NAME);
    workspaceFolder.setUri(adjustURI(getWorkspaceFolderPath().toString()));
    workspaceFolderList.add(workspaceFolder);
    cobolWorkspaceService.scanWorkspaceForCopybooks(workspaceFolderList);
  }

  @Test
  public void getCopyBookList() {
    assertEquals(cobolWorkspaceService.getCopybookList().size(), 1);
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

  private void createTempDirAndFile() {
    Path workspacePath =
        Paths.get(
            System.getProperty("java.io.tmpdir")
                + System.getProperty("file.separator")
                + "WORKSPACE");

    Path copybooksPath =
        Paths.get(workspacePath + System.getProperty("file.separator") + "COPYBOOKS");

    try {
      if (!Files.exists(workspacePath)) {
        Files.createDirectory(workspacePath);
      }

      if (!Files.exists(copybooksPath)) {
        Files.createDirectory(copybooksPath);
      }

      Files.createFile(
          Paths.get(copybooksPath + System.getProperty("file.separator") + "copy.cpy"));
    } catch (IOException e) {
      e.printStackTrace();
    }

    setWorkspaceFolderPath(workspacePath.toUri());
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
