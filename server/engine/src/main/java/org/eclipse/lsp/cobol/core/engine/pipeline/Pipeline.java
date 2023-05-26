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

import java.util.LinkedList;
import java.util.List;

/**
 * Processing pipeline functionality
 */
public class Pipeline {
  private final List<Stage<?, ?>> stages = new LinkedList<>();

  /**
   * Adds a new stage to the pipeline
   * @param stage - pipeline processing stage
   */
  public void add(Stage<?, ?> stage) {
    stages.add(stage);
  }

  /**
   * Runs the pipeline
   * @param context - pipeline context
   * @return - a final result of the pipeline processing
   */
  public PipelineResult<?> run(AnalysisContext context) {
    PipelineResult<?> result = PipelineResult.empty();
    for (Stage stage : stages) {
      result = stage.run(context, result);
      if (result.stopProcessing()) {
        return result;
      }
    }
    return result;
  }
}
