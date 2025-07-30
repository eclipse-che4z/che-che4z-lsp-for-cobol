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

jest.mock("worker_threads", () => ({
  Worker: class {
    constructor(private path: string) {}
    public on(_message: string, listener: (value: unknown) => void) {
      listener({
        type: messageType,
        payload: payload,
      });
    }
    public postMessage(_message: unknown) {}
    public terminate() {}
  },
}));

describe("ControlFlowService tests", () => {
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
    logChannel = {
      trace: jest.fn(),
      debug: jest.fn(),
      info: jest.fn(),
      warn: jest.fn(),
      error: jest.fn(),
    };
  });

  test("AnalysisTask log error to logger channel", async () => {
    messageType = "log";
    payload = [{ severity: 0, message: "message" }];

    const service = new ControlFlowAnalysisService(
      undefined,
      logChannel as unknown as LogOutputChannel,
    );
    await service.handleControlFlowAst(apiResult);
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
