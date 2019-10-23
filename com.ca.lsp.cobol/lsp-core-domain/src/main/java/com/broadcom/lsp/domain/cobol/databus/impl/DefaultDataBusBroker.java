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

import com.broadcom.lsp.domain.cobol.databus.api.AbstractDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.inject.Singleton;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

/**
 * Created  on 16/10/2019
 */
@Slf4j
@Singleton
public class DefaultDataBusBroker<T extends DataEvent, S> extends AbstractDataBusBroker<T, S> {

    @Override
    @SneakyThrows
    public void postData(T dataEvent) {
        postData(dataEvent.getRegistryId(),dataEvent);
    }

    @Override
    @SneakyThrows
    public void postData(RegistryId registryId, T dataEvent) {
        seekRegistry(registryId).get().post(dataEvent);
    }

    @Override
    @SneakyThrows
    public void subscribe(S dataSubscriber) {
        subscribe(RegistryId.GENERAL_REGISTRY_ID, dataSubscriber);
    }

    @Override
    @SneakyThrows
    public void subscribe(RegistryId registryId, S dataSubscriber) {
        seekRegistry(registryId).get().register(dataSubscriber);
    }

    @Override
    @SneakyThrows
    public void subscribe(DataEventType eventType, IDataBusObserver observer) {
        subscribe(getSubscriber(eventType, observer));
    }
}
