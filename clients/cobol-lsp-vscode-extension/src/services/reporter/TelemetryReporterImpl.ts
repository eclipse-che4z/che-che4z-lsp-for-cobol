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
import * as vscode from "vscode";
import TelemetryReporter from "@vscode/extension-telemetry";
import { TELEMETRY_DEFAULT_CONTENT } from "../../constants";

import { TelemetryEvent } from "./model/TelemetryEvent";
import { TelemetryReport } from "./TelemetryReport";

export class TelemetryReporterImpl implements TelemetryReport {
  public static getInstance(): TelemetryReporterImpl {
    if (!TelemetryReporterImpl.instance) {
      TelemetryReporterImpl.instance = new TelemetryReporterImpl(
        this.getTelemetryKeyId(),
      );
    }
    return TelemetryReporterImpl.instance;
  }

  private static instance: TelemetryReporterImpl;

  private static getTelemetryKeyId(): string {
    // The following line is replaced by base64 encoded telemetry key in the CI
    const TELEMETRY_KEY_ENCODED = TELEMETRY_DEFAULT_CONTENT;

    if (TELEMETRY_KEY_ENCODED !== TELEMETRY_DEFAULT_CONTENT) {
      return Buffer.from(TELEMETRY_KEY_ENCODED, "base64").toString();
    }
    return TELEMETRY_DEFAULT_CONTENT;
  }

  private static convertData(content: TelemetryEvent) {
    return {
      categories: content.categories.toString(),
      event: content.eventName,
      IDE: vscode.env ? vscode.env.appName : "N.D.",
      notes: content.notes,
      timestamp: content.timestamp,
      rootCause: content.rootCause,
    };
  }

  private reporter: TelemetryReporter;

  constructor(private telemetryKeyId: string) {
    this.reporter = new TelemetryReporter(this.telemetryKeyId);
  }

  public reportEvent(content: TelemetryEvent): void {
    if (this.isValidTelemetryKey()) {
      this.reporter.sendTelemetryEvent(
        content.eventName,
        TelemetryReporterImpl.convertData(content),
        content.measurements,
      );
    }
  }

  public reportExceptionEvent(content: TelemetryEvent): void {
    if (this.isValidTelemetryKey()) {
      this.reporter.sendTelemetryErrorEvent(
        content.eventName,
        TelemetryReporterImpl.convertData(content),
      );
    }
  }

  public dispose(): any {
    this.reporter.dispose();
  }

  private isValidTelemetryKey(): boolean {
    return this.telemetryKeyId !== TELEMETRY_DEFAULT_CONTENT;
  }
}
