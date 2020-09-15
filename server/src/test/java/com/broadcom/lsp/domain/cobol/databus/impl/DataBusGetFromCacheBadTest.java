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
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.NoSuchElementException;

import static org.junit.jupiter.api.Assertions.assertTrue;

/** This test verifies that cache can handle edge cases, e.g. missing elements. */
@Slf4j
class DataBusGetFromCacheBadTest extends DatabusConfigProvider {
  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> databus;

  @BeforeEach
  void setUp() {
    databus = new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3, 3, "HOURS"));

    databus.storeData(new CopybookModel("COPY1", "/var/tmp/worspace1", "FASDFASDFSF"));
    databus.storeData(new CopybookModel("COPY2", "/var/tmp/worspace1", "FASDFASDFSF"));
    databus.storeData(new CopybookModel("COPY3", "/var/tmp/worspace1", "FASDFASDFSF"));
    databus.storeData(new CopybookModel("COPY4", "/var/tmp/worspace1", "FASDFASDFSF"));
    databus.storeData(new CopybookModel("COPY40", "/var/tmp/worspace1", "FASDFASDFSF"));
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test
  void getData() throws NoSuchElementException {
    Assertions.assertThrows(
        NoSuchElementException.class,
        () -> {
          assertTrue(databus.isStored("COPY40"));
          LOG.debug(String.format("Cache content : %s", databus.printCache()));
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
                  .getData("COPY20")
                  .getName()
                  .equalsIgnoreCase("COPY20"));
        });
  }
}
