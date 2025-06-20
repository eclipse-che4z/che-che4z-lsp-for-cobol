/*
 * Copyright (c) 2023 Broadcom.
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
import {
  getWorkspaceFolderResult,
  readFileResult,
  Uri,
} from "../../__mocks__/vscode";
import { initializeExternalAPIs } from "../../services/ExternalAPIsService";
import {
  loadProcessorGroupCompileOptionsConfig,
  loadProcessorGroupCopybookExtensionsConfig,
  loadProcessorGroupDialectConfig,
  loadProcessorGroupSqlBackendConfig,
} from "../../services/ProcessorGroups";
import * as vscode from "vscode";

const WORKSPACE_PATH = "/tests/processor-groups";
const WORKSPACE_URI = Uri.file(WORKSPACE_PATH);

jest.mock("fs", () => ({
  existsSync: jest.fn().mockReturnValue(true),
  readFileSync: jest.fn().mockImplementation(() => {}),
}));

// jest.mock("vscode", () => {
//   // eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
//   const vscode = jest.requireActual("../../__mocks__/vscode");
//   // eslint-disable-next-line @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-member-access
//   const WORKSPACE_URI_OBJ = vscode.Uri.file("/my/workspace") as vscode.Uri;
//   // eslint-disable-next-line @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-member-access
//   const WORKSPACE_URI_OBJ_WIN32 = vscode.Uri.file(
//     "c:/my/workspace",
//   ) as vscode.Uri;
//   // eslint-disable-next-line @typescript-eslint/no-unsafe-return
//   return {
//     ...vscode,
//     workspace: {
//       fs: {
//       getWorkspaceFolder: (uri: vscode.Uri) =>
//         uri.path.startsWith("/c:")
//           ? { uri: WORKSPACE_URI_OBJ_WIN32 }
//           : { uri: WORKSPACE_URI_OBJ },
//       workspaceFolders: [{ uri: WORKSPACE_URI_OBJ }],
//       getConfiguration: jest.fn().mockReturnValue({
//         get: jest.fn().mockReturnValue(undefined),
//       }),
//     },
//   };
// });

jest.mock("path", (): unknown => {
  return {
    ...jest.requireActual("path"),
    relative: (...strs: string[]) => {
      return strs[1].substring(strs[0].length + 1);
    },
    isAbsolute: (...strs: string[]) => {
      return strs[0].startsWith("/") || strs[0].startsWith("c:\\");
    },
  };
});

beforeEach(async () => {
  getWorkspaceFolderResult.uri = WORKSPACE_URI;
  readFileResult[`${WORKSPACE_PATH}/.cobolplugin/proc_grps.json`] = `{
      "pgroups": [
          {
              "name": "DAF",
              "copybook-extensions": [".copy"],
              "copybook-file-encoding": "UTF-8",
              "compiler-options": ["QUALIFY(EXTEND)","XMLPARSE(COMPAT)"],
              "preprocessor": [
                  "IDMS",
                  {
                      "name": "DaCo",
                      "libs": ["/daco",
                      {
                  "environment": "ENV",
                  "stage": "1",
                  "system": "SYSTEM",
                  "subsystem": "SUBSYTEM",
                  "type": "COPY",
                  "profile": "instance.internal.connection"
                }
                  ]
                  },
                  {
                      "name": "SQL",
                      "target-sql-backend": "DATACOM_SERVER"
                  }
              ],
              "libs": ["/copy"]
          },
          {
              "name": "IDMSPG",
              "preprocessor": [ "IDMS" ]
          },
          {
              "name": "ABS",
              "libs": [
                "/abs",
                { "dataset": "remote.dataset.location" },
                { "uss": "remote.uss.location" },
                {
                  "environment": "ENV",
                  "stage": "1",
                  "system": "SYSTEM",
                  "subsystem": "SUBSYTEM",
                  "type": "COPY",
                  "profile": "instance.internal.connection"
                }
              ]
          }
      ]
  }`;
  readFileResult[`${WORKSPACE_PATH}/.cobolplugin/pgm_conf.json`] = `{
    "pgms": [
        { "program": "c:\\\\my\\\\workspace\\\\TEST.cob", "pgroup": "DAF" },
        { "program": "/my/workspace/abs/TEST.cob", "pgroup": "ABS" },
        { "program": "TEST.cob", "pgroup": "DAF" },
        { "program": "*DAF.cob", "pgroup": "DAF" },
        { "program": "IDMS/TEST.cob", "pgroup": "IDMSPG" }
    ]
  }`;

  jest
    .spyOn(vscode.workspace, "getWorkspaceFolder")
    .mockReturnValue({ name: "ws", index: 0, uri: WORKSPACE_URI });

  await initializeExternalAPIs(
    Uri.file("/storage"),
    vscode.window.createOutputChannel("test"),
  );
});

describe("Processor groups configuration provides lib path", () => {
  it("Processor groups configuration provides lib path", async () => {
    // const item = {
    //   scopeUri: WORKSPACE_URI + "/TEST.cob",
    //   section: "cobol-lsp.cpy-manager.paths-local",
    // };
    // // const result = await loadProcessorGroupCopybookPathsConfig(item, []);
    // expect(result).toEqual([vscode.Uri.file("/copy")]);
  });
});

describe("Processor groups configuration understand absolute paths", () => {
  it("Processor groups configuration understand absolute paths", async () => {
    // const item = {
    //   scopeUri: WORKSPACE_URI + "/abs/TEST.cob",
    //   section: "cobol-lsp.cpy-manager.paths-local",
    // };
    // const result = await loadProcessorGroupCopybookPathsConfig(item, []);
    // expect(result).toStrictEqual([
    //   vscode.Uri.file("/abs"),
    //   { dataset: "remote.dataset.location" },
    //   { uss: "remote.uss.location" },
    //   {
    //     environment: "ENV",
    //     stage: "1",
    //     system: "SYSTEM",
    //     subsystem: "SUBSYTEM",
    //     type: "COPY",
    //     profile: "instance.internal.connection",
    //   },
    // ]);
  });
});

it("Processor groups configuration provides copybook-extensions", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
    section: "cobol-lsp.cpy-manager.copybook-extensions",
  };
  const result = await loadProcessorGroupCopybookExtensionsConfig(
    item.scopeUri,
    [],
  );
  expect(result).toStrictEqual([".copy"]);
});

it("Processor groups configuration provides cobol-lsp.target-sql-backend", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
    section: "cobol-lsp.target-sql-backend",
  };
  const result = await loadProcessorGroupSqlBackendConfig(item, "");
  expect(result).toStrictEqual("DATACOM_SERVER");
});

it("Processor groups configuration matches program", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, []);
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration matches program relative to workspace", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "IDMS/TEST.cob"),
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, []);
  expect(result).toStrictEqual(["IDMS"]);
});
it("Checks library configurations in preprocessor definitions overrides processor group libraries", async () => {
  // const scope = {
  //   scopeUri: WORKSPACE_URI + "/progDaF.cob",
  // };
  // const resultCobol = await loadProcessorGroupCopybookPathsConfig(scope, []);
  // const resultDaco = await loadProcessorGroupCopybookPathsConfig(
  //   scope,
  //   [],
  //   "DaCo",
  // );
  // expect(resultCobol).toStrictEqual([vscode.Uri.file("/copy")]);
  // expect(resultDaco).toStrictEqual([
  //   vscode.Uri.file("/daco"),
  //   {
  //     environment: "ENV",
  //     profile: "instance.internal.connection",
  //     stage: "1",
  //     subsystem: "SUBSYTEM",
  //     system: "SYSTEM",
  //     type: "COPY",
  //   },
  // ]);
});

it("Processor groups configuration matches program with *", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "progDaF.cob"),
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, []);
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration mismatches program with *", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "progDA.cob"),
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, []);
  expect(result).toStrictEqual([]);
});

it("Processor groups configuration provides compiler-options", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
    section: "cobol-lsp.compiler.options",
  };
  const result = await loadProcessorGroupCompileOptionsConfig(item, "");
  expect(result).toStrictEqual(["QUALIFY(EXTEND)", "XMLPARSE(COMPAT)"]);
});

describe("Processor groups configuration provides lib path in Windows", () => {
  it("Processor groups configuration provides lib path in Windows", async () => {
    // const item = {
    //   scopeUri: "file:///c:/my/workspace/TEST.cob",
    //   section: "cobol-lsp.cpy-manager.paths-local",
    // };
    // const result = await loadProcessorGroupCopybookPathsConfig(item, []);
    // expect(result).toStrictEqual([vscode.Uri.file("/copy")]);
  });
});
