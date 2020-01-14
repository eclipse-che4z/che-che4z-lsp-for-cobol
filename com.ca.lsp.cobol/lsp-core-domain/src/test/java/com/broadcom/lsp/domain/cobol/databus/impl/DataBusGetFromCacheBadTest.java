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

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.NoSuchElementException;
import java.util.Optional;

import static org.junit.Assert.assertTrue;

/** This test verifies that cache can handle edge cases, e.g. missing elements. */
@Slf4j
public class DataBusGetFromCacheBadTest extends AbsDataBusImplTest {
  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> databus;

  @Before
  public void setUp() {
    databus = new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3));

    databus.storeData(
        CopybookStorable.builder()
            .name("COPY1")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CopybookStorable.builder()
            .name("COPY2")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CopybookStorable.builder()
            .name("COPY3")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CopybookStorable.builder()
            .name("COPY4")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CopybookStorable.builder()
            .name("COPY40")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .build());
  }

  @After
  public void tearDown() {
    databus = null;
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test(expected = NoSuchElementException.class)
  @SneakyThrows
  public void getData() throws NoSuchElementException {
    assertTrue(databus.isStored(CopybookRepository.calculateUUID("COPY40")));
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
    Optional<CopybookStorable> leastRecentlyUsed = databus.lastRecentlyUsed();
    LOG.debug(
        String.format(
            "Least Recently Used item : %s  ID : %d",
            leastRecentlyUsed.get().getName(), leastRecentlyUsed.get().getId()));
    // Cache is Full
    LOG.debug(
        String.format(
            "Cache STATUS --> MaxCacheSize: %d  ActualCacheSize: %d",
            databus.getCacheMaxSize(), databus.cacheSize()));
    LOG.debug(
        String.format(
            "Retrieving not existent item %s will throw NoSuchElementException ", "COPY20"));
    assertTrue(
        databus
            .getData(CopybookRepository.calculateUUID("COPY20"))
            .getName()
            .equalsIgnoreCase("COPY20"));
  }
}
