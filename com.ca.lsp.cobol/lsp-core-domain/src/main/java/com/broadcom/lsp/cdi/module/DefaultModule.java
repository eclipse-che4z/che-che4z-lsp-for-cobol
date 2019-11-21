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

package com.broadcom.lsp.cdi.module;

import com.google.inject.AbstractModule;
import com.google.inject.name.Names;

/**
 * THis is a default module that provides DI bindings.
 */
public class DefaultModule extends AbstractModule {
    @Override
    protected void configure() {
        bindConstant()
                .annotatedWith(Names.named("VERSION"))
                .to("0.8");
    }
}
