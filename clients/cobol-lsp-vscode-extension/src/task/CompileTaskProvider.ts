import * as vscode from "vscode";
import { CustomBuildTaskTerminal } from "./CustomBuildTaskTerminal";

export class CompileTaskProvider implements vscode.TaskProvider {
    public static taskSource = "cobolCompile";
    public static problemMatcher = "$zowecc";
    public static taskProviderName = "Cobol LS";
    private cobolCompileTasks?: Thenable<vscode.Task[]> = undefined;

    public resolveTask(_task: vscode.Task, _token: vscode.CancellationToken): vscode.ProviderResult<vscode.Task> {
        const cobolDataSet = _task.definition.cobolDatatSet;
        const compileJclDataSet = _task.definition.compileJclDataSet;
        if (compileJclDataSet && cobolDataSet) {
            // resolveTask requires that the same definition object be used.
            const definition = _task.definition as any;
            const currentFilePath = vscode.window.activeTextEditor.document.uri.fsPath;

            return new vscode.Task(
                definition,
                vscode.TaskScope.Workspace,
                CompileTaskProvider.taskProviderName,
                CompileTaskProvider.taskSource,
                new vscode.CustomExecution(async () => new CustomBuildTaskTerminal(currentFilePath, definition)),
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
        const currentFilePath = "";
        const definition: vscode.TaskDefinition = {
            type: CompileTaskProvider.taskSource,
        };
        result.push(new vscode.Task(definition, vscode.TaskScope.Workspace, CompileTaskProvider.taskProviderName,
            CompileTaskProvider.taskSource,
            new vscode.CustomExecution(async () => new CustomBuildTaskTerminal(currentFilePath, definition)),
            CompileTaskProvider.problemMatcher));
        return result;
    }

}
