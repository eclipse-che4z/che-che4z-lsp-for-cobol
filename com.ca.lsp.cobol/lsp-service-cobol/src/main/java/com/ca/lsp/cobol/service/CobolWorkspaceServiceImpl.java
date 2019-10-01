/*
 * Copyright (c) 2019 Broadcom.
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
package com.ca.lsp.cobol.service;

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
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService {
  private static CobolWorkspaceServiceImpl INSTANCE = null;

  private static final String COPYBOOK_FOLDER_NAME = "COPYBOOKS";
  private static final String URI_FILE_SEPARATOR = "/";
  private List<File> copybookList = new ArrayList<>();

  private CobolWorkspaceServiceImpl() {}

  public static CobolWorkspaceServiceImpl getInstance() {
    if (INSTANCE == null) INSTANCE = new CobolWorkspaceServiceImpl();
    return INSTANCE;
  }

  /**
   * @param workspaceFolder is the folder sent from the client (represent the rootFolder of the
   *     workspace opened in the client)
   */
  private void createCopybookList(WorkspaceFolder workspaceFolder) {
    try (Stream<Path> copybookFoldersStream =
        Files.list(
            Paths.get(
                new URI(workspaceFolder.getUri() + URI_FILE_SEPARATOR + COPYBOOK_FOLDER_NAME)))) {
      copybookFoldersStream.map(Path::toFile).forEach(copybookList::add);
    } catch (URISyntaxException | IOException e) {
      log.error(e.getMessage());
    }
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
   * Search in a list of given URI paths the presence of copybooks
   *
   * @param workspaceFolders list of URI paths
   */
  void scanWorkspaceForCopybooks(List<WorkspaceFolder> workspaceFolders) {
    workspaceFolders.forEach(this::createCopybookList);
  }

  /** @return List of copybooks */
  public List<File> getCopybookList() {
    return copybookList;
  }
}
