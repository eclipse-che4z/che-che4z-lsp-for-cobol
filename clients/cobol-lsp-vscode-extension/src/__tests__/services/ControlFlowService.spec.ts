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

import { Program } from "@code4z/analysis/lib/model/cfast";
import {
  ApiResult,
  ControlFlowAnalysisService,
} from "../../services/ControlFlowService";

jest.mock("worker_threads", () => ({
  Worker: class {
    constructor(private path: string) {}
    public on(_message: string, _listener: (value: unknown) => void) {}
    public postMessage(_message: unknown) {}
  },
}));

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
      };
    }
  },
}));

describe("ControlFlowService tests", () => {
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

  test("Build queued for analysis", async () => {
    const service = new ControlFlowAnalysisService();
    const queueAnalysis = jest.spyOn(service, "queueAnalysis");
    await service.handleControlFlowAst(apiResult);
    expect(queueAnalysis).toHaveBeenCalled();
  });
});
