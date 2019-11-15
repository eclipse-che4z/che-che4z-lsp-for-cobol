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

package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.cobol.databus.api.AbstractDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.SerializationUtils;

import java.util.Optional;

/** Created on 16/10/2019 */
@Slf4j
@Singleton
public class DefaultDataBusBroker<T extends DataEvent, S> extends AbstractDataBusBroker<T, S> {
  @NonNull private final CpyRepositoryLRU cpyRepo;

  @Inject
  public DefaultDataBusBroker(
      @Named("ASYNC-MESS-DISPATCHER") int nthread, CpyRepositoryLRU cpyRepo) {
    super(nthread);
    this.cpyRepo = cpyRepo;
  }

  @Override
  @SneakyThrows
  public CpyRepositoryLRU getCpyRepo() {
    return cpyRepo;
  }

  @Override
  @SneakyThrows
  public void postData(@NonNull T dataEvent) {
    postData(dataEvent.getRegistryId(), dataEvent);
  }

  @Override
  @SneakyThrows
  public void postData(@NonNull RegistryId registryId, @NonNull T dataEvent) {
    seekRegistry(registryId).get().post(dataEvent);
  }

  @Override
  @SneakyThrows
  public void subscribe(@NonNull S dataSubscriber) {
    subscribe(RegistryId.GENERAL_REGISTRY_ID, dataSubscriber);
  }

  @Override
  @SneakyThrows
  public void subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber) {
    seekRegistry(registryId).get().register(dataSubscriber);
  }

  @Override
  @SneakyThrows
  public void subscribe(@NonNull DataEventType eventType, @NonNull IDataBusObserver observer) {
    subscribe(getSubscriber(eventType, observer));
  }

  @Override
  @SneakyThrows
  @Synchronized
  public CpyStorable storeData(@NonNull CpyStorable storable) {
    CpyStorable deepcopy = SerializationUtils.clone(storable);
    if (!isStored(deepcopy.getId())) getCpyRepo().persist(deepcopy);
    getCpyRepo().setSort(false);
    return storable;
  }

  @Override
  @SneakyThrows
  @Synchronized
  public CpyStorable getData(@NonNull long uuid) {
    return getCpyRepo().getCpyStorableCache(uuid).get();
  }

  @Override
  @SneakyThrows
  @Synchronized
  public boolean isStored(@NonNull long uuid) {
    return getCpyRepo().isStored(uuid);
  }

  @SneakyThrows
  public Optional<CpyStorable> lastRecentlyUsed() {
    return getCpyRepo().topItem();
  }

  @SneakyThrows
  public Optional<CpyStorable> leastRecentlyUsed() {
    return getCpyRepo().lastItem();
  }

  @SneakyThrows
  @Synchronized
  public void invalidateCache() {
    getCpyRepo().invalidateCache();
  }
}
