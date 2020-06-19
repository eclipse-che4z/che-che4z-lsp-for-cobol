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

package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolReplacementMapping;
import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.BufferedTokenStream;

import javax.annotation.Nonnull;
import java.util.List;

/**
 * This service applies replacing for given text by replace clauses and tokens. It may work with
 * REPLACING and REPLACE statements.
 */
@Singleton
public class ReplacingServiceImpl implements ReplacingService {

  @Nonnull
  public String applyReplacing(
      @Nonnull String text,
      @Nonnull List<ReplaceClauseContext> replaceClauses,
      @Nonnull BufferedTokenStream tokens) {
    return replaceClauses.stream()
        .map(it -> new CobolReplacementMapping(it.replaceable(), it.replacement()))
        .reduce(
            text, (replaced, pattern) -> pattern.replace(replaced, tokens), (str1, str2) -> str2);
  }
}
