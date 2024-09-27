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
import { globSync } from "glob";
import { Uri, workspace } from "vscode";
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

  const wsUri = workspace.getWorkspaceFolder(Uri.parse(item.scopeUri))?.uri;
  if (wsUri === undefined) {
    return configObject;
  }
  const globs = globSync(
    config.map((ele) => ele.replace(backwardSlashRegex, "/")),
    { cwd: cleanWorkspaceFolderName(wsUri.fsPath), absolute: true },
  ).map((s) => normalizePath(s));
  return globs;
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
      await readProcessorGroupsFileContent(Uri.parse(item.scopeUri)),
      await readProgramConfigFileContent(Uri.parse(item.scopeUri)),
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
  documentUri: Uri,
  workspaceUri: Uri,
): string | undefined {
  const relativeDocPath = path.relative(
    workspaceUri.fsPath,
    documentUri.fsPath,
  );
  const candidates: string[] = [];
  for (const v of pgmCfg.pgms) {
    // exact match
    if (path.isAbsolute(v.program)) {
      if (pathMatches(v.program, documentUri.fsPath)) {
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
  return (
    program === documentPath ||
    (path.sep === "/"
      ? program.split("\\").join(path.sep) === documentPath
      : program.split("/").join(path.sep).toUpperCase() ===
        documentPath.toUpperCase())
  );
}

export const loadProcessorsConfigForDocument = (
  documentUriString: string,
  pgroups: ProcessorGroup[],
  pgmCfg: ProgramsConfig,
  b4g: B4GTypeMetadata | undefined,
): ProcessorGroup | undefined => {
  if (pgroups.length === 0) {
    return undefined;
  }
  const documentUri = Uri.parse(documentUriString);
  const wsUri = workspace.getWorkspaceFolder(documentUri)?.uri;
  if (wsUri === undefined) {
    return undefined;
  }
  const pgroup = selectProcessorGroup(pgmCfg, documentUri, wsUri, b4g);
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
  documentUri: Uri,
  workspaceUri: Uri,
  b4g: B4GTypeMetadata | undefined,
): string | undefined {
  if (b4g === undefined) {
    return matchProcessorGroup(pgmCfg, documentUri, workspaceUri);
  }
  const selectedElement = b4g.fileExtension
    ? path.basename(documentUri.fsPath, "." + b4g.fileExtension)
    : path.basename(documentUri.fsPath);
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
    await readProcessorGroupsFileContent(Uri.parse(documentUri)),
    await readProgramConfigFileContent(Uri.parse(documentUri)),
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
