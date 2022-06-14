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
import org.eclipse.lsp4j.*;

import javax.annotation.Nullable;
import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.SNIPPETS;

/**
 * This completion provider resolves static server-side snippets, and their human-readable
 * representation as documentation
 */
@Singleton
public class SnippetCompletion implements Completion {
  private final CompletionStorage<SnippetsModel> snippets;
  private final static String BACKTICK = "```";
  private final static String LANGUAG_ID = "COBOL";

  @Inject
  SnippetCompletion(@Named("Snippets") CompletionStorage snippets) {
    this.snippets = snippets;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {
    return snippets.getLabels().stream()
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .collect(Collectors.toList())
        .stream()
        .map(snippets::getSnippet)
        .map(this::toSnippetCompletions)
        .collect(toList());
  }

  private CompletionItem toSnippetCompletions(SnippetsModel snippet) {
    CompletionItem item = new CompletionItem(snippet.getPrefix());
    item.setLabel(snippet.getPrefix());
    item.setInsertText(String.join("\n", snippet.getBody()));
    item.setInsertTextMode(InsertTextMode.AdjustIndentation);
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    item.setDocumentation(retrieveDocumentation(snippet.getBody()));
    item.setDetail(snippet.getDescription());
    item.setSortText(SNIPPETS.prefix + snippet.getPrefix());
    item.setKind(CompletionItemKind.Snippet);
    return item;
  }

  @NonNull
  private MarkupContent retrieveDocumentation(String[] label) {

    return DocumentationUtils.wrapWithMarkup(BACKTICK+LANGUAG_ID+"\n"+
        Arrays.stream(label).map(string -> string.replaceAll("[${\\d:}]", "")).collect(Collectors.joining("\n"))+"\n"+BACKTICK);
  }
}
