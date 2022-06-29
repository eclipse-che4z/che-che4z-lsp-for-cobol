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
import * as path from "path";
import {TelemetryReporterImpl} from "../../../services/reporter/TelemetryReporterImpl";
import {TelemetryService} from "../../../services/reporter/TelemetryService";

const USERNAME: string = "usernameToAnonymize";
const FAKE_ROOT_PATH: string = path.join("C:", "Users", USERNAME, "folder1", "folder2", "folder3");
let spySendTelemetry;
let spySendExceptionTelemetry;
jest.mock("@vscode/extension-telemetry");
jest.mock("../../../services/util/ExtensionUtils");

function runScenario(expectedNumberOfCalls, eventType: string, eventName?: string, categories?: string[], rootCause?: string, telemetryMeasurements?: Map<string, number>) {
    if (eventType === "log") {
        TelemetryService.registerEvent(eventName, categories, undefined, telemetryMeasurements);
        expect(spySendTelemetry).toBeCalledTimes(expectedNumberOfCalls);
    } else {
        TelemetryService.registerExceptionEvent(eventName, rootCause, categories);
        expect(spySendExceptionTelemetry).toBeCalledTimes(expectedNumberOfCalls);
    }
}

function setupScenario() {
    (TelemetryReporterImpl as any).getTelemetryKeyId = jest.fn().mockReturnValue("key_id_for_testing_purposes");
    (TelemetryService as any).getUsername = jest.fn().mockReturnValue(USERNAME);
    spySendTelemetry = jest.spyOn(TelemetryReporter.prototype, "sendTelemetryEvent");
    spySendExceptionTelemetry = jest.spyOn(TelemetryReporter.prototype, "sendTelemetryErrorEvent");
}

describe("TelemetryService information are consistent before send them to the telemetry server", () => {
    beforeAll(() => {
        setupScenario();
    });
    afterEach(() => {
        jest.clearAllMocks();
    });

    test("Given a fulfilled telemetry event, the data is correctly collected and sent to the telemetry server", () => {
        runScenario(1, "log", "test");
    });

    test("Given a fulfilled telemetry measurement event, the data is contained as part of a telemetry event and their data are sent to the telemetry server", () => {
        const startTime: number = Date.now();
        runScenario(1, "log", "test the download", undefined, undefined, new Map().set("time elapsed", TelemetryService.calculateTimeElapsed(startTime - 100, startTime)));
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

    test("An exception telemetry event with a null root cause is not sent to the telemetry server", () => {
        runScenario(0, "exception", "runtimeException", undefined, null);
    });

});

describe("Anonymize content", () => {
    test("Given a verbose exception log content, then the information about the user is obfuscated", () => {
        (TelemetryService as any).getUsername = jest.fn().mockReturnValue(USERNAME);

        // construct a cross-platform example path to validate the anonymization functionality
        const fakePath: string = path.format(({
            root: FAKE_ROOT_PATH,
            base: "someFile.js",
        }));

        const input: string = "Error: ENOENT: no such file or directory, scandir 'test'\n" +
            "\tat Object.readdirSync (fs.js:795:3)\n" +
            "\tat Object.<anonymous> (electron/js2c/asar.js:605:39)\n" +
            "\tat Object.readdirSync (electron/js2c/asar.js:605:39)\n" +
            "\tat" + fakePath + ":58:16\n" +
            "\tat Generator.next (<anonymous>)\n" +
            "\tat" + fakePath + ":21:71\n" +
            "\tat new Promise (<anonymous>)\n" +
            "\tat" + fakePath + ":17:12\n" +
            "\tat activate (" + fakePath + ":46:12)\n" +
            "\tat Function._callActivateOptional (" + fakePath + ":837:509)\n" +
            "\tat Function._callActivate (" + fakePath + ":837:160)\n" +
            "\tat" + fakePath + ":835:703\n" +
            "\tat processTicksAndRejections (" + fakePath + ":85:5)\n" +
            "\tat async Promise.all (index 0)\n";

        expect((TelemetryService as any).anonymizeContent(input).includes(USERNAME)).toBeFalsy();
    });
});
