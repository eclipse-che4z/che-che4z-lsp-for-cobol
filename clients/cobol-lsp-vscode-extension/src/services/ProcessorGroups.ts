import * as fs from "fs";
import * as path from "path";
import { Minimatch } from "minimatch";
import { SettingsUtils } from "./util/SettingsUtils";
import { Uri } from "vscode";

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";

export function loadProcessorGroupCopybookPaths(documentUri: string, dialectType: string): string[] {
    return loadProcessorGroupSettings(documentUri, "libs", [] as string[], dialectType);
}

export function loadProcessorGroupCopybookPathsConfig(item: { scopeUri: string }, configObject: string[]): string [] {
    return [...loadProcessorGroupSettings(item.scopeUri, "libs", [] as string[]), ...configObject];
}

export function loadProcessorGroupCopybookExtensionsConfig(item: { scopeUri: string }, configObject: string[]): string[] {
    return loadProcessorGroupSettings(item.scopeUri, "copybook-extensions", configObject);
}

export function loadProcessorGroupCopybookEncodingConfig(item: { scopeUri: string }, configObject: string): string {
    return loadProcessorGroupSettings(item.scopeUri, "copybook-file-encoding", configObject);
}

export function loadProcessorGroupDialectConfig(item: { scopeUri: string, section: string }, configObject: unknown): unknown {
    try {
        const pgCfg = loadProcessorsConfig(item.scopeUri);
        if (pgCfg === undefined) {
            return configObject;
        }
        const dialects: Preprocessor[] = [];
        if (!Array.isArray(pgCfg.preprocessor)) {
            dialects.push(pgCfg.preprocessor);
        } else {
            for (const pp of pgCfg.preprocessor) {
                if (typeof pp === 'object' && pp) {
                    dialects.push(pp["name"]);
                }
                if (typeof pp === 'string' && pp) {
                    dialects.push(pp);
                }
            }
        }

        return dialects || configObject;
    } catch (e) {
        console.error(JSON.stringify(e));
        return configObject;
    }
}


type ProgramsConfig = {
    pgms: {
        program: string;
        pgroup: string;
    }[]
}

type Preprocessor = string | string[];

type ProcessorConfig = {
    name: string;
    libs: string[];
    preprocessor: Preprocessor[]
};

type ProcessorsConfig = {
    pgroups: ProcessorConfig[];
}

function matchProcessorGroup(pgmCfg: ProgramsConfig, documentPath: string, workspacePath: string): string | undefined {
    documentPath = path.sep === "/" ? documentPath.replace("\\", path.sep) :  documentPath.replace("/", path.sep);
    workspacePath = path.sep === "/" ? workspacePath.replace("\\", path.sep) :  workspacePath.replace("/", path.sep);
    const relativeDocPath = path.relative(workspacePath, documentPath);

    const candidates = [];
    let result = undefined;
    pgmCfg.pgms.forEach(v => {
        // exact match
        if (relativeDocPath.endsWith(v.program)) {
            result = v.pgroup
            return;
        }
        const m = new Minimatch(v.program, { nocase: true });
        if (m.match(relativeDocPath)) {
            candidates.push(v.pgroup);
        }
    });
    if (!result) {
        if (candidates.length === 0) {
            return undefined;
        }
        result = candidates[0];
    }
    return result;
}

function loadProcessorsConfig(documentUri: string): ProcessorConfig | undefined {
    const documentPath = Uri.parse(documentUri).fsPath;
    const ws = SettingsUtils.getWorkspaceFoldersPath(true);
    if (ws.length < 1) {
        return undefined;
    }
    const cfgPath = path.join(ws[0], PROCESSOR_GROUP_FOLDER);
    const procCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PROC);
    const pgmCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PGM);
    if (!fs.existsSync(pgmCfgPath) || !fs.existsSync(procCfgPath)) {
        return undefined;
    }
    const procCfg: ProcessorsConfig = JSON.parse(fs.readFileSync(procCfgPath).toString());
    const pgmCfg: ProgramsConfig = JSON.parse(fs.readFileSync(pgmCfgPath).toString());
    const pgroup = matchProcessorGroup(pgmCfg, documentPath, ws[0]);

    let result = undefined;
    procCfg.pgroups.forEach(p => {
        if (pgroup == p.name) {
            result = p;
            return;
        }
    });
    return result;
}

function loadProcessorGroupSettings<T>(scopeUri: string, atrtibute: string, configObject: T, dialect: string = "COBOL"): T | undefined {
    try {
        const pgCfg = loadProcessorsConfig(scopeUri);
        if (pgCfg == undefined) {
            return configObject;
        }

        if (dialect && dialect !== 'COBOL') {
            for (const pp of pgCfg.preprocessor) {
                if (pp && typeof pp === 'object' && pp['name'] === dialect && pp[atrtibute]) {
                    return pp[atrtibute];
                }
            }
        } else {
            if (pgCfg[atrtibute]) {
                return pgCfg[atrtibute];
            }
        }

        return configObject;
    } catch (e) {
        console.error(JSON.stringify(e));
        return configObject;
    }
}