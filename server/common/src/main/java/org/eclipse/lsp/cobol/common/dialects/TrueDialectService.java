/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.common.dialects;

import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSessionProvider;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;

/**
 * True Dialects Service, based on different language ids
 */
public interface TrueDialectService<T extends BenchmarkSessionProvider> {
  /**
   * Returns the pipeline for a dialect based on a given language id
   * @param languageId a language id of a dialect
   * @return the pipeline for a dialect
   */
  Pipeline<T> getPipeline(CobolLanguageId languageId);

  /**
   * Returns the cleanup preprocessor for a dialect, based on a given language id
   * @param languageId a language id of a dialect
   * @return the cleanup preprocessor
   */
  CleanerPreprocessor getPreprocessor(CobolLanguageId languageId);

}
