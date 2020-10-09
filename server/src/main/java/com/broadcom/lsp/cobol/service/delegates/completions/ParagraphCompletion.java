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
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.CompletionItemKind;

import javax.annotation.Nonnull;
import java.util.Collection;
import java.util.Collections;
import java.util.Optional;

import static com.broadcom.lsp.cobol.service.delegates.completions.CompletionOrder.PARAGRAPHS;

@Singleton
public class ParagraphCompletion implements Completion {

  @Nonnull
  @Override
  public Collection<String> getCompletionSource(CobolDocumentModel document) {
    return Optional.ofNullable(document)
        .map(CobolDocumentModel::getAnalysisResult)
        .map(AnalysisResult::getParagraphs)
        .orElse(Collections.emptySet());
  }

  @Nonnull
  @Override
  public String getSortOrderPrefix() {
    return PARAGRAPHS.prefix;
  }

  @Nonnull
  @Override
  public CompletionItemKind getKind() {
    return CompletionItemKind.Method;
  }
}
