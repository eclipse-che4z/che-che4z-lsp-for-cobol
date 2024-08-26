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

import { B4GTypeMetadata, decodeBridgeJson } from "../../services/BridgeForGit";
import { loadProcessorsConfigForDocument } from "../../services/ProcessorGroups";
import * as path from "path";

jest.mock("vscode", () => ({
  Uri: {
    parse: jest.fn().mockImplementation((str: string) => {
      const fsPath = str.substring("file://".length).replace(/\//g, path.sep);
      const p =
        (str.startsWith("/") ? "" : "/") + str.substring("file://".length);
      return {
        path: p,
        fsPath: process.platform === "win32" ? fsPath.substring(1) : fsPath,
      };
    }),
  },
  workspace: {
    getConfiguration: jest.fn().mockReturnValue({
      get: jest.fn(),
    }),
    workspaceFolders: [
      {
        uri: {
          fsPath: "/home/",
        },
      },
    ],
  },
}));
const b4gJson = {
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
  test("Decode b4f json", () => {
    const result = decodeBridgeJson(b4gJson);
    expect(result).toBeDefined();
    expect(result!.elements["main"].processorGroup).toBe("pg2");
    expect(Object.keys(result!.elements)[0] + "." + result!.fileExtension).toBe(
      "main.cob",
    );
  });

  test("Map file into processor group", () => {
    const scopeUri = "file:///home/main.cob";
    const cfg = loadProcessorsConfigForDocument(
      scopeUri,
      pgJson,
      pgMapJson,
      decodeBridgeJson(b4gJson),
    );
    expect(cfg?.name).toBe("pg2");
  });

  test("No extension case", () => {
    const scopeUri = "file:///home/main";
    const cfg = loadProcessorsConfigForDocument(
      scopeUri,
      pgJson,
      pgMapJson,
      decodeBridgeJson(b4gJsonNoExt),
    );
    expect(cfg?.name).toBe("pg2");
  });
});
