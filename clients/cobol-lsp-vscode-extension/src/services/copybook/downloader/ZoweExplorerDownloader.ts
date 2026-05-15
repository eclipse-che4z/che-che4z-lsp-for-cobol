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
import * as vscode from "vscode";
import { FAILED_REQUESTS_LIMIT } from "../../../constants";
import { hasMember } from "../../util/Utils";

export interface MemberCacheItem {
  name: string;
  extension?: string;
}

const extractPartialId = /\/([^/]+)\/(.*)\/[^/]+/;

export abstract class ZoweExplorerDownloader {
  public static profileStore: Map<string, "locked-profile" | "valid-profile"> =
    new Map();
  protected memberListCache: Map<string, MemberCacheItem[]> = new Map();
  protected pendingMemberListCache: Map<
    string,
    Promise<MemberCacheItem[] | undefined>
  > = new Map();
  protected failedRequests: Map<string, number> = new Map();

  protected createId(profileName: string, path: string, extensions: string[]) {
    return `${profileName}|${path}|${extensions.join("|")}`;
  }

  /**
   * Clears the member cache for the copybook downloader
   */
  public clearMemberListCache() {
    this.memberListCache.clear();
    this.pendingMemberListCache.clear();
  }

  public fsChanged(uri: vscode.Uri) {
    const m = extractPartialId.exec(uri.path);
    if (!m) return;

    const profile = m[1];
    const partialPath = m[2];
    const partialKey = `${profile}|${partialPath}`;

    [...this.memberListCache.keys()]
      .filter((x) => x.startsWith(partialKey))
      .forEach((k) => this.memberListCache.delete(k));
    [...this.pendingMemberListCache.keys()]
      .filter((x) => x.startsWith(partialKey))
      .forEach((k) => this.pendingMemberListCache.delete(k));
  }

  public reenableFailedRequests() {
    this.failedRequests.clear();
  }

  protected async makeCachedRequest(
    title: string,
    requestId: string,
    uri: vscode.Uri,
    responseTransformer: (
      files: [string, vscode.FileType][],
    ) => MemberCacheItem[],
  ) {
    const cachedResponse = this.memberListCache.get(requestId);
    if (cachedResponse) {
      return cachedResponse;
    }

    let membersPromise = this.pendingMemberListCache.get(requestId);
    if (membersPromise) return membersPromise.then((x) => x ?? []);

    membersPromise = this.limitFailedRequests(title, () =>
      Promise.resolve(vscode.workspace.fs.readDirectory(uri)).then(
        responseTransformer,
      ),
    );
    this.pendingMemberListCache.set(requestId, membersPromise);

    try {
      const members = await membersPromise;
      if (
        members &&
        this.pendingMemberListCache.get(requestId) === membersPromise
      )
        this.memberListCache.set(requestId, members);
      return members ?? [];
    } finally {
      if (this.pendingMemberListCache.get(requestId) === membersPromise)
        this.pendingMemberListCache.delete(requestId);
    }
  }

  private async limitFailedRequests<T>(
    requestId: string,
    request: () => Promise<T>,
  ): Promise<T | undefined> {
    const attempt = this.failedRequests.get(requestId) ?? 1;
    if (attempt <= FAILED_REQUESTS_LIMIT) {
      try {
        return await request();
      } catch (err) {
        this.failedRequests.set(requestId, attempt + 1);
        if (attempt === FAILED_REQUESTS_LIMIT) {
          void (async () => {
            const errorMessage =
              hasMember(err, "message") && typeof err.message === "string"
                ? err.message
                : "";
            const selection = await vscode.window.showErrorMessage(
              `Request to ${requestId} keeps failing repeatedly. Disabling future requests. ${errorMessage}`,
              "Keep disabled",
              "Reenable",
            );
            if (selection === "Reenable") {
              this.failedRequests.set(requestId, 0);
            }
          })();
        }
      }
    }
  }

  public async hasMember(
    profileName: string,
    uss: string,
    copybookName: string,
    allowedExtensions: string[],
  ): Promise<MemberCacheItem | undefined> {
    const members = await this.getAllMembers(
      profileName,
      uss,
      allowedExtensions,
    );
    copybookName = copybookName.toUpperCase();
    return members.find((member) => member.name.toUpperCase() === copybookName);
  }

  public abstract getAllMembers(
    profileName: string,
    dataset: string,
    extensions: string[],
  ): Promise<MemberCacheItem[]>;
}
