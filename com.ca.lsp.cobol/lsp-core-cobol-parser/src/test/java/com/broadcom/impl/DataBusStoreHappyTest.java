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

import static junit.framework.TestCase.assertEquals;
import static junit.framework.TestCase.assertTrue;

/** Created on 2019-10-02 */
@Slf4j
public class DataBusStoreHappyTest extends AbsDataBusImplTest {
  // cache dummy static content
  private static final String CPY_FIXED_NAME = "COPY-";
  private static final String CPY_FIXED_CONTENT = "FASDFASDFSF";
  private static final String CPY_FIXED_POSITION = "ROW:3,COL:4";
  private static final String CPY_FIXED_URI = "/var/tmp/worspace1";

  private final String PARAGRAPH_NAME = "PARNAME";
  private final Position POSITION_FIRST_OCCURRENCE = new Position(null, 0, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(null, 10, 10, 10, 10, 10);
  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  private DefaultDataBusBroker databus;

  @Before
  public void setUp() throws Exception {
    // create a dummy Multimap
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
    MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions);

    databus =
        LangServerCtx.getGuiceCtx(new DatabusTestModule())
            .getInjector()
            .getInstance(DefaultDataBusBroker.class);

    // TODO: parametrize store data (size-1 to add also copybook..)
    fulfillDatabusCacheContent(databus.getCacheMaxSize());

    // add one more elemnent
    databus.storeData(
        CpyStorable.builder()
            .name("COPY-COPYBOOK")
            .content(CPY_FIXED_CONTENT)
            .uri(CPY_FIXED_URI)
            .paragraphPosition(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions))
            .build());
  }

  @After
  public void tearDown() {
    databus = null;
    LangServerCtx.shutdown();
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
  }

  @Test
  @SneakyThrows
  public void cacheData() {
    String newCopybookName = "COPY-" + (databus.getCacheMaxSize() + 1);
    Assert.assertFalse(
        databus.isStored(ICpyRepository.calculateUUID(new StringBuilder(newCopybookName))));
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

    LOG.debug(String.format("Storing new item %s ", newCopybookName));
    databus.storeData(
        CpyStorable.builder()
            .name(newCopybookName)
            .content(CPY_FIXED_CONTENT)
            .position(CPY_FIXED_POSITION)
            .uri(CPY_FIXED_URI)
            .build());
    Assert.assertTrue(
        databus.isStored(ICpyRepository.calculateUUID(new StringBuilder(newCopybookName))));
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
    assertTrue(cpyStorable.getParagraphPosition().size() > 0);
  }

  @Test
  public void getContentFromCacheWithDeserializeOperation() {
    Optional<CpyStorable> cpyStorable = databus.leastRecentlyUsed();
    assertTrue(!cpyStorable.isPresent() || (cpyStorable.get().getParagraphPosition().size() > 0));
  }

  @Test
  public void invalidateCacheTest() {
    LOG.info("Current cache sizing is: " + databus.getCpyRepo().size());
    LOG.info("Apply cache invalidation...");
    databus.getCpyRepo().invalidateCache();
    LOG.info("New cache sizing is: " + databus.getCpyRepo().size());
    assertEquals(0, databus.getCpyRepo().size());
  }

  @Test
  public void geteElementFromCache() {
    String element = "COPY-1";
    assertTrue(databus.isStored(ICpyRepository.calculateUUID(new StringBuilder(element))));
  }

  private void fulfillDatabusCacheContent(int cacheMaxSize) {
    for (int i = 0; i < cacheMaxSize; i++) {
      databus.storeData(
          CpyStorable.builder()
              .name(CPY_FIXED_NAME + i)
              .content("FASDFASDFSF")
              .position("ROW:3,COL:4")
              .uri("/var/tmp/worspace1")
              .build());
    }
  }
}
