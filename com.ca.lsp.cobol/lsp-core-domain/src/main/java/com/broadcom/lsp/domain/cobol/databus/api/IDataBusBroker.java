/*
 * Copyright (c) 2019 Broadcom.
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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.common.eventbus.EventBus;
import com.google.inject.ImplementedBy;
import lombok.NonNull;
import lombok.SneakyThrows;

import java.util.HashMap;
import java.util.Map;

/** Created on 2019-10-01 */
@ImplementedBy(DefaultDataBusBroker.class)
public interface IDataBusBroker<T extends DataEvent, S> {
  Map<String, EventBus> registrySet = new HashMap<>();

  @SneakyThrows
  void postData(@NonNull T dataEvent);

  @SneakyThrows
  void postData(@NonNull RegistryId registryId, @NonNull T dataEvent);

  @SneakyThrows
  void subscribe(@NonNull S dataSubscriber);

  @SneakyThrows
  void subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber);

  @SneakyThrows
  void subscribe(@NonNull DataEventType eventType, @NonNull IDataBusObserver observer);

  @SneakyThrows
  S getSubscriber(@NonNull DataEventType event, @NonNull IDataBusObserver observer);

  @SneakyThrows
  CpyStorable storeData(@NonNull CpyStorable dataEvent);

  @SneakyThrows
  CpyStorable getData(@NonNull long uuid);

  @SneakyThrows
  boolean isStored(long uuid);

  int cacheSize();

  @SneakyThrows
  int getCacheMaxSize();

  @SneakyThrows
  String printCache();

  @SneakyThrows
  void invalidateCache();
}
