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
package org.eclipse.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Optional;

import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.SNIPPETS;

/** implementation for adding snippets in the autocomplete list */
@Singleton
public class SnippetCompletion implements Completion {
  private CompletionStorage snippets;

  @Inject
  SnippetCompletion(@Named("Snippets") CompletionStorage snippets) {
    this.snippets = snippets;
  }

  @NonNull
  @Override
  public Collection<String> getCompletionSource(CobolDocumentModel document) {
    return snippets.getLabels();
  }

  @Nullable
  @Override
  public String tryResolve(@NonNull String label) {
    return Optional.ofNullable(snippets.getInformationFor(label))
        .map(string -> string.replaceAll("[${\\d:}]", ""))
        .orElse(null);
  }

  @NonNull
  @Override
  public String getSortOrderPrefix() {
    return SNIPPETS.prefix;
  }

  @NonNull
  @Override
  public CompletionItem customize(@NonNull CompletionItem item) {
    item.setInsertText(snippets.getInformationFor(item.getLabel()));
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    return item;
  }

  @NonNull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Snippet;
  }
}
