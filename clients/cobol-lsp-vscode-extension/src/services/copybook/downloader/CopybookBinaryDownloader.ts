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
 *   Broadcom, Inc. - initial API and implementation
 */
import { PassThrough } from "stream";
import { TAR_FOLDER } from "../../../constants";
import { loadProfile } from "../../util/Utils";
import * as vscode from "vscode";

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
    path: string,
    profile: string,
    type: "USS" | "DSN",
  ): Promise<boolean> {
    const loadedProfile = loadProfile(profile, this.explorerAPI);
    const tarUri = this.getTarFileUri(path);
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

  public getTarFileUri(filePath: string) {
    return vscode.Uri.joinPath(this.storagePath, TAR_FOLDER, filePath);
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
