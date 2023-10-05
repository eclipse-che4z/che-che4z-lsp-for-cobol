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

import org.eclipse.lsp4j.InitializeResult;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test LSP Event processing loop.
 */
class EventLoopTest {
  LspMessageDispatcher loop;

  @BeforeEach
  void setUp() {
    loop = new LspMessageDispatcher();
    loop.startEventLoop();
  }

  @AfterEach
  void tearDown() throws InterruptedException {
    loop.stop();
  }

  @Test
  void testInitialize() throws ExecutionException, InterruptedException, TimeoutException {
    InitializeResult initResult = new InitializeResult();
    CompletableFuture<InitializeResult> result = loop.publish(new LspEvent<InitializeResult>() {
      @Override
      public InitializeResult execute() {
        return initResult;
      }
    });
    assertEquals(initResult, result.get(1, TimeUnit.SECONDS));
  }
}
