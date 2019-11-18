/*
 * Copyright (c) 2019 Broadcom.
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
import org.eclipse.lsp4j.InsertTextFormat;

import java.util.Collection;
import java.util.Optional;

public class SnippetCompletion extends AbstractCompletion {
  private static final Snippets SNIPPETS = new Snippets();

  @Override
  Collection<String> getCompletionSource(MyDocumentModel document) {
    return SNIPPETS.getLabels();
  }

  @Override
  String tryResolve(String label) {
    return Optional.ofNullable(SNIPPETS.getInformationFor(label))
        .map(string -> string.replaceAll("[${\\d:}]", ""))
        .orElse(null);
  }

  @Override
  protected String getSortOrderPrefix() {
    return "2";
  }

  @Override
  protected CompletionItem customize(CompletionItem item) {
    item.setInsertText(SNIPPETS.getInformationFor(item.getLabel()));
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    return item;
  }

  @Override
  protected CompletionItemKind getKind() {
    return CompletionItemKind.Snippet;
  }
}
