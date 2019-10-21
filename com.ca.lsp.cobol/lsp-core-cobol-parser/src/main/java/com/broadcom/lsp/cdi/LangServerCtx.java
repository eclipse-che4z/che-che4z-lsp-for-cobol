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

package com.broadcom.lsp.cdi;

import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.extern.slf4j.Slf4j;

/**
 * Created on 2019-10-03
 * Quick workaround to mantain the backward compatibility
 * meanwhile the old stack doesn't support DI.
 */
@Slf4j
public class LangServerCtx {
    private static final Injector injector = Guice.createInjector(new LangServerModule(), new DomainModule());
    public static Injector getGuiceCtx(){
        return injector;
    }

}
