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

jest.mock("vscode", () => ({
  Uri: {
    parse: jest.fn().mockImplementation((str: string) => {
      return {
        fsPath: str.substring("file://".length),
      };
    }),
    file: jest.fn().mockImplementation((str: string) => {
      return { fsPath: str };
    }),
  },
  workspace: {
    getWorkspaceFolder: jest
      .fn()
      .mockReturnValue({ uri: { fsPath: "file:///my/workspace" } }),
    workspaceFolders: [{ uri: { fsPath: "/my/workspace" } }],
  },
}));

jest.mock("path", () => ({
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

it("Processor groups configuration provides lib path", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.paths-local",
  };
  (globSync as any) = jest.fn().mockImplementation((config: string[]) => {
    if (config[0] === "/copy") return ["/copy-resolved-from-glob"];
    else throw Error("some issue with input param");
  });
  const result = loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["/copy-resolved-from-glob"]);
});

it("Processor groups configuration understend absolute paths", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/abs/TEST.cob",
    section: "cobol-lsp.cpy-manager.paths-local",
  };
  (globSync as any) = jest.fn().mockImplementation((config: string[]) => {
    if (config[0] === "/abs") return ["/copy-resolved-from-glob"];
    else throw Error("some issue with input param");
  });
  const result = loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["/copy-resolved-from-glob"]);
});

it("Processor groups configuration provides copybook-extensions", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.copybook-extensions",
  };
  const result = loadProcessorGroupCopybookExtensionsConfig(item, []);
  expect(result).toStrictEqual([".copy"]);
});

it("Processor groups configuration provides copybook-file-encoding", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.cpy-manager.copybook-file-encoding",
  };
  const result = loadProcessorGroupCopybookEncodingConfig(item, "");
  expect(result).toStrictEqual("UTF-8");
});

it("Processor groups configuration provides cobol-lsp.target-sql-backend", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.target-sql-backend",
  };
  const result = loadProcessorGroupSqlBackendConfig(item, "");
  expect(result).toStrictEqual("DATACOM_SERVER");
});

it("Processor groups configuration provides dialect lib path", () => {
  const result = loadProcessorGroupCopybookPaths(
    WORKSPACE_URI + "/TEST.cob",
    "DaCo",
  );
  expect(result).toStrictEqual(["/daco"]);
});

it("Processor groups configuration matches program", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration matches program relative to workspace", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/IDMS/TEST.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS"]);
});

it("Processor groups configuration matches program with *", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/progDaF.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration mismatches program with *", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/progDA.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual({});
});

it("Processor groups configuration provides compiler-options", () => {
  const item = {
    scopeUri: WORKSPACE_URI + "/TEST.cob",
    section: "cobol-lsp.compiler.options",
  };
  const result = loadProcessorGroupCompileOptionsConfig(item, "");
  expect(result).toStrictEqual(["QUALIFY(EXTEND)", "XMLPARSE(COMPAT)"]);
});
