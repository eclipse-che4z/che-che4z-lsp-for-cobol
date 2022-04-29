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
package org.eclipse.lsp.cobol.core.engine;

import lombok.Value;

/** The collection of timing data. */
@Value
class Timing {
  long preprocessorTime;
  long dialectsTime;
  long parserTime;
  long mappingTime;
  long splittingLanguageTimer;
  long visitorTime;
  long syntaxTreeTime;
  long lateErrorProcessingTime;

  static Builder builder() {
    return new Builder();
  }

  /** The collection of timers. */
  @Value
  static class Builder {
    Timer preprocessorTimer = new Timer();
    Timer dialectsTimer = new Timer();
    Timer parserTimer = new Timer();
    Timer mappingTimer = new Timer();
    Timer splittingLanguageTimer = new Timer();
    Timer visitorTimer = new Timer();
    Timer syntaxTreeTimer = new Timer();
    Timer lateErrorProcessingTimer = new Timer();

    Timing build() {
      return new Timing(
          preprocessorTimer.getTotalTime(),
          dialectsTimer.getTotalTime(),
          parserTimer.getTotalTime(),
          mappingTimer.getTotalTime(),
          splittingLanguageTimer.getTotalTime(),
          visitorTimer.getTotalTime(),
          syntaxTreeTimer.getTotalTime(),
          lateErrorProcessingTimer.getTotalTime());
    }
  }

  /** The stop watch timer. */
  static class Timer {
    long startTime = 0;
    long totalTime = 0;

    void start() {
      if (startTime != 0) throw new IllegalStateException("The timer must start only once");
      startTime = System.currentTimeMillis();
    }

    void stop() {
      if (totalTime != 0) throw new IllegalStateException("The timer must stop only once");
      totalTime = System.currentTimeMillis() - startTime;
    }

    long getTotalTime() {
      return totalTime;
    }
  }
}
