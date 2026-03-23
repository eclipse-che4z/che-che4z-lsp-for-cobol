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
import { Program } from "@code4z/analysis";
import {
  ApiResult,
  ControlFlowAnalysisService,
} from "../../services/ControlFlowService";
import { LogOutputChannel } from "vscode";
import { getConfigurationResult } from "../../__mocks__/vscode";
import { SETTINGS_UNREACHABLE_CODE_SEVERITY } from "../../constants";

const apiResult: ApiResult = {
  controlFlowAST: [
    {
      id: 1,
      children: [],
      type: "program",
      location: {
        uri: "documentUri",
        start: {
          line: 1,
          character: 1,
        },
        end: {
          line: 100,
          character: 10,
        },
      },
      name: "PARTSUP",
    },
  ],
  documentUri: "documentUri",
};

jest.mock("@code4z/analysis/lib/graphbuilder", () => ({
  ControlFlowGraphBuilder: class {
    constructor(
      private maxVMCount: number,
      private severity: number,
    ) {}

    public build(__programs: Program[]) {
      return {
        enters: [],
        locations: [],
        diagnostics: [],
        events: [],
      };
    }
  },
}));

let payload = {
  graphs: [],
  locations: [],
  diagnostics: new Map(),
  events: [],
} as unknown;

let messageType = "result";
let lastWorkerResultTrigger: undefined | (() => void);
let lastWorkerErrorTrigger: undefined | ((e: Error) => void);

beforeEach(() => {
  lastWorkerResultTrigger = undefined;
  lastWorkerErrorTrigger = undefined;
});

jest.mock("worker_threads", () => ({
  Worker: class {
    events = new Map<string, (value: unknown) => void>();
    constructor(private path: string) {
      lastWorkerErrorTrigger = (e) => {
        console.log("worker error", e);
        this.events.get("error")?.call(undefined, e);
      };
    }
    public on(event: string, listener: (value: unknown) => void) {
      this.events.set(event, listener);
    }
    public postMessage(_message: unknown) {
      lastWorkerResultTrigger = () => {
        this.events.get("message")?.call(undefined, {
          type: messageType,
          payload: payload,
        });
      };
    }
    public terminate() {}
  },
}));

describe("ControlFlowService tests", () => {
  afterEach(() => {
    delete getConfigurationResult[SETTINGS_UNREACHABLE_CODE_SEVERITY];
  });

  test("Build queued for analysis", async () => {
    const service = new ControlFlowAnalysisService();
    const queueAnalysis = jest.spyOn(service, "queueAnalysis");
    await service.handleControlFlowAst(apiResult);
    expect(queueAnalysis).toHaveBeenCalled();
  });

  test("Test invalidate", async () => {
    const service = new ControlFlowAnalysisService();
    await service.handleControlFlowAst(apiResult);

    const latestResults = service["latestResults"];
    expect(latestResults.size).toBe(1);

    await service.invalidate("documentUri", true);
  });

  test("Propagate errors", async () => {
    getConfigurationResult[SETTINGS_UNREACHABLE_CODE_SEVERITY] = "ERROR";

    const service = new ControlFlowAnalysisService();
    await service.handleControlFlowAst(apiResult);

    expect(lastWorkerErrorTrigger).toBeTruthy();

    const p = service.getAnalysis(apiResult.documentUri);

    lastWorkerErrorTrigger?.(Error("boom"));

    await expect(p).rejects.toThrow("boom");
  });

  test("Defer analysis", async () => {
    getConfigurationResult[SETTINGS_UNREACHABLE_CODE_SEVERITY] = "NONE";

    const service = new ControlFlowAnalysisService();
    await service.handleControlFlowAst(apiResult);

    expect(lastWorkerResultTrigger).toBeUndefined();
    expect(lastWorkerErrorTrigger).toBeUndefined();

    const p = service.getAnalysis(apiResult.documentUri);

    expect(lastWorkerResultTrigger).toBeTruthy();
    expect(lastWorkerErrorTrigger).toBeTruthy();

    lastWorkerResultTrigger?.();

    expect(await p).toBeTruthy();
  });
});

describe("ControlFlowService analysis task tests", () => {
  let logChannel = {
    trace: jest.fn(),
    debug: jest.fn(),
    info: jest.fn(),
    warn: jest.fn(),
    error: jest.fn(),
  };

  beforeEach(() => {
    getConfigurationResult[SETTINGS_UNREACHABLE_CODE_SEVERITY] = "ERROR";
    logChannel = {
      trace: jest.fn(),
      debug: jest.fn(),
      info: jest.fn(),
      warn: jest.fn(),
      error: jest.fn(),
    };
  });

  afterEach(() => {
    delete getConfigurationResult[SETTINGS_UNREACHABLE_CODE_SEVERITY];
  });

  test("AnalysisTask log error to logger channel", async () => {
    messageType = "log";
    payload = [{ severity: 0, message: "message" }];

    const service = new ControlFlowAnalysisService(
      undefined,
      logChannel as unknown as LogOutputChannel,
    );
    await service.handleControlFlowAst(apiResult);

    lastWorkerResultTrigger?.();

    expect(logChannel.error).toHaveBeenCalled();
  });

  test("AnalysisTask log warning to logger channel", async () => {
    messageType = "log";
    payload = [{ severity: 1, message: "message" }];

    const service = new ControlFlowAnalysisService(
      undefined,
      logChannel as unknown as LogOutputChannel,
    );
    await service.handleControlFlowAst(apiResult);

    lastWorkerResultTrigger?.();

    expect(logChannel.warn).toHaveBeenCalled();
  });

  test("AnalysisTask log info to logger channel", async () => {
    messageType = "log";
    payload = [{ severity: 2, message: "message" }];

    const service = new ControlFlowAnalysisService(
      undefined,
      logChannel as unknown as LogOutputChannel,
    );
    await service.handleControlFlowAst(apiResult);

    lastWorkerResultTrigger?.();

    expect(logChannel.info).toHaveBeenCalled();
  });

  test("AnalysisTask log info to logger channel", async () => {
    messageType = "log";
    payload = [{ severity: 3, message: "message" }];

    const service = new ControlFlowAnalysisService(
      undefined,
      logChannel as unknown as LogOutputChannel,
    );
    await service.handleControlFlowAst(apiResult);
    expect(logChannel.debug).toHaveBeenCalled();
  });
});
