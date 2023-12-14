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
  cleanWorkspaceFolder,
  normalizePath,
} from "./util/FSUtils";

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";

export function loadProcessorGroupCopybookPaths(
  documentUri: string,
  dialectType: string,
): string[] {
  return loadProcessorGroupSettings(
    documentUri,
    "libs",
    [] as string[],
    dialectType,
  );
}

export function loadProcessorGroupCopybookPathsConfig(
  item: { scopeUri: string },
  configObject: string[],
): string[] {
  const config = [
    ...loadProcessorGroupSettings(item.scopeUri, "libs", [] as string[]),
    ...configObject,
  ];
  return SettingsUtils.getWorkspaceFoldersPath(true)
    .map((folder) =>
      globSync(
        config.map((ele) => ele.replace(backwardSlashRegex, "/")),
        { cwd: cleanWorkspaceFolder(folder) },
      ).map((s) => normalizePath(s)),
    )
    .reduce((acc, curVal) => {
      return acc.concat(curVal);
    }, []);
}

export function loadProcessorGroupCopybookExtensionsConfig(
  item: { scopeUri: string },
  configObject: string[],
): string[] {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "copybook-extensions",
    configObject,
  );
}

export function loadProcessorGroupCopybookEncodingConfig(
  item: { scopeUri: string },
  configObject: string,
): string {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "copybook-file-encoding",
    configObject,
  );
}

export function loadProcessorGroupCompileOptionsConfig(
  item: { scopeUri: string },
  configObject: string,
): string {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "compiler-options",
    configObject,
  );
}

export function loadProcessorGroupSqlBackendConfig(
  item: { scopeUri: string },
  configObject: string,
): string {
  return loadProcessorGroupSettings(
    item.scopeUri,
    "target-sql-backend",
    configObject,
    "SQL",
  );
}

export function loadProcessorGroupDialectConfig(
  item: { scopeUri: string; section: string },
  configObject: unknown,
): unknown {
  try {
    const pgCfg = loadProcessorsConfig(item.scopeUri);
    if (pgCfg === undefined) {
      return configObject;
    }
    const dialects: Preprocessor[] = [];
    if (!Array.isArray(pgCfg.preprocessor)) {
      dialects.push(pgCfg.preprocessor);
    } else {
      for (const pp of pgCfg.preprocessor as Preprocessor) {
        if (typeof pp === "object" && pp) {
          dialects.push(pp["name"]);
        }
        if (typeof pp === "string" && pp) {
          dialects.push(pp);
        }
      }
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
  libs: string[];
  preprocessor: Preprocessor[];
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

function loadProcessorsConfig(
  documentUri: string,
): ProcessorConfig | undefined {
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
  const procCfg: ProcessorsConfig = JSON.parse(
    fs.readFileSync(procCfgPath).toString(),
  );
  const pgmCfg: ProgramsConfig = JSON.parse(
    fs.readFileSync(pgmCfgPath).toString(),
  );
  const pgroup = matchProcessorGroup(pgmCfg, documentPath, ws[0]);

  let result;
  procCfg.pgroups.forEach((p) => {
    if (pgroup === p.name) {
      result = p;
      return;
    }
  });
  return result;
}

function loadProcessorGroupSettings<T>(
  scopeUri: string,
  atrtibute: string,
  configObject: T,
  dialect: string = "COBOL",
): T {
  try {
    const pgCfg: ProcessorConfig | undefined = loadProcessorsConfig(scopeUri);
    if (pgCfg === undefined) {
      return configObject;
    }

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
