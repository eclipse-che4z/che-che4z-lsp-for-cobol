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

import lombok.NonNull;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.util.List;

/**
 * This service applies all the operations regarding watching the file system, including settings.
 * It is not necessary for registering folders to exist - the watcher will work when the folder
 * appears. It stops watching, but still exists if the folder deleted. The list of all the
 * registered paths to watch available using {@link #getWatchingFolders()}.
 */
public interface WatcherService {
  /** Subscribe to notifications that the settings.json changed */
  void watchConfigurationChange();

  /**
   * Watch all types of file system changes in folders with given paths relative to workspace folder
   *
   * @param paths - folders inside workspace to watch
   */
  void addWatchers(@NonNull List<String> paths);

  /**
   * Add Watchers for all types of file system changes for the copybooks specific to a document.
   * This includes dialects watching folders.
   *
   * @param documentUri - documents for which specified path need to be watched.
   */
  void addRuntimeWatchers(String documentUri);

  /**
   * Stop watching all types of file system changes in folders with given paths relative to
   * workspace folder
   *
   * @param paths - folders inside workspace to stop watching
   */
  void removeWatchers(@NonNull List<String> paths);

  /**
   * Stop watching all types of file system changes specified for a document.
   *
   * @param documentUri - document for which runtime watchers need to be removed.
   */
  void removeRuntimeWatchers(@NonNull String documentUri);

  /**
   * Get a list of paths of registered custom watchers not including .copybooks folder
   *
   * @return a list of paths that has registered watchers
   */
  @NonNull
  List<String> getWatchingFolders();


  /**
   * Get a list of all workspace associated with this watcher
   *
   * @return a list of paths
   */
  @NonNull
  List<WorkspaceFolder> getWorkspaceFolders();
}
