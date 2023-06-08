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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import lombok.NonNull;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;

/** This service applies replacing for given text by replace clauses and tokens. */
public interface ReplacingService {
  /**
   * Replace given content of documentMap by given patterns and tokens
   *
   * @param extendedDocument - an extended text document to work on
   * @param replaceData - Necessary data to apply the replacements
   */
  @NonNull
  void applyReplacing(@NonNull ExtendedDocument extendedDocument, @NonNull ReplaceData replaceData);

  /**
   * Retrieve pseudo-text replacing pattern from the given string. If the pseudo text consist of
   * whitespaces, or is empty, the empty pattern returns.
   *
   * @param clause string representation of the replacing clause in the format "==replaceable== BY
   *     ==replacement=="
   * @param locality the locality of the context
   * @return {@link ResultWithErrors} of pair of cleaned-up replaceable and replacement
   */
  @NonNull
  ResultWithErrors<Pair<String, String>> retrievePseudoTextReplacingPattern(
      @NonNull String clause, @NonNull Locality locality);

  /**
   * Retrieve full-token replacing pattern from the given string.
   *
   * @param clause - string representation of the replacing clause in the format "replaceable BY
   *     replacement"
   * @return pair of cleaned-up replaceable and replacement
   */
  @NonNull
  Pair<String, String> retrieveTokenReplacingPattern(@NonNull String clause);
}
