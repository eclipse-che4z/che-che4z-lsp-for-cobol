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
import TelemetryReporter from "vscode-extension-telemetry";
import {EXTENSION_ID, TELEMETRY_DEFAULT_CONTENT} from "../../constants";
import {ExtensionUtils} from "../settings/util/ExtensionUtils";
import {TelemetryEvent} from "./model/TelemetryEvent";
import {TelemetryReport} from "./TelemetryReport";

export class TelemetryReporterImpl implements TelemetryReport {
    public static getInstance(): TelemetryReporterImpl {
        if (!TelemetryReporterImpl.instance) {
            TelemetryReporterImpl.instance = new TelemetryReporterImpl(ExtensionUtils.getTelemetryKeyId());
        }
        return TelemetryReporterImpl.instance;
    }

    private static instance: TelemetryReporterImpl;

    private static generateData(content: TelemetryEvent) {
        return {
            categories: content.getCategories().toString(),
            event: content.getEventName(),
            IDE: "Theia on Che",
            notes: content.getNotes(),
            timestamp: content.getTimestamp(),
            rootCause: content.getRootCause(),
            timeElapsed_sec: content.getTimeElapsed(),
        };
    }

    private readonly telemetryKeyId: string;
    private reporter: TelemetryReporter;

    private constructor(telemetryKeyId: string) {
        this.telemetryKeyId = telemetryKeyId;
        this.reporter = new TelemetryReporter(EXTENSION_ID, ExtensionUtils.getPackageVersion(), telemetryKeyId);
        // TODO: remove after test on Che
        vscode.window.showInformationMessage(telemetryKeyId);
    }

    public reportEvent(content: TelemetryEvent): void {
        if (this.isValidTelemetryKey()) {
            this.reporter.sendTelemetryEvent(content.getEventName(), TelemetryReporterImpl.generateData(content));
        }
    }

    public reportExceptionEvent(content: TelemetryEvent): void {
        if (this.isValidTelemetryKey()) {
            this.reporter.sendTelemetryErrorEvent(content.getEventName(), TelemetryReporterImpl.generateData(content));
        }
    }

    public dispose(): any {
        this.reporter.dispose();
    }

    private isValidTelemetryKey(): boolean {
        return this.telemetryKeyId !== TELEMETRY_DEFAULT_CONTENT;
    }
}
