/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.eclipse.lsp.cobol.common.copybook.CopybookId;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;

/**
 * Implements copybook cache functionality
 */
@Singleton
public class CopybookCache {

  private final Cache<CopybookId, CopybookModel> cache;

  @Inject
  public CopybookCache(
      @Named("CACHE-MAX-SIZE") int cacheSize,
      @Named("CACHE-DURATION") int duration,
      @Named("CACHE-TIME-UNIT") String timeUnitName) {
    cache =
        CacheBuilder.newBuilder()
            .expireAfterWrite(duration, TimeUnit.valueOf(timeUnitName))
            .maximumSize(cacheSize)
            .build();
  }

  /**
   * Invalidates copybook cache
   */
  public void invalidateAll() {
    cache.invalidateAll();
  }

  /**
   * Gets copybook model from cache
   * @param copybookId copybook name
   * @param callable function to call if copybook does not exist
   * @return a copybook model
   * @throws ExecutionException with error message
   */
  public CopybookModel get(CopybookId copybookId, Callable<CopybookModel> callable) throws ExecutionException {
    return cache.get(copybookId, callable);
  }

  /**
   * Store copybook model to cache
   * @param copybookModel to store
   */
  public void store(CopybookModel copybookModel) {
    cache.put(copybookModel.getCopybookId(), copybookModel);
  }

  /**
   * Invalidate cache for the passed key
   * @param copybookId
   */
  public void invalidate(CopybookId copybookId) {
    cache.invalidate(copybookId);
  }
}
