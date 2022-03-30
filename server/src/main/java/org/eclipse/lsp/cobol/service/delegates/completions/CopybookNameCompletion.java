/*
 * Copyright (c) 2022 Broadcom.
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
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.CopybookNameService;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nullable;
import java.util.Collection;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.COPYBOOKS;

/**
 * This class provides completion suggestions for copybooks present in the local copy path in the
 * workspace
 */
@Slf4j
@Singleton
public class CopybookNameCompletion implements Completion {
  private final CopybookNameService copybookNameService;

  @Inject
  public CopybookNameCompletion(CopybookNameService copybookNameService) {
    this.copybookNameService = copybookNameService;
  }

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {

    return copybookNameService.getNames().stream()
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .map(this::toCopybookCompletion)
        .collect(toList());
  }

  private CompletionItem toCopybookCompletion(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setSortText(COPYBOOKS.prefix + name);
    item.setKind(CompletionItemKind.Class);
    return item;
  }
}
