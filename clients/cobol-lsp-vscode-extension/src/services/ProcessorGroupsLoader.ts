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

export async function readProgramConfigFileContent(
  documentUri: Uri,
): Promise<ProgramsConfig> {
  const EMPTY = { pgms: [] };

  const ws = workspace.getWorkspaceFolder(documentUri);
  if (ws === undefined) {
    return EMPTY;
  }
  const pgmCfgPath = Uri.joinPath(ws.uri, PG_FOLDER, PGR_PGM_FILE);
  try {
    const json = JSON.parse(
      new TextDecoder().decode(await workspace.fs.readFile(pgmCfgPath)),
    );
    const decoded = ProgramsConfigModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    return decoded.right;
  } catch (e: any) {
    if (e.code !== "FileNotFound") {
      console.error(e);
    }
    return EMPTY;
  }
}

export async function readProcessorGroupsFileContent(
  documentUri: Uri,
): Promise<ProcessorGroup[]> {
  const ws = workspace.getWorkspaceFolder(documentUri);
  if (ws === undefined) {
    return [];
  }

  const procCfgPath = Uri.joinPath(ws.uri, PG_FOLDER, PG_PROC_FILE);
  try {
    const ProcessorGrpupsModel = t.type({
      pgroups: t.array(ProcessorGroupModel),
    });
    const json = JSON.parse(
      new TextDecoder().decode(await workspace.fs.readFile(procCfgPath)),
    );

    const decoded = ProcessorGrpupsModel.decode(json);
    if (isLeft(decoded)) {
      throw Error(
        `Could not validate data: ${PathReporter.report(decoded).join("\n")}`,
      );
    }
    return decoded.right.pgroups;
  } catch (e: any) {
    if (e.code !== "FileNotFound") {
      console.error(e);
    }
    return [];
  }
}
