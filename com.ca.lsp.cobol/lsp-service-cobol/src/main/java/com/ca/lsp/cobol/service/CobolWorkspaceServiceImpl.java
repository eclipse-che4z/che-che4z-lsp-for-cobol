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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CblFetchEvent;
import com.broadcom.lsp.domain.cobol.model.CblScanEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.FileVisitOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Stream;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService {
  private final ExecutorService threadPool;
  private final DefaultDataBusBroker<CblFetchEvent, CblScanEvent> dataBus;
  private List<WorkspaceFolder> workspaceFolders;

  @Inject
  public CobolWorkspaceServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.CBLSCAN_EVENT, this);

    // create a thread pool fixed
    threadPool = Executors.newCachedThreadPool();
  }

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
   * @param copybookName (i.e. COPYTEST)
   * @return String that represent the content of a found copybook under the workspace folder or
   *     null if copybook is not found
   */
  @Override
  public String getContentByCopybookName(String copybookName) {
    Path uriForFileName;
    return (uriForFileName = getURIByCopybookName(copybookName)) != null
        ? getContentFromCopybook(uriForFileName)
        : null;
  }

  /**
   * From a given copybook name (without file extension) this method will return the URI of the file
   * * - if exists
   *
   * @param fileName (i.e. COPYTEST)
   * @return URI of file (i.e. file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy) or *
   *     null if didn't found. This case should be covered by an appropriate diagnostic message *
   *     using the Communication service delegate object
   */
  @Override
  public Path getURIByCopybookName(String fileName) {
    return getWorkspaceFolders().stream()
        .map(workspaceFolder -> searchCopybookInWorkspaceFolder(fileName, workspaceFolder))
        .findAny()
        .orElse(null);
  }

  /**
   * Store the informations about the workspace folder defined by the client IDE
   *
   * @param workspaceFolders list of workspace folders sent by the client to the server
   */
  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(CblScanEvent event) {
    threadPool.submit(
        () -> {
          String name = event.getName();
          String content;
          content = getContentByCopybookName(name);
          dataBus.postData(CblFetchEvent.builder().name(name).content(content).build());
        });
  }

  /**
   * @param uriForFileName of copybook found under workspace folder
   * @return content of the file as String content
   */
  @Nullable
  private String getContentFromCopybook(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return content;
  }

  /**
   * @param fileName name provided by preprocessor
   * @param workspaceFolder NIO Path of workspace folder
   * @return a valid path of the copybook file or null if not found
   */
  @Nullable
  private Path searchCopybookInWorkspaceFolder(String fileName, WorkspaceFolder workspaceFolder) {
    Path result = null;
    try {
      result = searchInDirectory(fileName, Paths.get(new URI(workspaceFolder.getUri())));
    } catch (URISyntaxException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return result;
  }

  /**
   * Delegated method to search in directory
   *
   * @param fileName name provided by preprocessor
   * @param workspaceFolderPath NIO Path of workspace folder
   * @return a valid path of the copybook file or null if not found
   */
  private Path searchInDirectory(String fileName, Path workspaceFolderPath) {
    Path pathFileFound = null;
    try (Stream<Path> stream =
        Files.find(
            workspaceFolderPath,
            100,
            (path, basicFileAttributes) -> {
              File resFile = path.toFile();
              return resFile.isFile()
                  && !resFile.isDirectory()
                  && resFile.getName().toLowerCase().contains(fileName.toLowerCase());
            },
            FileVisitOption.FOLLOW_LINKS)) {
      pathFileFound = stream.findFirst().orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return pathFileFound;
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }
}
