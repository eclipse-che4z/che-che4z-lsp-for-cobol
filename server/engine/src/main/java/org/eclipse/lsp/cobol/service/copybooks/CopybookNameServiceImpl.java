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
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp4j.WorkspaceFolder;

import javax.annotation.Nullable;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Collections.emptyList;
import static java.util.Collections.singleton;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.*;

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
  private Set<String> fullCopybookFoldersList;

  private static final String CPY_DOWNLOAD_FOLDER_PATH = ".c4z/.copybooks";

  @Inject
  public CopybookNameServiceImpl(
          final SettingsService settingsService,
          final FileSystemService files,
          final Provider<CobolLanguageClient> clientProvider) {
    this.settingsService = settingsService;
    this.files = files;
    this.clientProvider = clientProvider;
    this.fullCopybookFoldersList = singleton(CPY_DOWNLOAD_FOLDER_PATH);
  }

  @Override
  public List<CopybookName> getNames(String uri) {
    List<CopybookName> copybookNamesList = createCopybookNamesList(uri, n -> true);
    return ImmutableList.copyOf(copybookNamesList);
  }

  @Override
  public Optional<CopybookName> findByName(String uri, final String displayName) {
    List<CopybookName> copybookNamesList = createCopybookNamesList(uri,
            copybookName -> displayName.equalsIgnoreCase(copybookName.getDisplayName()));
    return copybookNamesList.isEmpty() ? Optional.empty() : Optional.of(copybookNamesList.get(0));
  }

  @Override
  public CompletableFuture<List<String>> copybookLocalFolders(String documentUri) {
    List<CompletableFuture<List<String>>> copybookLocalFolders = new ArrayList<>();
    copybookLocalFolders.add(
            settingsService.fetchTextConfigurationWithScope(documentUri, CPY_LOCAL_PATHS.label));
    return settingsService.fetchTextConfigurationWithScope(documentUri, DIALECTS.label)
            .thenAccept(
                    dialects -> dialects.forEach(dialect -> copybookLocalFolders.add(
                            settingsService.fetchTextConfigurationWithScope(documentUri, "cobol-lsp.dialect.libs", dialect)
                    )))
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
    // TODO cache invalidation if we will have cache
  }

  private String extractProgramName(@Nullable String uri) {
    if (uri == null) {
      return null;
    }
    int lastSegment = uri.lastIndexOf("/");
    String programName = uri;
    if (lastSegment >= 0) {
      programName = uri.substring(lastSegment + 1);
    }
    int lastDot = programName.lastIndexOf(".");
    if (lastDot >= 0) {
      programName = programName.substring(0, lastDot);
    }
    return programName;
  }


  private List<CopybookName> resolveNames(
          final List<WorkspaceFolder> workspaceFolderList,
          final List<String> copybookFolders,
          final List<String> copybookExtensions,
          String programName,
          Predicate<CopybookName> predicate) {

    List<String> copybookExtensionsWithoutDot = copybookExtensions.stream()
            .map(extension -> extension.replaceFirst("\\.", ""))
            .collect(Collectors.toList());
    Set<String> copybookExtensionsWithoutDotAsSet = new HashSet<>(copybookExtensionsWithoutDot);
    fullCopybookFoldersList = Stream.concat(
                    copybookFolders.stream().map(p ->
                            p.contains(CopybookService.FILE_BASENAME_VARIABLE)
                                    ? p.replace(CopybookService.FILE_BASENAME_VARIABLE, programName)
                                    : p),
                    Stream.of(CPY_DOWNLOAD_FOLDER_PATH))
            .collect(Collectors.toSet());

    try {
      return ImmutableList.copyOf(
              fullCopybookFoldersList.stream()
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
                      .filter(predicate)
                      .collect(Collectors.toMap(
                              CopybookName::getDisplayName,
                              Function.identity(),
                              (existing, replacement) ->
                                      copybookExtensionsWithoutDot.indexOf(existing.getExtension())
                                              < copybookExtensionsWithoutDot.indexOf(replacement.getExtension())
                                              ? existing : replacement

                      )).values());

    } catch (IllegalArgumentException iae) {
      LOG.debug(iae.getMessage(), iae);
      return Collections.emptyList();
    }
  }

  private List<String> listExistedFiles(
          final List<WorkspaceFolder> workspaces,
          final String copybookPath) {
    return Optional.ofNullable(workspaces).orElse(emptyList()).stream()
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

  private List<CopybookName> createCopybookNamesList(String uri, Predicate<CopybookName> predicate) {
    CobolLanguageClient cobolLanguageClient = clientProvider.get();
    CompletableFuture<List<WorkspaceFolder>> copybookWorkspaces = cobolLanguageClient.workspaceFolders();
    CompletableFuture<List<String>> copybooksExtensions = settingsService.fetchTextConfigurationWithScope(uri, CPY_EXTENSIONS.label);
    CompletableFuture<List<String>> copybookLocalFolders = copybookLocalFolders(uri);
    return resolveNames(copybookWorkspaces.join(), copybookLocalFolders.join(), copybooksExtensions.join(),
            extractProgramName(uri), predicate);
  }
}
