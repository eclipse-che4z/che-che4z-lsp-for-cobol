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

import com.broadcom.lsp.cdi.DomainModule;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.IObserver;
import com.broadcom.lsp.domain.cobol.model.*;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by lamgi04 on 2019-10-02
 */
@Slf4j
public class ISubScriberImplTest implements IObserver<DataEvent> {

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void subscribe() {
        Injector injector = Guice.createInjector(new DomainModule());
        DefaultDataBusBroker databus = (DefaultDataBusBroker) injector.getInstance(IDataBusBroker.class);

        databus.subscribe(DataEventType.CPYBUILD_EVENT, this);

        databus.postData(UnknownEvent.builder().eventMessage("UNKNOWN_SUBSCRIPTION TEST").build());
        databus.postData(CpyBuildEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
        databus.postData(CblFetchEvent.builder().name("CBLFETCH_SUBSCRIPTION TEST").build());
        databus.postData(CblScanEvent.builder().name("CBLSCAN_SUBSCRIPTION TEST").build());
        LOG.debug("DONE!");
    }


    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
        LOG.debug("CALLBACK WORKS!");
    }
}