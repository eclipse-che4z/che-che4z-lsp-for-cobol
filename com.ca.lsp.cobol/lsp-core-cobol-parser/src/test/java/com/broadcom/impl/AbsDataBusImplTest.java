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

import com.broadcom.lsp.domain.cobol.databus.api.DataBusObserver;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;

/**
 * This class is an abstraction for databus tests. It uses {@link Waiter} to apply waiting for the
 * asynchronous tasks.
 */
@Slf4j
public abstract class AbsDataBusImplTest implements DataBusObserver<DataEvent> {
  @Getter protected final Waiter waiter = new Waiter();

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug("CALLBACK WORKS!");
  }
}
