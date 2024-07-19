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
import SettingsUtils from "./util/SettingsUtils";
import { globSync } from "glob";
import { parse } from "../type/processorGroups";
import type { Pgroup, PgmConf, Pgm, ProcGrps } from "../type/processorGroups";
import { Uri } from "vscode";
import {
  backwardSlashRegex,
  cleanWorkspaceFolderName,
  normalizePath,
} from "./util/FSUtils";

interface NormalizedGroup {
  "compiler-options"?: string[];
  "copybook-extensions"?: string[];
  "copybook-file-encoding"?: string;
  libs?: string[];
  name: string;
  preprocessor: NormalizedPreprocessor[];
}

type NormalizedPreprocessor = SqlPreprocessor | GenericPrerocessor;
export type SQL_BACKEND = "DATACOM_SERVER" | "DB2";

interface SqlPreprocessor {
  name: 'SQL';
  libs: string[];
  ["target-sql-backend"]: SQL_BACKEND;

}
interface GenericPrerocessor {
  name: string;
  libs: string[];
}

export function isSqlPreprocessor(preprocessor: NormalizedPreprocessor): preprocessor is SqlPreprocessor {
  return preprocessor.name === "SQL";
}

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";

export function loadProcessorGroupCopybookPaths(
  documentUri: string,
  dialectType: string,
): string[] | Error {
  const pgroup = getProcessorGroup(documentUri);
  if (pgroup instanceof Error) {
    return pgroup;
  }
  if (dialectType === "COBOL") {
    return pgroup.libs || [];
  }
  const pr = pgroup.preprocessor.find((p) => p.name === dialectType);
  return pr?.libs || [];
}

export function loadProcessorGroupCopybookPathsConfig(
  item: { scopeUri: string },
  configObject: string[],
): string[] | Error {
  const pgroup = getProcessorGroup(item.scopeUri);
  if (pgroup instanceof Error) {
    return pgroup;
  }
  const libs = [...(pgroup.libs || []), ...configObject].map((l) =>
    l.replace(backwardSlashRegex, "/"),
  );
  return SettingsUtils.getWorkspaceFoldersFsPath()
    .map(cleanWorkspaceFolderName)
    .flatMap((p) => globSync(libs, { cwd: p }))
    .map(normalizePath);
}

export function loadProcessorGroupCopybookExtensionsConfig(
  item: { scopeUri: string },
  configObject: string[],
): string[] {
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

function matchProcessorGroup(
  pgms: Pgm[],
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
  for (const v of pgms) {
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

export function getProcessorGroup(documentUri: string): NormalizedGroup | Error {
  const documentPath = Uri.parse(documentUri).fsPath;
  const ws = SettingsUtils.getWorkspaceFoldersFsPath();
  if (ws.length < 1) {
    return undefined;
  }
  const cfgPath = path.join(ws[0], PROCESSOR_GROUP_FOLDER);

  const pgmConfPath = path.join(cfgPath, PROCESSOR_GROUP_PGM);
  let pgmConfJson: string;
  try {
    pgmConfJson = fs.readFileSync(pgmConfPath).toString();
  } catch (e) {
    return Error(`Program config file not found ${pgmConfPath}`);
  }
  let pgmConf: PgmConf;
  try {
    pgmConf = parse.toPgmConf(pgmConfJson);
  } catch (e) {
    const er = e as Error;
    return Error(
      `Program config file ${pgmConfPath} does not match required schema: ${er.message}`,
    );
  }
  if (pgmConf instanceof Error) {
    return pgmConf;
  }
  const name = matchProcessorGroup(pgmConf.pgms, documentPath, ws[0]);
  if (name === undefined) {
    return Error(`No matching program definition found for ${documentPath}`);
  }

  const procGrpsPath = path.join(cfgPath, PROCESSOR_GROUP_PROC);
  let procGrpsJson: string;
  try {
    procGrpsJson = fs.readFileSync(procGrpsPath).toString();
  } catch (e) {
    return Error(`Processor groups file ${procGrpsPath} not found`);
  }
  let procGrps: ProcGrps;
  try {
    procGrps = parse.toProcGrps(procGrpsJson);
  } catch (e) {
    const er = e as Error;
    return Error(
      `Processor groups file ${procGrpsPath} does not match required schema: ${er.message}`,
    );
  }
  if (procGrps instanceof Error) {
    return procGrps;
  }
  const pgroup = procGrps.pgroups.find((p) => p.name === name);
  if (pgroup === undefined) {
    return Error(`No matching processor group found for ${documentPath}`);
  }

  let npr: NormalizedPreprocessor[] = [];
  const pr = pgroup.preprocessor;
  if (pr === undefined) {
    npr = [];
  } else if (typeof pr === "string") {
    npr = [{ name: pr, libs: [] }];
  } else if (!Array.isArray(pr)) {
    npr = [
      {
        name: pr.name,
        libs: pr.libs || [],
      },
    ];
  } else {
    npr = pr.map((p) =>
      typeof p === "string"
        ? { name: p, libs: [] }
        : { name: p.name, libs: p.libs || [] },
    );
  }

  return {
    "compiler-options": pgroup["compiler-options"],
    "copybook-extensions": pgroup["copybook-extensions"],
    "copybook-file-encoding": pgroup["copybook-file-encoding"],
    name: pgroup.name,
    libs: pgroup.libs,
    preprocessor: npr.filter((p) => p.name != "SQL"), // "SQL" is not a real dialect, we will use it only to set up sql backend for now
  };
}
