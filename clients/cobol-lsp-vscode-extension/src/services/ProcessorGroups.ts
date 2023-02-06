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

function loadProcessorsConfig(programName: string): ProcessorConfig | undefined {
    const ws = SettingsUtils.getWorkspaceFoldersPath();
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
    let pgroup: string | undefined;

    const candidates = [];
    pgmCfg.pgms.forEach(v => {
        // exact match
        if (v.program === programName) {
            pgroup = v.pgroup
            return;
        }
        const m = new Minimatch(v.program, { nocase: true });
        if (m.match(programName)) {
            candidates.push(v.pgroup);
        }
    });
    if (!pgroup) {
        if (candidates.length === 0) {
            return undefined;
        }
        pgroup = candidates[0];
    }
    let result = undefined;
    procCfg.pgroups.forEach(p => {
        if (pgroup == p.name) {
            result = p;
            return;
        }
    });
    return result;
}

export function loadProcessorGroupCopybookPaths(cobolFileName: string, dialectType: string): string[] {
    const programName = cobolFileName.replace(/\.[^/.]+$/, "");
    const pgCfg = loadProcessorsConfig(programName);
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

export function loadProcessorGroupConfig(item: { scopeUri: string, section: any }, configObject: unknown): unknown {
    if (!item.scopeUri) {
        return configObject;
    }
    if (item.section !== SETTINGS_DIALECT) {
        return configObject;
    }
    try {
        const programName = path.basename(item.scopeUri.replace(/\.[^/.]+$/, ""));
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