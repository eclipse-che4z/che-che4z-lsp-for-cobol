/*
 * Copyright (c) 2022 Broadcom.
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
import * as crypto from "crypto";
import { loadProcessorGroupCopybooksLibs } from "../ProcessorGroups";
import { outputChannel } from "../util/OutputChannel";

function sha256(s: string): string {
  return crypto.createHash("sha256").update(s).digest().toString("hex");
}

function isNotFoundError(e: unknown) {
  return e instanceof vscode.FileSystemError && e.code === "FileNotFound";
}

export class ZoweCache {
  private static version = "v1";

  private zoweOnly = new Set<string>();

  constructor(
    private cacheUri: vscode.Uri,
    private invalidateCallback: () => void | Promise<void>,
    private timeout: number = 1000,
  ) {}

  public useZoweOnly(uriString: string) {
    return this.zoweOnly.has(uriString);
  }
  private obtainedZoweResponse(uriString: string) {
    this.zoweOnly.add(uriString);
  }

  public async readCached(uriString: string) {
    const uri = this.generateFileUri(uriString);

    try {
      return await vscode.workspace.fs.readFile(uri);
    } catch (_e) {
      return undefined;
    }
  }

  private async writeCached(uriString: string, data: Uint8Array) {
    const uri = this.generateFileUri(uriString);

    try {
      await vscode.workspace.fs.writeFile(uri, data);
    } catch (_e) {
      /* ignore */
    }
  }

  private async deleteCached(uriString: string) {
    const uri = this.generateFileUri(uriString);

    try {
      await vscode.workspace.fs.delete(uri);
    } catch (_e) {
      /* ignore */
    }
  }

  private generateFileUri(uriString: string) {
    const hash = sha256(uriString);
    return vscode.Uri.joinPath(this.cacheUri, `${ZoweCache.version}.${hash}`);
  }

  private invalidatePending: NodeJS.Timeout | undefined;
  invalidate() {
    if (this.invalidatePending) {
      clearTimeout(this.invalidatePending);
    }
    this.invalidatePending = setTimeout(
      () => void this.invalidateCallback(),
      this.timeout,
    );
  }

  public async handleCacheUpdate(
    uriString: string,
    zowe: Promise<Uint8Array>,
    cached: Promise<Uint8Array | undefined>,
  ) {
    const [z, c] = await Promise.allSettled([zowe, cached]);
    if (z.status === "fulfilled") {
      this.obtainedZoweResponse(uriString);
      if (
        c.status === "fulfilled" &&
        c.value &&
        Buffer.compare(z.value, c.value) === 0
      ) {
        return;
      }
      await this.writeCached(uriString, z.value);
    } else if (isNotFoundError(z.reason)) {
      this.obtainedZoweResponse(uriString);
      await this.deleteCached(uriString);
    }
    if (c.status === "fulfilled" && c.value) this.invalidate();
  }
}

export async function readZoweFileContent(
  uri: vscode.Uri,
  zoweCache?: ZoweCache,
) {
  const zowePromise = Promise.resolve(vscode.workspace.fs.readFile(uri));
  const uriString = uri.toString();
  if (!zoweCache || zoweCache.useZoweOnly(uriString)) return zowePromise;

  const cachedVersion = zoweCache.readCached(uriString);

  void zoweCache.handleCacheUpdate(uriString, zowePromise, cachedVersion);

  try {
    const result = await Promise.race([zowePromise, cachedVersion]);
    if (result) return result;
  } catch (_e) {
    /* ignore */
  }

  return zowePromise;
}

export async function readFileContent(
  fileUri: string,
  zoweCache?: ZoweCache,
): Promise<string | undefined> {
  const uri = vscode.Uri.parse(fileUri);
  const openFile = vscode.workspace.textDocuments.find(
    (doc) => doc.uri.toString() === fileUri,
  );
  if (openFile) {
    return openFile.getText();
  }
  try {
    const data = await (uri.scheme.startsWith("zowe")
      ? readZoweFileContent(uri, zoweCache)
      : vscode.workspace.fs.readFile(uri));
    const content = new TextDecoder().decode(data);
    return content;
  } catch (err) {
    outputChannel.error(
      `file/content message handler error ${fileUri} ${JSON.stringify(err)}`,
    );
    return;
  }
}

export async function resolveCopybookURI(
  documentURI: string,
  copybookName: string,
  dialectType: string,
): Promise<string | undefined> {
  const uri = vscode.Uri.parse(documentURI);

  const pgLibs = await loadProcessorGroupCopybooksLibs(uri, dialectType);

  const promises = pgLibs.map((lib) =>
    lib.resolveCopybookUri(copybookName, uri, dialectType),
  );
  const results = await Promise.allSettled(promises);
  for (const result of results) {
    if (result.status === "fulfilled" && result.value) {
      if (typeof result.value === "function") {
        const resultUri = await result.value();
        return resultUri?.toString();
      }
      return result.value.toString();
    }
  }
  outputChannel.error("Unable to resolve copybook", { pgLibs, copybookName });
}
