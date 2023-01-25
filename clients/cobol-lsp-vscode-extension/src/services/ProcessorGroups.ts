import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";
import { SETTINGS_DIALECT } from "../constants";

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

type ProcessorsConfig = {
    pgroups: {
        name: string;
        preprocessor: Preprocessor[]
    }[];
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
        const cfgPath = path.join(vscode.workspace.getWorkspaceFolder(vscode.Uri.parse(item.scopeUri)).uri.fsPath, PROCESSOR_GROUP_FOLDER);
        const procCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PROC);
        const pgmCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PGM);
        if (!fs.existsSync(pgmCfgPath) || !fs.existsSync(procCfgPath)) {
            return configObject;
        }
        const procCfg: ProcessorsConfig = JSON.parse(fs.readFileSync(procCfgPath).toString());
        const pgmCfg: ProgramsConfig = JSON.parse(fs.readFileSync(pgmCfgPath).toString());

        let pgroup: string | undefined;
        pgmCfg.pgms.forEach(v => {
            if (v.program === programName) {
                pgroup = v.pgroup
            }
        });

        if(!pgroup) {
            return configObject;
        }

        let dialects: Preprocessor[] | undefined;
        procCfg.pgroups.forEach(p => {
            if(pgroup == p.name) {
                dialects = Array.isArray(p.preprocessor) ? p.preprocessor :  [p.preprocessor];
            }
        });

        return dialects || configObject;
    } catch (e) {
        console.error(JSON.stringify(e));
        return configObject;
    }
}