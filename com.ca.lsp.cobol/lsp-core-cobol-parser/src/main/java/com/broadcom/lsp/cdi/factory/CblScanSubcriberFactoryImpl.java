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

package com.broadcom.lsp.cdi.factory;

import com.broadcom.lsp.domain.cobol.databus.api.IObserver;
import com.broadcom.lsp.domain.cobol.databus.api.ISubcriberAbsFactory;
import com.broadcom.lsp.domain.cobol.databus.impl.CblScanEventSubScriber;
import com.broadcom.lsp.domain.cobol.model.CblScanEvent;

/**
 * Created on 17/10/2019
 */
public class CblScanSubcriberFactoryImpl<T> implements ISubcriberAbsFactory<CblScanEventSubScriber> {
    @Override
    public CblScanEventSubScriber create(IObserver observer) {
        return new CblScanEventSubScriber(CblScanEvent.builder().build());
    }
}
