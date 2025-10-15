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
  getConfigurationResult,
  getWorkspaceFolderResult,
  readFileResult,
  Uri,
} from "../../__mocks__/vscode";
import {
  DEFAULT_DIALECT,
  ENDEVOR_PROCESSOR,
  PATHS_LOCAL_KEY,
  SETTINGS_CPY_NDVR_DEPENDENCIES,
} from "../../constants";
import { DatasetLib } from "../../services/copybookLibs/DatasetLib";
import { EndevorElementLib } from "../../services/copybookLibs/EndevorElementLib";
import LocalPathLib from "../../services/copybookLibs/LocalPathLib";
import { UssPathLib } from "../../services/copybookLibs/UssPathLib";
import { initializeExternalAPIs } from "../../services/ExternalAPIsService";
import {
  loadProcessorGroupCompileOptionsConfig,
  loadProcessorGroupCopybookExtensionsConfig,
  loadProcessorGroupCopybooksLibs,
  loadProcessorGroupDialectConfig,
  loadProcessorGroupSqlBackendConfig,
  loadProcessorGroup,
} from "../../services/ProcessorGroups";
import * as vscode from "vscode";
import * as E4ECopybookService from "../../services/copybook/E4ECopybookService";
import { E4E, E4EExternalConfigurationResponse } from "../../type/e4eApi";

const WORKSPACE_PATH = "/tests/processor-groups";
const WORKSPACE_URI = Uri.file(WORKSPACE_PATH);

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

