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
} from "./BridgeForGitLoader";
import {
  Preprocessor,
  ProcessorGroup,
  ProgramsConfig,
  readProcessorGroupsFileContent,
  readProgramConfigFileContent,
} from "./ProcessorGroupsLoader";

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
    if (pgCfg === undefined || pgCfg.preprocessor == undefined) {
      return configObject;
    }

    const dialects: Preprocessor[] = [];

    const preprocessors = Array.isArray(pgCfg.preprocessor)
      ? pgCfg.preprocessor
      : [pgCfg.preprocessor];
    for (const pp of preprocessors) {
      if (typeof pp === "object" && pp) {
        dialects.push(pp["name"]);
      }
      if (typeof pp === "string" && pp) {
        dialects.push(pp);
      }
    }

    // "SQL" is not a real dialect, we will use it only to set up sql backend for now
    const result = dialects.filter((name) => name != "SQL");
    return result.length > 0 ? result : configObject;
  } catch (e) {
    console.error(JSON.stringify(e));
    return configObject;
  }
}

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

export const loadProcessorsConfigForDocument = (
  documentUri: string,
  pgroups: ProcessorGroup[],
  pgmCfg: ProgramsConfig,
  b4g: B4GTypeMetadata | undefined,
): ProcessorGroup | undefined => {
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

async function loadProcessorGroupSettings<T extends string | string[]>(
  documentUri: string,
  atrtibute:
    | "libs"
    | "name"
    | "target-sql-backend"
    | "compiler-options"
    | "copybook-file-encoding"
    | "copybook-extensions",
  configObject: T,
  dialect: string = "COBOL",
): Promise<T> {
  const pgCfg: ProcessorGroup | undefined = loadProcessorsConfigForDocument(
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
      for (const pp of pgCfg.preprocessor as Preprocessor[]) {
        if (
          pp &&
          typeof pp === "object" &&
          pp["name"] === dialect &&
          pp[atrtibute] !== undefined
        ) {
          return pp[atrtibute] as T;
        }
      }
    } else {
      if (pgCfg[atrtibute] !== undefined) {
        return pgCfg[atrtibute] as T;
      }
    }

    return configObject;
  } catch (e) {
    console.error(JSON.stringify(e));
    return configObject;
  }
}
