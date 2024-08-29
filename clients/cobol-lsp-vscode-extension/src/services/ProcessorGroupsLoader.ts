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
import * as path from "path";
import * as fs from "fs";
import { SettingsUtils } from "./util/SettingsUtils";
import * as t from "io-ts";
import { PathReporter } from "io-ts/lib/PathReporter";
import { isLeft } from "fp-ts/Either";

const PROCESSOR_GROUP_FOLDER = ".cobolplugin";
const PROCESSOR_GROUP_PGM = "pgm_conf.json";
const PROCESSOR_GROUP_PROC = "proc_grps.json";

const ProgramsConfigModel = t.type({
  pgms: t.array(
    t.type({
      program: t.string,
      pgroup: t.string,
    }),
  ),
});

export type ProgramsConfig = t.TypeOf<typeof ProgramsConfigModel>;

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
    libs: t.array(t.string),
    "copybook-extensions": t.array(t.string),
    "compiler-options": t.array(t.string),
    "copybook-file-encoding": t.string,
    "target-sql-backend": t.string,
  }),
]);

export type ProcessorGroup = t.TypeOf<typeof ProcessorGroupModel>;

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
    const json = JSON.parse(fs.readFileSync(pgmCfgPath).toString());
    const decoded = ProgramsConfigModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    return decoded.right;
  } catch (e) {
    console.error(e);
    return EMPTY;
  }
};

export function readProcessorGroupsFileContent(): ProcessorGroup[] {
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
    const ProcessorGrpupsModel = t.type({
      pgroups: t.array(ProcessorGroupModel),
    });
    const json = JSON.parse(fs.readFileSync(procCfgPath).toString());
    const decoded = ProcessorGrpupsModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    return decoded.right.pgroups;
  } catch (e) {
    console.error(e);
    return [];
  }
}
