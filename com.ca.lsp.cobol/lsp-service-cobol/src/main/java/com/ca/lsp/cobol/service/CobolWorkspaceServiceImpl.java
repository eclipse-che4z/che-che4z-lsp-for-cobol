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

import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CblFetchEvent;
import com.broadcom.lsp.domain.cobol.model.CblScanEvent;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Stream;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl
    implements CobolWorkspaceService, IDataBusObserver<DataEvent> {
  private final ExecutorService threadPool;

  @Inject
  public CobolWorkspaceServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.CBLSCAN_EVENT, this);

    // create a thread pool fixed
    threadPool = Executors.newCachedThreadPool();
  }

  private final DefaultDataBusBroker dataBus;
  private static final String COPYBOOK_FOLDER_NAME = "COPYBOOKS";
  private static final String URI_FILE_SEPARATOR = "/";
  private List<Path> copybookPathsList;
  private final List<File> copybookFileList = new ArrayList<>();
  private List<WorkspaceFolder> workspaceFolders;
  private Path pathFileFound = null;

  @Override
  public CompletableFuture<List<? extends SymbolInformation>> symbol(WorkspaceSymbolParams params) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    throw new UnsupportedOperationException();
  }

  @Override
  public void didChangeWatchedFiles(DidChangeWatchedFilesParams params) {
    throw new UnsupportedOperationException();
  }

  /**
   * Search in a list of given URI paths the presence of copybooks in order to create a list of
   * files for each workspace folder found.
   *
   * @param workspaceFolders list of URI paths
   */
  void scanWorkspaceForCopybooks(List<WorkspaceFolder> workspaceFolders) {
    setWorkspaceFolders(workspaceFolders);
    getWorkspaceFolders().forEach(this::generateCopybookFileList);
  }

  /** @return List of copybooks */
  List<Path> getCopybookPathsList() {
    return copybookPathsList;
  }

  @Override
  public Path getURIByFileName(String fileName) {
    // define the list of file that will be used for the search
    getWorkspaceFolders()
        .forEach(
            workspaceFolder ->
                createFileAndPushInList(
                    workspaceFolder.getUri() + URI_FILE_SEPARATOR + COPYBOOK_FOLDER_NAME));

    copybookFileList.forEach(file -> searchInDirectory(fileName, file.toPath()));
    return pathFileFound;
  }

  private void searchInDirectory(String fileName, Path workspaceFolderPath) {
    try (Stream<Path> stream =
        Files.find(
            workspaceFolderPath,
            100,
            (path, basicFileAttributes) -> {
              File resFile = path.toFile();
              return resFile.isFile()
                  && !resFile.isDirectory()
                  && resFile.getName().contains(fileName);
            })) {
      stream.findFirst().ifPresent(path -> pathFileFound = path);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
  }

  private void createFileAndPushInList(String uri) {
    try {
      copybookFileList.add(new File(new URI(uri)));
    } catch (URISyntaxException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
  }

  @Override
  public String getContentByURI(String copybookName) throws IOException {
    Path uriForFileName = getURIByFileName(copybookName);
    return Files.lines(uriForFileName).reduce((s1, s2) -> s1 + "\r\n" + s2).orElse("");
  }

  /**
   * Create a list of Files for each copybook found in a specific folder under the workspace
   *
   * @param workspaceFolder is the folder sent from the client (represent the rootFolder of the
   *     workspace opened in the client)
   */
  private void generateCopybookFileList(WorkspaceFolder workspaceFolder) {
    copybookPathsList = new ArrayList<>();
    try (Stream<Path> copybookFoldersStream =
        Files.list(
            Paths.get(
                new URI(workspaceFolder.getUri() + URI_FILE_SEPARATOR + COPYBOOK_FOLDER_NAME)))) {
      copybookFoldersStream.forEach(copybookPathsList::add);
    } catch (URISyntaxException | IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  @Override
  public void observerCallback(DataEvent event) {
    if (!event.getEventType().equals(DataEventType.CPYBUILD_EVENT)) {
      return;
    }

    // create the task and pass it to the executor service
    Runnable getContentTask =
        () -> {
          CblScanEvent cblEvent = (CblScanEvent) event;
          String name = cblEvent.getName();
          try {
            String content = getContentByURI(name);
            dataBus.postData(CblFetchEvent.builder().name(name).content(content).build());
          } catch (IOException e) {
            log.error(Arrays.toString(e.getStackTrace()));
          }
        };
    threadPool.submit(getContentTask);
  }
}
