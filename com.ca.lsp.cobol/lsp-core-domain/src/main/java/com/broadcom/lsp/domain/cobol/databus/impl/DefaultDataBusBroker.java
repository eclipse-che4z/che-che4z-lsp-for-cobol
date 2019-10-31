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
import com.broadcom.lsp.domain.cobol.model.*;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.SerializationUtils;

import java.util.Optional;

/**
 * Created  on 16/10/2019
 */
@Slf4j
@Singleton
public class DefaultDataBusBroker<T extends DataEvent, S> extends AbstractDataBusBroker<T, S> {

    @Inject
    public DefaultDataBusBroker(@Named("ASYNC-MESS-DISPATCHER") int nthread, CpyRepository cpyRepo) {
        super(nthread, cpyRepo);
    }

    /**
     * Compares its two arguments for order.  Returns a negative integer,
     * zero, or a positive integer as the first argument is less than, equal
     * to, or greater than the second.<p>
     **/


    @Override
    @SneakyThrows
    public void postData(@NonNull T dataEvent) {
        postData(dataEvent.getRegistryId(),dataEvent);
    }

    @Override
    @SneakyThrows
    public void postData(@NonNull RegistryId registryId, @NonNull T dataEvent) {
        seekRegistry(registryId).get().post(dataEvent);
    }

    @Override
    @SneakyThrows
    public void subscribe(@NonNull S dataSubscriber) {
        subscribe(RegistryId.GENERAL_REGISTRY_ID, dataSubscriber);
    }

    @Override
    @SneakyThrows
    public void subscribe(@NonNull RegistryId registryId, @NonNull S dataSubscriber) {
        seekRegistry(registryId).get().register(dataSubscriber);
    }

    @Override
    @SneakyThrows
    public void subscribe(@NonNull DataEventType eventType, @NonNull IDataBusObserver observer) {
        subscribe(getSubscriber(eventType, observer));
    }

    @Override
    @SneakyThrows
    @Synchronized
    public CpyStorable storeData(@NonNull CpyStorable dataEvent) {
        if (!dataEvent.getClass().toString().equals(CpyStorable.class.toString()))
            throw new ClassCastException(String.format("Required %s Type not satisfied, found %s", CpyStorable.class, dataEvent.getClass()));
        CpyStorable deepcopy = SerializationUtils.clone(dataEvent);
        if (!isStored(deepcopy.getId()))
            swapAndStore(deepcopy);
        getCpyRepo().setSort(false);
        return dataEvent;
    }

    @Override
    @SneakyThrows
    protected void swapAndStore(@NonNull CpyStorable deepcopy) {
        if (getCpyRepo().getCache().size() < getCpyRepo().getCacheMaxSize()) {
            getCpyRepo().getCache().add(deepcopy);
            return;
        }
        getCpyRepo().getCache()
                .remove(getCpyRepo().getCache().size() - 1);
        getCpyRepo().getCache()
                .add(deepcopy);
    }

    @Override
    @SneakyThrows
    public boolean isStored(@NonNull StringBuilder id) {
        long uuid = CpyStorable.calculateUUID(id);
        return isStored(uuid);
    }

    @Override
    @SneakyThrows
    public boolean isStored(@NonNull String id) {
        long uuid = CpyStorable.calculateUUID(id);
        return isStored(uuid);
    }

    @Override
    @SneakyThrows
    public boolean isStored(long uuid) {
        Optional<CpyStorable> cpy = getCpyRepo().getCache().stream()
                .filter(copy -> uuid == copy.getId())
                .findAny();
        if (cpy.isPresent()) {
            cpy.get().match();
            getCpyRepo().setSort(false);
        }
        return cpy.isPresent();
    }
}
