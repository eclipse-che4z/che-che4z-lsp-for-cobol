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

export abstract class ZoweExplorerDownloader {
  public static profileStore: Map<string, "locked-profile" | "valid-profile"> =
    new Map();
  protected memberListCache: Map<string, MemberCacheItem[]> = new Map();
  protected failedRequests: Map<string, number> = new Map();
  protected abstract schema: string;
  protected abstract separator: string;

  constructor(protected readonly explorerAPI: IApiRegisterClient) {}

  protected createId(profileName: string, path: string) {
    return `${profileName}-${path}`;
  }

  /**
   * Clears the member cache for the copybook downloader
   */
  public clearMemberListCache() {
    this.memberListCache.clear();
  }

  public reenableFailedRequests() {
    this.failedRequests.clear();
  }

  public async limitFailedRequests(
    requestId: string,
    request: () => Promise<void>,
  ) {
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

        throw err;
      }
    }
  }

  public async hasMember(
    profileName: string,
    uss: string,
    copybookName: string,
  ): Promise<MemberCacheItem | undefined> {
    const members = await this.getAllMembers(profileName, uss);
    copybookName = copybookName.toUpperCase();
    return members.find((member) => member.name.toUpperCase() === copybookName);
  }

  public abstract getAllMembers(
    profileName: string,
    dataset: string,
  ): Promise<MemberCacheItem[]>;

  public async resolveCopybookUri(
    profileName: string,
    dataset: string,
    copybookName: string,
  ) {
    const member = await this.hasMember(profileName, dataset, copybookName);

    if (member) {
      return vscode.Uri.parse(
        `${this.schema}:/${profileName}${this.separator}${dataset}/${member.name}${member.extension ? member.extension : ""}`,
      );
    }
  }
}
