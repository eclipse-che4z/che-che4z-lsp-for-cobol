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
import { UssPathLib } from "./copybookLibs/UssPathLib";
import { DatasetLib } from "./copybookLibs/DatasetLib";
import { externalApis } from "./ExternalAPIsService";
import { EndevorElementLib } from "./copybookLibs/EndevorElementLib";
import { EndevorMemberLib } from "./copybookLibs/EndevorMemberLib";
import CopybookLib from "./copybookLibs/CopybookLib";
import { SettingsService } from "./Settings";
import { Memoize } from "./util/Memoize";
import { outputChannel } from "./util/OutputChannel";

const PG_FOLDER = ".cobolplugin";
const PGR_PGM_FILE = "pgm_conf.json";
const PG_PROC_FILE = "proc_grps.json";

type ProgramConfig = {
  program: string;
  processorGroup: ProcessorGroup;
};

export interface WorkspaceConfig {
  programs: ProgramConfig[];
  processorGroups: { [key: string]: ProcessorGroup };
}

export type ProcessorGroup = {
  name: string;
  preprocessors?: Preprocessor[];
} & Partial<ProcessorGroupProperties>;

export type Preprocessor = {
  name: string;
} & Partial<ProcessorGroupProperties>;

export interface ProcessorGroupProperties {
  libs: CopybookLib[];
  "copybook-extensions": string[];
  "compiler-options": string[];
  "copybook-file-encoding": string;
  "target-sql-backend": string;
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

const EndevorDatasetModel = t.intersection([
  t.type({ dataset: t.string }),
  t.partial({ profile: t.string }),
]);
export type EndevorDatasetConfigModel = t.TypeOf<typeof EndevorDatasetModel>;

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

const LibModel = t.union([
  t.string,
  EndevorConfigModel,
  EndevorDatasetModel,
  ZoweDatasetConfigModel,
  ZoweUssConfigModel,
]);
const LibsModel = t.array(LibModel);
export type LibDefinition = t.TypeOf<typeof LibModel>;
export type LibsDefinitions = t.TypeOf<typeof LibsModel>;

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

type PreprocessorDefinition = t.TypeOf<typeof PreprocessorModel>;

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

type ProcessorGroupDefinition = t.TypeOf<typeof ProcessorGroupModel>;
export type ProcessorGroupsDefinition = t.TypeOf<typeof ProcessorGroupsModel>;

export type CopybookLibTypes =
  | typeof LocalPathLib
  | typeof DatasetLib
  | typeof UssPathLib
  | typeof EndevorElementLib
  | typeof EndevorMemberLib;

const readEndevorConfigCached = new Memoize(
  async function (documentUri: Uri): Promise<WorkspaceConfig | undefined> {
    if (!externalApis.handleAsEndevorElement(documentUri.toString())) {
      return;
    }

    const workspaceConfig: WorkspaceConfig = {
      processorGroups: {},
      programs: [],
    };

    const endevorData =
      await externalApis.e4eDownloader?.getEndevorProcessorGroupConfig(
        documentUri,
      );
    if (endevorData) {
      const processorGroups = endevorData.pgroups.map(
        transformProcessorGroup([EndevorElementLib, EndevorMemberLib]),
      );
      processorGroups.forEach((pg) => {
        workspaceConfig.processorGroups[pg.name] = pg;
      });

      const processorGroupName = endevorData.pgms[0].pgroup;
      const processorGroup = processorGroups.find(
        (pg) => pg.name === processorGroupName,
      );
      if (processorGroup) {
        const programs: ProgramConfig[] = [
          {
            program: workspace.asRelativePath(documentUri),
            processorGroup,
          },
        ];
        workspaceConfig.programs = programs;
      }
    }

    return workspaceConfig;
  },
  undefined,
  workspace.asRelativePath,
);
export const readEndevorConfig = readEndevorConfigCached.execute;

const readWorkspaceConfigCached = new Memoize(
  async function (workspaceUri: Uri): Promise<WorkspaceConfig | undefined> {
    const processorGroups = await readProcessorGroupsFile(workspaceUri);
    if (!processorGroups) return;

    const workspaceConfig: WorkspaceConfig = {
      processorGroups: {},
      programs: [],
    };

    processorGroups.forEach((pg) => {
      workspaceConfig.processorGroups[pg.name] = pg;
    });

    const programs = await readProgramConfig(workspaceUri);
    if (!programs) return workspaceConfig;

    programs.pgms.forEach((program) => {
      let processorGroup = processorGroups.find(
        (p) => p.name === program.pgroup,
      );
      if (!processorGroup) {
        processorGroup = { name: program.pgroup };
      }
      workspaceConfig.programs.push({
        program: program.program,
        processorGroup: processorGroup,
      });
    });

    return workspaceConfig;
  },
  undefined,
  (workspaceUri) => workspaceUri.toString(),
);
export const readWorkspaceConfig = readWorkspaceConfigCached.execute;

export function readSettingConfig(dialectType: string): ProcessorGroup {
  // local paths
  const directoryPaths = SettingsService.getLocalPath(dialectType);

  // dsn
  const dsns: LibsDefinitions = SettingsService.getDsnPath(dialectType).map(
    (dsn) => ({ dataset: dsn }),
  );

  // uss
  const usss: LibsDefinitions = SettingsService.getUssPath(dialectType).map(
    (uss) => ({ uss }),
  );

  return {
    name: "VSCodeSettingProcessorGroup",
    libs: transformLibs(
      [...directoryPaths, ...dsns, ...usss],
      [LocalPathLib, DatasetLib, UssPathLib],
      [],
    ),
  };
}

export function invalidateConfig(documentUri: Uri) {
  readWorkspaceConfigCached.invalidateCache(documentUri);
  readEndevorConfigCached.invalidateCache(documentUri);
}

export function clearWorkspaceConfigCache() {
  readWorkspaceConfigCached.clearCache();
  readEndevorConfigCached.clearCache();
}

async function readProcessorGroupsFile(
  workspaceUri: Uri,
): Promise<ProcessorGroup[] | undefined> {
  const procCfgPath = Uri.joinPath(workspaceUri, PG_FOLDER, PG_PROC_FILE);
  try {
    const fileContent = new TextDecoder().decode(
      await workspace.fs.readFile(procCfgPath),
    );
    const json: unknown = JSON.parse(fileContent);
    const decoded = ProcessorGroupsModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }

    return decoded.right.pgroups.map(
      transformProcessorGroup([
        LocalPathLib,
        DatasetLib,
        UssPathLib,
        EndevorElementLib,
      ]),
    );
  } catch (e) {
    if (
      e instanceof Error &&
      (!hasMember(e, "code") || e.code !== "FileNotFound")
    ) {
      outputChannel.error(
        `Error while reading ${procCfgPath.toString()} - ${e.message}`,
      );
    }
  }
}

