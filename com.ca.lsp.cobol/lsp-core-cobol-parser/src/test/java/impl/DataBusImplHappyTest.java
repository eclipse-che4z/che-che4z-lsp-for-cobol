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

package impl;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CpyBuildEvent;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Created on 2019-10-02
 */
@Slf4j
public class DataBusImplHappyTest extends AbsDataBusImplTest {

    private DefaultDataBusBroker databus;

    @Before
    public void setUp() throws Exception {
        databus = LangServerCtx.getGuiceCtx(new DatabusModule()).getInjector().getInstance(DefaultDataBusBroker.class);
    }

    @After
    public void tearDown() throws Exception {
        databus = null;
    }

    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
        waiter.assertTrue(DataEventType.CPYBUILD_EVENT == adaptedDataEvent.getEventType());
        LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
        LOG.debug(String.format("Expected : %s", DataEventType.CPYBUILD_EVENT.getId()));
        waiter.resume();
    }

    @Test
    @SneakyThrows
    public void subscribe() {
        databus.subscribe(DataEventType.CPYBUILD_EVENT, this);
        databus.postData(CpyBuildEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
        waiter.await(5000);
    }

}