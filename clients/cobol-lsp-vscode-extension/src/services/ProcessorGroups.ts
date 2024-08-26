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

import * as fs from "fs";
import * as path from "path";
import { Minimatch } from "minimatch";
import { SettingsUtils } from "./util/SettingsUtils";
import { globSync } from "glob";
import { Uri } from "vscode";
import {
  backwardSlashRegex,
  cleanWorkspaceFolderName,
  getVariablesFromUri,
  normalizePath,
} from "./util/FSUtils";
import { SettingsService } from "./Settings";
import {
  B4GTypeMetadata,
  decodeBridgeJson,
  loadBridgeJsonContent,
} from "./BridgeForGit";

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";

export async function loadProcessorGroupCopybookPaths(
  documentUri: string,
  dialectType: string,
): Promise<string[]> {
  return loadProcessorGroupSettings(
    documentUri,
    "libs",
    [] as string[],
    dialectType,
  );
}

export async function loadProcessorGroupCopybookPathsConfig(
  item: { scopeUri: string },
  configObject: string[],
): Promise<string[]> {
  const cfg = await loadProcessorGroupSettings(
    item.scopeUri,
    "libs",
    [] as string[],
  );
  const config = SettingsService.evaluateVariables(
    [...cfg, ...configObject],
    getVariablesFromUri(item.scopeUri, false),
  );
  return SettingsUtils.getWorkspaceFoldersPath(true)
    .map((folder) =>
      globSync(
        config.map((ele) => ele.replace(backwardSlashRegex, "/")),
        { cwd: cleanWorkspaceFolderName(folder), absolute: true },
      ).map((s) => normalizePath(s)),
    )
    .reduce((acc, curVal) => {
      return acc.concat(curVal);
    }, []);
}

export async function loadProcessorGroupCopybookExtensionsConfig(
  item: { scopeUri: string },
  configObject: string[],
): Promise<string[]> {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "copybook-extensions",
    configObject,
  );
}

export async function loadProcessorGroupCopybookEncodingConfig(
  item: { scopeUri: string },
  configObject: string,
): Promise<string> {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "copybook-file-encoding",
    configObject,
  );
}

export async function loadProcessorGroupCompileOptionsConfig(
  item: { scopeUri: string },
  configObject: string,
): Promise<string> {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "compiler-options",
    configObject,
  );
}

export async function loadProcessorGroupSqlBackendConfig(
  item: { scopeUri: string },
  configObject: string,
): Promise<string> {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "target-sql-backend",
    configObject,
    "SQL",
  );
}

export async function loadProcessorGroupDialectConfig(
  item: { scopeUri: string; section: string },
  configObject: unknown,
): Promise<unknown> {
  try {
    const pgCfg = loadProcessorsConfigForDocument(
      item.scopeUri,
      readProcessorGroupsFileContent(),
      readProgramConfigFileContent(),
      decodeBridgeJson(await loadBridgeJsonContent(Uri.parse(item.scopeUri))),
    );
    if (pgCfg === undefined) {
      return configObject;
    }
    const dialects: Preprocessor[] = [];

    if (Array.isArray(pgCfg.preprocessor)) {
      for (const pp of pgCfg.preprocessor as Preprocessor) {
        if (typeof pp === "object" && pp) {
          dialects.push(pp["name"]);
        }
        if (typeof pp === "string" && pp) {
          dialects.push(pp);
        }
      }
    } else if (pgCfg.preprocessor !== undefined) {
      dialects.push(pgCfg.preprocessor);
    }

    // "SQL" is not a real dialect, we will use it only to set up sql backend for now
    return dialects.filter((name) => name != "SQL") || configObject;
  } catch (e) {
    console.error(JSON.stringify(e));
    return configObject;
  }
}

type ProgramsConfig = {
  pgms: {
    program: string;
    pgroup: string;
  }[];
};

type Preprocessor = string | string[];

type ProcessorConfig = {
  name: string;
  libs?: string[];
  preprocessor?: Preprocessor[];
};

type ProcessorsConfig = {
  pgroups: ProcessorConfig[];
};

function matchProcessorGroup(
  pgmCfg: ProgramsConfig,
  documentPath: string,
  workspacePath: string,
): string | undefined {
  documentPath =
    path.sep === "/"
      ? documentPath.replace("\\", path.sep)
      : documentPath.replace("/", path.sep);
  workspacePath =
    path.sep === "/"
      ? workspacePath.replace("\\", path.sep)
      : workspacePath.replace("/", path.sep);
  const relativeDocPath = path.relative(workspacePath, documentPath);

  const candidates: string[] = [];
  for (const v of pgmCfg.pgms) {
    // exact match
    if (path.isAbsolute(v.program)) {
      if (pathMatches(v.program, documentPath)) {
        return v.pgroup;
      }
    } else {
      if (relativeDocPath === v.program) {
        candidates.push(v.pgroup);
      }
    }

    const m = new Minimatch(v.program, { nocase: true, dot: true });
    if (m.match(relativeDocPath)) {
      candidates.push(v.pgroup);
    }
  }
  if (candidates.length === 0) {
    return undefined;
  }
  return candidates[0];
}

