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
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RequiredCopybookEvent;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.concurrent.TimeoutException;

/**
 * This test verifies that the object that was unsubscribed from the databus doesn't receive
 * notifications anymore.
 */
@Slf4j
public class DataBusUnSubscribeTest extends AbsDataBusImplTest {

  private DefaultDataBusBroker databus;

  @Before
  public void setUp() {
    databus =
        LangServerCtx.getGuiceCtx(new DatabusTestModule())
            .getInjector()
            .getInstance(DefaultDataBusBroker.class);
  }

  @After
  public void tearDown() {
    databus = null;
    LangServerCtx.shutdown();
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(DataEventType.REQUIRED_COPYBOOK_EVENT == adaptedDataEvent.getEventType());
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
    LOG.debug(String.format("Expected : %s", DataEventType.REQUIRED_COPYBOOK_EVENT.getId()));
    waiter.resume();
  }

  @Test(expected = TimeoutException.class)
  @SneakyThrows
  public void subscribe() {
    // Subscribe
    Object subscriber = databus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
    databus.postData(RequiredCopybookEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
    waiter.await(5000);
    // Unsubscribe
    databus.unSubscribe(subscriber);
    databus.postData(RequiredCopybookEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
    // wait undefined because no subscriber anymore
    waiter.await(5000);
  }
}
