/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Collections.unmodifiableList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_EXTENSIONS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_LOCAL_PATHS;

/**
 * This service processes all the copybook names present in the local directory. The service also
 * caches copybook to reduce filesystem load.
 */
@Slf4j
@Singleton
public class CopybookNameServiceImpl implements CopybookNameService {

  private final FileSystemService files;
  private final Provider<CobolLanguageClient> clientProvider;
  private final SettingsService settingsService;
  private List<String> listOfCopybookNames;

  @Inject
  public CopybookNameServiceImpl(
      SettingsService settingsService,
      FileSystemService files,
      Provider<CobolLanguageClient> clientProvider) {
    this.settingsService = settingsService;
    this.files = files;
    this.clientProvider = clientProvider;
    this.listOfCopybookNames = new ArrayList<>();
  }

  @Override
  public List<String> getNames() {
    return listOfCopybookNames;
  }

  @Override
  public void collectLocalCopybookNames() {

    CompletableFuture<List<WorkspaceFolder>> copybookWorkspaces = clientProvider.get()
        .workspaceFolders();
    CompletableFuture<List<String>> copybookLocalFolders = settingsService.getTextConfiguration(
        CPY_LOCAL_PATHS.label);
    CompletableFuture<List<String>> copybooksExtensions = settingsService.getTextConfiguration(
        CPY_EXTENSIONS.label);

    CompletableFuture.allOf(copybookWorkspaces, copybookLocalFolders, copybooksExtensions).join();

    resolveNames(copybookWorkspaces.join(), copybookLocalFolders.join(),
        new HashSet<>(copybooksExtensions.join()));
  }

  private void resolveNames(
      List<WorkspaceFolder> workspaceFolderList, List<String> copybookFolders,
      Set<String> copybookExtensions) {
    listOfCopybookNames =
        unmodifiableList(
            copybookFolders.stream()
                .map(copybookFolder -> listExistedFiles(workspaceFolderList, copybookFolder))
                .flatMap(List::stream)
                .map(nameAndExtension -> nameAndExtension.split("\\."))
                .filter(nameAndExtension -> copybookExtensions.contains(nameAndExtension[1]))
                .map(nameAndExtension -> nameAndExtension[0])
                .collect(Collectors.toList()));
  }

  private List<String> listExistedFiles(List<WorkspaceFolder> workspace, String fileName) {
    return workspace.stream()
        .map(
            path ->
                files
                    .getPathFromURI(files.decodeURI(path.getUri()))
                    .resolve(files.decodeURI(fileName)))
        .filter(files::fileExists)
        .map(files::listFilesInDirectory)
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }
}
