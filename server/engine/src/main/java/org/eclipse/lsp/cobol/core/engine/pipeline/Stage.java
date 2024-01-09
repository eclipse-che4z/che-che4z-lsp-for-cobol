/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.pipeline;

import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;

/**
 * Processing Pipeline Stage
 */
public interface Stage<T, R> {
  /**
   * Runs a processing stage
   * @param context - pipeline processing context
   * @param prevStageResult - previous stage result
   * @return the result of the current stage processing
   */
  StageResult<T> run(AnalysisContext context, StageResult<R> prevStageResult);

  /**
   * Returns the name of the stage
   * @return the name of the stage
   */
  String getName();
}
