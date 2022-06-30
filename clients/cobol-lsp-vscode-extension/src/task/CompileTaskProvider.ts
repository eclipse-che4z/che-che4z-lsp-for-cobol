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
import {taskType} from "../extension";
import { CustomBuildTaskTerminal } from "./CustomBuildTaskTerminal";

const TASK_DETAIL = "compile with IBM Enterprise COBOL for z/OS";
export class CompileTaskProvider implements vscode.TaskProvider {
    public static taskSource = "cobol";
    public static problemMatcher = "$zowecc";
    public static taskProviderName = "compile";
    private cobolCompileTasks?: Thenable<vscode.Task[]> = undefined;

    public resolveTask(_task: vscode.Task, _token: vscode.CancellationToken): vscode.ProviderResult<vscode.Task> {
        const jobCard = _task.definition.jobCard;
        if (jobCard) {
            // resolveTask requires that the same definition object be used.
            const definition = _task.definition as any;
            const documentText = vscode.window.activeTextEditor.document;

            return new vscode.Task(
                definition,
                vscode.TaskScope.Workspace,
                CompileTaskProvider.taskProviderName,
                CompileTaskProvider.taskSource,
                new vscode.CustomExecution(async () => new CustomBuildTaskTerminal(documentText, definition)),
                CompileTaskProvider.problemMatcher,
            );
        }
        return undefined;
    }

    public provideTasks(_token: vscode.CancellationToken): vscode.ProviderResult<vscode.Task[]> {
        if (!this.cobolCompileTasks) {
            this.cobolCompileTasks = this.getCompileTask();
        }
        return this.cobolCompileTasks;
    }

    private async getCompileTask(): Promise<vscode.Task[]> {
        const result: vscode.Task[] = [];
        const documentText = undefined;
        const definition: vscode.TaskDefinition = {
            type: taskType,
        };
        const task = new vscode.Task(definition, vscode.TaskScope.Workspace, CompileTaskProvider.taskProviderName,
            CompileTaskProvider.taskSource,
            new vscode.CustomExecution(async () => new CustomBuildTaskTerminal(documentText, definition)),
            CompileTaskProvider.problemMatcher);
        task.detail = TASK_DETAIL;
        result.push(task);
        return result;
    }

}
