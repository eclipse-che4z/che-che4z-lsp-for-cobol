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
package org.eclipse.lsp.cobol.dialects;

import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.pipeline.Pipeline;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;

/**
 * Cobol Dialect Interface
 */
public interface TrueCobolDialect {
  /**
   * Returns the pipeline for current dialect
   * @return the pipeline for a dialect
   */
  Pipeline<AnalysisContext> getPipeline();

  /**
   * Returns the cleanup preprocessor for current dialect
   * @return the cleanup preprocessor
   */
  CleanerPreprocessor getPreprocessor();
}
