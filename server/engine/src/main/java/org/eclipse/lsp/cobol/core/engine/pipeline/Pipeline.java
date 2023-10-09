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

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.*;

/**
 * Processing pipeline functionality
 */
@Slf4j
public class Pipeline {
  private static final String PERFORMANCE_LOG_PATH = "performance.log.path";
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
    Map<String, Timing> timing = new LinkedHashMap<>();
    PipelineResult<?> result = PipelineResult.empty();

    try {
      for (Stage stage : stages) {
        PipelineResult<?> prevResult = result;
        result = timing.computeIfAbsent(stage.getName(), a -> new Timing()).measure(() -> stage.run(context, prevResult));

        if (result.stopProcessing()) {
          return result;
        }
      }
      return result;
    } finally {
      logTiming(timing, context);
    }
  }

  private void logTiming(Map<String, Timing> timing, AnalysisContext context) {
    timing.forEach((key, value) -> LOG.debug("Timing for {}: {}", key, value.getTime()));
    Optional.ofNullable(System.getProperty(PERFORMANCE_LOG_PATH))
            .map(Paths::get)
            .ifPresent(path -> {
      try {
        if (!Files.exists(path)) {
          LOG.info("Write performance data into: " + path);
          Files.write(path, Collections.singleton(createHeaderLine()), StandardOpenOption.CREATE);
        }
        Files.write(path, Collections.singleton(createTimingLine(timing, context)), StandardOpenOption.APPEND);
      } catch (IOException e) {
        LOG.debug(e.getMessage(), e);
      }
    });
  }

  private String createHeaderLine() {
    StringBuilder line = new StringBuilder("url");
    for (Stage stage: stages) {
      line.append(",");
      line.append(stage.getName());
    }
    line.append(",");
    line.append("Total time");
    line.append(",");
    line.append("Size");
    return line.toString();
  }

  private String createTimingLine(Map<String, Timing> timing, AnalysisContext context) {
    StringBuilder line = new StringBuilder(context.getExtendedDocument().getUri());
    long total = 0;
    for (Stage stage: stages) {
      line.append(",");
      long time = Optional.ofNullable(timing.get(stage.getName())).map(Timing::getTime).orElse(0L);
      line.append(time);
      total += time;
    }
    line.append(",");
    line.append(total);
    line.append(",");
    line.append(context.getExtendedDocument().toString().length());
    return line.toString();
  }
}
