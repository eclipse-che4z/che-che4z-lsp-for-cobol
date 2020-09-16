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

package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.ca.lsp.core.cobol.model.CopybookModel;
import com.google.common.base.Ticker;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

import java.util.Optional;
import java.util.concurrent.TimeUnit;

/**
 * This class manages the caching for copybooks in the databus applying the LRU (Last recently used)
 * algorithm.
 */
@Slf4j
@Singleton
public class CopybookRepositoryLRU implements CopybookRepository {
  @Getter private final int cacheMaxSize;
  private Cache<String, CopybookModel> cache;

  @Inject
  public CopybookRepositoryLRU(
      @Named("CACHE-MAX-SIZE") int cacheSize,
      @Named("CACHE-DURATION") int duration,
      @Named("CACHE-TIME-UNIT") String timeUnitName) {
    cacheMaxSize = cacheSize;
    buildCache(cacheSize, duration, timeUnitName, null);
  }

  /** For test purpose only */
  CopybookRepositoryLRU(int cacheSize, int duration, String timeUnitName, Ticker ticker) {
    cacheMaxSize = cacheSize;
    buildCache(cacheSize, duration, timeUnitName, ticker);
  }

  private void buildCache(int cacheSize, int duration, String timeUnitName, Ticker ticker) {
    var cacheBuilder = CacheBuilder.newBuilder()
        .maximumSize(cacheSize)
        .expireAfterWrite(duration, TimeUnit.valueOf(timeUnitName));
    if (ticker != null) {
        cacheBuilder.ticker(ticker);
    }
    cache = cacheBuilder.build();
  }

  @Override
  public Optional<CopybookModel> getCopybookStorableFromCache(@NonNull String name) {
    return Optional.ofNullable(cache.getIfPresent(name));
  }

  @Override
  public synchronized void persist(@NonNull CopybookModel copybookModel) {
    cache.put(copybookModel.getName(), copybookModel);
  }

  @Override
  public String logContent() {
    return cache.asMap().toString();
  }

  @Override
  public int size() {
    return Math.toIntExact(cache.size());
  }

  @Override
  public boolean isStored(@NonNull String name) {
    return cache.getIfPresent(name) != null;
  }

  /** Method that remove all the elements from the cache */
  @Override
  public void invalidateCache() {
    cache.invalidateAll();
  }
}
