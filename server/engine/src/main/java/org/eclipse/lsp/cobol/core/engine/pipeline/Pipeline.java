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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.Timing;

import java.util.*;

/**
 * Processing pipeline functionality
 */
@Slf4j
public class Pipeline {
  private final List<Stage<?, ?>> stages = new LinkedList<>();

  /**
   * Adds a new stage to the pipeline
   *
   * @param stage - pipeline processing stage
   */
  public void add(Stage<?, ?> stage) {
    stages.add(stage);
  }

  /**
   * Runs the pipeline
   *
   * @param context - pipeline context
   * @return - a final result of the pipeline processing
   */
  public PipelineResult run(AnalysisContext context) {
    Map<String, Timing> timing = new LinkedHashMap<>();
    StageResult<?> result = StageResult.empty();

    for (Stage stage : stages) {
      StageResult<?> prevResult = result;
      result = timing.computeIfAbsent(stage.getName(), a -> new Timing()).measure(() -> stage.run(context, prevResult));

      if (result.stopProcessing()) {
        return new PipelineResult(timing, result);
      }
    }
    return new PipelineResult(timing, result);
  }
}
