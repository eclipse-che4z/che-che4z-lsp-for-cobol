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

package com.ca.lsp.core.cobol.preprocessor.sub.util;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;
import org.antlr.v4.runtime.BufferedTokenStream;

import javax.annotation.Nonnull;
import java.util.List;

/** This service applies replacing for given text by replace clauses and tokens. */
public interface ReplacingService {
  /**
   * Replace given text by given patterns and tokens
   *
   * @param text - String to replace
   * @param replaceClauses - replace clauses with patterns for replacement
   * @param tokens - tokens needed to retrieve the full replacement token
   * @return a String with all the patterns applied one by one
   */
  @Nonnull
  String applyReplacing(
      @Nonnull String text,
      @Nonnull List<ReplaceClauseContext> replaceClauses,
      @Nonnull BufferedTokenStream tokens);
}
