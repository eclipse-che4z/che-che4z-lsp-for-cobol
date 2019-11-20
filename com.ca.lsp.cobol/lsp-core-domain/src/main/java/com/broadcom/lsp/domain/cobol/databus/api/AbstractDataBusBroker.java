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

import com.broadcom.lsp.domain.cobol.databus.impl.CopybookRepositoryLRU;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.common.eventbus.AsyncEventBus;
import com.google.common.eventbus.EventBus;
import lombok.SneakyThrows;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** This class spawns the cache registries and manage the databus interactions. */
public abstract class AbstractDataBusBroker<T extends DataEvent, S>
    implements DataBusBroker<T, S> {
  private ExecutorService executor;
  private EventBus generalRegistry;
  private EventBus scannerRegistry;
  private EventBus fetcherRegistry;
  private EventBus cpyRegistry;

  private DeadEventSubscriber recycleBin = new DeadEventSubscriber();
  private Map<String, EventBus> registrySet = new HashMap<>();

  public AbstractDataBusBroker(int numberOfThreads) {
    executor = Executors.newFixedThreadPool(numberOfThreads);
    generalRegistry = new AsyncEventBus(RegistryId.GENERAL_REGISTRY_ID.getId(), executor);
    scannerRegistry = new AsyncEventBus(RegistryId.SCANNER_REGISTRY_ID.getId(), executor);
    fetcherRegistry = new AsyncEventBus(RegistryId.FETCHER_REGISTRY_ID.getId(), executor);
    cpyRegistry = new AsyncEventBus(RegistryId.CPY_REGISTRY_ID.getId(), executor);
    generalRegistry.register(recycleBin);
    scannerRegistry.register(recycleBin);
    fetcherRegistry.register(recycleBin);
    cpyRegistry.register(recycleBin);
    registrySet.put(RegistryId.GENERAL_REGISTRY_ID.getId(), generalRegistry);
    registrySet.put(RegistryId.SCANNER_REGISTRY_ID.getId(), scannerRegistry);
    registrySet.put(RegistryId.FETCHER_REGISTRY_ID.getId(), fetcherRegistry);
    registrySet.put(RegistryId.CPY_REGISTRY_ID.getId(), cpyRegistry);
  }

  @SneakyThrows
  protected Optional<EventBus> seekRegistry(RegistryId registryId) {
    return Optional.ofNullable(registrySet.get(registryId.getId()));
  }

  @Override
  @SneakyThrows
  public S getSubscriber(DataEventType event, DataBusObserver observer) {
    return (S) SubscriberFactoryProvider.getFactory(event).create(observer);
  }

  @Override
  @SneakyThrows
  public int getCacheMaxSize() {
    return getCopybookRepo().getCacheMaxSize();
  }

  @Override
  @SneakyThrows
  public String printCache() {
    return getCopybookRepo().logContent();
  }

  @Override
  public int cacheSize() {
    return getCopybookRepo().size();
  }

  protected abstract CopybookRepositoryLRU getCopybookRepo();
}
