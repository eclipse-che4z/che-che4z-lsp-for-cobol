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
import com.broadcom.lsp.domain.cobol.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.inject.ImplementedBy;
import lombok.NonNull;
import lombok.SneakyThrows;

/**
 * This interface represents API to work with databus.
 *
 * @param <T> - a data event class managed by the implementation
 * @param <S> - a subscriber class for this event
 */
@ImplementedBy(DefaultDataBusBroker.class)
public interface DataBusBroker<T extends DataEvent, S> {

  @SneakyThrows
  void postData(@NonNull T dataEvent);

  @SneakyThrows
  void postData(@NonNull RegistryId registryId, @NonNull T dataEvent);

  @SneakyThrows
  void subscribe(@NonNull S dataSubscriber);

  @SneakyThrows
  void subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber);

  @SneakyThrows
  void subscribe(@NonNull DataEventType eventType, @NonNull DataBusObserver observer);

  @SneakyThrows
  void unSubscribe(S dataSubscriber);

  @SneakyThrows
  void unSubscribe(@NonNull RegistryId registryId, S dataSubscriber);

  @SneakyThrows
  void unSubscribe(@NonNull DataEventType eventType, @NonNull DataBusObserver observer);

  @SneakyThrows
  S getSubscriber(@NonNull DataEventType event, @NonNull DataBusObserver observer);

  @SneakyThrows
  CopybookStorable storeData(@NonNull CopybookStorable dataEvent);

  @SneakyThrows
  CopybookStorable getData(@NonNull long uuid);

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
