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


import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBrokerImpl;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.broadcom.lsp.domain.cobol.model.RegistryId;
import com.google.common.eventbus.EventBus;
import com.google.inject.ImplementedBy;
import com.google.inject.Singleton;

import java.util.HashSet;

/**
 * Created on 2019-10-01
 */

@ImplementedBy(DefaultDataBusBrokerImpl.class)
@Singleton
public interface IDataBusBroker<T extends DataEvent> {
    HashSet<EventBus> registrySet = new HashSet<>();
    void postData(T dataEvent);
    void postData(RegistryId registryId,T dataEvent);
    void subscribe(T dataEvent);
    void subscribe(RegistryId registryId, T dataEvent);
}
