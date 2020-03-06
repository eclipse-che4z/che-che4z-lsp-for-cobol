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

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import lombok.Getter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.junit.Before;
import org.junit.Test;
import org.mockito.internal.util.reflection.FieldSetter;

import java.lang.reflect.Field;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.NoSuchElementException;

import static org.junit.Assert.*;

@Slf4j
public class CopybookRepositoryLRUTest extends CopybookStorableProvider {
  private CopybookRepositoryLRU repository;
  private static final int CACHE_SIZE = 4;
  private CopybookStorable storable = getDummyStorable();
  @Getter protected final Waiter waiter = new Waiter();

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
   * This test validates that the cache is throwing the expired elements away, the elements which
   * are older than 3h
   *
   * @throws NoSuchFieldException
   */
  @Test
  public void testCacheExpiration() throws NoSuchFieldException {
    long genDt = Instant.now().minus(4, ChronoUnit.HOURS).getEpochSecond();

    CopybookStorable storableCpy = new CopybookStorable("REMOVE", "URI", "DUMMY CONTENT");
    Field f = storableCpy.getClass().getDeclaredField("genDt");
    f.setAccessible(true);
    FieldSetter.setField(storableCpy, f, genDt);

    repository.persist(storableCpy);
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO232", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));

    assertEquals(3, repository.size());
  }

  /**
   * This test validates the cache sort mechanism, first is sorted by the hits and after by the time
   * in ms, it is worth to mention that we need to delay with 1ms the element in order to have a
   * time difference at the creation moment, if not it will not differentiate and the order will be
   * not the expected one
   *
   * @throws NoSuchFieldException
   */
  @Test
  public void testCacheSort() throws NoSuchFieldException {
    long genDt = Instant.now().minus(1, ChronoUnit.MILLIS).toEpochMilli();

    CopybookStorable elem1 = new CopybookStorable("NEW_STO3", "URI", "DUMMY CONTENT");

    /*
     The mechanism is using ms to evaluate the time of creation, because the process is too fast there is a need
      for one ms delay
    */
    Field f = elem1.getClass().getDeclaredField("genDt");
    f.setAccessible(true);
    FieldSetter.setField(elem1, f, genDt);

    CopybookStorable elem2 = new CopybookStorable("NEW_STO1", "URI", "DUMMY CONTENT");

    /*
     Element1 and element2 are used as notation in order to make more visible the expected result
    */
    repository.persist(elem1);
    repository.persist(elem2);
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO2", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO3", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO", "URI", "DUMMY CONTENT"));
    repository.persist(new CopybookStorable("NEW_STO3", "URI", "DUMMY CONTENT"));

    assertEquals(elem1.getName(), repository.topItem().get().getName());
    assertEquals(elem1.getContent(), repository.topItem().get().getContent());
    assertEquals(elem2.getName(), repository.lastItem().get().getName());
    assertEquals(elem2.getContent(), repository.lastItem().get().getContent());
    assertEquals(CACHE_SIZE, repository.size());
  }

  /** This test validates that an exception is thrown if provided arguments are null. */
  @Test(expected = IllegalArgumentException.class)
  public void testNullArguments() {
    repository.persist(new CopybookStorable(null, null, null));
    repository.persist(null);
  }

  @Test
  public void testWrongSearchedElement() {
    assertFalse(repository.isStored(storable.getName() + "wrong"));
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

    repository.persist(new CopybookStorable("NEW_STO2 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    repository.persist(new CopybookStorable("NEW_STO3 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    repository.persist(new CopybookStorable("NEW_STO4 ", "URI2", "DUMMY CONTENT2"));
    LOG.info("Cache sizing after NEW_STO = " + repository.size());

    int prevCacheSize = repository.size();

    repository.persist(new CopybookStorable("NEW_STO5 ", "URI2", "DUMMY CONTENT2"));
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
   * This test verify that a NoSuchElementException is thrown if the cache is empty or the element
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

  /** This test verify that an element defined in the cache is retrieved correctly */
  @Test
  public void testStoredElement() {
    assertTrue(repository.isStored(new StringBuilder(storable.getName())));
    assertTrue(repository.isStored(storable.getName()));
  }

  /** This test verify that the cache invalidation works correctly. */
  @Test
  public void testCacheInvalidation() {
    repository.invalidateCache();
    assertEquals(0, repository.size());
  }
}
