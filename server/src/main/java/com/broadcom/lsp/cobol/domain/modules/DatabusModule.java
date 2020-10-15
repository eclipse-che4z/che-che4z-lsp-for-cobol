/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.cobol.domain.modules;

import com.google.inject.AbstractModule;
import com.google.inject.name.Names;

/** This module provides DI bindings with default values for databus parameters. */
public class DatabusModule extends AbstractModule {
  @Override
  protected void configure() {
    bindConstant().annotatedWith(Names.named("ASYNC-MESS-DISPATCHER")).to(10);
    bindConstant().annotatedWith(Names.named("CACHE-MAX-SIZE")).to(500);
    bindConstant().annotatedWith(Names.named("CACHE-DURATION")).to(3);
    bindConstant().annotatedWith(Names.named("CACHE-TIME-UNIT")).to("HOURS");
  }
}
