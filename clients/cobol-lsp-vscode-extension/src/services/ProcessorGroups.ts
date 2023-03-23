import * as fs from "fs";
import * as path from "path";
import { Minimatch } from "minimatch";
import { SETTINGS_DIALECT } from "../constants";
import { SettingsUtils } from "./util/SettingsUtils";

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";


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
    if (!documentPath.startsWith(workspacePath)) {
        return undefined;
    }
    let relativeDocPath = documentPath.substring(workspacePath.length);
    if (relativeDocPath.startsWith("/")) {
        relativeDocPath = relativeDocPath.substring(1);
    }

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

function loadProcessorsConfig(documentPath: string): ProcessorConfig | undefined {
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

export function loadProcessorGroupCopybookPaths(documentPath: string, dialectType: string): string[] {
    const pgCfg = loadProcessorsConfig(documentPath);
    if (pgCfg == undefined) {
        return [];
    }

    if (dialectType && dialectType != 'COBOL') {
        for (const pp of pgCfg.preprocessor) {
            if (pp && typeof pp === 'object' && pp['name'] === dialectType && pp['libs']) {
                return pp['libs'];
            }
        }
    } else {
        if (pgCfg.libs) {
            return pgCfg.libs;
        }
    }

    return [];
}

export function loadProcessorGroupCopybookPathsConfig(item: { scopeUri: string, section: any }, configObject: unknown): unknown {
    if (!item.scopeUri) {
        return configObject;
    }
    try {
        const programName = path.basename(item.scopeUri);
        const pgCfg = loadProcessorsConfig(programName);
        if (pgCfg === undefined) {
            return configObject;
        }
        return [...pgCfg.libs, ...configObject as []] || configObject;
    } catch (e) {
        console.error(JSON.stringify(e));
        return configObject;
    }
}

export function loadProcessorGroupDialectConfig(item: { scopeUri: string, section: any }, configObject: unknown): unknown {
    if (!item.scopeUri) {
        return configObject;
    }
    try {
        const programName = path.basename(item.scopeUri);
        const pgCfg = loadProcessorsConfig(programName);
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