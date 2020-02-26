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
 */
package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.FileSystemService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.*;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * This class is used to mock the actual behavior of {@link FileSystemService} by returning the
 * predefined values.
 */
@Singleton
@Slf4j
public class MockFileSystemService implements FileSystemService {
  public static final String SOMEPROG_DEP = "SOMEPROG.dep";
  @Setter private CopybooksMock copybooks;
  @Getter private final DefaultDataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;
  private Path depFolderPath = null;
  private Path depFilePath = null;

  @Getter protected Waiter waiter = new Waiter();

  @Inject
  // TODO: Get rid of this class
  public MockFileSystemService(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public String getContentByCopybookName(
      String copybookName, String profileName, List<String> datasetList) {
    Path path = getPathByCopybookName(copybookName);
    if (path != null) {
      return retrieveContentByPath(path);
    } else {
      return null;
    }
  }

  public void generateDependencyFile() throws URISyntaxException {

    Path cobdepsPath = Paths.get(cobdepsPath());

    log.info("Path for folder: " + cobdepsPath);

    if (!Files.exists(cobdepsPath)) {
      try {
        if (depFolderPath == null) {
          depFolderPath = Files.createDirectories(cobdepsPath);
          log.info(depFolderPath.toString());
        }

        if (depFolderPath.toFile().exists()) {
          depFilePath = Paths.get(depFolderPath + filesystemSeparator() + SOMEPROG_DEP);
          Files.createFile(Paths.get(depFolderPath + filesystemSeparator() + SOMEPROG_DEP));
          generateDummyContentForFile();
        }

      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  private String cobdepsPath() throws URISyntaxException {
    return Paths.get(new URI(getWorkspaceFolders().get(0).getUri()))
        + filesystemSeparator()
        + ".cobdeps"
        + filesystemSeparator();
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String name = event.getName();
    Path path = getPathByCopybookName(name);

    // if content is null I will update or  generate a dependency file
    if (path == null) {
      try {
        generateDependencyFile();
      } catch (URISyntaxException e) {
        e.printStackTrace();
      }
    }
    waiter.resume();
  }

  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  private Path getPathByCopybookName(String fileName) {
    try (Stream<Path> pathStream =
        Files.find(
            workspaceFoldersAsPathList().get(0),
            100,
            (path, basicFileAttributes) -> {
              File resFile = path.toFile();
              return resFile.isFile()
                  && !resFile.isDirectory()
                  && resFile.getName().contains(".")
                  && resFile
                      .getName()
                      .substring(0, resFile.getName().lastIndexOf('.'))
                      .equalsIgnoreCase(fileName);
            },
            FileVisitOption.FOLLOW_LINKS)) {
      return pathStream.findAny().orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return null;
  }

  private String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  private void generateDummyContentForFile() {
    try {
      Files.write(depFilePath, "DSF".getBytes());
    } catch (IOException e) {
      log.error(e.getLocalizedMessage());
    }
  }

  private List<Path> workspaceFoldersAsPathList() {
    return getWorkspaceFolders().stream()
        .map(this::getPathFromWorkspaceFolder)
        .collect(Collectors.toList());
  }

  private Path getPathFromWorkspaceFolder(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()));
    } catch (URISyntaxException e) {
      throw new IllegalArgumentException("Workspace URI not valid");
    }
  }

  private String retrieveContentByPath(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return content;
  }
}
