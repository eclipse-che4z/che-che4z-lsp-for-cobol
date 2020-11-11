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

package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.MarkupContent;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.function.Consumer;

import static org.junit.jupiter.api.Assertions.*;

/**
 * This test checks the logic of completion items resolution implemented by {@link
 * TextDocumentService}. The idea of this process is that on the textDocument/completion request the
 * server responses with {@link CompletionItem} without any documentation. To fulfill the {@link
 * CompletionItem} there is an entry point completionItem/resolve. The test cases here check how
 * does server manages different resolving requests, for example for the element that has
 * documentation provided, the one that has no documentation and an invalid request.
 */
class CompletionResolutionTest extends ConfigurableTest {
  private TextDocumentService service;

  @BeforeEach
  void createService() {
    service = injector.getInstance(TextDocumentService.class);
  }

  @Test
  void testResolveCompletionItemExisting() {
    CompletionItem unresolved = new CompletionItem("ADD");

    checkResolving(
        unresolved,
        c -> {
          assertNotNull(c.getValue());
          assertFalse(c.getValue().isBlank());
        });
  }

  @Test
  void testResolveCompletionItemNonExisting() {
    CompletionItem unresolved = new CompletionItem("abcd");
    checkResolving(unresolved, c -> assertNull(c.getValue()));
  }

  private void checkResolving(CompletionItem unresolved, Consumer<? super MarkupContent> consumer) {
    CompletableFuture<CompletionItem> resolveCompletionItem =
        service.resolveCompletionItem(unresolved);
    try {
      CompletionItem completionItem = resolveCompletionItem.get();
      Either<String, MarkupContent> documentation = completionItem.getDocumentation();
      MarkupContent content = documentation.getRight();
      Optional.of(content).ifPresent(consumer);
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }
}
