package com.ca.lsp.cobol.service;

import static junit.framework.TestCase.assertEquals;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.junit.Before;
import org.junit.Test;

public class WorkspaceServiceTest {
  private static final String FOLDER_NAME = "test";
  private Path workspaceFolderPath = null;
  private List<WorkspaceFolder> workspaceFolderList = new ArrayList<>();

  private CobolWorkspaceServiceImpl cobolWorkspaceService = new CobolWorkspaceServiceImpl();

  @Before
  public void scanWorkspaceForCopybooks() {
    createTempDirAndFile();

    WorkspaceFolder workspaceFolder = new WorkspaceFolder();
    workspaceFolder.setName(FOLDER_NAME);
    workspaceFolder.setUri(getWorkspaceFolderPath().toUri().toString());
    workspaceFolderList.add(workspaceFolder);
    cobolWorkspaceService.scanWorkspaceForCopybooks(workspaceFolderList);
  }

  @Test
  public void getCopyBookList() {
    assertEquals(cobolWorkspaceService.getCopybookList().size(), 1);
    removeAllCopybooksFilesAtShutdown(getWorkspaceFolderPath().toAbsolutePath().toString());
  }

  private void removeAllCopybooksFilesAtShutdown(String dir) {
    try {
      System.out.println(dir);
      Files.walk(Paths.get(dir))
          .sorted(Comparator.reverseOrder())
          .map(Path::toFile)
          .forEach(File::delete);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void createTempDirAndFile() {
    try {

      Path parentTempDir =
          Files.createDirectory(Paths.get(System.getProperty("java.io.tmpdir") + "cpyfolderRoot"));

      Path copyBookTempDir =
          Files.createDirectory(
              Paths.get(
                  parentTempDir.toAbsolutePath()
                      + System.getProperty("file.separator")
                      + "COPYBOOKS"));

      Path tempFile =
          Files.createFile(
              Paths.get(
                  copyBookTempDir.toAbsolutePath()
                      + System.getProperty("file.separator")
                      + "test.cpy"));

      // Path tempFile = Files.createFile(copyBookTempDir, "COPYBOOK", ".cpy");
      setWorkspaceFolderPath(parentTempDir.toAbsolutePath());

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private Path getWorkspaceFolderPath() {
    return workspaceFolderPath;
  }

  private void setWorkspaceFolderPath(Path workspaceFolderPath) {
    this.workspaceFolderPath = workspaceFolderPath;
  }
}
