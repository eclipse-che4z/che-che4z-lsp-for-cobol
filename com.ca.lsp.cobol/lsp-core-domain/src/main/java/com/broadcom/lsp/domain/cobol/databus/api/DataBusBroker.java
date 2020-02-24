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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.databus.model.RegistryId;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
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
  @NonNull
  S subscribe(@NonNull S dataSubscriber);

  @SneakyThrows
  @NonNull
  S subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber);

  @SneakyThrows
  @NonNull
  S subscribe(@NonNull DataEventType eventType, @NonNull EventObserver observer);

  @SneakyThrows
  void unSubscribe(S dataSubscriber);

  @SneakyThrows
  void unSubscribe(@NonNull RegistryId registryId, S dataSubscriber);

  @SneakyThrows
  S getSubscriber(@NonNull DataEventType event, @NonNull EventObserver observer);

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
