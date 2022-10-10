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
package org.eclipse.lsp.cobol.service;

import com.google.inject.Singleton;
import lombok.Synchronized;

import java.util.HashMap;
import java.util.Map;

/**
 * Provides sync object for the uri resource to lock the working thread
 */
@Singleton
public class SyncProvider {
  private final Map<String, Object> syncMap = new HashMap<>();

  /**
   * Creates or returns a sync object based on given uri
   * @param uri the uri
   * @return a sync object
   */
  @Synchronized
  public Object getSync(String uri) {
    return syncMap.computeIfAbsent(uri, s -> new Object());
  }

  /**
   * Clears sync object for given uri
   * @param uri the uri
   */
  @Synchronized
  public void remove(String uri) {
    syncMap.remove(uri);
  }
}
