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
import com.google.common.base.Ticker;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.Duration;
import java.util.NoSuchElementException;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
class CopybookRepositoryLRUTest {
  private CopybookRepositoryLRU repository;
  private static final int CACHE_SIZE = 4;
  private static final int CACHE_DURATION = 3;
  private static final String CACHE_TIME_UNIT = "HOURS";
  private final CopybookModel storable =
      new CopybookModel("Test", "file:///C:/Users/test/Test.cbl", "000000 IDENTIFICATION DIVISION.");
  @Getter protected final Waiter waiter = new Waiter();

  @BeforeEach
  void initRepository() {
    repository = new CopybookRepositoryLRU(CACHE_SIZE, CACHE_DURATION, CACHE_TIME_UNIT);
    repository.persist(storable);
  }

  /** This test verifies that getMaxSize() return the cache's pre-filled size. */
  @Test
  void testMaxSize() {
    assertEquals(CACHE_SIZE, repository.getCacheMaxSize());
  }

  /** This test verifies that cache cannot have negative size */
  @Test
  void cacheSizeIsNotNegative() {
    assertTrue(repository.getCacheMaxSize() >= 0);
  }

  /**
   * This test verifies that a CopybookModel object stored successfully in the cache. After
   * calling the persist method, the cache size increased by one
   */
  @Test
  void testPersist() {
    var prevCacheSize = repository.size();
    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    assertEquals(repository.size(), prevCacheSize + 1);
  }

  /**
   * This test validates that the cache is throwing the expired elements away, the elements which
   * are older than 3h
   *
   */
  @Test
  void testCacheExpiration() {
    SettableTicker ticker = new SettableTicker();
    repository = new CopybookRepositoryLRU(CACHE_SIZE, CACHE_DURATION, CACHE_TIME_UNIT, ticker);
    repository.persist(new CopybookModel("REMOVE", "URI", "DUMMY CONTENT"));
    ticker.incrementNanoseconds(1);

    // then passed 3 hours
    ticker.incrementNanoseconds(Duration.ofHours(3).toNanos());

    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    ticker.incrementNanoseconds(1);
    repository.persist(new CopybookModel("NEW_STO2", "URI", "DUMMY CONTENT"));
    ticker.incrementNanoseconds(1);
    repository.persist(new CopybookModel("NEW_STO3", "URI", "DUMMY CONTENT"));
    ticker.incrementNanoseconds(1);

    assertEquals(3, repository.size());
  }

  private class SettableTicker extends Ticker {
    private long nanoseconds = 1;

    public void incrementNanoseconds(long delta) {
      this.nanoseconds += delta;
    }

    @Override
    public long read() {
      return nanoseconds;
    }
  }

  /**
   * This test validates the cache sort mechanism, first is sorted by the hits and after by the time
   * in ms, it is worth to mention that we need to delay with 1ms the element in order to have a
   * time difference at the creation moment, if not it will not differentiate, and the order will be
   * not the expected one
   *
   */
  @Test
  void testCacheSort() {
    var elem1 = new CopybookModel("NEW_STO3", "URI", "DUMMY CONTENT");
    var elem2 = new CopybookModel("NEW_STO1", "URI", "DUMMY CONTENT");

    /*
     Element1 and element2 are used as notation in order to make more visible the expected result
    */
    repository.persist(elem1);
    repository.persist(elem2);
    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO2", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO3", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookModel("NEW_STO3", "URI", "DUMMY CONTENT"));

    assertEquals(CACHE_SIZE, repository.size());
  }

  /** This test validates that an exception thrown if provided arguments are null. */
  @Test
  void testNullArguments() {
    Assertions.assertThrows(
        NullPointerException.class,
        () -> {
          repository.persist(new CopybookModel(null, null, null));
          repository.persist(null);
        });
  }

  @Test
  void testWrongSearchedElement() {
    assertFalse(repository.isStored(storable.getName() + "wrong"));
  }

  /**
   * This test verifies that when a new element should be stored in a full cache, the oldest element
   * removed from the cache
   */
  @Test
  void testCacheRotation() {
    LOG.info("Cache sizing before NEW_STO = " + repository.size());

    repository.persist(new CopybookModel("NEW_STO", "URI", "DUMMY CONTENT"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    repository.persist(new CopybookModel("NEW_STO2 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    repository.persist(new CopybookModel("NEW_STO3 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    repository.persist(new CopybookModel("NEW_STO4 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    int prevCacheSize = repository.size();

    repository.persist(new CopybookModel("NEW_STO5 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    assertEquals(repository.size(), prevCacheSize);
  }

  /**
   * This test verifies that a string representation of the cache content returned to the callee. If
   * the cache is empty an empty string returned
   */
  @Test
  void testLogCacheContent() {
    assertNotNull(repository.logContent());
  }

  /**
   * This test verifies that a NoSuchElementException is thrown if the cache is empty, or the
   * element looking for doesn't exist.
   */
  @Test
  void testNoSuchElement() throws NoSuchElementException {
    Assertions.assertThrows(
        NoSuchElementException.class,
        () -> {
          // search a not present element
          assertTrue(
              repository
                  .getCopybookStorableFromCache("NOT-PRESENT-ITEM")
                  .get()
                  .getName()
                  .equalsIgnoreCase("NOT-PRESENT-ITEM"));
        });
  }

  /** This test verifies that an element defined in the cache retrieved correctly */
  @Test
  void testStoredElement() {
    assertTrue(repository.isStored(storable.getName()));
  }

  /** This test verifies that the cache invalidation works correctly. */
  @Test
  void testCacheInvalidation() {
    repository.invalidateCache();
    assertEquals(0, repository.size());
  }
}
