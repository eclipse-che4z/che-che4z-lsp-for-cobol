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

import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import com.ca.lsp.core.cobol.model.CopybookModel;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/** This tests verifies that serialization to a cache storable object works correctly. */
@Slf4j
class DataBusStoreHappyTest extends DatabusConfigProvider {
  // cache dummy static content
  private static final String CPY_FIXED_NAME = "COPY-";
  private static final String CPY_FIXED_CONTENT = "FASDFASDFSF";
  private static final String CPY_FIXED_URI = "/var/tmp/worspace1";

  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> databus;

  @BeforeEach
  void setUp() {
    // create a dummy Multimap
    databus = new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3, 3, "HOURS"));
    fulfillDatabusCacheContent(databus.getCacheMaxSize());

    // add one more element
    databus.storeData(new CopybookModel("COPY-COPYBOOK", CPY_FIXED_URI, CPY_FIXED_CONTENT));
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test
  void cacheData() {
    String newCopybookName = "COPY-" + (databus.getCacheMaxSize() + 1);
    assertFalse(databus.isStored(newCopybookName));
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
    // Cache is Full
    LOG.debug(
        String.format(
            "Cache STATUS --> MaxCacheSize: %d  ActualCacheSize: %d",
            databus.getCacheMaxSize(), databus.cacheSize()));
    assertEquals(databus.getCacheMaxSize(), databus.cacheSize());

    LOG.debug(String.format("Storing new item %s ", newCopybookName));
    databus.storeData(new CopybookModel(newCopybookName, CPY_FIXED_URI, CPY_FIXED_CONTENT));
    assertTrue(databus.isStored(newCopybookName));
    // Swapped
    assertEquals(databus.getCacheMaxSize(), databus.cacheSize());
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
  }

  @Test
  void invalidateCacheTest() {
    LOG.info("Current cache sizing is: " + databus.cacheSize());
    LOG.info("Apply cache invalidation...");
    databus.invalidateCache();
    LOG.info("New cache sizing is: " + databus.cacheSize());
    assertEquals(0, databus.cacheSize());
  }

  @Test
  void getElementFromCache() {
    String element = "COPY-1";
    assertTrue(databus.isStored(element));
  }

  private void fulfillDatabusCacheContent(int cacheMaxSize) {
    for (int i = 0; i < cacheMaxSize; i++) {
      databus.storeData(new CopybookModel(CPY_FIXED_NAME + i, "/var/tmp/worspace1", "FASDFASDFSF"));
    }
  }
}
