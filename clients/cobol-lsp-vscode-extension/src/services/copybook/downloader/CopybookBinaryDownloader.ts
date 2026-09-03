/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import { PassThrough } from "stream";
import { TAR_FOLDER } from "../../../constants";
import { loadProfile } from "../../util/Utils";
import { outputChannel } from "../../util/OutputChannel";
import * as vscode from "vscode";

const pendingCache: Map<string, Promise<boolean>> = new Map();
const approvedDownloads = new Set<string>();

export class CopybookBinaryDownloader {
  constructor(
    private storagePath: vscode.Uri,
    private explorerAPI: IApiRegisterClient,
  ) {}

  public async downloadFile(
    path: string,
    profile: string,
    type: "USS" | "DSN",
  ): Promise<boolean> {
    if (!(await this.isDownloadApproved(path, profile, type))) return false;

    const id = `${type}|${profile}|${path}`;
    let p = pendingCache.get(id);
    if (p) return p;

    p = this.downloadFileImpl(path, profile, type);
    pendingCache.set(id, p);

    try {
      return await p;
    } finally {
      pendingCache.delete(id);
    }
  }

  // Workspace-supplied .cobolplugin/proc_grps.json controls which Zowe
  // profile and remote path get fetched. Require an untampered/trusted
  // workspace plus one-time explicit consent per profile+path before
  // spending the user's real mainframe credentials on it.
  private async isDownloadApproved(
    path: string,
    profile: string,
    type: "USS" | "DSN",
  ): Promise<boolean> {
    if (!vscode.workspace.isTrusted) {
      outputChannel.error(
        `Refused to download ${type} copybook archive "${path}" using Zowe profile "${profile}": workspace is not trusted.`,
      );
      return false;
    }

    const id = `${type}|${profile}|${path}`;
    if (approvedDownloads.has(id)) return true;

    const choice = await vscode.window.showWarningMessage(
      `The workspace configuration (.cobolplugin/proc_grps.json) is requesting a mainframe download using Zowe profile "${profile}":\n${type} ${path}\n\nOnly allow this if you trust this workspace.`,
      { modal: true },
      "Allow",
    );

    if (choice !== "Allow") {
      outputChannel.error(
        `Denied ${type} copybook archive download "${path}" using Zowe profile "${profile}".`,
      );
      return false;
    }

    approvedDownloads.add(id);
    return true;
  }

  private async downloadFileImpl(
    path: string,
    profile: string,
    type: "USS" | "DSN",
  ): Promise<boolean> {
    const tarUri = this.getTarFileUri(path);
    if (!tarUri) return false;

    const loadedProfile = loadProfile(profile, this.explorerAPI);
    try {
      const passThrough = new PassThrough();
      const chunks: Buffer[] = [];

      passThrough.on("data", (chunk: Buffer) => {
        chunks.push(chunk);
      });

      if (type == "DSN") {
        await this.explorerAPI.getMvsApi(loadedProfile).getContents(path, {
          returnEtag: true,
          binary: true,
          stream: passThrough,
        });
      } else
        await this.explorerAPI.getUssApi(loadedProfile).getContents(path, {
          returnEtag: true,
          binary: true,
          stream: passThrough,
        });
      const content = Buffer.concat(chunks);
      await vscode.workspace.fs.writeFile(tarUri, content);
      return true;
    } catch (_error) {
      return false;
    }
  }

  public getTarFileUri(filePath: string): vscode.Uri | undefined {
    const root = vscode.Uri.joinPath(this.storagePath, TAR_FOLDER);
    const resolved = vscode.Uri.joinPath(root, filePath);
    const rootPrefix = root.path.endsWith("/") ? root.path : `${root.path}/`;
    if (resolved.path !== root.path && !resolved.path.startsWith(rootPrefix)) {
      outputChannel.error(
        `Rejected tar file location "${filePath}": it resolves outside of the extension's storage folder.`,
      );
      return undefined;
    }
    return resolved;
  }
  public async isPresentLocally(
    inputPath: string | vscode.Uri | undefined,
    isUnderExtStorage: boolean = true,
  ) {
    if (!inputPath) return false;
    const uri =
      inputPath instanceof vscode.Uri
        ? inputPath
        : isUnderExtStorage
          ? vscode.Uri.joinPath(this.storagePath, inputPath)
          : vscode.Uri.parse(inputPath);
    try {
      await vscode.workspace.fs.stat(uri);
      return true;
    } catch (_error) {
      return false;
    }
  }
}
