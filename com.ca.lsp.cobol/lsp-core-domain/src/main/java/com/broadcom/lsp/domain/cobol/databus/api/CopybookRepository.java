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
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.google.inject.ImplementedBy;
import lombok.NonNull;
import lombok.SneakyThrows;

import java.util.Optional;
import java.util.UUID;

/** This repository manages the caching of copybooks. */
@ImplementedBy(CopybookRepositoryLRU.class)
public interface CopybookRepository {

  @SneakyThrows
  void sortCache();

  @SneakyThrows
  static long calculateUUID(@NonNull StringBuilder uuid) {
    return UUID.nameUUIDFromBytes(uuid.toString().getBytes()).getMostSignificantBits();
  }

  @SneakyThrows
  static long calculateUUID(@NonNull String uuid) {
    return UUID.nameUUIDFromBytes(uuid.getBytes()).getMostSignificantBits();
  }

  @SneakyThrows
  Optional<CopybookStorable> getCopybookStorableFromCache(@NonNull long uuid);

  @SneakyThrows
  void setSort(boolean isSort);

  /**
   * The object to store should be a deep copy of the actual object.
   *
   * @param storable - object to store
   */
  @SneakyThrows
  void persist(@NonNull CopybookStorable storable);

  @SneakyThrows
  String logContent();

  @SneakyThrows
  int size();

  @SneakyThrows
  boolean isStored(@NonNull StringBuilder id);

  @SneakyThrows
  boolean isStored(@NonNull String id);

  @SneakyThrows
  boolean isStored(@NonNull long uuid);

  @SneakyThrows
  void invalidateCache();
}
