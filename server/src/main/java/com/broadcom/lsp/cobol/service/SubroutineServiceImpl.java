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
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.jrpc.CobolLanguageClient;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.util.concurrent.ExecutionError;
import com.google.common.util.concurrent.UncheckedExecutionException;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import com.google.inject.name.Named;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * This service processes subroutine requests and returns URI by its name. The service also caches
 * the URI to reduce filesystem load.
 */
@Singleton
public class SubroutineServiceImpl implements SubroutineService {
  private final LoadingCache<String, Optional<String>> cache;

  @Inject
  public SubroutineServiceImpl(
      Provider<CobolLanguageClient> clientProvider,
      @Named("CACHE-MAX-SIZE") int cacheSize,
      @Named("CACHE-DURATION") int duration,
      @Named("CACHE-TIME-UNIT") String timeUnitName) {
    cache = CacheBuilder.newBuilder()
        .expireAfterWrite(duration, TimeUnit.valueOf(timeUnitName))
        .maximumSize(cacheSize)
        .build(new CacheLoader<String, Optional<String>>() {
          @Override
          public Optional<String> load(String key) throws Exception {
            return Optional.ofNullable(clientProvider.get().resolveSubroutine(key).get());
          }
        });
  }

  @Override
  public Optional<String> getUri(String name) {
    try {
      return cache.get(name);
    } catch (ExecutionException | UncheckedExecutionException | ExecutionError e) {
      return Optional.empty();
    }
  }

  @Override
  public Collection<String> getNames() {
    return cache.asMap().entrySet().stream()
        .filter(entry -> entry.getValue().isPresent())
        .map(Map.Entry::getKey)
        .collect(Collectors.toList());
  }

  @Override
  public void store(String name, String uri) {
    cache.put(name, Optional.ofNullable(uri));
  }

  @Override
  public void invalidateCache() {
    cache.invalidateAll();
  }
}
