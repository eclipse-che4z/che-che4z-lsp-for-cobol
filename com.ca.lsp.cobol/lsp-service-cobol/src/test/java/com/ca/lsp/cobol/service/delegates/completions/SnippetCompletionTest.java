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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;
import org.junit.Before;
import org.junit.Test;

import java.util.Collection;

import static org.junit.Assert.*;

public class SnippetCompletionTest {
  private static final String INSERT_TEXT = "WRITE ${1:item}";
  private static final String DOCUMENTATION_TEXT = "WRITE item";
  private static final String LABEL = "WRITE";
  private SnippetCompletion provider;

  @Before
  public void prepareProvider() {
    provider = new SnippetCompletion(new Snippets());
  }

  @Test
  public void testGetCompletionSource() {
    Collection<String> strings = provider.getCompletionSource(null);
    assertFalse(strings.isEmpty());
    assertTrue(strings.contains(LABEL));
  }

  @Test
  public void testTryResolvePositive() {
    assertEquals(DOCUMENTATION_TEXT, provider.tryResolve(LABEL));
  }

  @Test
  public void testTryResolveNegative() {
    assertNull(provider.tryResolve("non-existing string"));
  }

  @Test
  public void testTryResolveNull() {
    assertNull(provider.tryResolve(null));
  }

  @Test
  public void testGetSortOrderPrefix() {
    assertEquals("3", provider.getSortOrderPrefix());
  }

  @Test
  public void testGetKind() {
    assertEquals(CompletionItemKind.Snippet, provider.getKind());
  }

  @Test
  public void testCustomize() {
    CompletionItem item = new CompletionItem(LABEL);
    CompletionItem actual = provider.customize(item);
    assertEquals(LABEL, actual.getLabel());
    assertEquals(INSERT_TEXT, actual.getInsertText());
    assertEquals(InsertTextFormat.Snippet, actual.getInsertTextFormat());
  }
}
