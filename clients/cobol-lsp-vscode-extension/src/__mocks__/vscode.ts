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
    export function getConfiguration() { }
}

export namespace window {
    export let showErrorMessage = () => { };
    export let showInformationMessage = () => { };
    export let createStatusBarItem = () => { return { show: () => { } } };
    export let activeTextEditor= {document: {}};
}

export namespace TaskScope {
    export const Workspace = 2;
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

export enum ConfigurationTarget {
    Global = 1,
    Workspace = 2,
    WorkspaceFolder = 3
}

export enum EndOfLine {
    /**
     * The line feed `\n` character.
     */
    LF = 1,
    /**
     * The carriage return line feed `\r\n` sequence.
     */
    CRLF = 2
}

export const Range = jest.fn().mockImplementation((start, end) => { return { start: start, end: end } })
export const Position = jest.fn().mockImplementation((line, character) => { return { line: line, character: character } });

export interface TaskProvider {
    provideTasks(token: any): any;
    resolveTask(task: any, token: any): any;
}
export class CompletionItem {}
export class CodeLens { }
export class DocumentLink { }
export class TreeItem { }
export class CustomExecution {
    // @ts-ignore
    constructor(callback: (resolvedDefinition: any) => Thenable<any>);
}

export class Task {
    // @ts-ignore
    constructor(taskDefinition: any, scope: any, name: string, source: string, execution?: any,
                problemMatchers?: string | string[]);
}
export class EventEmitter {
    event: any;
    fire = (data: any) => {};
    dispose=()=> {};
}
