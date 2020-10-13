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

package com.broadcom.lsp.cobol.domain.databus.api;

import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.domain.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.cobol.domain.databus.model.RegistryId;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import com.google.inject.ImplementedBy;
import lombok.NonNull;

/**
 * This interface represents API to work with databus.
 *
 * @param <T> - a data event class managed by the implementation
 * @param <S> - a subscriber class for this event
 */
@ImplementedBy(DefaultDataBusBroker.class)
public interface DataBusBroker<T extends DataEvent, S> {

  void postData(@NonNull T dataEvent);

  void postData(@NonNull RegistryId registryId, @NonNull T dataEvent);

  @NonNull
  S subscribe(@NonNull S dataSubscriber);

  @NonNull
  S subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber);

  @NonNull
  S subscribe(@NonNull DataEventType eventType, @NonNull EventObserver observer);

  void unSubscribe(S dataSubscriber);

  void unSubscribe(@NonNull RegistryId registryId, S dataSubscriber);

  S getSubscriber(@NonNull DataEventType event, @NonNull EventObserver observer);

  CopybookModel storeData(CopybookModel dataEvent);

  CopybookModel getData(String name);

  boolean isStored(String name);

  int cacheSize();

  int getCacheMaxSize();

  String printCache();

  void invalidateCache();
}
