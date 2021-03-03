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

package org.eclipse.lsp.cobol.domain.event.impl;

import org.eclipse.lsp.cobol.domain.event.api.EventObserver;
import org.eclipse.lsp.cobol.domain.event.model.RunAnalysisEvent;
import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.Subscribe;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/** A subscriber for {@link RunAnalysisEvent} */
@Slf4j
@RequiredArgsConstructor
public class RunAnalysisEventSubscriber {

  @Getter @NonNull private EventObserver observer;

  @NonNull @Getter private RunAnalysisEvent eventType;

  @Subscribe
  @AllowConcurrentEvents
  public void onDataHandler(RunAnalysisEvent eventType) {
    LOG.debug(eventType.getHeader());
    observer.observerCallback(eventType);
  }
}
