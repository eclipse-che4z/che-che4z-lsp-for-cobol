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
package org.eclipse.lsp.cobol.utils;

import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertNotNull;

/**
 * This class tests provided Custom Thread Executors (ThreadPoolExecutor and
 * ScheduledThreadPoolExecutor)
 */
class CustomThreadPoolExecutorTest {

  @Test
  void customExecutorCreatioinTest() {
    CustomThreadPoolExecutor customExecutor = new CustomThreadPoolExecutorService(4, 5, 60, 3);
    assertNotNull(customExecutor.getThreadPoolExecutor());
    assertNotNull(customExecutor.getScheduledThreadPoolExecutor());
  }
}
