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
 */

package com.broadcom.lsp.domain.cobol.event.impl;

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.AnalysisFinishedEvent;
import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.Subscribe;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

/** A subscriber for {@link AnalysisFinishedEvent} */
@Slf4j
@AllArgsConstructor
public class AnalysisFinishedEventSubscriber {

    @Getter @NonNull private EventObserver observer;
    @Getter @NonNull private AnalysisFinishedEvent eventType;

    @Subscribe
    @AllowConcurrentEvents
    @SneakyThrows
    public void onDataHandler(AnalysisFinishedEvent eventType) {
        LOG.debug(eventType.getHeader());
        observer.observerCallback(eventType);
    }
}
