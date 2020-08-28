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

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.Collection;

/**
 * Completion provider that allows to resolve autocomplete requests with specific items based on
 * type. The type of completion items may be dynamic (depends on the current document) and static
 * (does not depend on the document).
 *
 * <p>Use getSortOrderPrefix() to specify the order of the completions. It should go from dynamic to
 * static, from the most common the most rare.
 */
public interface Completion {

  /**
   * Retrieve a collection of string that are going to be converted into completion items. Use
   * document to retrieve dynamic data or some special stuff for static data.
   *
   * @param document - object that contains text and analysis output
   * @return collection of strings to be converted into completion items
   */
  @Nonnull
  Collection<String> getCompletionSource(@Nullable MyDocumentModel document);

  /**
   * Try to resolve the documentation for the completion item by its label
   *
   * @param label - A code part user typed in the IDE to be completed
   * @return the description for the label or null if not resolved
   */
  @Nullable
  default String tryResolve(@Nonnull String label) {
    return null;
  }

  /**
   * Get a prefix for the completion item to apply sort with the expected order
   *
   * @return a string containing number for proper sorting
   */
  @Nonnull
  String getSortOrderPrefix();

  /**
   * Get kind for the completion items to add specific icons on the client side.
   *
   * @return CompletionItemKind for the provided completions
   */
  @Nonnull
  CompletionItemKind getKind();

  /**
   * Set special values to the given item if it is needed. Return the given element with no changes
   * by default
   *
   * @param item - a CompletionItem to be customized
   * @return a CompletionItem item with some special values set or the given item in the other case
   */
  @Nonnull
  default CompletionItem customize(@Nonnull CompletionItem item) {
    return item;
  }
}
