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

package com.ca.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageClient;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.singletonList;
import static java.util.Collections.unmodifiableList;
import static java.util.stream.Collectors.toList;

/**
 * This class creates watchers with type to watch all types of events. The key to remove a watcher
 * is its path without any changes.
 */
@Singleton
public class WatcherServiceImpl implements WatcherService {

  /** Glob patterns to watch the copybooks folder and copybook files */
  private static final String COPYBOOKS_FOLDER_GLOB = "**/.copybooks/**/*";

  /**
   * The kind of events of interest, for watchers calculated as WatchKind.Create | WatchKind.Change
   * | WatchKind.Delete which is 7
   */
  private static final int WATCH_ALL_KIND = 7;

  private static final String WATCH_FILES = "workspace/didChangeWatchedFiles";
  private static final String WATCH_CONFIGURATION = "workspace/didChangeConfiguration";

  private final List<String> folderWatchers = new ArrayList<>();

  private final Provider<LanguageClient> clientProvider;

  @Inject
  WatcherServiceImpl(Provider<LanguageClient> clientProvider) {
    this.clientProvider = clientProvider;
  }

  @Nonnull
  public List<String> getWatchingFolders() {
    return unmodifiableList(folderWatchers);
  }

  public void watchConfigurationChange() {
    register(singletonList(new Registration("configurationChange", WATCH_CONFIGURATION, null)));
  }

  public void watchPredefinedFolder() {
    register(
        singletonList(
            new Registration(
                "copybooksWatcher",
                WATCH_FILES,
                new DidChangeWatchedFilesRegistrationOptions(
                    singletonList(new FileSystemWatcher(COPYBOOKS_FOLDER_GLOB, WATCH_ALL_KIND))))));
  }

  public void addWatchers(@Nonnull List<String> paths) {
    register(
        paths.stream()
            .map(
                it -> {
                  folderWatchers.add(it);
                  return new Registration(
                      it,
                      WATCH_FILES,
                      new DidChangeWatchedFilesRegistrationOptions(
                          singletonList(
                              new FileSystemWatcher("**/" + it + "/**/*", WATCH_ALL_KIND))));
                })
            .collect(toList()));
  }

  @Override
  public void removeWatchers(@Nonnull List<String> paths) {
    List<String> collect = paths.stream().filter(folderWatchers::remove).collect(toList());
    if (!collect.isEmpty()) {
      clientProvider
          .get()
          .unregisterCapability(
              new UnregistrationParams(
                  collect.stream()
                      .map(it -> new Unregistration(it, WATCH_FILES))
                      .collect(toList())));
    }
  }

  private void register(List<Registration> registrations) {
    clientProvider.get().registerCapability(new RegistrationParams(registrations));
  }
}
