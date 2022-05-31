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

import { IProfileLoaded } from "@zowe/imperative";
import { ZoweExplorerApi, ZoweVsCodeExtension } from "@zowe/zowe-explorer-api";
import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../services/Settings";
import { COMPILE_JCL_HEADER, COMPILE_JCL_MIDDLE, COMPILE_JCL_TAIL } from "./script/compile";

export class CustomBuildTaskTerminal implements vscode.Pseudoterminal {
    private ERROR_REGEX = "^\\s+([0-9]*)\\s+IGY[A-Z]{2}\\d{4}-([A-Z])\\s+(.*)$";
    private writeEmitter = new vscode.EventEmitter<string>();
    onDidWrite: vscode.Event<string> = this.writeEmitter.event;
    private closeEmitter = new vscode.EventEmitter<number>();
    onDidClose?: vscode.Event<number> = this.closeEmitter.event;

    constructor(private documentText: vscode.TextDocument, private definition: vscode.TaskDefinition) {
    }

    public open(_initialDimensions: vscode.TerminalDimensions | undefined): void {
        this.doCompile();
    }

    public close(): void {
    }

    private async doCompile(): Promise<void> {
        const zoweExplorerApi = ZoweVsCodeExtension.getZoweExplorerApi();
        let loadedProfile: IProfileLoaded;
        if (!zoweExplorerApi) {
            return Promise.reject("Please install zowe Explorer");
        }
        if (!(this.definition.steplib && this.definition.jobCard)) {
            return this.handleError({ message: "jobCard and steplib are mandatory. customize task and provide these attributed in task.json" });
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

    private async CompileCobolDocument(zoweExplorerApi: ZoweExplorerApi.IApiRegisterClient, loadedProfile: IProfileLoaded) {
        const jclToSubmit = this.getCompileJobJCL();
        const jesApi = zoweExplorerApi.getJesApi(loadedProfile);

        this.writeEmitter.fire("Submitting JCL ...\r\n");
        const submitJob = await jesApi.submitJcl(jclToSubmit);
        this.writeEmitter.fire(`JOB submitted. JOBID: ${submitJob.jobid} ...\r\n`);
        this.writeEmitter.fire(`Fetching result ...\r\n`);
        // TODO : Add a logic to not aggresively look for O/P
        let job = await jesApi.getJob(submitJob.jobid);
        do {
            job = await jesApi.getJob(submitJob.jobid);
        } while (!job.retcode);

        this.writeEmitter.fire(`JOB completed, return code: ${job.retcode} ...\r\n`);
        const sysPrintSpool = (await jesApi.getSpoolFiles(submitJob.jobname, submitJob.jobid))
            .filter(file => file.ddname === "SYSPRINT");
        const sysPrintContent = await jesApi.getSpoolContentById(submitJob.jobname, submitJob.jobid, sysPrintSpool[0].id);

        this.storeSysPrint(submitJob, sysPrintContent);
        this.writeEmitter.fire("Analysing output...\r\n");

        this.writeEmitter.fire(sysPrintContent.split("\n")
            .filter(str => str.match(this.ERROR_REGEX))
            .map(str => {
                const match = str.match(this.ERROR_REGEX);
                return `\x1b[4m\x1b[33m${this.documentText.uri.fsPath}:${match[1]}:7\x1b[24m\x1b[39m -72 - ${match[2]}: ${match[3]}`;
            })
            .join("\r\n"));
    }

    private storeSysPrint(submitJob: any, sysPrintContent: any) {
        if (this.definition.saveSysprint) {
            const fileLocation = this.definition.sysPrintLocation ? `${this.definition.sysPrintLocation}` : `${vscode.workspace.workspaceFolders[0].uri.fsPath}\\SYSPRINT`;
            if (!fs.existsSync(fileLocation)) {
                fs.mkdirSync(fileLocation, { recursive: true });
            }
            fs.writeFileSync(`${fileLocation}\\${submitJob.jobid}`, sysPrintContent);
            this.writeEmitter.fire(`SYSPRINT at \x1b[4m\x1b[33m${fileLocation}\\${submitJob.jobid}\x1b[24m\x1b[39m\r\n`);
        }
    }

    private getCompileJobJCL() {
        let jclToSubmit: string;
        const jobCard = fs.readFileSync(path.resolve(vscode.workspace.workspaceFolders[0].uri.fsPath, this.definition.jobCard)).toString();
        const steplibs = this.definition.steplib && this.definition.steplib.length > 0 ? this.generateLibs("STEPLIB", this.definition.steplib) : "//*";
        const syslibs = this.definition.syslib && this.definition.syslib.length > 0 ? this.generateLibs("SYSLIB", this.definition.syslib) : "//*";
        jclToSubmit = `${jobCard}\r\n${COMPILE_JCL_HEADER}\r\n${steplibs}\r\n${COMPILE_JCL_MIDDLE}\r\n${syslibs}\r\n${COMPILE_JCL_TAIL}\r\n${this.documentText.getText()}`;
        return jclToSubmit;
    }

    private generateLibs(libName: string, params: string[]) {
        return params.map((str, i) => {
            if (i === 0) {
                return `//${libName}  DD  DISP=SHR,DSN=${str}`;
            }
            return `//         DD  DISP=SHR,DSN=${str}`;
        }).join("\r\n");
    }

    private handleError(error: any) {
        this.writeEmitter.fire(`encountered error ...\r\n`);
        this.writeEmitter.fire(`${error.message}\r\n`);
        this.closeEmitter.fire(0);
        return Promise.reject(error.message);
    }
}
