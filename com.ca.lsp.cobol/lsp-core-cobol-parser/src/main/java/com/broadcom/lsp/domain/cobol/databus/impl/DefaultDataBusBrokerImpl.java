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

import com.broadcom.lsp.domain.cobol.databus.api.AbstractDataBusBrokerImpl;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.common.eventbus.EventBus;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.util.Optional;

/**
 * Created  on 16/10/2019
 */
@Slf4j
@Singleton
public class DefaultDataBusBrokerImpl<T extends DataEvent> extends AbstractDataBusBrokerImpl<T> {

    @Override
    public void postData(T dataEvent) {
        postData(dataEvent.getRegistryId(),dataEvent);
    }

    @Override
    public void postData(RegistryId registryId, T dataEvent) {
        seekRegistry(registryId).get().post(dataEvent);
    }

    @Override
    public void subscribe(T dataEvent) {
        subscribe(dataEvent.getRegistryId(),dataEvent);
    }

    @Override
    public void subscribe(RegistryId registryId, T dataEvent) {
        seekRegistry(registryId).get().register(dataEvent);
    }
}
