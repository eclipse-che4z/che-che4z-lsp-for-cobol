import {
  loadProcessorGroupCopybookPaths,
  loadProcessorGroupCopybookPathsConfig,
  loadProcessorGroupDialectConfig,
} from "../../services/ProcessorGroups";

jest.mock("fs", () => ({
  existsSync: jest.fn().mockReturnValue(true),
  readFileSync: jest.fn().mockImplementation((f) => {
    if (f == "procCfgPath") {
      return '{"pgroups": [ { "name": "DAF", "preprocessor": ["IDMS", {"name":"DaCo", "libs":["/daco"]}], "libs":["/copy"] }]}';
    }
    if (f == "pgmCfgPath") {
      return '{"pgms": [ { "program": "TEST", "pgroup": "DAF" }, { "program": "*DAF", "pgroup": "DAF" }]}';
    }
    return undefined;
  }),
}));

jest.mock("vscode", () => ({
  Uri: {
    parse: jest.fn(),
  },
  workspace: {
    getWorkspaceFolder: jest
      .fn()
      .mockReturnValue({ uri: { fsPath: "some path" } }),
    workspaceFolders: [{ uri: { fsPath: "some path" } }],
  },
}));

jest.mock("path", () => ({
  basename: jest.fn().mockImplementation((name) => name),
  join: jest
    .fn()
    .mockReturnValueOnce("ignore")
    .mockReturnValueOnce("procCfgPath")
    .mockReturnValueOnce("pgmCfgPath")
    .mockReturnValueOnce("ignore")
    .mockReturnValueOnce("procCfgPath")
    .mockReturnValueOnce("pgmCfgPath")
    .mockReturnValueOnce("ignore")
    .mockReturnValueOnce("procCfgPath")
    .mockReturnValueOnce("pgmCfgPath")
    .mockReturnValueOnce("ignore")
    .mockReturnValueOnce("procCfgPath")
    .mockReturnValueOnce("pgmCfgPath")
    .mockReturnValueOnce("ignore")
    .mockReturnValueOnce("procCfgPath")
    .mockReturnValueOnce("pgmCfgPath"),
  Uri: {
    join: jest.fn().mockReturnValue("some path"),
  },
}));

it("Processor groups configuration provides lib path", () => {
  const item = {
    scopeUri: "TEST.cob",
    section: "cpy-manager.paths-local",
  };
  const result = loadProcessorGroupCopybookPathsConfig(item, []);
  expect(result).toStrictEqual(["/copy"]);
});

it("Processor groups configuration provides dialect lib path", () => {
  const result = loadProcessorGroupCopybookPaths("TEST.cob", "DaCo");
  expect(result).toStrictEqual(["/daco"]);
});

it("Processor groups configuration matches program", () => {
  const item = {
    scopeUri: "TEST.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration matches program with *", () => {
  const item = {
    scopeUri: "progDaF.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration mismatches program with *", () => {
  const item = {
    scopeUri: "progDA.cob",
    section: "cobol-lsp.dialects",
  };
  const result = loadProcessorGroupDialectConfig(item, {});
  expect(result).toStrictEqual({});
});
