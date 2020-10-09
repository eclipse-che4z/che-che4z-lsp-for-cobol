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
package com.broadcom.lsp.cobol.service.delegates.completions;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.Collection;

import static com.broadcom.lsp.cobol.service.delegates.completions.CompletionOrder.KEYWORDS;

@Singleton
public class KeywordCompletion implements Completion {
  private CompletionStorage keywords;

  @Inject
  KeywordCompletion(@Named("Keywords") CompletionStorage keywords) {
    this.keywords = keywords;
  }

  @Nonnull
  @Override
  public Collection<String> getCompletionSource(CobolDocumentModel document) {
    return keywords.getLabels();
  }

  @Nullable
  @Override
  public String tryResolve(@Nonnull String label) {
    return keywords.getInformationFor(label);
  }

  @Nonnull
  @Override
  public String getSortOrderPrefix() {
    return KEYWORDS.prefix;
  }

  @Nonnull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Keyword;
  }
}
