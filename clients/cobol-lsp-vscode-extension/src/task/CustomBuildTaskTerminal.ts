import { ZoweVsCodeExtension } from "@zowe/zowe-explorer-api";
import * as vscode from "vscode";
import { SettingsService } from "../services/Settings";

export class CustomBuildTaskTerminal implements vscode.Pseudoterminal {
    private writeEmitter = new vscode.EventEmitter<string>();
    onDidWrite: vscode.Event<string> = this.writeEmitter.event;
    private closeEmitter = new vscode.EventEmitter<number>();
    onDidClose?: vscode.Event<number> = this.closeEmitter.event;

    constructor(private currentFilePath, private definition) {
    }

    public open(_initialDimensions: vscode.TerminalDimensions | undefined): void {
        this.doCompile();
    }

    public close(): void {
    }

    private async doCompile(): Promise<void> {
        const zoweExplorerApi = ZoweVsCodeExtension.getZoweExplorerApi();
        let loadedProfile;
        if (!zoweExplorerApi) {
            return Promise.reject("Please install zowe Explorer");
        }
        if (!(this.definition.cobolDatatSet && this.definition.compileJclDataSet)) {
            return this.handleError({ message: "cobolDatatSet and compileJclDataSet are mandatory. customize task and provide these attributed in task.json" });
        }

        try {
            loadedProfile = zoweExplorerApi
                .getExplorerExtenderApi()
                .getProfilesCache()
                .loadNamedProfile(SettingsService.getProfileName());
        } catch (error) {
            return this.handleError(error);
        }

        return new Promise<void>(async resolve => {
            try {
                await this.CompileCobolDocument(zoweExplorerApi, loadedProfile);
                this.closeEmitter.fire(0);
                resolve();
            } catch (error) {
                return this.handleError(error);
            }
        });
    }

    private async CompileCobolDocument(zoweExplorerApi, loadedProfile: any) {
        const mvsApi = zoweExplorerApi.getMvsApi(loadedProfile);
        const jesApi = zoweExplorerApi.getJesApi(loadedProfile);
        this.writeEmitter.fire("Starting file upload...\r\n");
        await mvsApi.putContents(this.currentFilePath, this.definition.cobolDatatSet);
        this.writeEmitter.fire("File upload Success...\r\n");
        this.writeEmitter.fire("Submitting remote JCL ...\r\n");
        const submitJob = await jesApi.submitJob(this.definition.compileJclDataSet);
        this.writeEmitter.fire("JOB submitted ...\r\n");
        // TODO : Add a logic to not aggresively look for O/P
        let job = await jesApi.getJob(submitJob.jobid);
        do {
            job = await jesApi.getJob(submitJob.jobid);
        } while (!job.retcode);
        this.writeEmitter.fire(`JOB completed, return code: ${job.retcode} ...\r\n`);
        const sysPrintSpool = (await jesApi
            .getSpoolFiles(submitJob.jobname, submitJob.jobid)).filter(file => file.
            ddname === "SYSPRINT");
        const sysPrintContent = await jesApi
            .getSpoolContentById(submitJob.jobname, submitJob.jobid, sysPrintSpool[0].id);
        this.writeEmitter.fire("Analysing output...\r\n");
        this.writeEmitter.fire(`FILENAME:@${vscode.workspace.asRelativePath(this.currentFilePath)}@\r\n`);
        this.writeEmitter.fire(sysPrintContent.split("\n")
            .filter(str => str.match("^\\s+([0-9]*)\\s+IGY[A-Z]{2}\\d{4}-([A-Z])\\s+(.*)$"))
            .join("\r\n"));
    }

    private handleError(error: any) {
        this.writeEmitter.fire(`encountered error ...\r\n`);
        this.writeEmitter.fire(`${error.message}\r\n`);
        this.closeEmitter.fire(0);
        return Promise.reject(error.message);
    }
}
