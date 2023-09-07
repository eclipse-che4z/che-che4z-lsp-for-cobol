/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;

import java.util.Optional;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * Document content cache organized by document uri
 */
@Singleton
public class DocumentContentCache {
  private final Cache<String, Optional<String>> cache;

  @Inject
  public DocumentContentCache(
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
   * Stores document content by uri
   * @param uri - uri of the document
   * @param text - text of the document
   */
  public void store(String uri, @NonNull String text) {
    cache.put(uri, Optional.of(text));
  }

  /**
   * Returns a document content by uri
   * @param uri - uri of the document
   * @return the text of a document
   */
  public Optional<String> get(String uri) {
    try {
      return cache.get(uri, Optional::empty);
    } catch (ExecutionException e) {
      return Optional.empty();
    }
  }

  /**
   * Invalidates document content
   * @param uri - uri of the document
   */
  public void invalidate(String uri) {
    cache.invalidate(uri);
  }
}
