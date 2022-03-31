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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import lombok.NonNull;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;

import java.util.List;

/** This service applies replacing for given text by replace clauses and tokens. */
public interface ReplacingService {
  /**
   * Replace given text by given patterns and tokens
   *
   * @param text - String to replace
   * @param replacePatterns - list of patterns for replacement
   * @return a String with all the patterns applied one by one
   */
  @NonNull
  String applyReplacing(@NonNull String text, @NonNull List<Pair<String, String>> replacePatterns);

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
