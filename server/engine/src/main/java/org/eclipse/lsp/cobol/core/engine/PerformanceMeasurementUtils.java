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
package org.eclipse.lsp.cobol.core.engine;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.analysis.Timing;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Collections;
import java.util.Map;
import java.util.Optional;

/**
 * Utility class for performance related logic.
 */
@UtilityClass
@Slf4j
public class PerformanceMeasurementUtils {
  private static final String PERFORMANCE_LOG_PATH = "performance.log.path";

  /**
   * Log timing into CSV file
   * @param timing timing data
   * @param context analysis context
   */
  public void logTiming(Map<String, Timing> timing, AnalysisContext context) {
    timing.forEach((key, value) -> LOG.debug("Timing for {}: {}", key, value.getTime()));
    Optional.ofNullable(System.getProperty(PERFORMANCE_LOG_PATH))
            .map(Paths::get)
            .ifPresent(path -> {
              try {
                if (!Files.exists(path)) {
                  LOG.info("Write performance data into: " + path);
                  Files.write(path, Collections.singleton(createHeaderLine(timing)), StandardOpenOption.CREATE);
                }
                Files.write(path, Collections.singleton(createTimingLine(timing, context)), StandardOpenOption.APPEND);
              } catch (IOException e) {
                LOG.debug(e.getMessage(), e);
              }
            });
  }

  private String createHeaderLine(Map<String, Timing> timing) {
    StringBuilder line = new StringBuilder("url");
    for (String stageName : timing.keySet()) {
      line.append(",");
      line.append(stageName);
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
    for (String stageName : timing.keySet()) {
      line.append(",");
      long time = Optional.ofNullable(timing.get(stageName)).map(Timing::getTime).orElse(0L);
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
