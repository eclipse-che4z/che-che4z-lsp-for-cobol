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
import { DialectsConfiguration } from "./Settings";
import { loadBridgeJsonContent } from "./BridgeForGitLoader";
import {
  clearWorkspaceConfigCache,
  ProcessorGroupProperties,
  readEndevorConfig,
  readWorkspaceConfig,
  ProcessorGroup,
  WorkspaceConfig,
  readSettingConfig,
} from "./ProcessorGroupsLoader";
import { DEFAULT_DIALECT } from "../constants";
import { getVariablesFromUri } from "./util/FSUtils";
import { clearDiagnostics } from "./ExternalAPIsService";

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

export async function loadProcessorGroupCopybookExtensionsConfig(
  documentUri: Uri,
  dialect: string,
  configObject: string[],
): Promise<string[]> {
  return loadProcessorGroupSettings(
    documentUri,
    "copybook-extensions",
    configObject,
    dialect,
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
  const pgCfg = await loadProcessorGroup(item.scopeUri);
  if (!pgCfg.preprocessors) {
    return dialectConfig;
  }

  const dialects = pgCfg.preprocessors.map((p) => p.name);

  // "SQL" is not a real dialect, we will use it only to set up sql backend for now
  const result = dialects.filter((name) => name !== "SQL");
  return result.length > 0 ? result : dialectConfig;
}

function matchProcessorGroup(wsCfg: WorkspaceConfig, documentUri: Uri) {
  const relativeDocPath = toForwardSlashUppercase(
    workspace.asRelativePath(documentUri, false),
  );
  const candidates: ProcessorGroup[] = [];
  for (const programConfig of wsCfg.programs) {
    const programDefinition = toForwardSlashUppercase(programConfig.program);
    // exact match
    if (path.isAbsolute(programConfig.program)) {
      if (programDefinition === toForwardSlashUppercase(documentUri.fsPath)) {
        return programConfig.processorGroup;
      }
    }

    const m = new Minimatch(programDefinition, {
      nocase: true,
      dot: true,
    });
    if (m.match(relativeDocPath)) {
      candidates.push(programConfig.processorGroup);
    }
  }
  if (candidates.length === 0) {
    return undefined;
  }
  return candidates[0];
}

function toForwardSlashUppercase(path: string): string {
  return path.split("\\").join("/").toUpperCase();
}

export async function loadProcessorGroup(documentUri: Uri) {
  let workspaceConfig = await readEndevorConfig(documentUri);

  if (!workspaceConfig) {
    const workspaceUri = workspace.getWorkspaceFolder(documentUri)?.uri;
    if (workspaceUri) {
      workspaceConfig = await readWorkspaceConfig(workspaceUri);
    }
  }

  if (workspaceConfig) {
    const b4gPGName = await getB4GProcessorGroupName(documentUri);
    if (b4gPGName) {
      return workspaceConfig.processorGroups[b4gPGName];
    }

    const matchedGroup = matchProcessorGroup(workspaceConfig, documentUri);
    if (matchedGroup) {
      return matchedGroup;
    }
  }

  return readSettingConfig(DEFAULT_DIALECT);
}

async function getB4GProcessorGroupName(documentUri: Uri) {
  const b4gConfig = await loadBridgeJsonContent(documentUri);
  if (b4gConfig) {
    const { filename, extension } = getVariablesFromUri(documentUri, false);
    if (
      !b4gConfig.fileExtension ||
      `.${b4gConfig.fileExtension}` === extension
    ) {
      const b4gElement = b4gConfig.elements[filename];
      if (b4gElement) {
        return b4gElement.processorGroup;
      }
    }
    return b4gConfig.defaultProcessorGroup;
  }
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
  if (!processorGroup) {
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

export function setUpProgramConfigWatcher(fn: () => unknown) {
  const handler = () => {
    clearWorkspaceConfigCache();
    clearDiagnostics();
    fn();
  };
  const watcher = workspace.createFileSystemWatcher("**/pgm_conf.json");
  watcher.onDidChange((_uri) => handler());
  watcher.onDidDelete((_uri) => handler());
  watcher.onDidCreate((_uri) => handler());
  return watcher;
}

export function setUpProcessorGroupConfigWatcher(fn: () => unknown) {
  const handler = () => {
    clearWorkspaceConfigCache();
    clearDiagnostics();
    fn();
  };
  const watcher = workspace.createFileSystemWatcher("**/proc_grps.json");
  watcher.onDidChange((_uri) => handler());
  watcher.onDidDelete((_uri) => handler());
  watcher.onDidCreate((_uri) => handler());
  return watcher;
}
