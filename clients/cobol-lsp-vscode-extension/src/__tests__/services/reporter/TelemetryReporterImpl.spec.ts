/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import { TelemetryReporterImpl } from "../../../services/reporter/TelemetryReporterImpl";

const INVALID_TELEMETRY_KEY: string = "INVALID_INSTRUMENTATION_KEY";

describe("Telemetry key retrieval functionality is able to return a decoded existing key or a default string", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("In not replaced by correct value in CI, constant value for invalid telemetry key is returned", () => {
    expect((TelemetryReporterImpl as any).getTelemetryKeyId()).toBe(
      INVALID_TELEMETRY_KEY,
    );
  });
});
