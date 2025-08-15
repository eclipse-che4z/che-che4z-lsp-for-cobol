/*
 * Copyright (c) 2025 Broadcom.
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

import * as vscode from "vscode";

const default_pgm = `{
    "pgms": [
        {
            "program": "**",
            "pgroup": "DEFAULT"
        }
    ]
}`;

const default_proc = `{
    "pgroups": [
        {
            "name": "DEFAULT",
            "libs": [
                "**"
            ]
        }
    ]
}`;

export async function pickWorkspace(
  workspaces = vscode.workspace.workspaceFolders,
) {
  if (!workspaces || workspaces.length === 0) {
    await vscode.window.showErrorMessage(
      "Creating configuration files requires an opened workspace",
    );
    return;
  }

  if (workspaces.length === 1) return workspaces[0];
  const pickedWs = await vscode.window.showQuickPick(
    workspaces.map((w) => ({
      label: w.name,
      detail: w.uri.scheme === "file" ? w.uri.fsPath : w.uri.toString(true),
      ws: w,
    })),
    { title: "Select a workspace where to generate the configuration files" },
  );
  return pickedWs?.ws;
}

export async function createSampleConfiguration(
  wsp = pickWorkspace(),
  fs = vscode.workspace.fs,
) {
  const ws = await wsp;
  if (!ws) return;

  try {
    const folder = vscode.Uri.joinPath(ws.uri, ".cobolplugin");
    const pgm = vscode.Uri.joinPath(folder, "pgm_conf.json");
    const proc = vscode.Uri.joinPath(folder, "proc_grps.json");

    const encoder = new TextEncoder();

    await fs.createDirectory(folder);

    const exists = await Promise.allSettled([fs.stat(pgm), fs.stat(proc)]);

    if (exists.some((x) => x.status === "fulfilled")) {
      await vscode.window.showErrorMessage(`Configuration files already exist`);
      return;
    }

    await Promise.all([
      fs.writeFile(pgm, encoder.encode(default_pgm)),
      fs.writeFile(proc, encoder.encode(default_proc)),
    ]);

    await Promise.all(
      [
        vscode.workspace.openTextDocument(pgm),
        vscode.workspace.openTextDocument(proc),
      ].map((p) =>
        p.then((e) => vscode.window.showTextDocument(e, { preview: false })),
      ),
    );
  } catch (e: unknown) {
    await vscode.window.showErrorMessage(
      `Error occurred while generating configuration files:\n${String(e)}`,
    );
  }
}
