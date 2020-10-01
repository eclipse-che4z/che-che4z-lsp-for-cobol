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
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Optional;

import static com.ca.lsp.cobol.service.delegates.completions.CompletionOrder.SNIPPETS;

@Singleton
public class SnippetCompletion implements Completion {
  private CompletionStorage snippets;

  @Inject
  SnippetCompletion(@Named("Snippets") CompletionStorage snippets) {
    this.snippets = snippets;
  }

  @Nonnull
  @Override
  public Collection<String> getCompletionSource(MyDocumentModel document) {
    return snippets.getLabels();
  }

  @Nullable
  @Override
  public String tryResolve(@Nonnull String label) {
    return Optional.ofNullable(snippets.getInformationFor(label))
        .map(string -> string.replaceAll("[${\\d:}]", ""))
        .orElse(null);
  }

  @Nonnull
  @Override
  public String getSortOrderPrefix() {
    return SNIPPETS.prefix;
  }

  @Nonnull
  @Override
  public CompletionItem customize(@Nonnull CompletionItem item) {
    item.setInsertText(snippets.getInformationFor(item.getLabel()));
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    return item;
  }

  @Nonnull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Snippet;
  }
}
