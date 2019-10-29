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
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService, IDataBusObserver<DataEvent> {

  @Inject
  public CobolWorkspaceServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.CBLSCAN_EVENT, this);
  }


  private DefaultDataBusBroker dataBus;
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
  public List<Path> getCopybookPathsList() {
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
      e.printStackTrace();
    }
  }

  private void createFileAndPushInList(String uri) {
    try {
      copybookFileList.add(new File(new URI(uri)));
    } catch (URISyntaxException e) {
      e.printStackTrace();
    }
  }

  @Override
  public Stream<String> getContentByURI(String copybookName) {
    Path uriForFileName = getURIByFileName(copybookName);
    Stream<String> fileContent = null;

    try {
      fileContent = Files.lines(uriForFileName);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return fileContent;
  }

  @Override
  public void populateDatabus(String filename, Path Uri, String content) {
    CblFetchEvent fetchEventItem = CblFetchEvent.builder()
            .uri(Uri.toString())
            .name(filename)
            .content(content)
            .build();
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
      log.error(e.getMessage());
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
    if (!event.getEventType().equals(DataEventType.CBLSCAN_EVENT)){
      return;
    }
    CblScanEvent cblEvent = (CblScanEvent) event;
    String name = cblEvent.getName();
    Stream<String> content = getContentByURI(name);
    String stringContent = content.reduce((s1, s2) -> s1+"\r\n" + s2).orElse("");
    dataBus.postData(CblFetchEvent.builder().name(name).content(stringContent).build());
  }
}
