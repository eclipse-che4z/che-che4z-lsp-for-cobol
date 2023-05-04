/*
 * Copyright (c) 2020 Broadcom.
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

export class CopybookProfile {
  private copybook: any;
  constructor(
    readonly documentUri: string,
    copybook: string,
    readonly dialectType: string,
    readonly profile: string,
    readonly quiet: boolean,
  ) {
    this.copybook = copybook;
  }

  public equals(other: CopybookProfile): boolean {
    return (
      this.documentUri == other.documentUri &&
      this.copybook == other.copybook &&
      this.dialectType == other.dialectType &&
      this.profile == other.profile &&
      this.quiet == other.quiet
    );
  }

  public updateCopybook(copybook: string) {
    this.copybook = copybook;
  }

  public getCopybook() {
    return this.copybook;
  }
}

export class DownloadQueue {
  private queue: CopybookProfile[] = [];
  private resolve: any;

  public push(
    documentUri: string,
    copybook: string,
    dialectType: string,
    profile: string,
    quiet: boolean,
  ): void {
    if (this.resolve) {
      this.resolve(
        new CopybookProfile(documentUri, copybook, dialectType, profile, quiet),
      );
      this.resolve = undefined;
    } else {
      const copybookProfile = new CopybookProfile(
        documentUri,
        copybook,
        dialectType,
        profile,
        quiet,
      );
      for (const item of this.queue) {
        if (copybookProfile.equals(item)) {
          return;
        }
      }
      this.queue.push(copybookProfile);
    }
  }

  public async pop(): Promise<CopybookProfile | undefined> {
    if (this.queue.length > 0) {
      return Promise.resolve(this.queue.pop());
    }
    return new Promise((resolve, reject) => {
      this.resolve = resolve;
    });
  }

  public get length(): number {
    return this.queue.length;
  }

  public clean(): void {
    this.queue = [];
  }

  public stop(): void {
    if (this.resolve) {
      this.resolve(undefined);
    }
  }
}
