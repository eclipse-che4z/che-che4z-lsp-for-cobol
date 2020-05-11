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

import * as fs from "fs";
import {URL} from "url";
import {LocalCopybookResolver} from "./settings/LocalCopybookResolver";

export class Prioritizer {
    private settingsParser: LocalCopybookResolver = new LocalCopybookResolver();
    private localCpyURI: string[];
    private notLocalCpy: string[];

    public setLocalCpyURI(localCpy: string[]) {
        this.localCpyURI = localCpy;
    }

    public getLocalCpyURI(): string[] {
        return this.localCpyURI;
    }

    public setNotLocalCpy(notLocalCpy: string[]) {
        this.notLocalCpy = notLocalCpy;
    }

    public getNotLocalCpy(): string[] {
        return this.notLocalCpy;
    }

    public checkCopybooksPresentLocal(copybooks: string[], listUri: string[]) {
        const resolvedUri: string[] = this.settingsParser.resolve(listUri);
        const copybooksPath: string[] = [];
        const notLocal: string[] = [];
        copybooks.forEach(copybook => {
            const copybookPath: string = this.copybookInLocal(copybook, resolvedUri);
            if (copybookPath) {
                copybooksPath.push(copybookPath);
            } else {
                notLocal.push(copybook);
            }
        });
        this.setNotLocalCpy(notLocal);
        this.setLocalCpyURI(copybooksPath);
    }

    private copybookInLocal(copybook: string, resolvedUri: string[]): string {
        let finalUri: URL;
        resolvedUri.forEach(uri => {
            const url = new URL(uri);
            if (uri.includes(copybook) && fs.existsSync(url)) {
                finalUri = url;
            }
        });
        return finalUri ? finalUri.href : null;
    }

}
