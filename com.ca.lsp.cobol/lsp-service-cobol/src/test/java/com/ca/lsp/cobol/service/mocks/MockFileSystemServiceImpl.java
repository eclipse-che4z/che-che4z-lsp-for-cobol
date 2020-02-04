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
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.FileSystemService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.nio.file.FileSystems;
import java.util.List;

/**
 * This class is used to mock the actual behavior of {@link FileSystemService} by returning the
 * predefined values.
 */
@Singleton
@Slf4j
public class MockFileSystemServiceImpl
    implements MockFileSystemService, EventObserver<RequiredCopybookEvent> {
  public static final String SOMEPROG_DEP = "SOMEPROG.dep";
  @Setter private CopybooksMock copybooks;
  @Getter private final DefaultDataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;

  @Getter protected Waiter waiter = new Waiter();

  @Inject
  public MockFileSystemServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String name = event.getName();
    String content = getContentByCopybookName(event.getName());
    dataBus.postData(FetchedCopybookEvent.builder().name(name).uri(name).content(content).build());
  }

  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  @Override
  public String getContentByCopybookName(String copybookName) {
    return copybooks.getCopybooks().stream()
        .filter(
            it ->
                it.getFileName().equalsIgnoreCase(copybookName)
                    || it.getFileName().equalsIgnoreCase(copybookName + ".cpy"))
        .map(CobolText::getFullText)
        .findAny()
        .orElse(null);
  }
  //
  //  private Path getPathByCopybookName(String fileName) {
  //    try (Stream<Path> pathStream =
  //        Files.find(
  //            workspaceFoldersAsPathList().get(0),
  //            100,
  //            (path, basicFileAttributes) -> {
  //              File resFile = path.toFile();
  //              return resFile.isFile()
  //                  && !resFile.isDirectory()
  //                  && resFile.getName().contains(".")
  //                  && resFile
  //                      .getName()
  //                      .substring(0, resFile.getName().lastIndexOf('.'))
  //                      .equalsIgnoreCase(fileName);
  //            },
  //            FileVisitOption.FOLLOW_LINKS)) {
  //      return pathStream.findAny().orElse(null);
  //    } catch (IOException e) {
  //      log.error(Arrays.toString(e.getStackTrace()));
  //    }
  //    return null;
  //  }
  //
  private String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }
  //
  //  private void generateDummyContentForFile() {
  //    try {
  //      Files.write(depFilePath, "DSF".getBytes());
  //    } catch (IOException e) {
  //      log.error(e.getLocalizedMessage());
  //    }
  //  }
  //
  //  private List<Path> workspaceFoldersAsPathList() {
  //    return getWorkspaceFolders().stream()
  //        .map(this::getPathFromWorkspaceFolder)
  //        .collect(Collectors.toList());
  //  }
  //
  //  private Path getPathFromWorkspaceFolder(WorkspaceFolder it) {
  //    try {
  //      return Paths.get(new URI(it.getUri()));
  //    } catch (URISyntaxException e) {
  //      throw new IllegalArgumentException("Workspace URI not valid");
  //    }
  //  }
  //
  //  private String retrieveContentByPath(Path uriForFileName) {
  //    String content = null;
  //    try (Stream<String> stream = Files.lines(uriForFileName)) {
  //      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
  //    } catch (IOException e) {
  //      log.error(Arrays.toString(e.getStackTrace()));
  //    }
  //    return content;
  //  }
}
