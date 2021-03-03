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
import org.eclipse.lsp4j.CompletionItemKind;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.Collection;

import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.KEYWORDS;

/** implementation for adding keywords in the autocomplete list */
@Singleton
public class KeywordCompletion implements Completion {
  private CompletionStorage keywords;

  @Inject
  KeywordCompletion(@Named("Keywords") CompletionStorage keywords) {
    this.keywords = keywords;
  }

  @NonNull
  @Override
  public Collection<String> getCompletionSource(CobolDocumentModel document) {
    return keywords.getLabels();
  }

  @Nullable
  @Override
  public String tryResolve(@NonNull String label) {
    return keywords.getInformationFor(label);
  }

  @NonNull
  @Override
  public String getSortOrderPrefix() {
    return KEYWORDS.prefix;
  }

  @NonNull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Keyword;
  }
}
