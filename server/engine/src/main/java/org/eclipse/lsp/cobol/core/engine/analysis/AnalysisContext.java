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
package org.eclipse.lsp.cobol.core.engine.analysis;

import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.error.SyntaxError;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Supplier;

/**
 * Contains related to analysis state
 */
@RequiredArgsConstructor
@Value
@Slf4j
public class AnalysisContext {
  /**
   * Type of activities we want to measure time for
   */
  public enum Activity {
    DIALECTS,
    PREPROCESSOR,
    PARSER,
    VISITOR,
    SYNTAX_TREE,
    LATE_ERROR_PROCESSING
  }

  Map<Activity, Timing> timing = new HashMap<>();
  String documentUri;
  AnalysisConfig config;
  List<SyntaxError> accumulatedErrors = new ArrayList<>();

  /**
   * Measure run time of supplier
   * @param activity current activity
   * @param supplier execution logic
   * @return result of execution
   * @param <T> type of execution result
   */
  public <T> T measure(Activity activity, Supplier<T> supplier) {
    return timing.computeIfAbsent(activity, a -> new Timing()).measure(supplier);
  }

  /**
   * Measure run time of runnable
   * @param activity current activity
   * @param runnable execution logic
   */
  public void measure(Activity activity, Runnable runnable) {
    timing.computeIfAbsent(activity, a -> new Timing()).measure(runnable);
  }

  /**
   * Log the timing of analysis
   */
  public void logTiming() {
    LOG.debug(
            "Timing for parsing {}. Dialects: {}, preprocessor: {}, parser: {}, visitor: {}, syntaxTree: {}, "
                    + "late error processing: {}",
            documentUri,
            timing.get(Activity.DIALECTS).getTime(),
            timing.get(Activity.PREPROCESSOR).getTime(),
            timing.get(Activity.PARSER).getTime(),
            timing.get(Activity.VISITOR).getTime(),
            timing.get(Activity.SYNTAX_TREE).getTime(),
            timing.get(Activity.LATE_ERROR_PROCESSING).getTime());
  }
}