let isEndevorElementResult = false;
let e4eConfigurationResult: E4EExternalConfigurationResponse | Error;
let e4eMock: E4E;

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
                      "libs": [
                        "/daco",
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
                { "uss": "/remote/uss/location" },
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
            "name": "back-slash",
            "libs": [ "/back" ]
          },
          {
            "name": "forward-slash",
            "libs": [ "/forward" ]
          }
      ]
  }`;
  readFileResult[`${WORKSPACE_PATH}/.cobolplugin/pgm_conf.json`] = `{
    "pgms": [
        { "program": "c:\\\\my\\\\workspace\\\\TEST.cob", "pgroup": "DAF" },
        { "program": "${WORKSPACE_PATH}/abs/TEST.cob", "pgroup": "ABS" },
        { "program": "TEST.cob", "pgroup": "DAF" },
        { "program": "bAcK\\\\TeSt.cob", "pgroup": "back-slash" },
        { "program": "FoRwArD/TeSt.cob", "pgroup": "forward-slash" },
        { "program": "*DAF.cob", "pgroup": "DAF" },
        { "program": "IDMS/TEST.cob", "pgroup": "IDMSPG" }
    ]
  }`;

  e4eConfigurationResult = {
    pgms: [{ program: "COBOL/PROGRAM", pgroup: "endevor_pgroup" }],
    pgroups: [
      {
        name: "endevor_pgroup",
        libs: [{ dataset: "ENDEVOR.DATASET" }],
      },
    ],
  };

  jest
    .spyOn(vscode.workspace, "getWorkspaceFolder")
    .mockReturnValue({ name: "ws", index: 0, uri: WORKSPACE_URI });

  e4eMock = {
    isEndevorElement: jest
      .fn()
      .mockImplementation(() => isEndevorElementResult),
    getProfileInfo: jest.fn().mockResolvedValue({
      profile: "profile",
      instance: "instance",
    }),
    listElements: jest.fn().mockResolvedValue([]),
    getElement: jest.fn(),
    listMembers: jest
      .fn()
      .mockResolvedValue(["COPYBOOK", "ANOTHER", "CaSeTeSt"]),
    getMember: jest.fn().mockResolvedValue([]),
    getConfiguration: jest.fn().mockImplementation(() => {
      return e4eConfigurationResult;
    }),

    onDidChangeElement: jest.fn(),
  };

  jest
    .spyOn(E4ECopybookService, "getE4EAPI")
    .mockResolvedValue({ api: e4eMock });
  await initializeExternalAPIs(Uri.file("/storage"));
});

describe("Processor groups", () => {
  describe("get processor group for a document", () => {
    describe("read config from .cobolplugin directory", () => {
      it("reads proc_grps.json and pgm_conf.json to get configuration", async () => {
        const document = vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob");
        const pg = await loadProcessorGroup(document);
        expect(pg?.name).toEqual("DAF");
      });
    });
    describe("endevor document -> read pg config from E4E", () => {
      beforeEach(() => {
        isEndevorElementResult = true;
        getConfigurationResult[SETTINGS_CPY_NDVR_DEPENDENCIES] =
          ENDEVOR_PROCESSOR;
        getConfigurationResult["compiler"] = "";
        getConfigurationResult["preprocessors"] = [];
      });

      it("reads processor group configuration from E4E", async () => {
        const document = vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob");
        const pg = await loadProcessorGroup(document);
        expect(pg?.name).toEqual("endevor_pgroup");
      });

      describe("Endevor returns error", () => {
        beforeEach(() => {
          e4eConfigurationResult = new Error("Error from E4E");
        });

        it("returns vscode setting configuration and show error to user", async () => {
          const document = vscode.Uri.joinPath(WORKSPACE_URI, "ERROR.cob");
          const pg = await loadProcessorGroup(document);
          expect(pg?.name).toEqual("VSCodeSettingProcessorGroup");
          expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
            "An error occurred while retrieving Endevor configuration: Error from E4E.",
          );

          // failed requests are not repeated
          await loadProcessorGroup(document);
          expect(e4eMock.getConfiguration).toHaveBeenCalledTimes(1);
        });
      });
    });

    describe("generate processor group configuration from vscode setting if no other configuration is available", () => {
      describe("no matching pg", () => {
        beforeEach(() => {
          isEndevorElementResult = false;
          getConfigurationResult[PATHS_LOCAL_KEY] = ["local/copybooks"];
          getConfigurationResult[`idms.${PATHS_LOCAL_KEY}`] = [
            "local/idms/copybooks",
          ];
        });
        it("uses vscode setting if no matching processor group is available", async () => {
          const document = vscode.Uri.joinPath(WORKSPACE_URI, "NO_PG.cob");
          const pg = await loadProcessorGroup(document);
          expect(pg?.name).toEqual("VSCodeSettingProcessorGroup");
          expect(pg?.libs).toEqual([new LocalPathLib("local/copybooks")]);
        });
      });

      describe("no matching pg - idms dialect", () => {
        beforeEach(() => {
          isEndevorElementResult = false;
          getConfigurationResult[PATHS_LOCAL_KEY] = ["local/copybooks"];
          getConfigurationResult[`idms.${PATHS_LOCAL_KEY}`] = [
            "local/idms/copybooks",
          ];
        });
        it("uses vscode setting if no matching processor group is available", async () => {
          const document = vscode.Uri.joinPath(WORKSPACE_URI, "NO_PG.cob");
          const pg = await loadProcessorGroup(document, "IDMS");
          expect(pg?.name).toEqual("VSCodeSettingProcessorGroup");
          expect(pg.libs).toEqual([new LocalPathLib("local/idms/copybooks")]);
        });
      });

      describe("vscode setting is used for endevor documents when ENDEVOR PROCESSOR setting is disabled", () => {
        beforeEach(() => {
          isEndevorElementResult = true;
          getConfigurationResult[SETTINGS_CPY_NDVR_DEPENDENCIES] = "";
        });

        it("reads processor group configuration from VSCode settings", async () => {
          const document = vscode.Uri.joinPath(WORKSPACE_URI, "ENDEVOR.cob");
          const pg = await loadProcessorGroup(document);
          expect(pg?.name).toEqual("VSCodeSettingProcessorGroup");
        });
      });
    });
  });
});

describe("Processor groups configuration provides lib path", () => {
  it("returns instance of LocalPathLib pointing to the directory from configuration", async () => {
    const document = vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob");
    const result = await loadProcessorGroupCopybooksLibs(
      document,
      DEFAULT_DIALECT,
    );
    expect(result).toEqual([new LocalPathLib("/copy")]);
  });
});

describe("Processor groups configuration understand absolute paths", () => {
  it("Processor groups configuration understand absolute paths", async () => {
    const document = vscode.Uri.joinPath(WORKSPACE_URI, "abs/TEST.cob");
    const result = await loadProcessorGroupCopybooksLibs(
      document,
      DEFAULT_DIALECT,
    );
    expect(result).toStrictEqual([
      new LocalPathLib("/abs"),
      new DatasetLib("remote.dataset.location"),
      new UssPathLib("/remote/uss/location"),
      new EndevorElementLib({
        environment: "ENV",
        stage: "1",
        system: "SYSTEM",
        subsystem: "SUBSYTEM",
        type: "COPY",
        profile: "instance.internal.connection",
      }),
    ]);
  });
});

it("Processor groups configuration provides copybook-extensions", async () => {
  const item = {
    scopeUri: vscode.Uri.joinPath(WORKSPACE_URI, "TEST.cob"),
    section: "cobol-lsp.cpy-manager.copybook-extensions",
  };
  const result = await loadProcessorGroupCopybookExtensionsConfig(
    item.scopeUri,
    DEFAULT_DIALECT,
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
  const document = vscode.Uri.joinPath(WORKSPACE_URI, "progDaF.cob");

  const resultCobol = await loadProcessorGroupCopybooksLibs(
    document,
    DEFAULT_DIALECT,
  );
  const resultSql = await loadProcessorGroupCopybooksLibs(document, "SQL");
  const resultDaco = await loadProcessorGroupCopybooksLibs(document, "DaCo");

  expect(resultCobol).toStrictEqual([new LocalPathLib("/copy")]);
  expect(resultSql).toStrictEqual([new LocalPathLib("/copy")]);
  expect(resultDaco).toStrictEqual([
    new LocalPathLib("/daco"),
    new EndevorElementLib({
      environment: "ENV",
      profile: "instance.internal.connection",
      stage: "1",
      subsystem: "SUBSYTEM",
      system: "SYSTEM",
      type: "COPY",
    }),
  ]);
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
    const document = vscode.Uri.parse("file:///c:/my/workspace/TEST.cob");

    const result = await loadProcessorGroupCopybooksLibs(
      document,
      DEFAULT_DIALECT,
    );
    expect(result).toStrictEqual([new LocalPathLib("/copy")]);
  });

  it("forward slash in PGM definition", async () => {
    const document = vscode.Uri.joinPath(WORKSPACE_URI, "FORWard/teST.cob");
    const result = await loadProcessorGroupCopybooksLibs(
      document,
      DEFAULT_DIALECT,
    );
    expect(result).toStrictEqual([new LocalPathLib("/forward")]);
  });

  it("backward slash in PGM definition", async () => {
    const document = vscode.Uri.joinPath(WORKSPACE_URI, "baCK/TEst.cob");
    const result = await loadProcessorGroupCopybooksLibs(
      document,
      DEFAULT_DIALECT,
    );
    expect(result).toStrictEqual([new LocalPathLib("/back")]);
  });
});
