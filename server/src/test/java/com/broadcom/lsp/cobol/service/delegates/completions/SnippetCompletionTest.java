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
package com.broadcom.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Collection;

import static org.junit.jupiter.api.Assertions.*;

/** Test to check SnippetCompletion */
class SnippetCompletionTest {
  private static final String INSERT_TEXT = "WRITE ${1:item}";
  private static final String DOCUMENTATION_TEXT = "WRITE item";
  private static final String LABEL = "WRITE";
  private SnippetCompletion provider;

  @BeforeEach
  void prepareProvider() {
    provider = new SnippetCompletion(new Snippets());
  }

  @Test
  void testGetCompletionSource() {
    Collection<String> strings = provider.getCompletionSource(null);
    assertFalse(strings.isEmpty());
    assertTrue(strings.contains(LABEL));
  }

  @Test
  void testTryResolvePositive() {
    assertEquals(DOCUMENTATION_TEXT, provider.tryResolve(LABEL));
  }

  @Test
  void testTryResolveNegative() {
    assertNull(provider.tryResolve("non-existing string"));
  }

  @Test
  void testTryResolveNull() {
    Assertions.assertThrows(
            IllegalArgumentException.class,
        () -> {
          provider.tryResolve(null);
        });
  }

  @Test
  void testGetSortOrderPrefix() {
    assertEquals("6", provider.getSortOrderPrefix());
  }

  @Test
  void testGetKind() {
    assertEquals(CompletionItemKind.Snippet, provider.getKind());
  }

  @Test
  void testCustomize() {
    CompletionItem item = new CompletionItem(LABEL);
    CompletionItem actual = provider.customize(item);
    assertEquals(LABEL, actual.getLabel());
    assertEquals(INSERT_TEXT, actual.getInsertText());
    assertEquals(InsertTextFormat.Snippet, actual.getInsertTextFormat());
  }
}
