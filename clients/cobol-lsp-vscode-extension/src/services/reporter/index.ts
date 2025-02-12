/*
 * Copyright (c) 2025 Broadcom.
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
import { TelemetryEvent, TelemetryEventMeasurements } from "./model";
import TelemetryReporter from "@vscode/extension-telemetry";

let reporter: TelemetryReporter | undefined;

/**
 * for tests
 */
export function setReporter(r: TelemetryReporter | undefined): void {
  reporter = r;
}

export async function initTelemetry(context: vscode.ExtensionContext) {
  const telemetryKey = await getTelemetryKey(context);
  if (telemetryKey === undefined) {
    return;
  }
  reporter = new TelemetryReporter(telemetryKey);
  context.subscriptions.push(reporter);
}
/**
 * This method collect the data event for telemetry purpose, apply basic validation
 * and delegate the reporter service to sent them to the target telemetry server
 * @param eventName name assigned for the event for the telemetry
 * @param categories optional list of keywords (act as tags)
 * @param notes optional brief description
 * @param telemetryMeasurement optional set of numeric data with a key name
 */
export function registerEvent(
  eventName: string,
  categories?: string[],
  notes?: string,
  telemetryMeasurement?: TelemetryEventMeasurements,
): void {
  if (reporter === undefined) {
    return;
  }
  reporter.sendTelemetryEvent(
    eventName,
    convertData(
      createTelemetryEvent(
        eventName,
        categories!,
        notes,
        undefined,
        telemetryMeasurement,
      ),
    ),
    telemetryMeasurement,
  );
}

/**
 * This method collect the exception data event for telemetry purpose, apply basic validation
 * and delegate the reporter service to sent them to the target telemetry server
 * @param eventName name assigned for the event for the telemetry
 * @param rootCause the stacktrace attached for debugging purpose.
 * @param categories optional list of keywords (act as tags)
 * @param notes optional brief description
 * @param telemetryMeasurement optional set of numeric data with a key name
 */
export function registerExceptionEvent(
  eventName = "RuntimeException",
  rootCause: string,
  categories?: string[],
  notes?: string,
  telemetryMeasurement?: TelemetryEventMeasurements,
): void {
  if (reporter === undefined) {
    return;
  }
  reporter.sendTelemetryErrorEvent(
    eventName,
    convertData(
      createTelemetryEvent(
        eventName,
        categories!,
        notes,
        anonymizeContent(rootCause),
        telemetryMeasurement,
      ),
    ),
  );
}

async function getTelemetryKey(
  context: vscode.ExtensionContext,
): Promise<string | undefined> {
  // telemetry is disabled by default, to enable provide "telemetry.key" with a base64 encoded telemetry key
  const KEY_URI = vscode.Uri.joinPath(context.extensionUri, "telemetry.key");
  try {
    const content = (await vscode.workspace.fs.readFile(KEY_URI)).toString();
    const key = Buffer.from(content, "base64").toString();
    if (key.length === 0) {
      return undefined;
    }
    return key;
  } catch (error) {
    console.warn(error);
    return undefined;
  }
}

function createTelemetryEvent(
  eventName: string,
  categories: string[],
  notes?: string,
  rootCause?: string,
  telemetryMeasurement?: TelemetryEventMeasurements,
): TelemetryEvent {
  return {
    timestamp: new Date().toISOString(),
    eventName,
    categories: resolveCategories(categories),
    notes: notes || "",
    rootCause,
    measurements: telemetryMeasurement,
  };
}

/**
 * This method allows to anonymize the username value present in stack trace
 * @param content stack trace
 */
export function anonymizeContent(content: string): string {
  if (typeof process !== "undefined" && process.release.name === "node") {
    const { userInfo } = require("node:os"); // eslint-disable-line
    const { sep } = require("node:path"); // eslint-disable-line

    return content.replace(
      new RegExp("\\" + sep + userInfo().username, "g"), // eslint-disable-line
      sep + "anonymous",
    );
  } else {
    return content;
  }
}

function resolveCategories(categories: string[]): string[] {
  return categories ? categories : ["N.D"];
}

function convertData(content: TelemetryEvent) {
  return {
    categories: content.categories.toString(),
    event: content.eventName,
    IDE: vscode.env ? vscode.env.appName : "N.D.",
    notes: content.notes,
    timestamp: content.timestamp,
    rootCause: content.rootCause,
  };
}
