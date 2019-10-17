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

package com.broadcom.lsp.domain.cobol.databus.api;

import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.common.eventbus.AsyncEventBus;
import com.google.common.eventbus.EventBus;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created  on 16/10/2019
 */
@Slf4j
public abstract class AbstractDataBusBrokerImpl<T extends DataEvent> implements IDataBusBroker<T> {
    private ExecutorService executor = Executors.newFixedThreadPool(10);
    private EventBus generalRegistry = new AsyncEventBus(RegistryId.GENERAL_REGISTRY_ID.getId(), executor);
    private EventBus scannerRegistry = new AsyncEventBus(RegistryId.SCANNER_REGISTRY_ID.getId(), executor);
    private EventBus fetcherRegistry = new AsyncEventBus(RegistryId.FETCHER_REGISTRY_ID.getId(), executor);
    private EventBus cpyRegistry = new AsyncEventBus(RegistryId.CPY_REGISTRY_ID.getId(), executor);

    public AbstractDataBusBrokerImpl() {
        registrySet.add(generalRegistry);
    }

    @SneakyThrows
    protected Optional<EventBus> seekRegistry (RegistryId registryId){
        return registrySet.stream().filter(s -> s.equals(registryId.getId())).findFirst();
    }
}
