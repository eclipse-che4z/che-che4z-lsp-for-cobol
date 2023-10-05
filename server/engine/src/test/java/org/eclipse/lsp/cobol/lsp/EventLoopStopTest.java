/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp;

import org.junit.jupiter.api.Test;

import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Test if we can actually stop the event loop.
 */
class EventLoopStopTest {
  @Test
  void testStop() throws InterruptedException {
    LspMessageDispatcher queue = new LspMessageDispatcher();
    CompletableFuture<Void> done = queue.startEventLoop();
    queue.stop();
    done.join();
    assertTrue(true);
  }
}
