/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.domain.databus.impl;

import com.google.common.eventbus.AsyncEventBus;
import com.google.common.eventbus.EventBus;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.api.DeadEventSubscriber;
import org.eclipse.lsp.cobol.domain.databus.model.DataEvent;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;

import java.util.concurrent.ExecutorService;

/**
 * This class is the default implementation for databus broker.
 */
@Slf4j
@Singleton
public class DefaultDataBusBroker implements DataBusBroker {
  private EventBus eventBus;

  @Inject
  DefaultDataBusBroker(CustomThreadPoolExecutor customExecutor, DeadEventSubscriber deadEventSubscriber) {
    ExecutorService executor = customExecutor.getThreadPoolExecutor();
    eventBus = new AsyncEventBus(executor);
    eventBus.register(deadEventSubscriber);
  }

  @Override
  public void postData(@NonNull DataEvent dataEvent) {
    LOG.debug("Post data: {}", dataEvent);
    eventBus.post(dataEvent);
  }

  @Override
  public void subscribe(@NonNull Object dataSubscriber) {
    LOG.debug("Subscription: {}", dataSubscriber);
    eventBus.register(dataSubscriber);
  }

  @Override
  public void unSubscribe(@NonNull Object dataSubscriber) {
    LOG.debug("Unsubscription: {}", dataSubscriber);
    eventBus.unregister(dataSubscriber);
  }
}
