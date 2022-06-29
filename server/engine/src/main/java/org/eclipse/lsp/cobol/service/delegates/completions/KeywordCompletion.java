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

import javax.annotation.Nullable;
import java.util.Collection;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.KEYWORDS;
import static org.eclipse.lsp4j.CompletionItemKind.Keyword;

/** This completion provider resolves keywords and documentation for them as static content */
@Singleton
public class KeywordCompletion implements Completion {
  private CompletionStorage<String> keywords;

  @Inject
  KeywordCompletion(@Named("Keywords") CompletionStorage keywords) {
    this.keywords = keywords;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
          @NonNull String token, @Nullable CobolDocumentModel document) {
    return keywords.getLabels().stream()
            .filter(DocumentationUtils.startsWithIgnoreCase(token))
            .map(this::toKeywordCompletion)
            .collect(toList());
  }

  private CompletionItem toKeywordCompletion(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setDocumentation(DocumentationUtils.wrapWithMarkup(keywords.getInformationFor(name)));
    item.setSortText(KEYWORDS.prefix + name);
    item.setKind(Keyword);
    return item;
  }
}
