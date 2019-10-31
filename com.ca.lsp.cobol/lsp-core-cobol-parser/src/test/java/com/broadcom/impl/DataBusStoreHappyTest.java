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
import com.broadcom.lsp.domain.cobol.databus.impl.CpyRepositoryLRU;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.util.Optional;

/**
 * Created on 2019-10-02
 */
@Slf4j
public class DataBusStoreHappyTest extends AbsDataBusImplTest {

    private DefaultDataBusBroker databus;

    @Before
    public void setUp() throws Exception {
        databus = LangServerCtx.getGuiceCtx(new DatabusModule()).getInjector().getInstance(DefaultDataBusBroker.class);
        databus.storeData(CpyStorable.builder()
                .name("COPY1")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
        databus.storeData(CpyStorable.builder()
                .name("COPY2")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
        databus.storeData(CpyStorable.builder()
                .name("COPY3")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
        databus.storeData(CpyStorable.builder()
                .name("COPY4")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
        databus.storeData(CpyStorable.builder()
                .name("COPY40")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
    }

    @After
    public void tearDown() throws Exception {
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
        Assert.assertFalse(databus.isStored(CpyRepositoryLRU.calculateUUID(new StringBuilder("COPY20"))));
        LOG.debug(String.format("Cache content : %s", databus.printCache()));
        Optional<CpyStorable> leastRecentlyUsed = databus.lastRecentlyUsed();
        LOG.debug(String.format("Least Recently Used item : %s  ID : %d", leastRecentlyUsed.get().getName(), leastRecentlyUsed.get().getId()));
        //Cache is Full
        LOG.debug(String.format("Cache STATUS --> MaxCacheSize: %d  ActualCacheSize: %d", databus.getCacheMaxSize(), databus.cacheSize()));
        Assert.assertEquals(databus.getCacheMaxSize(), databus.cacheSize());
        LOG.debug(String.format("Storing new item %s ", "COPY20"));
        databus.storeData(CpyStorable.builder()
                .name("COPY20")
                .content("FASDFASDFSF")
                .position("ROW:3,COL:4")
                .uri("/var/tmp/worspace1")
                .build());
        Assert.assertTrue(databus.isStored(CpyRepositoryLRU.calculateUUID(new StringBuilder("COPY20"))));
        //Swapped
        Assert.assertEquals(databus.getCacheMaxSize(), databus.cacheSize());
        LOG.debug(String.format("Cache content : %s", databus.printCache()));
    }
}