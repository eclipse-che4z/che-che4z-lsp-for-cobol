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

package com.broadcom.lsp.cobol.core.preprocessor.delegates;

import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.model.CopybookUsage;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.google.common.collect.Multimap;
import lombok.NonNull;
import org.antlr.v4.runtime.BufferedTokenStream;

import java.util.Deque;

/** A factory for {@link GrammarPreprocessorListener} */
public interface GrammarPreprocessorListenerFactory {
  /**
   * Create a new {@link GrammarPreprocessorListenerImpl} for pre-processing of a COBOL text with
   * the grammar
   *
   * @param uri - URI of the document
   * @param tokens - a stream of tokens by {@link CobolPreprocessorLexer}
   * @param copybookStack - a stack representing the copybook hierarchy
   * @param copybookProcessingMode - settings of copybook processing
   * @param positionCorrectionMap - contains mapping between the modified new line in document as
   *     per preprocessing to the actual {@link CobolLine} in the document.
   * @return a new listener
   */
  GrammarPreprocessorListenerImpl create(
      @NonNull String uri,
      @NonNull BufferedTokenStream tokens,
      @NonNull Deque<CopybookUsage> copybookStack,
      @NonNull CopybookProcessingMode copybookProcessingMode,
      @NonNull Multimap<Integer, CobolLine> positionCorrectionMap);
}
