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
import { asArray, hasMember } from "./util/Utils";
import LocalPathLib from "./copybookLibs/LocalPathLib";
import { UssPathLib } from "./copybookLibs/UssPathConfig";
import { DatasetLib } from "./copybookLibs/DatasetLib";
import { externalApis } from "./copybook/CopybookDownloadService";
import { EndevorElementLib } from "./copybookLibs/EndevorElementLib";
import { EndevorMemberLib } from "./copybookLibs/EndevorMemberLib";

const PG_FOLDER = ".cobolplugin";
const PGR_PGM_FILE = "pgm_conf.json";
const PG_PROC_FILE = "proc_grps.json";
const EMPTY_PROGRAM_CONFIG = { pgms: [] };

type ProgramConfig = {
  program: string;
  processorGroup: TransformedProcessorGroup;
};

export interface WorkspaceConfig {
  programs: ProgramConfig[];
  processorGroups: { [key: string]: TransformedProcessorGroup };
}

let workspaceConfigs: { [key: string]: WorkspaceConfig } = {};

export async function readEndevorConfig(
  documentUri: Uri,
): Promise<WorkspaceConfig | undefined> {
  if (!externalApis.handleAsEndevorElement(documentUri.toString())) {
    return;
  }

  const workspaceKey = documentUri.toString();
  let workspaceConfig = workspaceConfigs[workspaceKey];
  if (workspaceConfig) {
    return workspaceConfig;
  }

  workspaceConfig = {
    processorGroups: {},
    programs: [],
  };

  const endevorData =
    await externalApis.e4eDownloader?.getEndevorProcessorGroupConfig(
      documentUri,
    );
  if (endevorData) {
    // const decodedGroups = ProcessorGroupsModel.decode(
    //   endevorData.pgroups.map((p) => ({ name: p.name, libs: p.libs })),
    // );
    // if (isLeft(decodedGroups)) {
    //   const msg = `Could not validate data: ${PathReporter.report(decodedGroups).join("\n")}`;
    //   throw Error(msg);
    // }
    const decodedGroups = endevorData.pgroups.map((p) => ({
      name: p.name,
      libs: p.libs.map((l) => {
        if (hasMember(l, "dataset")) {
          const el: EndevorDatasetConfigModel = {
            endevorDataset: l.dataset,
          };
          if (hasMember(l, "profile") && typeof l.profile === "string") {
            el.profile = l.profile;
          }
          return el;
        } else return l;
      }),
    }));

    const processorGroups = decodedGroups.map(transformProcessorGroup);
    processorGroups.forEach((pg) => {
      workspaceConfig.processorGroups[pg.name] = pg;
    });

    const decodedPrograms = ProgramsConfigModel.decode({
      pgms: endevorData.pgms.map((pgm) => ({
        ...pgm,
        program: `**/${pgm.program.split("/").reverse().join(".")}`,
      })),
    });
    if (isLeft(decodedPrograms)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decodedPrograms).join("\n")}`,
      );
    }
    decodedPrograms.right.pgms.forEach((program) => {
      let processorGroup = processorGroups.find(
        (p) => p.name === program.pgroup,
      );
      if (!processorGroup) {
        //throw Error(`Processor group ${program.pgroup} definition missing.`);
        // TODO: report missing pg configuration
        processorGroup = { name: program.pgroup };
      }
      workspaceConfig.programs.push({
        program: program.program,
        processorGroup: processorGroup,
      });
    });
  }

  workspaceConfigs[workspaceKey] = workspaceConfig;

  return workspaceConfig;
}

export async function readWorkspaceConfig(
  workspaceUri: Uri,
): Promise<WorkspaceConfig> {
  const workspaceKey = workspaceUri.toString();
  let workspaceConfig = workspaceConfigs[workspaceKey];
  if (workspaceConfig) {
    return workspaceConfig;
  }

  workspaceConfig = { processorGroups: {}, programs: [] };

  const processorGroups = await readProcessorGroupsFile(workspaceUri);
  processorGroups.forEach((pg) => {
    workspaceConfig.processorGroups[pg.name] = pg;
  });

  const programs = await readProgramConfig(workspaceUri);

  programs.pgms.forEach((program) => {
    let processorGroup = processorGroups.find((p) => p.name === program.pgroup);
    if (!processorGroup) {
      //throw Error(`Processor group ${program.pgroup} definition missing.`);
      // TODO: report missing pg configuration
      processorGroup = { name: program.pgroup };
    }
    workspaceConfig.programs.push({
      program: program.program,
      processorGroup: processorGroup,
    });
  });

  workspaceConfigs[workspaceKey] = workspaceConfig;

  return workspaceConfig;
}

const ProgramsConfigModel = t.type({
  pgms: t.array(
    t.type({
      program: t.string,
      pgroup: t.string,
    }),
  ),
});
export type ProgramsConfig = t.TypeOf<typeof ProgramsConfigModel>;

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
export type EndevorConfigModel = t.TypeOf<typeof EndevorConfigModel>;

const EndevorDatasetModel = t.intersection([
  t.type({
    endevorDataset: t.string,
  }),
  t.partial({
    profile: t.string,
  }),
]);
export type EndevorDatasetConfigModel = t.TypeOf<typeof EndevorDatasetModel>;

const ZoweDatasetConfigModel = t.intersection([
  t.type({ dataset: t.string }),
  t.partial({ profile: t.string }),
]);
export type ZoweDatasetConfigModel = t.TypeOf<typeof ZoweDatasetConfigModel>;

const ZoweUssConfigModel = t.intersection([
  t.type({ uss: t.string }),
  t.partial({ profile: t.string }),
]);
export type ZoweUssConfigModel = t.TypeOf<typeof ZoweUssConfigModel>;

const LibsModel = t.array(
  t.union([
    t.string,
    EndevorConfigModel,
    EndevorDatasetModel,
    ZoweDatasetConfigModel,
    ZoweUssConfigModel,
  ]),
);
export type CopybookLibs = t.TypeOf<typeof LibsModel>;

const PreprocessorItemModel = t.union([
  t.string,
  t.intersection([
    t.type({ name: t.string }),
    t.partial({
      libs: LibsModel,
      "copybook-extensions": t.array(t.string),
      "compiler-options": t.array(t.string),
      "copybook-file-encoding": t.string,
      "target-sql-backend": t.string,
    }),
  ]),
]);

const PreprocessorModel = t.union([
  PreprocessorItemModel,
  t.array(PreprocessorItemModel),
]);

type Preprocessor = t.TypeOf<typeof PreprocessorModel>;

const ProcessorGroupModel = t.intersection([
  t.type({
    name: t.string,
  }),
  t.partial({
    preprocessor: PreprocessorModel,
    libs: LibsModel,
    "copybook-extensions": t.array(t.string),
    "compiler-options": t.array(t.string),
    "copybook-file-encoding": t.string,
    "target-sql-backend": t.string,
  }),
]);

const ProcessorGroupsModel = t.type({
  pgroups: t.array(ProcessorGroupModel),
});

type ProcessorGroup = t.TypeOf<typeof ProcessorGroupModel>;

export type TransformedProcessorGroup = {
  name: string;
  preprocessors?: TransformedPreprocessor[];
  // libs: TransformedLibs[];
  // "copybook-extensions"?: string[];
  // "compiler-options"?: string[];
  // "copybook-file-encoding"?: string;
  // "target-sql-backend"?: string;
} & Partial<ProcessorGroupProperties>;

export type TransformedLibs =
  | LocalPathLib
  | DatasetLib
  | UssPathLib
  | EndevorElementLib
  | EndevorMemberLib;

export type TransformedPreprocessor = {
  name: string;
} & Partial<ProcessorGroupProperties>;

export interface ProcessorGroupProperties {
  libs: TransformedLibs[];
  "copybook-extensions": string[];
  "compiler-options": string[];
  "copybook-file-encoding": string;
  "target-sql-backend": string;
}

async function readProcessorGroupsFile(
  workspaceUri: Uri,
): Promise<TransformedProcessorGroup[]> {
  const procCfgPath = Uri.joinPath(workspaceUri, PG_FOLDER, PG_PROC_FILE);
  try {
    const fileContent = new TextDecoder().decode(
      await workspace.fs.readFile(procCfgPath),
    );
    // update new cache
    const json: unknown = JSON.parse(fileContent);
    const decoded = ProcessorGroupsModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }

    return decoded.right.pgroups.map(transformProcessorGroup);
  } catch (e) {
    if (hasMember(e, "code") && e.code !== "FileNotFound") {
      // TODO: better error handling
      console.error(e);
    }
    return [];
  }
}

function transformProcessorGroup(
  input: ProcessorGroup,
): TransformedProcessorGroup {
  const result: TransformedProcessorGroup = {
    name: input.name,
    libs: transformLibs(input.libs),
    preprocessors: transformPreprocessor(input.preprocessor),
  };

  return result;
}

export function transformLibs(libs?: CopybookLibs) {
  if (!libs) {
    return [];
  }

  const processorGroupLibTypes = [
    LocalPathLib,
    DatasetLib,
    UssPathLib,
    EndevorElementLib,
    EndevorMemberLib,
  ];

  const results = processorGroupLibTypes.map((pg) => pg.create(libs)).flat();

  return results;
}

function transformPreprocessor(
  input?: Preprocessor,
): TransformedPreprocessor[] {
  if (!input) return [];
  const preprocessors = asArray(input);
  const transformed = preprocessors.map((preprocessor) => {
    if (typeof preprocessor === "string") {
      return { name: preprocessor, libs: [] };
    } else {
      return {
        name: preprocessor?.name ?? "",
        libs: transformLibs(preprocessor?.libs),
      };
    }
  });

  return transformed;
}

async function readProgramConfig(workspaceUri: Uri): Promise<ProgramsConfig> {
  const pgmCfgPath = Uri.joinPath(workspaceUri, PG_FOLDER, PGR_PGM_FILE);

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
    return decoded.right;
  } catch (e) {
    if (hasMember(e, "code") && e.code !== "FileNotFound") {
      // TODO: better error handling
      console.error(e);
    }
    return EMPTY_PROGRAM_CONFIG;
  }
}

export function clearWorkspaceConfigCache() {
  workspaceConfigs = {};
}
