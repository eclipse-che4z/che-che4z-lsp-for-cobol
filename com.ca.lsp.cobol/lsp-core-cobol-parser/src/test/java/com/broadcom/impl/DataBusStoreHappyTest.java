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

package com.broadcom.impl;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.ICpyRepository;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.Optional;

/** Created on 2019-10-02 */
@Slf4j
public class DataBusStoreHappyTest extends AbsDataBusImplTest {
  private final String PARAGRAPH_NAME = "PARNAME";
  private final Position POSITION_FIRST_OCCURRENCE = new Position(0, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(10, 10, 10, 10, 10);
  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  private DefaultDataBusBroker databus;

  @Before
  public void setUp() throws Exception {
    // create a dummy Multimap
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
    MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions);

    databus =
        LangServerCtx.getGuiceCtx(new DatabusModule())
            .getInjector()
            .getInstance(DefaultDataBusBroker.class);
    databus.storeData(
        CpyStorable.builder()
            .name("COPY1")
            .content("FASDFASDFSF")
            .position("ROW:3,COL:4")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CpyStorable.builder()
            .name("COPY2")
            .content("FASDFASDFSF")
            .position("ROW:3,COL:4")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CpyStorable.builder()
            .name("COPY3")
            .content("FASDFASDFSF")
            .position("ROW:3,COL:4")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CpyStorable.builder()
            .name("COPY40")
            .content("FASDFASDFSF")
            .position("ROW:3,COL:4")
            .uri("/var/tmp/worspace1")
            .build());
    databus.storeData(
        CpyStorable.builder()
            .name("COPY-COPYBOOK")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .paragraphPosition(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions))
            .build());
  }

  @After
  public void tearDown() throws Exception {
    databus = null;
    LangServerCtx.shutdown();
    // TODO: invoke method to invalidate the cache
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test
  @SneakyThrows
  public void cacheData() {
    Assert.assertFalse(databus.isStored(ICpyRepository.calculateUUID(new StringBuilder("COPY20"))));
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
    Optional<CpyStorable> leastRecentlyUsed = databus.lastRecentlyUsed();
    LOG.debug(
        String.format(
            "Least Recently Used item : %s  ID : %d",
            leastRecentlyUsed.get().getName(), leastRecentlyUsed.get().getId()));
    // Cache is Full
    LOG.debug(
        String.format(
            "Cache STATUS --> MaxCacheSize: %d  ActualCacheSize: %d",
            databus.getCacheMaxSize(), databus.cacheSize()));
    Assert.assertEquals(databus.getCacheMaxSize(), databus.cacheSize());
    LOG.debug(String.format("Storing new item %s ", "COPY20"));
    databus.storeData(
        CpyStorable.builder()
            .name("COPY20")
            .content("FASDFASDFSF")
            .position("ROW:3,COL:4")
            .uri("/var/tmp/worspace1")
            .build());
    Assert.assertTrue(databus.isStored(ICpyRepository.calculateUUID(new StringBuilder("COPY20"))));
    // Swapped
    Assert.assertEquals(databus.getCacheMaxSize(), databus.cacheSize());
    LOG.debug(String.format("Cache content : %s", databus.printCache()));
  }

  /**
   * This unit test verify that from a given multimap the cache can be fullfilled with a
   * serializable hashmap
   */
  @Test
  public void storeContentInCacheWithSerializableOperation() {
    databus.getCpyRepo().invalidateCache();
    LOG.info("cache swapped - new size: " + databus.getCpyRepo().size());

    // create a dummy Multimap
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
    MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions);

    CpyStorable cpyStorable =
        CpyStorable.builder()
            .name("COPY-COPYBOOK")
            .content("FASDFASDFSF")
            .uri("/var/tmp/worspace1")
            .paragraphPosition(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions))
            .build();
    databus.storeData(cpyStorable);
    assert (cpyStorable.getParagraphPosition().size() > 0);
  }

  @Test
  public void getContentFromCacheWithDeserializeOperation() {
    Optional<CpyStorable> cpyStorable = databus.leastRecentlyUsed();
    assert !cpyStorable.isPresent() || (cpyStorable.get().getParagraphPosition().size() > 0);
  }
}
