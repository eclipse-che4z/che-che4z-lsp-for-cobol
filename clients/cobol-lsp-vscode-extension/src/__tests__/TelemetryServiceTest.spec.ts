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
import TelemetryReporter from "vscode-extension-telemetry";
import {TelemetryService} from "../services/reporter/TelemetryService";
import {ExtensionUtils} from "../services/settings/util/ExtensionUtils";

let spySendTelemetry;
let spySendExceptionTelemetry;
jest.mock("vscode-extension-telemetry");

function runScenario(expectedNumberOfCalls, type: string, eventName?: string, categories?: string[], rootCause?: string, telemetryMeasurements?: Map<string, number>) {
    if (type === "log") {
        TelemetryService.registerEvent(eventName, categories, undefined, telemetryMeasurements);
        expect(spySendTelemetry).toBeCalledTimes(expectedNumberOfCalls);
    } else {
        TelemetryService.registerExceptionEvent(eventName, rootCause, categories);
        expect(spySendExceptionTelemetry).toBeCalledTimes(expectedNumberOfCalls);
    }
}

function setupScenario() {
    ExtensionUtils.getIDEName = jest.fn().mockReturnValue("testingIde");
    ExtensionUtils.getPackageVersion = jest.fn().mockReturnValue("1.0");
    ExtensionUtils.getTelemetryKeyId = jest.fn().mockReturnValue("key_id_for_testing_purposes");
    (ExtensionUtils as any).getUsername = jest.fn().mockReturnValue("USERNAME");
    jest.mock("vscode-extension-telemetry");
    spySendTelemetry = jest.spyOn(TelemetryReporter.prototype, "sendTelemetryEvent");
    spySendExceptionTelemetry = jest.spyOn(TelemetryReporter.prototype, "sendTelemetryErrorEvent");
}

describe("TelemetryService information are consistent before send them to the telemetry server", () => {
    beforeEach(() => {
        jest.clearAllMocks();
    });
    beforeAll(() => {
        setupScenario();
    });
    afterEach(() => {
        jest.clearAllMocks();
    });

    test("Given a fulfilled telemetry event, the data is correctly collected and sent to the telemetry server", () => {
        runScenario(1, "log", "test");
    });

    test("Given a fulfilled telemetry measuremnt event, the data is contained as part of a telemetry event and their data are sent to the telemetry server", () => {
        runScenario(1, "log", "test the download", undefined, undefined, new Map().set("time elapsed", ExtensionUtils.calculateTimeElapsed(Date.now() - 100, Date.now())));
    });

    test("An empty telemetry object is not sent to the telemetry server", () => {
        runScenario(0, "log");
    });

    test("A telemetry event with empty eventName is not sent to the telemetry server", () => {
        runScenario(0, "log");
    });

    test("An exception telemetry event that contains event name and root cause is sent to the telemetry server", () => {
        runScenario(1, "exception", "runtimeException", [], "JavaNotFound");
    });

    test("An exception telemetry event without root cause is not sent to the telemetry server", () => {
        runScenario(0, "exception", "runtimeException");
    });
});
