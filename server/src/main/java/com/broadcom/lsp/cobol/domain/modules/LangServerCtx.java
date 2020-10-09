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

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import lombok.Getter;
import lombok.NonNull;
import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;

/**
 * Created on 2019-10-03 Quick workaround to have the backward compatibility meanwhile the old stack
 * doesn't support DI.
 */
@Slf4j
public class LangServerCtx {
  private static LangServerCtx singleInstance = null;
  @Getter private static Injector injector;

  private LangServerCtx(Module[] modules) {
    injector = Guice.createInjector(modules);
  }

  @Synchronized
  public static LangServerCtx getGuiceCtx(@NonNull Module... modules) {
    if (singleInstance == null) {
      singleInstance = new LangServerCtx(modules);
    } else {
      injector.createChildInjector(modules);
    }
    return singleInstance;
  }

  public static void shutdown() {
    singleInstance = null;
    injector = null;
  }
}
