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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Collections.emptyList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_EXTENSIONS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;

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
  private List<String> listOfCopybookFolders;

  @Inject
  public CopybookNameServiceImpl(
      SettingsService settingsService,
      FileSystemService files,
      Provider<CobolLanguageClient> clientProvider) {
    this.settingsService = settingsService;
    this.files = files;
    this.clientProvider = clientProvider;
    this.listOfCopybookNames = new HashSet<>();
  }

  @Override
  public List<CopybookName> getNames() {
    return ImmutableList.copyOf(listOfCopybookNames);
  }

  @Override
  public Optional<CopybookName> findByName(String displayName) {
    return listOfCopybookNames.stream()
        .filter(copybookName -> displayName.equalsIgnoreCase(copybookName.getDisplayName()))
        .findAny();
  }

  @Override
  public boolean isCopybook(String uri) {
    String[] uriAsArray = uri.split("/");
    String fileNameWithExtension = uriAsArray[uriAsArray.length - 1];
    String fileName = fileNameWithExtension.split("\\.")[0];
    return findByName(fileName).isPresent()
        || Optional.ofNullable(listOfCopybookFolders)
        .orElse(emptyList())
        .stream()
        .anyMatch(uri::contains);
  }

  public CompletableFuture<List<String>> copybookLocalFolders() {
    List<CompletableFuture<List<String>>> copybookLocalFolders = new ArrayList<>();
    copybookLocalFolders.add(settingsService.fetchTextConfiguration(CPY_LOCAL_PATHS.label));
    return settingsService.fetchTextConfiguration(DIALECTS.label)
        .thenAccept(
            dialects -> dialects.forEach(dialect -> {
              copybookLocalFolders.add(
                  settingsService.fetchTextConfiguration(
                      String.format("cpy-manager.%s.paths-local", dialect.toLowerCase())));
            }))
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
      List<WorkspaceFolder> workspaceFolderList,
      List<String> copybookFolders,
      List<String> copybookExtensions) {
    List<String> copybookExtensionsWithoutDot = copybookExtensions.stream()
        .map(extension -> extension.replaceFirst("\\.", ""))
        .collect(Collectors.toList());
    Set<String> copybookExtensionsWithoutDotAsSet = new HashSet<>(copybookExtensionsWithoutDot);
    listOfCopybookFolders = copybookFolders;
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