const transformProcessorGroup =
  (libTypes: CopybookLibTypes[]) =>
  (input: ProcessorGroupDefinition): ProcessorGroup => {
    const libs = transformLibs(input.libs, libTypes, []);
    const result: ProcessorGroup = {
      name: input.name,
      libs,
      preprocessors: transformPreprocessor(input.preprocessor, libTypes, libs),
      "compiler-options": input["compiler-options"],
      "copybook-extensions": input["copybook-extensions"],
      "copybook-file-encoding": input["copybook-file-encoding"],
      "target-sql-backend": input["target-sql-backend"],
    };

    return result;
  };

export function transformLibs(
  libDefinitions: LibsDefinitions | undefined,
  libTypes: CopybookLibTypes[],
  defaultLibs: CopybookLib[],
): CopybookLib[] {
  if (!libDefinitions) {
    return defaultLibs;
  }

  const libs = [];

  for (const libDefinition of libDefinitions) {
    for (const libType of libTypes) {
      const libInstance = libType.create(libDefinition);
      if (libInstance) {
        libs.push(libInstance);
        break;
      }
    }
  }

  return libs;
}

function transformPreprocessor(
  input: PreprocessorDefinition | undefined,
  libTypes: CopybookLibTypes[],
  defaultLibs: CopybookLib[],
): Preprocessor[] {
  if (!input) return [];
  const preprocessors = asArray(input);
  const transformed = preprocessors.map((preprocessor) => {
    if (typeof preprocessor === "string") {
      return { name: preprocessor, libs: defaultLibs };
    } else {
      return {
        name: preprocessor.name ?? "",
        libs: transformLibs(preprocessor.libs, libTypes, defaultLibs),
        "compiler-options": preprocessor["compiler-options"],
        "copybook-extensions": preprocessor["copybook-extensions"],
        "copybook-file-encoding": preprocessor["copybook-file-encoding"],
        "target-sql-backend": preprocessor["target-sql-backend"],
      };
    }
  });

  return transformed;
}

async function readProgramConfig(
  workspaceUri: Uri,
): Promise<ProgramsConfig | undefined> {
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
    if (
      e instanceof Error &&
      (!hasMember(e, "code") || e.code !== "FileNotFound")
    ) {
      outputChannel.error(
        `Error while reading ${pgmCfgPath.toString()} - ${e.message}`,
      );
    }
  }
}
