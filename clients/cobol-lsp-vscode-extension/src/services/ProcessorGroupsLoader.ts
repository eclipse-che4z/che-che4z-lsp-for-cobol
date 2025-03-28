/*
 * Copyright (c) 2024 Broadcom.
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
import * as t from "io-ts";
import { workspace, Uri } from "vscode";
import { PathReporter } from "io-ts/lib/PathReporter";
import { isLeft } from "fp-ts/Either";
import { TextDecoder } from "util";

const PG_FOLDER = ".cobolplugin";
const PGR_PGM_FILE = "pgm_conf.json";
const PG_PROC_FILE = "proc_grps.json";
const EMPTY_PROGRAM_CONFIG = { pgms: [] };
const workspaceConfigs: [
  Map<string, ProcessorGroup[]>,
  Map<string, ProgramsConfig>,
] = [new Map<string, ProcessorGroup[]>(), new Map<string, ProgramsConfig>()];

export const enum ProcessorIndex {
  PROCESSOR_GROUP = 0,
  PROGRAM_CONFIG = 1,
}
const ProgramsConfigModel = t.type({
  pgms: t.array(
    t.type({
      program: t.string,
      pgroup: t.string,
    }),
  ),
});

const EndevorConfigModel = t.intersection([
  t.type({
    environment: t.string,
    stage: t.string,
    system: t.string,
    subsystem: t.string,
    type: t.string,
  }),
  t.partial({ use_map: t.boolean }),
  t.partial({ profile: t.string }),
]);

const ZoweDatasetConfigModel = t.intersection([
  t.type({ dataset: t.string }),
  t.partial({ profile: t.string }),
]);

const ZoweUssConfigModel = t.intersection([
  t.type({ uss: t.string }),
  t.partial({ profile: t.string }),
]);

export type ProgramsConfig = t.TypeOf<typeof ProgramsConfigModel>;
export type EndevorConfigModel = t.TypeOf<typeof EndevorConfigModel>;
export type ZoweDatasetConfigModel = t.TypeOf<typeof ZoweDatasetConfigModel>;
export type ZoweUssConfigModel = t.TypeOf<typeof ZoweUssConfigModel>;

const PreprocessorModel = t.union([
  t.string,
  t.intersection([
    t.type({ name: t.string }),
    t.partial({
      libs: t.array(t.string),
      "copybook-extensions": t.array(t.string),
      "compiler-options": t.array(t.string),
      "copybook-file-encoding": t.string,
      "target-sql-backend": t.string,
    }),
  ]),
]);

export type Preprocessor = t.TypeOf<typeof PreprocessorModel>;

const ProcessorGroupModel = t.intersection([
  t.type({
    name: t.string,
  }),
  t.partial({
    preprocessor: t.union([PreprocessorModel, t.array(PreprocessorModel)]),
    libs: t.array(
      t.union([
        t.string,
        EndevorConfigModel,
        ZoweDatasetConfigModel,
        ZoweUssConfigModel,
      ]),
    ),
    "copybook-extensions": t.array(t.string),
    "compiler-options": t.array(t.string),
    "copybook-file-encoding": t.string,
    "target-sql-backend": t.string,
  }),
]);

export type ProcessorGroup = t.TypeOf<typeof ProcessorGroupModel>;

export async function readProgramConfigFileContent(
  documentUri: Uri,
): Promise<ProgramsConfig> {
  const ws = workspace.getWorkspaceFolder(documentUri);
  if (ws === undefined) {
    return EMPTY_PROGRAM_CONFIG;
  }
  const wsUriString = ws.uri.toString();
  const pgmCfgPath = Uri.joinPath(ws.uri, PG_FOLDER, PGR_PGM_FILE);

  if (workspaceConfigs[ProcessorIndex.PROGRAM_CONFIG].has(wsUriString)) {
    return workspaceConfigs[ProcessorIndex.PROGRAM_CONFIG].get(wsUriString)!;
  } else {
    return await readProgranConfigAndCache(wsUriString, pgmCfgPath);
  }
}

export async function readProcessorGroupsFileContent(
  documentUri: Uri,
): Promise<ProcessorGroup[]> {
  const ws = workspace.getWorkspaceFolder(documentUri);
  if (ws === undefined) {
    return [];
  }

  const wsUriString = ws.uri.toString();
  const procCfgPath = Uri.joinPath(ws.uri, PG_FOLDER, PG_PROC_FILE);
  if (workspaceConfigs[ProcessorIndex.PROCESSOR_GROUP].has(wsUriString)) {
    return workspaceConfigs[ProcessorIndex.PROCESSOR_GROUP].get(wsUriString)!;
  } else {
    return await readProcessorGroupsFileAndCache(wsUriString, procCfgPath);
  }
}

async function readProcessorGroupsFileAndCache(
  wsUriString: string,
  procCfgPath: Uri,
): Promise<ProcessorGroup[]> {
  try {
    const fileContent = new TextDecoder().decode(
      await workspace.fs.readFile(procCfgPath),
    );
    // update new cache
    const ProcessorGroupsModel = t.type({
      pgroups: t.array(ProcessorGroupModel),
    });
    const json: unknown = JSON.parse(fileContent);
    const decoded = ProcessorGroupsModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    workspaceConfigs[ProcessorIndex.PROCESSOR_GROUP].set(
      wsUriString,
      decoded.right.pgroups,
    );
    return decoded.right.pgroups;
  } catch (e) {
    if (
      e &&
      typeof e === "object" &&
      "code" in e &&
      e.code !== "FileNotFound"
    ) {
      console.error(e);
    }
    workspaceConfigs[ProcessorIndex.PROCESSOR_GROUP].set(wsUriString, []);
    return [];
  }
}

async function readProgranConfigAndCache(
  wsUriString: string,
  pgmCfgPath: Uri,
): Promise<ProgramsConfig> {
  try {
    const fileContent = new TextDecoder().decode(
      await workspace.fs.readFile(pgmCfgPath),
    );
    // update new cache
    const json: unknown = JSON.parse(fileContent);
    const decoded = ProgramsConfigModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    workspaceConfigs[ProcessorIndex.PROGRAM_CONFIG].set(
      wsUriString,
      decoded.right,
    );
    return decoded.right;
  } catch (e) {
    if (
      e &&
      typeof e === "object" &&
      "code" in e &&
      e.code !== "FileNotFound"
    ) {
      console.error(e);
    }
    workspaceConfigs[ProcessorIndex.PROGRAM_CONFIG].set(
      wsUriString,
      EMPTY_PROGRAM_CONFIG,
    );
    return EMPTY_PROGRAM_CONFIG;
  }
}

export function clearWorkspaceConfigCache(configIndex: ProcessorIndex) {
  workspaceConfigs[configIndex].clear();
}
