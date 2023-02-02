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

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

/**
 * The collection of timing data.
 */
public class Timing {
  Timer timer = new Timer();

  /**
   * Measure run time of supplier
   * @param supplier execution logic
   * @return result of execution
   * @param <T> type of execution result
   */
  public <T> T measure(Supplier<T> supplier) {
    try {
      timer.start();
      return supplier.get();
    } finally {
      timer.stop();
    }
  }
  /**
   * Measure run time of runnable
   * @param runnable execution logic
   */
  public void measure(Runnable runnable) {
    try {
      timer.start();
      runnable.run();
    } finally {
      timer.stop();
    }
  }
  public long getTime() {
    return  timer.getTotalTime();
  }
}

/**
 * The stop watch timer.
 */
class Timer {
  private List<Long> measurements = new ArrayList<>();
  private long startTime = 0;

  public void start() {
    if (startTime != 0) {
      throw new IllegalStateException("The timer is running");
    }
    startTime = System.currentTimeMillis();
  }

  public void stop() {
    if (startTime == 0) {
      throw new IllegalStateException("The timer is not running");
    }
    measurements.add(System.currentTimeMillis() - startTime);
    startTime = 0;
  }

  long getTotalTime() {
      return measurements.stream().mapToLong(l -> l).sum();
  }
}
