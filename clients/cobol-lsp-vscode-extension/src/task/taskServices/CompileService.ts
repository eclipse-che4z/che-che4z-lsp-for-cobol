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
import { SettingsService } from "../../services/Settings";
import { Utils } from "../../services/util/Utils";
import { CobolCompileJCLProvider } from "../jcl/CobolCompileJCLProvider";
import { CobolCompileJobDefinition } from "../providers/CompileTaskProvider";
import SpoolContentProvider from "../providers/SpoolContentProvider";
import { CRLF } from "../terminal/CustomBuildTaskTerminal";
import { TerminalDisplayService } from "./TerminalDisplayService";

export class CompileService {
    private ERROR_REGEX = "^\\s+([0-9]*)\\s+IGY[A-Z]{2}\\d{4}-([A-Z])\\s+(.*)$";
    private displayService = new TerminalDisplayService(this.writeEmitter);
    private jobContext: Map<string, { jobname: string, jobid: string, spoolid: number }> = new Map();

    constructor(private writeEmitter: vscode.EventEmitter<string>,
        private closeEmitter: vscode.EventEmitter<number>,
        private definition: CobolCompileJobDefinition,
        private documentText: vscode.TextDocument) {
    }
    public async doCompile(): Promise<void> {
        const zoweExplorerApi = Utils.getZoweExplorerAPI();
        let loadedProfile: IProfileLoaded;
        if (!zoweExplorerApi) {
            return this.handleError({ message: "Please install Zowe Explorer" });
        }
        if (typeof this.definition?.jobCard === "undefined" || this.definition.jobCard.length === 0) {
            return this.handleError({ message: "jobCard is missing. Update the task configuration in task.json ." });
        }

        try {
            const zoweProfile = SettingsService.getProfileName();
            if (!zoweProfile) {
                return this.handleError(
                    { message: "Please specify zowe profile for copybook download in settings." }, () => {
                        vscode.commands.executeCommand("workbench.action.openSettings", "cobol-lsp.cpy-manager.profiles");
                    });
            }
            loadedProfile = zoweExplorerApi
                .getExplorerExtenderApi()
                .getProfilesCache()
                .loadNamedProfile(zoweProfile);
        } catch (error) {
            return this.handleError(error);
        }

        return new Promise<void>(async resolve => {
            try {
                await this.compileCobolDocument(zoweExplorerApi, loadedProfile);
                this.closeEmitter.fire(0);
                const selection = await vscode.window.showInformationMessage("Compilation completed.", "Show Listing");
                if (selection === "Show Listing") {
                    vscode.workspace.openTextDocument(this.generateUri(this.definition.listingFile.ddname, this.definition.listingFile.spoolid)).then(doc => vscode.window.showTextDocument(doc));
                }
                resolve();
            } catch (error) {
                return this.handleError(error);
            }
        });
    }
    private async compileCobolDocument(zoweExplorerApi: IApiRegisterClient, loadedProfile: IProfileLoaded) {
        const jclToSubmit = CobolCompileJCLProvider.getCompileJobJCL(this.definition, this.documentText.getText());
        const jesApi = zoweExplorerApi.getJesApi(loadedProfile);
        this.writeEmitter.fire(`Submitting JCL ...${CRLF}`);
        const submitJob = await jesApi.submitJcl(jclToSubmit);
        this.writeEmitter.fire(`JOB submitted, ${submitJob.jobname} ${submitJob.jobid} ...${CRLF}`);
        this.writeEmitter.fire(`Fetching result ...${CRLF}`);
        let job = await jesApi.getJob(submitJob.jobid);
        job = await this.getJobStatus(0, 0, job, jesApi, submitJob);
        this.writeEmitter.fire(`\x1b[32mJOB completed, return code: ${job.retcode} ...${CRLF}`);
        if (`${job.retcode}` !== "JCL ERROR") {
            const spoolFiles = await jesApi.getSpoolFiles(submitJob.jobname, submitJob.jobid);
            const jesMsg = spoolFiles.filter(file => file.ddname === "JESYSMSG")[0];
            const jobSummary = await this.displayService.getMessageFromJesMsg(jesMsg, jesApi);
            this.createJobContext(spoolFiles);
            if (this.definition.stepSummary) {
                await this.displayService.displayJobSummary(jobSummary);
            }
            if (this.definition.listFiles) {
                await this.displayService.displaySpoolFiles(spoolFiles);
            }
            if (this.definition.combineSummaryNListing) {
                await this.displayService.displayCombinedTable(spoolFiles, jobSummary);
            }
            if (this.definition.printFile?.length > 0) {
                for (const spoolId of this.definition.printFile) {
                    // display spool content
                    const spool = spoolFiles.filter(file => file.id === spoolId)[0];
                    const spoolUri = this.generateUri(spool.ddname, spool.id, spool.jobid, spool.jobname);
                    await this.displayService.displaySpoolContent(spoolUri);
                }
            }
            const sysPrintSpool = spoolFiles.filter(file => (this.definition.listingFile.ddname ? (file.ddname === this.definition.listingFile.ddname) : true)
                && (this.definition.listingFile.procstep ? (file.procstep === this.definition.listingFile.procstep) : true)
                && (this.definition.listingFile.stepname ? (file.stepname === this.definition.listingFile.stepname) : true)
                && (this.definition.listingFile.spoolid ? (file.id === this.definition.listingFile.spoolid) : true));
            const sysPrintContent = await jesApi.getSpoolContentById(submitJob.jobname, submitJob.jobid, sysPrintSpool[0].id);
            this.writeEmitter.fire(sysPrintContent.split("\n")
                .filter(str => str.match(this.ERROR_REGEX))
                .map(str => {
                    const match = str.match(this.ERROR_REGEX);
                    return `\x1b[4m\x1b[33m${this.documentText.uri.fsPath}:${match[1]}:7\x1b[24m\x1b[39m -72 - ${match[2]}: ${match[3]}`;
                })
                .join(CRLF));
            this.writeEmitter.fire(CRLF);
        }
    }