function pathMatches(program: string, documentPath: string) {
  return path.sep === "/"
    ? program.split("\\").join(path.sep) === documentPath
    : program.split("/").join(path.sep).toUpperCase() ===
        documentPath.toUpperCase();
}

const loadProcessorConfigurations = (
  processorsJsonContent: string,
): ProcessorConfig[] => {
  const procCfg: ProcessorsConfig = JSON.parse(processorsJsonContent);
  return procCfg.pgroups;
};

export function readProcessorGroupsFileContent(): ProcessorConfig[] {
  const ws = SettingsUtils.getWorkspaceFoldersPath(true);
  if (ws.length < 1) {
    return [];
  }
  const cfgPath = path.join(ws[0], PROCESSOR_GROUP_FOLDER);
  const procCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PROC);
  if (!fs.existsSync(procCfgPath)) {
    return [];
  }
  try {
    return JSON.parse(fs.readFileSync(procCfgPath).toString()).pgroups;
  } catch (e) {
    console.error(e);
    return [];
  }
}

export const readProgramConfigFileContent = (): ProgramsConfig => {
  const EMPTY = { pgms: [] };
  const ws = SettingsUtils.getWorkspaceFoldersPath(true);
  if (ws.length < 1) {
    return EMPTY;
  }
  const cfgPath = path.join(ws[0], PROCESSOR_GROUP_FOLDER);
  const pgmCfgPath = path.join(cfgPath, PROCESSOR_GROUP_PGM);
  if (!fs.existsSync(pgmCfgPath)) {
    return EMPTY;
  }
  try {
    return JSON.parse(fs.readFileSync(pgmCfgPath).toString());
  } catch (e) {
    console.error(e);
    return EMPTY;
  }
};

export const loadProcessorsConfigForDocument = (
  documentUri: string,
  pgroups: ProcessorConfig[],
  pgmCfg: ProgramsConfig,
  b4g: B4GTypeMetadata | undefined,
): ProcessorConfig | undefined => {
  if (pgroups.length === 0) {
    return undefined;
  }
  const documentPath = Uri.parse(documentUri).fsPath;
  const ws = SettingsUtils.getWorkspaceFoldersPath(true);
  if (ws.length < 1) {
    return undefined;
  }
  const pgroup = selectProcessorGroup(pgmCfg, documentPath, ws[0], b4g);

  let result;
  pgroups.forEach((p) => {
    if (pgroup === p.name) {
      result = p;
      return;
    }
  });
  return result;
};

function selectProcessorGroup(
  pgmCfg: ProgramsConfig,
  documentPath: string,
  workspacePath: string,
  b4g: B4GTypeMetadata | undefined,
): string | undefined {
  if (b4g === undefined) {
    return matchProcessorGroup(pgmCfg, documentPath, workspacePath);
  }
  const selectedElement = b4g.fileExtension
    ? path.basename(documentPath, "." + b4g.fileExtension)
    : path.basename(documentPath);
  return b4g.elements[selectedElement] === undefined
    ? b4g.defaultProcessorGroup
    : b4g.elements[selectedElement].processorGroup;
}

async function loadProcessorGroupSettings<T>(
  documentUri: string,
  atrtibute: string,
  configObject: T,
  dialect: string = "COBOL",
): Promise<T> {
  const pgCfg: ProcessorConfig | undefined = loadProcessorsConfigForDocument(
    documentUri,
    readProcessorGroupsFileContent(),
    readProgramConfigFileContent(),
    decodeBridgeJson(await loadBridgeJsonContent(Uri.parse(documentUri))),
  );
  if (pgCfg === undefined) {
    return configObject;
  }
  try {
    if (dialect && dialect !== "COBOL") {
      for (const pp of pgCfg.preprocessor as Preprocessor) {
        if (
          pp &&
          typeof pp === "object" &&
          pp["name"] === dialect &&
          pp[atrtibute]
        ) {
          return pp[atrtibute];
        }
      }
    } else {
      if (pgCfg[atrtibute as keyof ProcessorConfig]) {
        return pgCfg[atrtibute as keyof ProcessorConfig] as T;
      }
    }

    return configObject;
  } catch (e) {
    console.error(JSON.stringify(e));
    return configObject;
  }
}
