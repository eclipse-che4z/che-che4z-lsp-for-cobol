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
import { Uri, workspace } from "vscode";
import { DialectsConfiguration, SettingsService } from "./Settings";
import { loadBridgeJsonContent } from "./BridgeForGitLoader";
import {
  clearWorkspaceConfigCache,
  EndevorConfigModel,
  ProcessorGroupProperties,
  readWorkspaceConfig,
  TransformedProcessorGroup,
  WorkspaceConfig,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
} from "./ProcessorGroupsLoader";
import { PATHS_LOCAL_KEY } from "../constants";

export async function loadProcessorGroupCopybookPaths(
  documentUri: Uri,
  dialectType: string,
): Promise<string[]> {
  return (
    await loadProcessorGroupSettings(documentUri, "libs", [], dialectType)
  ).filter((element) => typeof element == "string");
}

export async function loadProcessorGroupCopybooksLibs(
  documentUri: Uri,
  dialectType: string,
) {
  const libs = await loadProcessorGroupSettings(
    documentUri,
    "libs",
    [],
    dialectType,
  );

  return libs;
}

export type ProcessorGroupCopybookPathConfig =
  | Uri
  | ZoweDatasetConfigModel
  | ZoweUssConfigModel
  | EndevorConfigModel;

// export async function loadProcessorGroupCopybookPathsConfig(
//   documentUri: Uri,
//   dialect?: string,
// ): Promise<ProcessorGroupCopybookPathConfig[]> {
//   const allConfigs = await loadProcessorGroupSettings(
//     documentUri,
//     "libs",
//     [],
//     dialect,
//   );

//   const configs: ProcessorGroupCopybookPathConfig[] = [];
//   const variables = getVariablesFromUri(documentUri, false);

//   for (const config of allConfigs) {
//     if (typeof config === "string") {
//       const evaluatedPaths = SettingsService.evaluateVariables(
//         [config],
//         variables,
//       );

//       const searchUris = SettingsService.prepareLocalSearchUris(
//         evaluatedPaths,
//         workspace.workspaceFolders ?? [],
//       );

//       configs.push(...searchUris);
//     } else {
//       if (USS in config) {
//         config.uss = SettingsService.evaluateVariables(
//           [config.uss],
//           variables,
//         )[0];
//       }
//       configs.push(config);
//     }
//   }
//   return configs;
// }

export async function loadProcessorGroupCopybookExtensionsConfig(
  documentUri: Uri,
  configObject: string[],
): Promise<string[]> {
  return loadProcessorGroupSettings(
    documentUri,
    "copybook-extensions",
    configObject,
  );
}

export async function loadProcessorGroupCompileOptionsConfig(
  item: { scopeUri: Uri },
  configObject: string,
): Promise<string[]> {
  return loadProcessorGroupSettings(item.scopeUri, "compiler-options", [
    configObject,
  ]);
}

export async function loadProcessorGroupSqlBackendConfig(
  item: { scopeUri: Uri },
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
  item: { scopeUri: Uri },
  dialectConfig: DialectsConfiguration,
) {
  // try {
  const pgCfg = await loadProcessorGroup(item.scopeUri);
  if (pgCfg === undefined || pgCfg.preprocessors == undefined) {
    return dialectConfig;
  }

  const dialects = pgCfg.preprocessors.map((p) => p.name);

  // "SQL" is not a real dialect, we will use it only to set up sql backend for now
  const result = dialects.filter((name) => name != "SQL");
  return result.length > 0 ? result : dialectConfig;
  // } catch (e) {
  //   console.error(JSON.stringify(e));
  //   return dialectConfig;
  // }
}

