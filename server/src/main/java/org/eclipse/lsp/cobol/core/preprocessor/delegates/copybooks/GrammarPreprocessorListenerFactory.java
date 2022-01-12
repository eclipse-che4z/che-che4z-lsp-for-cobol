/*
 * Copyright (c) 2021 Broadcom.
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
import org.antlr.v4.runtime.BufferedTokenStream;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.service.CopybookConfig;

/** A factory for {@link GrammarPreprocessorListener} */
public interface GrammarPreprocessorListenerFactory {
  /**
   * Create a new {@link GrammarPreprocessorListenerImpl} for pre-processing of a COBOL text with
   * the grammar
   *
   * @param uri URI of the document
   * @param tokens a stream of tokens
   * @param copybookConfig contains config info like: copybook processing mode, target backend sql
   *     server
   * @param hierarchy the hierarchy of the copybooks
   * @return a new listener
   */
  GrammarPreprocessorListenerImpl create(
      @NonNull String uri,
      @NonNull BufferedTokenStream tokens,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy);
}
