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

package impl;

import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.model.DataEvent;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;

/**
 * Created on 2019-10-02
 */
@Slf4j
public abstract class AbsDataBusImplTest implements IDataBusObserver<DataEvent> {
    @Getter
    protected final Waiter waiter = new Waiter();

    public abstract void setUp() throws Exception;

    public abstract void tearDown() throws Exception;

    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
        LOG.debug("CALLBACK WORKS!");
    }
}