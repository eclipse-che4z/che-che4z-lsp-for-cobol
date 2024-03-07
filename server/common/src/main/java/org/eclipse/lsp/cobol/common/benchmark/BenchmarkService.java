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
package org.eclipse.lsp.cobol.common.benchmark;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.util.List;

/** Collecting timing data. */
public interface BenchmarkService {
  /**
   * Creates and store a BenchmarkSession.
   *
   * @return a new benchmark session.
   */
  BenchmarkSession startSession();

  /**
   * Get all collected measurements.
   *
   * @return a list of measurements.
   */
  List<Measurement> getMeasurements();

  /**
   * Generate jsons object with measurements
   *
   * @return a list of json objects
   */
  List<JsonElement> toJsons();

  /**
   * Log accumulated timing information.
   */
  void logTiming();
}
