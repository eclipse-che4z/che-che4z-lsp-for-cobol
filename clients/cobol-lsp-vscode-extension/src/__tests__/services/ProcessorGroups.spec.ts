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
import {
  loadProcessorGroupCompileOptionsConfig,
  loadProcessorGroupCopybookEncodingConfig,
  loadProcessorGroupCopybookExtensionsConfig,
  loadProcessorGroupCopybookPaths,
  loadProcessorGroupCopybookPathsConfig,
  loadProcessorGroupDialectConfig,
  loadProcessorGroupSqlBackendConfig,
} from "../../services/ProcessorGroups";
import { globSync } from "glob";

const WORKSPACE_URI = "file:///my/workspace";

jest.mock("fs", () => ({
  existsSync: jest.fn().mockReturnValue(true),
  readFileSync: jest.fn().mockImplementation((f) => {
    if (f === "procCfgPath") {
      return `{
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
            }`;
    }
    if (f === "pgmCfgPath") {
      return `{
                "pgms": [ 
                    { "program": "/my/workspace/abs/TEST.cob", "pgroup": "ABS" },
                    { "program": "TEST.cob", "pgroup": "DAF" }, 
                    { "program": "*DAF.cob", "pgroup": "DAF" },
                    { "program": "IDMS/TEST.cob", "pgroup": "IDMSPG" }
                ]
            }`;
    }
    return undefined;
  }),
}));

// TODO: Yes, still horrifying
jest.mock("vscode", () => ({
  Uri: {
    parse: jest.fn().mockImplementation((str: string) => {
      str = str.replace(/\\/g, "/");
      const fsPath = str.substring("file://".length);
      const path = (str.startsWith("/") ? "" : "/") + fsPath;
      return {
        path,
        fsPath,
      };
    }),
    joinPath: (u: any, segment: string) => {
      if (segment === "../.bridge.json") {
        return {
          path: u.path.substring(0, u.path.lastIndexOf("/") + "/.bridge.json"),
          fsPath:
            u.fsPath.substring(0, u.fsPath.lastIndexOf("/")) + "/.bridge.json",
        };
      }
      expect(segment).toBe("..");
      const path = u.path;
      return {
        path: path.substring(0, path.lastIndexOf("/")),
        fsPath: path.substring(0, path.lastIndexOf("/")),
      };
    },
    file: jest.fn().mockImplementation((str: string) => {
      const path = (str.startsWith("/") ? "" : "/") + str.replace(/\\/g, "/");
      return {
        path,
        fsPath: str,
      };
    }),
  },
  workspace: {
    fs: {
      readFile: jest.fn().mockImplementation(() => {
        throw { code: "FileNotFound" };
      }),
    },
    getWorkspaceFolder: jest
      .fn()
      .mockReturnValue({ uri: { fsPath: "file:///my/workspace" } }),
    workspaceFolders: [{ uri: { fsPath: "/my/workspace" } }],
  },
}));

jest.mock("path", () => ({
  ...jest.requireActual("path"),
  join: jest.fn().mockImplementation((...strs: string[]) => {
    if (strs[1] === "pgm_conf.json") {
      return "pgmCfgPath";
    }
    if (strs[1] === "proc_grps.json") {
      return "procCfgPath";
    }
    return strs.join("/");
  }),
  relative: jest.fn().mockImplementation((...strs: string[]) => {
    return strs[1].substring(strs[0].length + 1);
  }),
  isAbsolute: jest.fn().mockImplementation((...strs: string[]) => {
    return strs[0].startsWith("/");
  }),
  sep: "/",
}));

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
