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

import com.broadcom.lsp.domain.cobol.factory.CblFetchSubcriberFactoryImpl;
import com.broadcom.lsp.domain.cobol.factory.CblScanSubcriberFactoryImpl;
import com.broadcom.lsp.domain.cobol.factory.CpyBuildSubcriberFactoryImpl;
import com.broadcom.lsp.domain.cobol.factory.UnknownSubcriberFactoryImpl;
import com.broadcom.lsp.domain.cobol.model.DataEventType;

import java.util.NoSuchElementException;

/**
 * Created on 17/10/2019
 */
public interface ISubscriberFactoryProvider {
    static ISubcriberAbsFactory getFactory(DataEventType choice) {
        switch (choice) {
            case CPYBUILD_EVENT:
                return new CpyBuildSubcriberFactoryImpl();
            case UNKNOWN_EVENT:
                return new UnknownSubcriberFactoryImpl();
            case CBLFETCH_EVENT:
                return new CblFetchSubcriberFactoryImpl();
            case CBLSCAN_EVENT:
                return new CblScanSubcriberFactoryImpl();
            default:
                throw new NoSuchElementException(String.format("No subscriber found for %s,%s", choice.getId(), choice.name()));
        }
    }
}
