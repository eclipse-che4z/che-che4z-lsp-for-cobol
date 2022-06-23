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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;
import org.eclipse.lsp4j.MarkupContent;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Optional;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.SNIPPETS;

/**
 * This completion provider resolves static server-side snippets, and their human-readable
 * representation as documentation
 */
@Singleton
public class SnippetCompletion implements Completion {
  private final CompletionStorage snippets;

  @Inject
  SnippetCompletion(@Named("Snippets") CompletionStorage snippets) {
    this.snippets = snippets;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {
    return snippets.getLabels().stream()
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .map(this::toSnippetCompletions)
        .collect(toList());
  }

  private CompletionItem toSnippetCompletions(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(snippets.getInformationFor(item.getLabel()));
    item.setDocumentation(retrieveDocumentation(name));
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    item.setSortText(SNIPPETS.prefix + name);
    item.setKind(CompletionItemKind.Snippet);
    return item;
  }

  @NonNull
  private MarkupContent retrieveDocumentation(String label) {
    return DocumentationUtils.wrapWithMarkup(
        Optional.ofNullable(snippets.getInformationFor(label))
            .map(string -> string.replaceAll("[${\\d:}]", ""))
            .orElse(""));
  }
}
