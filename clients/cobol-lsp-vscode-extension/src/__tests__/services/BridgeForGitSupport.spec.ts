/*
 * Copyright (c) 2024 Broadcom.
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

import { B4GTypeMetadata } from "../../services/BridgeForGitLoader";
import { loadProcessorsConfigForDocument } from "../../services/ProcessorGroups";

jest.mock("vscode", () => {
  /* eslint-disable @typescript-eslint/no-unsafe-assignment, @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-member-access, @typescript-eslint/no-unsafe-return */
  const vscode = jest.requireActual("../../__mocks__/vscode");
  const WS_URI = new vscode.Uri("/c:/my/workspace");
  return {
    ...vscode,
    workspace: {
      getWorkspaceFolder: () => ({ uri: WS_URI }),
      workspaceFolders: [{ uri: WS_URI }],
    },
  };
});

const b4gJson: B4GTypeMetadata = {
  elements: {
    main: {
      processorGroup: "pg2",
    },
  },
  defaultProcessorGroup: "DEFGRP",
  definedProcessorGroups: [
    {
      name: "pg2",
      description: "A GROUP",
    },
    {
      name: "DEFGRP",
      description: "DEFAULT GROUP",
    },
  ],
  fileExtension: "cob",
};

const b4gJsonNoExt = {
  elements: {
    main: {
      processorGroup: "pg2",
    },
  },
  defaultProcessorGroup: "DEFGRP",
  definedProcessorGroups: [
    {
      name: "pg2",
      description: "A GROUP",
    },
    {
      name: "DEFGRP",
      description: "DEFAULT GROUP",
    },
  ],
  fileExtension: "",
};

const pgJson = [{ name: "pg1" }, { name: "pg2" }];
const pgMapJson = { pgms: [{ program: "main.cob", pgroup: "pg1" }] };

describe("Bridge for Git group tests", () => {
  test("Map file into processor group", () => {
    const scopeUri = "file:///home/main.cob";
    const cfg = loadProcessorsConfigForDocument(
      scopeUri,
      pgJson,
      pgMapJson,
      b4gJson,
    );
    expect(cfg?.name).toBe("pg2");
  });

  test("No extension case", () => {
    const scopeUri = "file:///home/main";
    const cfg = loadProcessorsConfigForDocument(
      scopeUri,
      pgJson,
      pgMapJson,
      b4gJsonNoExt,
    );
    expect(cfg?.name).toBe("pg2");
  });
});
