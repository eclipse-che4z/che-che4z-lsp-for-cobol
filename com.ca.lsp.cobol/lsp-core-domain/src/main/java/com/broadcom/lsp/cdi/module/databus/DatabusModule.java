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

package com.broadcom.lsp.cdi.module.databus;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.google.inject.name.Names;

/**
 * Created   on 2019-10-02
 */
//Binding Module
public class DatabusModule extends DefaultModule {
    @Override
    protected void configure() {
        super.configure();
        bindConstant()
                .annotatedWith(Names.named("ASYNC-MESS-DISPATCHER"))
                .to(10);
        bindConstant()
                .annotatedWith(Names.named("CACHE-MAX-SIZE"))
                .to(5);
    }
}
