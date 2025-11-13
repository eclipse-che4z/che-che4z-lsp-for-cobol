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
const USERNAME: string = "usernameToAnonymize";
jest.mock("node:os", () => ({
  userInfo: jest.fn().mockReturnValue({
    username: USERNAME,
  }),
}));

import TelemetryReporter from "@vscode/extension-telemetry";

import * as path from "path";
import { TelemetryEventMeasurements } from "../../../services/reporter/model";
import {
  anonymizeContent,
  telemetryEvent,
  telemetryExceptionEvent,
  setReporter,
} from "../../../services/reporter";

setReporter(new TelemetryReporter("the key"));

const FAKE_ROOT_PATH: string = path.join(
  "C:",
  "Users",
  USERNAME,
  "folder1",
  "folder2",
  "folder3",
);
let spySendTelemetry: jest.SpyInstance;
let spySendExceptionTelemetry: jest.SpyInstance;
jest.mock("@vscode/extension-telemetry");

function runScenario(
  expectedNumberOfCalls: number,
  eventType: string,
  eventName?: string,
  categories?: string[],
  rootCause?: string,
  telemetryMeasurements?: TelemetryEventMeasurements,
) {
  if (eventType === "log") {
    telemetryEvent(eventName!, categories, undefined, telemetryMeasurements);
    expect(spySendTelemetry).toHaveBeenCalledTimes(expectedNumberOfCalls);
  } else {
    telemetryExceptionEvent(eventName, rootCause!, categories);
    expect(spySendExceptionTelemetry).toHaveBeenCalledTimes(
      expectedNumberOfCalls,
    );
  }
}

function setupScenario() {
  spySendTelemetry = jest.spyOn(
    TelemetryReporter.prototype,
    "sendTelemetryEvent",
  );
  spySendExceptionTelemetry = jest.spyOn(
    TelemetryReporter.prototype,
    "sendTelemetryErrorEvent",
  );
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

  test("An exception telemetry event that contains event name and root cause is sent to the telemetry server", () => {
    runScenario(1, "exception", "runtimeException", [], "JavaNotFound");
  });
});

describe("Anonymize content", () => {
  test("Given a verbose exception log content, then the information about the user is obfuscated", () => {
    // construct a cross-platform example path to validate the anonymization functionality
    const fakePath: string = path.format({
      root: FAKE_ROOT_PATH,
      base: "someFile.js",
    });

    const input: string =
      "Error: ENOENT: no such file or directory, scandir 'test'\n" +
      "\tat Object.readdirSync (fs.js:795:3)\n" +
      "\tat Object.<anonymous> (electron/js2c/asar.js:605:39)\n" +
      "\tat Object.readdirSync (electron/js2c/asar.js:605:39)\n" +
      "\tat" +
      fakePath +
      ":58:16\n" +
      "\tat Generator.next (<anonymous>)\n" +
      "\tat" +
      fakePath +
      ":21:71\n" +
      "\tat new Promise (<anonymous>)\n" +
      "\tat" +
      fakePath +
      ":17:12\n" +
      "\tat activate (" +
      fakePath +
      ":46:12)\n" +
      "\tat Function._callActivateOptional (" +
      fakePath +
      ":837:509)\n" +
      "\tat Function._callActivate (" +
      fakePath +
      ":837:160)\n" +
      "\tat" +
      fakePath +
      ":835:703\n" +
      "\tat processTicksAndRejections (" +
      fakePath +
      ":85:5)\n" +
      "\tat async Promise.all (index 0)\n";

    expect(anonymizeContent(input).includes(USERNAME)).toBeFalsy();
  });
});
