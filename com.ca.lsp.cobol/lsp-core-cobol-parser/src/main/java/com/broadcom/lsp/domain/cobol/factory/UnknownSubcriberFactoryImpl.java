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

package com.broadcom.lsp.domain.cobol.factory;

import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.databus.api.ISubcriberAbsFactory;
import com.broadcom.lsp.domain.cobol.databus.impl.UnknownEventSubScriber;
import com.broadcom.lsp.domain.cobol.model.UnknownEvent;

/**
 * Created on 17/10/2019
 */
public class UnknownSubcriberFactoryImpl<T> implements ISubcriberAbsFactory<UnknownEventSubScriber> {

    @Override
    public UnknownEventSubScriber create(IDataBusObserver observer) {
        return new UnknownEventSubScriber(observer, UnknownEvent.builder().build());
    }
}
