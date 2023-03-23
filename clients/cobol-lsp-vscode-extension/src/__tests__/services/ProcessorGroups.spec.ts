import { loadProcessorGroupCopybookPaths, loadProcessorGroupCopybookPathsConfig, loadProcessorGroupDialectConfig } from "../../services/ProcessorGroups";

const WORKSPACE = "/my/workspace";

jest.mock("fs", () => ({
    existsSync: jest.fn().mockReturnValue(true),
    readFileSync: jest.fn().mockImplementation(f => {
        if (f == "procCfgPath") {
            return `{
                "pgroups": [
                    { 
                        "name": "DAF", 
                        "preprocessor": [
                            "IDMS", 
                            { 
                                "name": "DaCo", 
                                "libs": ["/daco"]
                            }
                        ], 
                        "libs": ["/copy"] 
                    },
                    {
                        "name": "IDMSPG",
                        "preprocessor": [ "IDMS" ]
                    }
                ]
            }`;
        }
        if (f == "pgmCfgPath") {
            return `{
                "pgms": [ 
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
        parse: jest.fn(),
    },
    workspace: {
        getWorkspaceFolder: jest.fn().mockReturnValue({ uri: { fsPath: "file:///my/workspace" } }),
        workspaceFolders: [{ uri: { fsPath: "/my/workspace" } }],
    }
}));

jest.mock("path", () => ({
    basename: jest.fn().mockImplementation((name) => name),
    join: jest.fn()
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath")
        .mockReturnValueOnce("ignore").mockReturnValueOnce("procCfgPath").mockReturnValueOnce("pgmCfgPath"),
    Uri: {
        join: jest.fn().mockReturnValue("some path"),
    },
}));

it("Processor groups configuration provides lib path", () => {
    const item = {
        scopeUri: WORKSPACE + "/TEST.cob",
        section: "cpy-manager.paths-local",
    }
    const result = loadProcessorGroupCopybookPathsConfig(item, []);
    expect(result).toStrictEqual(["/copy"]);
});

it("Processor groups configuration provides dialect lib path", () => {
    const result = loadProcessorGroupCopybookPaths(WORKSPACE + "/TEST.cob", "DaCo");
    expect(result).toStrictEqual(["/daco"]);
});

it("Processor groups configuration matches program", () => {
    const item = {
        scopeUri: WORKSPACE + "/TEST.cob",
        section: "cobol-lsp.dialects",
    }
    const result = loadProcessorGroupDialectConfig(item, {});
    expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration matches program relative to workspace", () => {
    const item = {
        scopeUri: WORKSPACE + "/IDMS/TEST.cob",
        section: "cobol-lsp.dialects",
    }
    const result = loadProcessorGroupDialectConfig(item, {});
    expect(result).toStrictEqual(["IDMS"]);
});

it("Processor groups configuration matches program with *", () => {
    const item = {
        scopeUri: WORKSPACE + "/progDaF.cob",
        section: "cobol-lsp.dialects",
    }
    const result = loadProcessorGroupDialectConfig(item, {});
    expect(result).toStrictEqual(["IDMS", "DaCo"]);
});

it("Processor groups configuration mismatches program with *", () => {
    const item = {
        scopeUri: WORKSPACE + "/progDA.cob",
        section: "cobol-lsp.dialects",
    }
    const result = loadProcessorGroupDialectConfig(item, {});
    expect(result).toStrictEqual({});
});
