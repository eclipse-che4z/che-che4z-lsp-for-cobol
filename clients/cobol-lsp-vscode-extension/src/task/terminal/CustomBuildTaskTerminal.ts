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
import { CobolCompileJobDefinition } from "../providers/CompileTaskProvider";
import { CompileService } from "../taskServices/CompileService";

export const CRLF = "\r\n";
export class CustomBuildTaskTerminal implements vscode.Pseudoterminal {

    private writeEmitter = new vscode.EventEmitter<string>();
    private closeEmitter = new vscode.EventEmitter<number>();
    onDidWrite: vscode.Event<string> = this.writeEmitter.event;
    onDidClose?: vscode.Event<number> = this.closeEmitter.event;
    private compileService: CompileService;

    constructor(private documentText: vscode.TextDocument, private definition: CobolCompileJobDefinition) {
        this.compileService = new CompileService(this.writeEmitter, this.closeEmitter, this.definition, this.documentText)
    }

    public open(_initialDimensions: vscode.TerminalDimensions | undefined): void {
        try {
            this.validateParams();
        } catch (error) {
            this.compileService.handleError(error).catch(err => {
                throw new Error(err);
            });
        }
        this.compileService.doCompile();
    }

    public close(): void {
    }

    private validateParams() {
        const invalidSyslib = this.definition.syslib?.filter(str => str.length > 44);
        const invalidSteplib = this.definition.steplib?.filter(str => str.length > 44);
        if ((invalidSyslib ? invalidSyslib.length === 0 : true) && (invalidSteplib ? invalidSteplib.length === 0 : true)) {
            return;
        }
        const invalidParams = (invalidSyslib ? invalidSyslib?.join(", ") : "") + (invalidSteplib ? invalidSteplib?.join(", ") : "");
        throw new Error(`Invalid params provided. Steplib and Syslib has must have a max length of 44.${CRLF}Correct/modify ${invalidParams}.`);
    }

    public generateUri(spoolName: string, spoolid?: number, jobid?: string, jobname?: string): vscode.Uri {
        return this.compileService.generateUri(spoolName, spoolid, jobid, jobname);
    }
}
