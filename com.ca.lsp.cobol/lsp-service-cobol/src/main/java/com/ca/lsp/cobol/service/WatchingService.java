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

import javax.annotation.Nonnull;
import java.util.List;

/**
 * This service applies all the operations regarding watching the file system, including settings.
 * It is not necessary for registering folders to exist - the watcher will work when the folder
 * appears. It stops watching, but still exists if the folder deleted. The list of all the
 * registered paths to watch available using {@link #getWatchingFolders()}.
 */
public interface WatchingService {
  /** Subscribe to notifications that the settings.json changed */
  void watchConfigurationChange();

  /** Watch all types of file system changes in .copybooks folder */
  void watchPredefinedFolder();

  /**
   * Watch all types of file system changes in folders with given paths relative to workspace folder
   *
   * @param paths - folders inside workspace to watch
   */
  void addWatchers(@Nonnull List<String> paths);

  /**
   * Stop watching all types of file system changes in folders with given paths relative to
   * workspace folder
   *
   * @param paths - folders inside workspace to stop watching
   */
  void removeWatchers(@Nonnull List<String> paths);

  /**
   * Get a list of paths of registered custom watchers not including .copybooks folder
   *
   * @return a list of paths that has registered watchers
   */
  @Nonnull
  List<String> getWatchingFolders();
}
