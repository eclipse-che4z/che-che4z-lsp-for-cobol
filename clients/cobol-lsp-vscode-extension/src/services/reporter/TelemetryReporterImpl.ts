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
import TelemetryReporter from "@vscode/extension-telemetry";
import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";
import {EXTENSION_ID, TELEMETRY_DEFAULT_CONTENT} from "../../constants";

import {ExtensionUtils} from "../util/ExtensionUtils";
import {TelemetryEvent} from "./model/TelemetryEvent";
import {TelemetryMeasurement} from "./model/TelemetryMeasurement";
import {TelemetryReport} from "./TelemetryReport";

export class TelemetryReporterImpl implements TelemetryReport {
    public static getInstance(): TelemetryReporterImpl {
        if (!TelemetryReporterImpl.instance) {
            TelemetryReporterImpl.instance = new TelemetryReporterImpl(this.getTelemetryKeyId());
        }
        return TelemetryReporterImpl.instance;
    }

    private static instance: TelemetryReporterImpl;

    /**
     * This method return the value of the instrumentation key necessary to create the telemetry reporter from an
     * external file configuration. If the file doesn't exists it returns a generic value that will not be valid
     * for collect telemetry event.
     */
    private static getTelemetryKeyId(): string {
        return fs.existsSync(this.getTelemetryResourcePath()) ? this.getInstrumentationKey() : TELEMETRY_DEFAULT_CONTENT;
    }

    private static getTelemetryResourcePath() {
        return vscode.Uri.file(
            path.join(ExtensionUtils.getExtensionPath(), "resources", "TELEMETRY_KEY")).fsPath;
    }

    private static getInstrumentationKey(): string {
        return Buffer.from(fs.readFileSync(this.getTelemetryResourcePath(), "utf8"), "base64").toString().trim();
    }

    private static convertData(content: TelemetryEvent) {
        return {
            categories: content.categories.toString(),
            event: content.eventName,
            IDE: ExtensionUtils.getIDEName(),
            notes: content.notes,
            timestamp: content.timestamp,
            rootCause: content.rootCause,
        };
    }

    private static convertMeasurements(content: Map<string, number>): TelemetryMeasurement {
        const result: TelemetryMeasurement = {};

        if (content) {
            for (const [key, value] of content) {
                if (value) {
                    result[key] = value;
                }
            }
        }
        return result;
    }

    private reporter: TelemetryReporter;

    constructor(private telemetryKeyId: string) {
        this.reporter = new TelemetryReporter(EXTENSION_ID, ExtensionUtils.getPackageVersion(), this.telemetryKeyId);
    }

    public reportEvent(content: TelemetryEvent): void {
        if (this.isValidTelemetryKey()) {
            this.reporter.sendTelemetryEvent(content.eventName, TelemetryReporterImpl.convertData(content), TelemetryReporterImpl.convertMeasurements(content.measurements));
        }
    }

    public reportExceptionEvent(content: TelemetryEvent): void {
        if (this.isValidTelemetryKey()) {
            this.reporter.sendTelemetryErrorEvent(content.eventName, TelemetryReporterImpl.convertData(content));
        }
    }

    public dispose(): any {
        this.reporter.dispose();
    }

    private isValidTelemetryKey(): boolean {
        return this.telemetryKeyId !== TELEMETRY_DEFAULT_CONTENT;
    }
}
