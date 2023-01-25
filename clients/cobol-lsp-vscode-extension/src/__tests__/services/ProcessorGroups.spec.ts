import { loadProcessorGroupConfig } from "../../services/ProcessorGroups";

jest.mock("fs", () => ({
    existsSync: jest.fn().mockReturnValue(true),
    readFileSync: jest.fn().mockImplementation(f => {
        if (f == "procCfgPath") {
            return "{\"pgroups\": [ { \"name\": \"DAF\", \"preprocessor\": [\"IDMS\", \"DaCo\"] }]}";
        }
        if (f == "pgmCfgPath") {
            return "{\"pgms\": [ { \"program\": \"TEST\", \"pgroup\": \"DAF\" }]}";
        }
        return undefined;
    }),
}));
jest.mock("vscode", () => ({
    Uri: {
        parse: jest.fn(),
    },
    workspace: {
        getWorkspaceFolder: jest.fn().mockReturnValue({uri: {fsPath: "some path"}}),
        workspaceFolders: [{uri: {fsPath: "some path"}}],
    }
}));
jest.mock("path", () => ({
    basename: jest.fn().mockReturnValue("TEST"),
    join: jest.fn().mockReturnValueOnce("ignore")
        .mockReturnValueOnce("procCfgPath")
        .mockReturnValueOnce("pgmCfgPath"),
    Uri: {
        join: jest.fn().mockReturnValue("some path"),
    },
}));

it("Processor groups configuration matches program", () => {
    const item = {
        scopeUri: "prog.cob",
        section: "cobol-lsp.dialects",
    }
    const result = loadProcessorGroupConfig(item, {});
    expect(result).toStrictEqual(["IDMS", "DaCo"]);
});