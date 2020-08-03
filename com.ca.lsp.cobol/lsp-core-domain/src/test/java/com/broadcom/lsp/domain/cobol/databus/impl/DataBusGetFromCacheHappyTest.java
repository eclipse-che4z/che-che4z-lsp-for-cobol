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
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertTrue;

/** This cache verifies the main logic of cache data management. */
@Slf4j
class DataBusGetFromCacheHappyTest extends DatabusConfigProvider {
  // cache dummy static content
  private static final String CPY_FIXED_NAME = "COPY-";
  private static final String CPY_FIXED_CONTENT = "FASDFASDFSF";
  private static final String CPY_FIXED_URI = "/var/tmp/worspace1";

  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> databus;

  @BeforeEach
  void setUp() {
    databus = new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3));
    fulfillDatabusCacheContent(databus.getCacheMaxSize());
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test
  @SneakyThrows
  void getData() {
    String newCopybookName = "COPY-" + (databus.getCacheMaxSize() - 1);

    assertTrue(databus.isStored(CopybookRepository.calculateUUID(newCopybookName)));
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
    LOG.debug(String.format("Retrieving item %s ", newCopybookName));
    assertTrue(
        databus
            .getData(CopybookRepository.calculateUUID(newCopybookName))
            .getName()
            .equalsIgnoreCase(newCopybookName));
    LOG.debug(
        String.format(
            "Element Retrieved : %s",
            databus.getData(CopybookRepository.calculateUUID(newCopybookName))));
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
  }

  private void fulfillDatabusCacheContent(int cacheMaxSize) {
    for (int i = 0; i < cacheMaxSize; i++) {
      databus.storeData(
          CopybookStorable.builder()
              .name(CPY_FIXED_NAME + i)
              .content(CPY_FIXED_CONTENT)
              .uri(CPY_FIXED_URI)
              .build());
    }
  }
}
