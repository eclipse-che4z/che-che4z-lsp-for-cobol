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

package org.eclipse.lsp.cobol.domain.databus.impl;

import org.eclipse.lsp.cobol.domain.databus.model.RegistryId;
import org.eclipse.lsp.cobol.domain.event.api.EventObserver;
import org.eclipse.lsp.cobol.domain.event.model.DataEvent;
import org.eclipse.lsp.cobol.domain.event.model.DataEventType;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

/**
 * This class is the default implementation for databus broker.
 *
 * @param <T> - a data event class managed by the implementation
 * @param <S> - a subscriber class for this event
 */
@Slf4j
@Singleton
public class DefaultDataBusBroker<T extends DataEvent, S> extends AbstractDataBusBroker<T, S> {

  @Inject
  DefaultDataBusBroker(CustomThreadPoolExecutor customExecutor) {
    super(customExecutor);
  }

  @Override
  public void postData(@NonNull T dataEvent) {
    postData(dataEvent.getRegistryId(), dataEvent);
  }

  @Override
  public void postData(@NonNull RegistryId registryId, @NonNull T dataEvent) {
    seekRegistry(registryId).ifPresent(it -> it.post(dataEvent));
  }

  @Override
  public @NonNull S subscribe(@NonNull S dataSubscriber) {
    return subscribe(RegistryId.GENERAL_REGISTRY_ID, dataSubscriber);
  }

  @Override
  public @NonNull S subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber) {
    seekRegistry(registryId).ifPresent(it -> it.register(dataSubscriber));
    return dataSubscriber;
  }

  @Override
  public @NonNull S subscribe(@NonNull DataEventType eventType, @NonNull EventObserver observer) {
    return subscribe(getSubscriber(eventType, observer));
  }

  @Override
  public void unSubscribe(@NonNull S dataSubscriber) {
    unSubscribe(RegistryId.GENERAL_REGISTRY_ID, dataSubscriber);
  }

  @Override
  public void unSubscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber) {
    seekRegistry(registryId).ifPresent(it -> it.unregister(dataSubscriber));
  }
}