function matchProcessorGroup(wsCfg: WorkspaceConfig, documentUri: Uri) {
  const relativeDocPath = workspace.asRelativePath(documentUri, false);

  const candidates: TransformedProcessorGroup[] = [];
  for (const programConfig of wsCfg.programs) {
    // exact match
    if (path.isAbsolute(programConfig.program)) {
      if (pathMatches(programConfig.program, documentUri.fsPath)) {
        return programConfig.processorGroup;
      }
    } else {
      if (relativeDocPath === programConfig.program) {
        candidates.push(programConfig.processorGroup);
      }
    }

    const m = new Minimatch(programConfig.program, { nocase: true, dot: true });
    if (m.match(relativeDocPath)) {
      candidates.push(programConfig.processorGroup);
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

// export const loadProcessorsConfigForDocument = (
//   documentUriString: string,
//   pgroups: ProcessorGroup[],
//   pgmCfg: ProgramsConfig,
//   b4g: B4GTypeMetadata | undefined,
// ): ProcessorGroup | undefined => {
//   if (pgroups.length === 0) {
//     return undefined;
//   }
//   const documentUri = Uri.parse(documentUriString);
//   const wsUri = workspace.getWorkspaceFolder(documentUri)?.uri;
//   if (wsUri === undefined) {
//     return undefined;
//   }
//   const pgroup = selectProcessorGroup(pgmCfg, documentUri, wsUri, b4g);
//   let result;
//   pgroups.forEach((p) => {
//     if (pgroup === p.name) {
//       result = p;
//       return;
//     }
//   });
//   return result;
// };

// function selectProcessorGroup(
//   wsCfg: WorkspaceConfig,
//   documentUri: Uri,
//   b4g: B4GTypeMetadata | undefined,
// ): TransformedProcessorGroup | undefined {
//   if (b4g === undefined) {
//     return matchProcessorGroup(wsCfg, documentUri);
//   }
//   const selectedElement = b4g.fileExtension
//     ? path.basename(documentUri.fsPath, "." + b4g.fileExtension)
//     : path.basename(documentUri.fsPath);
//   const processorGroupName =
//     b4g.elements[selectedElement] === undefined
//       ? b4g.defaultProcessorGroup
//       : b4g.elements[selectedElement].processorGroup;
//   return wsCfg.processorGroups[processorGroupName];
// }

// type AttributeTypes = {
//   libs: TransformedLibs[];
//   name: string;
//   "target-sql-backend": string;
//   "compiler-options": string;
//   "copybook-file-encoding": string;
//   "copybook-extensions": string[];
// };

async function loadProcessorGroup(documentUri: Uri) {
  const workspaceUri = workspace.getWorkspaceFolder(documentUri)?.uri;
  if (workspaceUri === undefined) {
    return undefined;
  }

  const workspaceConfig = await readWorkspaceConfig(workspaceUri);
  const b4gConfig = await loadBridgeJsonContent(documentUri);
  if (b4gConfig) {
    const selectedElement = b4gConfig.fileExtension
      ? path.basename(documentUri.fsPath, "." + b4gConfig.fileExtension)
      : path.basename(documentUri.fsPath);
    const processorGroupName =
      b4gConfig.elements[selectedElement] === undefined
        ? b4gConfig.defaultProcessorGroup
        : b4gConfig.elements[selectedElement].processorGroup;
    return workspaceConfig?.processorGroups[processorGroupName];
  }

  return matchProcessorGroup(workspaceConfig, documentUri);
  // const processorGroup = selectProcessorGroup(documentUri, workspaceConfig);

  // const workspaceProcessorGroups = await readWorkspaceProcessorGroups(wsUri)
}

async function loadProcessorGroupSettings<
  P extends keyof ProcessorGroupProperties,
>(
  documentUri: Uri,
  attribute: P,
  defaultValue: ProcessorGroupProperties[P],
  dialect: string = "COBOL",
) {
  const processorGroup = await loadProcessorGroup(documentUri);
  if (processorGroup === undefined) {
    return defaultValue;
  }

  if (dialect && dialect !== "COBOL" && processorGroup.preprocessors) {
    for (const preprocessor of processorGroup.preprocessors) {
      if (
        preprocessor.name === dialect &&
        preprocessor[attribute] !== undefined
      ) {
        return preprocessor[attribute];
      }
    }
  } else {
    if (processorGroup[attribute] !== undefined) {
      return processorGroup[attribute];
    }
  }

  return defaultValue;
}

export function setUpProgramConfigWatcher() {
  const watcher = workspace.createFileSystemWatcher("**/pgm_conf.json");
  watcher.onDidChange((_uri) => clearWorkspaceConfigCache());
  watcher.onDidDelete((_uri) => clearWorkspaceConfigCache());
  watcher.onDidCreate((_uri) => clearWorkspaceConfigCache());
  return watcher;
}

export function setUpProcessorGroupConfigWatcher() {
  const watcher = workspace.createFileSystemWatcher("**/proc_grps.json");
  watcher.onDidChange((_uri) => clearWorkspaceConfigCache());
  watcher.onDidDelete((_uri) => clearWorkspaceConfigCache());
  watcher.onDidCreate((_uri) => clearWorkspaceConfigCache());
  return watcher;
}
