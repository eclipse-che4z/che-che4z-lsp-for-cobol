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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;

/** A factory for {@link GrammarPreprocessorListener} */
public interface GrammarPreprocessorListenerFactory {
  /**
   * Create a new {@link GrammarPreprocessorListenerImpl} for pre-processing of a COBOL text with
   * the grammar
   *
   * @param context - preprocessor context
   * @return a new listener
   */
  GrammarPreprocessorListenerImpl create(@NonNull PreprocessorContext context);
}
