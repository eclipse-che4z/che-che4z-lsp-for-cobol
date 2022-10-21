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

import static java.util.Collections.singleton;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_EXTENSIONS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.WorkspaceFolder;

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
  private Set<CopybookName> listOfCopybookNames;
  private Set<String> listOfCopybookFolders;

  private static final String CPY_DOWNLOAD_FOLDER_PATH = ".c4z/.copybooks";

  @Inject
  public CopybookNameServiceImpl(
      final SettingsService settingsService,
      final FileSystemService files,
      final Provider<CobolLanguageClient> clientProvider) {
    this.settingsService = settingsService;
    this.files = files;
    this.clientProvider = clientProvider;
    this.listOfCopybookFolders = singleton(CPY_DOWNLOAD_FOLDER_PATH);
    this.listOfCopybookNames = new HashSet<>();
  }

  @Override
  public List<CopybookName> getNames() {
    return ImmutableList.copyOf(listOfCopybookNames);
  }

  @Override
  public Optional<CopybookName> findByName(final String displayName) {
    return listOfCopybookNames.stream()
        .filter(copybookName -> displayName.equalsIgnoreCase(copybookName.getDisplayName()))
        .findAny();
  }

  @Override
  public CompletableFuture<List<String>> copybookLocalFolders() {
    List<CompletableFuture<List<String>>> copybookLocalFolders = new ArrayList<>();
    copybookLocalFolders.add(settingsService.fetchTextConfiguration(CPY_LOCAL_PATHS.label));
    return settingsService.fetchTextConfiguration(DIALECTS.label)
        .thenAccept(
            dialects -> dialects.forEach(dialect -> copybookLocalFolders.add(
                settingsService.fetchTextConfiguration(
                    String.format("cpy-manager.%s.paths-local", dialect.toLowerCase())))))
        .thenCompose(
            c -> CompletableFuture.allOf(copybookLocalFolders.toArray(new CompletableFuture<?>[0]))
                .thenApply(v -> copybookLocalFolders.stream()
                    .map(CompletableFuture::join)
                    .flatMap(List::stream)
                    .collect(Collectors.toList())
                ));
  }

  @Override
  public void collectLocalCopybookNames() {
    listOfCopybookNames = new HashSet<>();
    CompletableFuture<List<WorkspaceFolder>> copybookWorkspaces = clientProvider.get()
        .workspaceFolders();
    CompletableFuture<List<String>> copybooksExtensions = settingsService.fetchTextConfiguration(
        CPY_EXTENSIONS.label);
    CompletableFuture<List<String>> copybookLocalFolders = copybookLocalFolders();
    CompletableFuture.allOf(copybookLocalFolders, copybookWorkspaces, copybooksExtensions)
        .thenAccept(
            (aVoid) -> resolveNames(
                copybookWorkspaces.join(),
                copybookLocalFolders.join(),
                copybooksExtensions.join()));
  }

  private void resolveNames(
      final List<WorkspaceFolder> workspaceFolderList,
      final List<String> copybookFolders,
      final List<String> copybookExtensions) {
    List<String> copybookExtensionsWithoutDot = copybookExtensions.stream()
        .map(extension -> extension.replaceFirst("\\.", ""))
        .collect(Collectors.toList());
    Set<String> copybookExtensionsWithoutDotAsSet = new HashSet<>(copybookExtensionsWithoutDot);
    listOfCopybookFolders = Stream.concat(copybookFolders.stream(),
            Stream.of(CPY_DOWNLOAD_FOLDER_PATH))
        .collect(Collectors.toSet());
    listOfCopybookFolders.addAll(copybookFolders);
    listOfCopybookNames = ImmutableSet.copyOf(
        copybookFolders.stream()
            .map(copybookFolder -> listExistedFiles(workspaceFolderList, copybookFolder))
            .flatMap(List::stream)
            .map(nameAndExtension -> nameAndExtension.split("\\."))
            .map(nameAndExtension -> CopybookName
                .builder()
                .displayName(nameAndExtension[0])
                .extension(nameAndExtension.length == 1 ? "" : nameAndExtension[1])
                .build())
            .filter(copybookName -> copybookExtensionsWithoutDotAsSet.contains(
                copybookName.getExtension()))
            .collect(Collectors.toMap(
                CopybookName::getDisplayName,
                Function.identity(),
                (existing, replacement) ->
                    copybookExtensionsWithoutDot.indexOf(existing.getExtension())
                        < copybookExtensionsWithoutDot.indexOf(replacement.getExtension())
                        ? existing : replacement

            )).values());
  }

  private List<String> listExistedFiles(
      final List<WorkspaceFolder> workspaces,
      final String copybookPath) {
    return workspaces.stream()
        .map(workspace -> files.getPathFromURI(workspace.getUri()))
        .map(workspacePath -> {
          String copybookFinalPath = Paths.get(copybookPath.replace("*", "tmp")).isAbsolute() ? copybookPath
              : String.join("/",
                  Optional.ofNullable(workspacePath)
                      .orElseThrow(IllegalArgumentException::new)
                          .toString(), copybookPath);
          return files.listFilesInDirectory(copybookFinalPath);
        })
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }
}
