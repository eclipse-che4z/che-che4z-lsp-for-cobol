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
import * as path from "node:path";
import { TAR_FOLDER } from "../../../constants";
import { loadProfile } from "../../util/Utils";
import * as vscode from "vscode";
import { outputChannel } from "../../util/OutputChannel";

const pendingCache: Map<string, Promise<boolean>> = new Map();

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

  private async downloadFileImpl(
    remotePath: string,
    profile: string,
    type: "USS" | "DSN",
  ): Promise<boolean> {
    if (type === "USS" && !path.posix.isAbsolute(remotePath)) {
      outputChannel.warn(`${remotePath} ignored for file download`);
      return false;
    }
    const tarUri = this.getTarFileUri(remotePath);
    if (!tarUri) {
      return false;
    }
    const loadedProfile = loadProfile(profile, this.explorerAPI);
    try {
      const passThrough = new PassThrough();
      const chunks: Buffer[] = [];

      passThrough.on("data", (chunk: Buffer) => {
        chunks.push(chunk);
      });

      if (type == "DSN") {
        await this.explorerAPI
          .getMvsApi(loadedProfile)
          .getContents(remotePath, {
            returnEtag: true,
            binary: true,
            stream: passThrough,
          });
      } else
        await this.explorerAPI
          .getUssApi(loadedProfile)
          .getContents(remotePath, {
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
    const tarUri = vscode.Uri.joinPath(this.storagePath, TAR_FOLDER, filePath);
    const root = path.join(this.storagePath.fsPath, TAR_FOLDER);
    if (path.relative(root, tarUri.fsPath).startsWith("..")) {
      outputChannel.warn(
        `${filePath} resolves outside the tar cache root. Ignored for file download.`,
      );
      return undefined;
    }
    return tarUri;
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
