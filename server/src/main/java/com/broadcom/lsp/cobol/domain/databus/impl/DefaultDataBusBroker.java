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

package com.broadcom.lsp.cobol.domain.databus.impl;

import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.domain.databus.model.RegistryId;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.util.NoSuchElementException;

/**
 * This class is the default implementation for databus broker. It uses a {@link
 * CopybookRepositoryLRU} to perform caching operations.
 *
 * @param <T> - a data event class managed by the implementation
 * @param <S> - a subscriber class for this event
 */
@Slf4j
@Singleton
public class DefaultDataBusBroker<T extends DataEvent, S> extends AbstractDataBusBroker<T, S> {
  @NonNull private final CopybookRepositoryLRU cpyRepo;

  @Inject
  DefaultDataBusBroker(
      @Named("ASYNC-MESS-DISPATCHER") int numberOfThreads, CopybookRepositoryLRU cpyRepo) {
    super(numberOfThreads);
    this.cpyRepo = cpyRepo;
  }

  @Override
  protected CopybookRepositoryLRU getCopybookRepo() {
    return cpyRepo;
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

  @Override
  public CopybookModel storeData(@NonNull CopybookModel storable) {
    getCopybookRepo().persist(storable);
    return storable;
  }

  @Override
  public CopybookModel getData(@NonNull String name) {
    return getCopybookRepo()
        .getCopybookStorableFromCache(name)
        .orElseThrow(NoSuchElementException::new);
  }

  @Override
  public boolean isStored(@NonNull String name) {
    return getCopybookRepo().isStored(name);
  }

  @Override
  public void invalidateCache() {
    getCopybookRepo().invalidateCache();
  }
}
