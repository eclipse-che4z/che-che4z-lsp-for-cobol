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
import * as url from "url";

// tslint:disable: no-namespace no-empty
export namespace workspace {
    export const workspaceFolders: [] = [];
    export function getConfiguration() {}
}

export namespace window {
    export let showErrorMessage = () => {};
    export let showInformationMessage = () => {};
    export let createStatusBarItem = () => { return { show: () => { } } };
}
export enum StatusBarAlignment {
    Right,
}

export class Uri {
    static file(path: string): Uri {
        const result: Uri = new Uri();
        result.toString = () => url.pathToFileURL(path).toString();
        return result;
    }
}
