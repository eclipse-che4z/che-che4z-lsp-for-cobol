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
import org.eclipse.lsp.cobol.core.engine.analysis.Timing;

import java.util.ArrayList;
import java.util.List;

/**
 * Contains related to analysis state
 */
@RequiredArgsConstructor
@Value
@Slf4j
public class AnalysisContext {
  String documentUri;
  AnalysisConfig config;
  Timing.Builder timingBuilder = Timing.builder();
  List<SyntaxError> accumulatedErrors = new ArrayList<>();

  public void dialectsStart() {
    timingBuilder.getDialectsTimer().start();
  }

  public void dialectsDone() {
    timingBuilder.getDialectsTimer().stop();
  }

  public void preprocessorStart() {
    timingBuilder.getPreprocessorTimer().start();
  }

  public void preprocessorDone() {
    timingBuilder.getPreprocessorTimer().stop();
  }

  public void parserStart() {
    timingBuilder.getParserTimer().start();
  }

  public void parserDone() {
    timingBuilder.getParserTimer().stop();
  }

  public void splittingLanguageStart() {
    timingBuilder.getSplittingLanguageTimer().start();
  }

  public void splittingLanguageDone() {
    timingBuilder.getSplittingLanguageTimer().stop();
  }

  public void visitorStart() {
    timingBuilder.getVisitorTimer().start();
  }

  public void visitorDone() {
    timingBuilder.getVisitorTimer().stop();
  }

  public void syntaxTreeStart() {
    timingBuilder.getSyntaxTreeTimer().start();
  }

  public void syntaxTreeDone() {
    timingBuilder.getSyntaxTreeTimer().stop();
  }

  public void lateErrorProcessingStart() {
    timingBuilder.getLateErrorProcessingTimer().start();
  }

  public void lateErrorProcessingDone() {
    timingBuilder.getLateErrorProcessingTimer().stop();
  }

  public void logTiming() {
    Timing timing = timingBuilder.build();
    LOG.debug(
            "Timing for parsing {}. Dialects: {}, preprocessor: {}, parser: {}, mapping: {}, visitor: {}, syntaxTree: {}, "
                    + "late error processing: {}",
            documentUri,
            timing.getDialectsTime(),
            timing.getPreprocessorTime(),
            timing.getParserTime(),
            timing.getMappingTime(),
            timing.getVisitorTime(),
            timing.getSyntaxTreeTime(),
            timing.getLateErrorProcessingTime());
  }
}
