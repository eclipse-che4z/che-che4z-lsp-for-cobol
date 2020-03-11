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

export interface CopybookProfile {
    copybook: string;
    profile: string;
}

export class DownloadQueue {
    private queue: CopybookProfile[] = [];
    private resolve: any;

    public push(copybook: string, profile: string): void {
        if (this.resolve) {
            const r = this.resolve;
            this.resolve = undefined;
            r({ copybook, profile });
        } else {
            this.queue.push({ copybook, profile });
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

    public stop(): void {
        if (this.resolve) {
            this.resolve(undefined);
        }
    }
}
