/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.Synchronized;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static java.util.Collections.unmodifiableList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.CPY_LOCAL_PATHS;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.SUBROUTINE_LOCAL_PATHS;

/**
 * This class creates watchers with type to watch all types of events. The key to remove a watcher
 * is its path without any changes.
 */
@Singleton
public class WatcherServiceImpl implements WatcherService {

  /**
   * The kind of events of interest, for watchers calculated as WatchKind.Create | WatchKind.Change
   * | WatchKind.Delete which is 7
   */
  private static final int WATCH_ALL_KIND = 7;

  private static final String WATCH_FILES = "workspace/didChangeWatchedFiles";
  private static final String WATCH_CONFIGURATION = "workspace/didChangeConfiguration";
  private static final String CONFIGURATION_CHANGE_ID = "configurationChange";

  private final List<String> folderWatchers = new ArrayList<>();
  private final Map<String, List<String>> runtimeSpecifiedFolderWatchers = new HashMap<>();
  private final List<WorkspaceFolder> workspaceFolders = new ArrayList<>();

  private final Provider<CobolLanguageClient> clientProvider;
  private final ConfigurationService configurationService;

  @Inject
  WatcherServiceImpl(
      Provider<CobolLanguageClient> clientProvider, ConfigurationService configurationService) {
    this.clientProvider = clientProvider;
    this.configurationService = configurationService;
  }

  @NonNull
  public List<String> getWatchingFolders() {
    return unmodifiableList(folderWatchers);
  }

  @Override
  public void watchConfigurationChange() {
    register(singletonList(new Registration(CONFIGURATION_CHANGE_ID, WATCH_CONFIGURATION, null)));
  }

  @Override
  public @NonNull List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  @Override
  @Synchronized
  public void addWatchers(@NonNull List<String> paths) {
    register(
            paths.stream()
                    .map(
                            folder -> {
                              folderWatchers.add(folder);
                              return new Registration(
                                      folder,
                                      WATCH_FILES,
                                      new DidChangeWatchedFilesRegistrationOptions(
                                              asList(
                                                      new FileSystemWatcher(createFileWatcher(folder), WATCH_ALL_KIND),
                                                      new FileSystemWatcher(createFolderWatcher(folder), WATCH_ALL_KIND))));
                            })
                    .collect(toList()));
  }

  @Override
  @Synchronized
  public void removeWatchers(@NonNull List<String> paths) {
    List<String> removedWatchers = paths.stream().filter(folderWatchers::remove).collect(toList());
    if (!removedWatchers.isEmpty()) {
      clientProvider
              .get()
              .unregisterCapability(
                      new UnregistrationParams(
                              removedWatchers.stream()
                                      .map(it -> new Unregistration(it, WATCH_FILES))
                                      .collect(toList())));
    }
  }

  /**
   * Stop watching all types of file system changes specified for a document.
   *
   * @param documentUri - document for which runtime watchers need to be removed.
   */
  @Override
  public void removeRuntimeWatchers(@NonNull String documentUri) {
    List<String> removedWatchers =
            runtimeSpecifiedFolderWatchers.getOrDefault(documentUri, Collections.emptyList());
    runtimeSpecifiedFolderWatchers.remove(documentUri);
    if (!removedWatchers.isEmpty()) {
      clientProvider
              .get()
              .unregisterCapability(
                      new UnregistrationParams(
                              removedWatchers.stream()
                                      .map(it -> new Unregistration(it, WATCH_FILES))
                                      .collect(toList())));
    }
  }

  /**
   * Add Watchers for all types of file system changes for the copybooks specific to a document.
   * This includes dialects watching folders.
   *
   * @param documentUri - documents for which specified path need to be watched.
   */
  @Override
  public void addRuntimeWatchers(String documentUri) {
    addWatchersForLocalCopybooks(documentUri);
    addWatchersForDialects(documentUri);
    addWatchersForSubroutines(documentUri);
  }

  private void addWatchersForSubroutines(String uri) {
    configurationService
        .getListConfiguration(uri, SUBROUTINE_LOCAL_PATHS.label)
        .thenAccept(dir -> addRuntimeWatcher(uri, dir));
  }

  private void addWatchersForDialects(String uri) {
    configurationService
        .getDialectWatchingFolders()
        .forEach(
            s ->
                configurationService
                    .getListConfiguration(uri, s)
                    .thenAccept(dir -> addRuntimeWatcher(uri, dir)));
  }

  private void addWatchersForLocalCopybooks(String uri) {
    configurationService
        .getListConfiguration(uri, CPY_LOCAL_PATHS.label)
        .thenAccept(dir -> addRuntimeWatcher(uri, dir));
  }

  private void addRuntimeWatcher(String uri, List<String> dir) {
    List<String> directories = new ArrayList<>();
    for (String path : dir) {
      if (path.contains(CopybookService.FILE_BASENAME_VARIABLE)) {
        path = path.replace("\\$\\{fileBasenameNoExtension\\}", getNameFromURI(uri));
      }
      directories.add(path);
    }
    addRuntimeWatchers(directories, uri);
  }

  private String getNameFromURI(String uri) {
    return new File(uri).getName().replaceFirst("\\?.*$", "").split("\\.")[0];
  }

  private void addRuntimeWatchers(@NonNull List<String> paths, String documentUri) {
    List<String> watchedFolders =
        runtimeSpecifiedFolderWatchers.getOrDefault(documentUri, new ArrayList<>());
    watchedFolders.addAll(paths);
    runtimeSpecifiedFolderWatchers.put(documentUri, watchedFolders);
    register(
            paths.stream()
            .map(
                folder ->
                    new Registration(
                        folder,
                        WATCH_FILES,
                        new DidChangeWatchedFilesRegistrationOptions(
                            asList(
                                new FileSystemWatcher(createFileWatcher(folder), WATCH_ALL_KIND),
                                new FileSystemWatcher(
                                    createFolderWatcher(folder), WATCH_ALL_KIND)))))
            .collect(toList()));
  }

  private Either<String, RelativePattern> createFileWatcher(String folder) {
    String pattern = "**/*";
    RelativePattern relativePattern = new RelativePattern();
    if (folder.contains(CopybookService.FILE_BASENAME_VARIABLE)) {
      String[] split = folder.split(CopybookService.FILE_BASENAME_VARIABLE);
      pattern = "**" + split[1] + pattern;
    }
    relativePattern.setBaseUri(getWorkspaceFolders().get(0));
    relativePattern.setPattern(pattern);
    return Either.forRight(relativePattern);
  }

  private Either<String, RelativePattern> createFolderWatcher(String folder) {
    RelativePattern relativePattern = new RelativePattern();
    relativePattern.setBaseUri(getWorkspaceFolders().get(0));
    return Either.forRight(relativePattern);
  }

  private void register(List<Registration> registrations) {
    clientProvider.get().registerCapability(new RegistrationParams(registrations));
  }
}
