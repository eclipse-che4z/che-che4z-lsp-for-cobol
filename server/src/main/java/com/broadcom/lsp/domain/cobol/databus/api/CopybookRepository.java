/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.domain.cobol.databus.api;

import com.broadcom.lsp.domain.cobol.databus.impl.CopybookRepositoryLRU;
import com.ca.lsp.core.cobol.model.CopybookModel;
import com.google.inject.ImplementedBy;
import lombok.NonNull;

import java.util.Optional;

/** This repository manages the caching of copybooks. */
@ImplementedBy(CopybookRepositoryLRU.class)
public interface CopybookRepository {

  Optional<CopybookModel> getCopybookStorableFromCache(@NonNull String name);

  /**
   * The object to store should be a deep copy of the actual object.
   *
   * @param storable - object to store
   */
  void persist(@NonNull CopybookModel storable);

  String logContent();

  int size();

  boolean isStored(@NonNull String name);

  void invalidateCache();
}
