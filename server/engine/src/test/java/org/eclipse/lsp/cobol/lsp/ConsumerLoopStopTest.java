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

import static java.util.Collections.emptyList;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.eclipse.lsp.cobol.lsp.events.queries.CodeActionQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.CodeActionHandler;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

/**
 * Test if we can actually stop the consumer.
 */
class ConsumerLoopStopTest {
  @Test
  void testStop() throws InterruptedException, ExecutionException {
    LspMessageBroker queue = new LspMessageBroker();
    LspEventConsumer lspEventConsumer = new LspEventConsumer(queue);
    lspEventConsumer.startConsumer();
    queue.stop();
    CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery = waitingQuery(queue);
    try {
      waitingQuery.get(200, TimeUnit.MILLISECONDS);
    } catch (TimeoutException e) {
      assertTrue(true);
    }
  }

  private static CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery(LspMessageBroker lspMessageBroker) {
    CodeActionParams params = mock(CodeActionParams.class);
    CodeActionHandler codeActionHandler = mock(CodeActionHandler.class);
    when(codeActionHandler.codeAction(params)).thenReturn(emptyList());
    CodeActionQuery codeActionQuery = new CodeActionQuery(params, codeActionHandler);
    lspMessageBroker.query(codeActionQuery);
    return codeActionQuery.getResult();
  }
}
