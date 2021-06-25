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

import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;

import javax.annotation.Nullable;
import java.util.Collection;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.CONSTANTS;
import static org.eclipse.lsp4j.CompletionItemKind.Constant;

/** This class resolves the predefined variables' completion requests */
@Singleton
public class ConstantCompletion implements Completion {

  @Override
  public @NonNull Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document) {
    if (document == null) return emptyList();
    return document.getAnalysisResult().getConstants().stream()
        .filter(DocumentationUtils.startsWithIgnoreCase(token))
        .map(this::toConstantCompletion)
        .collect(toList());
  }

  private CompletionItem toConstantCompletion(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setSortText(CONSTANTS.prefix + name);
    item.setKind(Constant);
    return item;
  }
}
