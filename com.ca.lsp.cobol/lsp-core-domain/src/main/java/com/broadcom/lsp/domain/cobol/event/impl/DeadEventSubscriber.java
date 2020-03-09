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

package com.broadcom.lsp.domain.cobol.event.impl;

import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.DeadEvent;
import com.google.common.eventbus.Subscribe;
import lombok.extern.slf4j.Slf4j;

/** This subscriber manages the events that cannot be handled. */
@Slf4j
public class DeadEventSubscriber {

  @Subscribe
  @AllowConcurrentEvents
  public void onDataHandler(DeadEvent eventType) {
    LOG.warn(String.format("DROPPED Event : %s", eventType.getEvent().toString()));
  }
}
