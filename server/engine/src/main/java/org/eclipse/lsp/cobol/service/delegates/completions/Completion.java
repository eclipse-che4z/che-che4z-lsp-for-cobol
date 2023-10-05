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

import lombok.NonNull;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.Objects;

/**
 * Completion provider that allows to resolve autocomplete requests with specific items based on
 * type. The type of completion items may be dynamic (depends on the current document) and static
 * (does not depend on the document).
 */
public interface Completion {

  /**
   * Provide a list of completion items of specific kind
   *
   * @param token - token to filter the suggestions
   * @param document - object that contains text and analysis output
   * @return collection of strings to be converted into completion items
   */
  @NonNull
  Collection<CompletionItem> getCompletionItems(
      @NonNull String token, @Nullable CobolDocumentModel document);

  /**
   * Checks if the supplied document is ready for collection based on weather document is analysis.
   *
   * @param document in current context
   * @return True if document is ready, false otherwise.
   */
  default boolean isDocumentReadyForSemanticCollection(CobolDocumentModel document) {
    return !(Objects.isNull(document) || Objects.isNull(document.getLastAnalysisResult()));
  }
}
