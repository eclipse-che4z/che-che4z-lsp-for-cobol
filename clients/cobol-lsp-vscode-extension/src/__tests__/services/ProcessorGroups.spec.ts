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
jest.mock("glob");
import { Uri } from "../../__mocks__/UriMock";
import {
  loadProcessorGroupCompileOptionsConfig,
  loadProcessorGroupCopybookEncodingConfig,
  loadProcessorGroupCopybookExtensionsConfig,
  loadProcessorGroupCopybookPaths,
  loadProcessorGroupCopybookPathsConfig,
  loadProcessorGroupDialectConfig,
  loadProcessorGroupSqlBackendConfig,
} from "../../services/ProcessorGroups";
// eslint-disable-next-line @typescript-eslint/no-unused-vars
import { globSync } from "glob";

const WORKSPACE_URI = "file:///my/workspace";

jest.mock("fs", () => ({
  existsSync: jest.fn().mockReturnValue(true),
  readFileSync: jest.fn().mockImplementation(() => {}),
}));

jest.mock("vscode", () => {
  const WORKSPACE_URI_OBJ = new Uri("/my/workspace");
  const WORKSPACE_URI_OBJ_WIN32 = new Uri("/c:/my/workspace");
  return {
    Uri,
    workspace: {
      fs: {
        readFile: jest.fn().mockImplementation((uri: Uri) => {
          if (
            uri.fsPath === "/my/workspace/.cobolplugin/proc_grps.json" ||
            uri.fsPath === "c:\\my\\workspace\\.cobolplugin\\proc_grps.json"
          ) {
            return Buffer.from(`{
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
                                      "libs": ["/daco"]
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
                              "libs": ["/abs"]
                          }
                      ]
                  }`);
          }
          if (
            uri.fsPath === "/my/workspace/.cobolplugin/pgm_conf.json" ||
            uri.fsPath === "c:\\my\\workspace\\.cobolplugin\\pgm_conf.json"
          ) {
            return Buffer.from(`{
                      "pgms": [
                          { "program": "c:\\\\my\\\\workspace\\\\TEST.cob", "pgroup": "DAF" },
                          { "program": "/my/workspace/abs/TEST.cob", "pgroup": "ABS" },
                          { "program": "TEST.cob", "pgroup": "DAF" }, 
                          { "program": "*DAF.cob", "pgroup": "DAF" },
                          { "program": "IDMS/TEST.cob", "pgroup": "IDMSPG" }
                      ]
                  }`);
          }
          throw { code: "FileNotFound" };
        }),
      },
      getWorkspaceFolder: (uri: Uri) =>
        uri.path.startsWith("/c:")
          ? { uri: WORKSPACE_URI_OBJ_WIN32 }
          : { uri: WORKSPACE_URI_OBJ },
      workspaceFolders: [{ uri: WORKSPACE_URI_OBJ }],
    },
  };
});

jest.mock("path", () => {
  return {
    ...jest.requireActual("path"),
    relative: jest.fn().mockImplementation((...strs: string[]) => {
      return strs[1].substring(strs[0].length + 1);
    }),
    isAbsolute: jest.fn().mockImplementation((...strs: string[]) => {
      return strs[0].startsWith("/") || strs[0].startsWith("c:\\");
    }),
  };
});

it("Processor groups configuration provides lib path", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.paths-local",
  };
  (globSync as any) = jest.fn().mockImplementation((config: string[]) => {
    if (config[0] === "/copy") return ["/copy-resolved-from-glob"];
    else throw Error("some issue with input param");
  });
  const result = await loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["/copy-resolved-from-glob"]);
});

it("Processor groups configuration understend absolute paths", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/abs/TEST.cob",
    section: "cobol-lsp.cpy-manager.paths-local",
  };
  (globSync as any) = jest.fn().mockImplementation((config: string[]) => {
    if (config[0] === "/abs") return ["/copy-resolved-from-glob"];
    else throw Error("some issue with input param");
  });
  const result = await loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["/copy-resolved-from-glob"]);
});

it("Processor groups configuration provides copybook-extensions", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.copybook-extensions",
  };
  const result = await loadProcessorGroupCopybookExtensionsConfig(item, []);
  expect(result).toStrictEqual([".copy"]);
});

it("Processor groups configuration provides copybook-file-encoding", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.copybook-file-encoding",
  };
  const result = await loadProcessorGroupCopybookEncodingConfig(item, "");
  expect(result).toStrictEqual("UTF-8");
});

it("Processor groups configuration provides cobol-lsp.target-sql-backend", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.target-sql-backend",
  };
  const result = await loadProcessorGroupSqlBackendConfig(item, "");
  expect(result).toStrictEqual("DATACOM_SERVER");
});

it("Processor groups configuration provides dialect lib path", async () => {
  const result = await loadProcessorGroupCopybookPaths(
    WORKSPACE_URI + "/TEST.cob",
    "DaCo",
  );
  expect(result).toStrictEqual(["/daco"]);
});

it("Processor groups configuration matches program", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration matches program relative to workspace", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/IDMS/TEST.cob",
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, []);
  expect(result).toStrictEqual(["IDMS"]);
});

it("Processor groups configuration matches program with *", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/progDaF.cob",
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration mismatches program with *", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/progDA.cob",
    section: "cobol-lsp.dialects",
  };
  const result = await loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual({});
});

it("Processor groups configuration provides compiler-options", async () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.compiler.options",
  };
  const result = await loadProcessorGroupCompileOptionsConfig(item, "");
  expect(result).toStrictEqual(["QUALIFY(EXTEND)", "XMLPARSE(COMPAT)"]);
});

it("Processor groups configuration provides lib path in Windows", async () => {
  const item = {
    scopeUri: "file:///c:/my/workspace/TEST.cob",
    section: "cobol-lsp.cpy-manager.paths-local",
  };
  (globSync as any) = jest.fn().mockImplementation((config: string[]) => {
    if (config[0] === "/copy") {
      return ["copy-resolved-from-glob"];
    } else {
      console.trace(config);
      throw Error("some issue with input param");
    }
  });
  const result = await loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["copy-resolved-from-glob"]);
});
