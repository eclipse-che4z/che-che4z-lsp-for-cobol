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
package com.broadcom.lsp.domain;

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.impl.CopybookRepositoryLRU;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.util.NoSuchElementException;

import static org.junit.Assert.*;

@Slf4j
public class CopybookRepositoryLRUTest extends DomainConfigurableTest {
  CopybookRepositoryLRU repository;
  public static final int CACHE_SIZE = 2;
  private CopybookStorable storable = getDummyStorable();

  @Before
  public void initRepository() {
    repository = new CopybookRepositoryLRU(CACHE_SIZE);
    repository.persist(storable);
  }

  /** This test verify that getMaxSize() return the cache's prefilled size. */
  @Test
  public void testMaxSize() {
    assertEquals(CACHE_SIZE, repository.getCacheMaxSize());
  }

  /** This test verify that cache cannot have negative size */
  @Test
  public void cacheSizeIsNotNegative() {
    assertTrue(repository.getCacheMaxSize() >= 0);
  }

  /**
   * This test verify that a CopybookStorable object is stored successfully in the cache. After call
   * the persist method the cache size is increased by one
   */
  @Test
  public void testPersist() {
    int prevCacheSize = repository.size();
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    assertEquals(repository.size(), prevCacheSize + 1);
  }

  /**
   * This test verify that when a new element should be stored in a full cache, the oldest element
   * is removed from the cache
   */
  @Test
  public void testCacheRotation() {
    LOG.info("Cache sizing before NEW_STO = " + repository.size());

    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    int prevCacheSize = repository.size();

    repository.persist(new CopybookStorable("NEW_STO2 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    assertEquals(repository.size(), prevCacheSize);
  }

  /**
   * This test verify that a string representation of the cache content is returned to the callee.
   * If the cache is empty an empty string is returned
   */
  @Test
  public void testLogCacheContent() {
    assertNotNull(repository.logContent());
  }

  /**
   * This test verify that a NoSuchElementException is throwed if the cache is empty or the element
   * looking for doesn't exist.
   */
  @Test(expected = NoSuchElementException.class)
  @SneakyThrows
  public void testNoSuchElement() throws NoSuchElementException {
    // search a not present element
    assertTrue(
        repository
            .getCopybookStorableFromCache(CopybookRepository.calculateUUID("NOT-PRESENT-ITEM"))
            .get()
            .getName()
            .equalsIgnoreCase("NOT-PRESENT-ITEM"));
  }

  /** This test verify that for a not empty cache the top item is returned to the callee. */
  @Test
  public void testTopItem() {
    assertNotNull(repository.topItem().get());
  }

  /** This test verify that for a not empty cache the last item is returned to the callee. */
  @Test
  public void testLastItem() {
    assertNotNull(repository.lastItem().get());
  }

  /** This test verify that an element defined in the cache is retrivied correctly */
  @Test
  public void testStoredElement() {
    assertTrue(repository.isStored(new StringBuilder(storable.getName())));
    assertTrue(repository.isStored(storable.getName()));
  }

  /** This test verify that the cache invalidation works correclty. */
  @Test
  public void testCacheInvalidation() {
    repository.invalidateCache();
    assertEquals(0, repository.size());
  }
}
