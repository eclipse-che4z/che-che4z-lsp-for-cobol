/*
 * Copyright (c) 2020 Broadcom.
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
package com.ca.lsp.cobol;

import com.broadcom.lsp.cdi.EngineModule;
import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

public abstract class ConfigurableTest {
  @BeforeAll
  public static void setUp() {
    LangServerCtx.getGuiceCtx(new TestModule(), new EngineModule(), new DatabusModule());
  }

  @AfterAll
  public static void tearDown() {
    LangServerCtx.shutdown();
  }
}