    private createJobContext(spoolFiles: IJobFile[]) {
        spoolFiles
            .map(file => {
                this.jobContext.set(file.ddname, { jobid: file.jobid, jobname: file.jobname, spoolid: file.id });
            });
    }

    private async getJobStatus(counter: number, delay: number, job, jesApi: IJes, submitJob) {
        counter++;
        if (counter % 3 === 0) {
            const n = counter / 3;
            delay = delay + n * 1000;
        }
        if (job.retcode) {
            return job;
        } else {
            job = await jesApi.getJob(submitJob.jobid);
            return await new Promise(resolve => {
                setTimeout(resolve, delay);
            }).then(_e => this.getJobStatus(counter, delay, job, jesApi, submitJob));
        }
    }

    public handleError(error: any, callback?: () => void) {
        this.writeEmitter.fire(`\x1b[1m\x1b[31mencountered error ...${CRLF}`);
        this.writeEmitter.fire(`\x1b[31m${error.message.split(new RegExp("\r\n?|\n")).join(CRLF)}${CRLF}`);
        this.closeEmitter.fire(0);
        if (typeof callback !== "undefined") { callback(); }
        return Promise.reject(error.message);
    }

    public generateUri(spoolName: string, spoolid?: number, jobid?: string, jobname?: string): vscode.Uri {
        if (jobid && jobname && spoolName && spoolid) {
            return vscode.Uri.from({ scheme: SpoolContentProvider.scheme, path: `${jobid}/${jobname}/${spoolid}/${spoolName}` });
        }
        const stepContext = this.jobContext.get(spoolName);
        if (stepContext) {
            return vscode.Uri.from({
                scheme: SpoolContentProvider.scheme,
                path: `${stepContext.jobid}/${stepContext.jobname}/${spoolid || stepContext.spoolid}/${spoolName}`
            });
        } else {
            return null;
        }
    }

}
