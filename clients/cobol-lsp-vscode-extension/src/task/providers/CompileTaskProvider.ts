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
import {taskType} from "../../extension";
import { CustomBuildTaskTerminal } from "../terminal/CustomBuildTaskTerminal";
import { CobolTerminalLink } from "./TerminalLinkProvider";

const TASK_DETAIL = "compile with IBM Enterprise COBOL for z/OS";
export class CompileTaskProvider implements vscode.TaskProvider {
    public static taskSource = "cobol";
    public static problemMatcher = "$enterprise-cobol";
    public static taskProviderName = "compile";
    private cobolCompileTasks?: Thenable<CobolCompileTask[]> = undefined;
    private terminalTask: CustomBuildTaskTerminal;

    public resolveTask(task: CobolCompileTask, _token: vscode.CancellationToken): vscode.ProviderResult<CobolCompileTask> {
        const definition: CobolCompileJobDefinition = task.definition;
                // resolveTask requires that the same definition object be used.
        const documentText = vscode.window.activeTextEditor.document;
        this.terminalTask = new CustomBuildTaskTerminal(documentText, definition);
        return new CobolCompileTask(
                    definition,
                    vscode.TaskScope.Workspace,
                    CompileTaskProvider.taskProviderName,
                    CompileTaskProvider.taskSource,
                    new vscode.CustomExecution(async () => this.terminalTask),
                    CompileTaskProvider.problemMatcher,
                );
    }

    public provideTasks(_token: vscode.CancellationToken): vscode.ProviderResult<CobolCompileTask[]> {
        if (!this.cobolCompileTasks) {
            this.cobolCompileTasks = this.getCompileTask();
        }
        return this.cobolCompileTasks;
    }

    public generateUri(link: CobolTerminalLink) {
        if (this.terminalTask) {
            return this.terminalTask.generateUri(link.data.link, link.data.spoolId);
        }
        return null;
    }

    private async getCompileTask(): Promise<CobolCompileTask[]> {
        const result: CobolCompileTask[] = [];
        const documentText = undefined;
        const definition: CobolCompileJobDefinition = {
            jobCard: [],
            type: taskType,
        };
        const task = new CobolCompileTask(definition, vscode.TaskScope.Workspace, CompileTaskProvider.taskProviderName,
            CompileTaskProvider.taskSource,
            new vscode.CustomExecution(async () => new CustomBuildTaskTerminal(documentText, definition)),
            CompileTaskProvider.problemMatcher);
        task.detail = TASK_DETAIL;
        result.push(task);
        return result;
    }

}

export interface CobolCompileJobDefinition extends vscode.TaskDefinition {
    jobCard: string[];
    steplib?: string[];
    syslib?: string[];
    compilerOptions?: string[];
    unit?: string;
    listingFile?: {stepname?: string, ddname?: string, procstep?: string, spoolid?: number};
    printFile?: number[] ;
}

export class CobolCompileTask extends vscode.Task {
     public definition: CobolCompileJobDefinition;
}
