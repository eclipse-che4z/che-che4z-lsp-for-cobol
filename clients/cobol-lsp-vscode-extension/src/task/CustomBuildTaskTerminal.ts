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
import { ZoweExplorerApi } from "@zowe/zowe-explorer-api";
import * as fs from "fs";
import * as os from "os";
import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../services/Settings";
import { CobolCompileJobDefinition } from "./CompileTaskProvider";
import { CobolCompileJCLProvider } from "./jcl/CobolCompileJCLProvider";

export class CustomBuildTaskTerminal implements vscode.Pseudoterminal {
    private ERROR_REGEX = "^\\s+([0-9]*)\\s+IGY[A-Z]{2}\\d{4}-([A-Z])\\s+(.*)$";
    private writeEmitter = new vscode.EventEmitter<string>();
    private closeEmitter = new vscode.EventEmitter<number>();
    onDidWrite: vscode.Event<string> = this.writeEmitter.event;
    onDidClose?: vscode.Event<number> = this.closeEmitter.event;

    constructor(private documentText: vscode.TextDocument, private definition: CobolCompileJobDefinition) {
    }

    public open(_initialDimensions: vscode.TerminalDimensions | undefined): void {
        try {
            this.validateParams();
        } catch (error) {
            this.handleError(error).catch(err => {
                throw new Error(err);
            });
        }
        this.doCompile();
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
        throw new Error(`Invalid params provided. Steplib and Syslib has must have a max length of 44.${os.EOL}Correct/modify ${invalidParams}.`);
    }

    private async doCompile(): Promise<void> {
        const zoweExplorerApi: ZoweExplorerApi.IApiRegisterClient = vscode.extensions.getExtension("Zowe.vscode-extension-for-zowe")?.exports;
        let loadedProfile: IProfileLoaded;
        if (!zoweExplorerApi) {
            return this.handleError({ message: "Please install zowe Explorer" });
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
                resolve();
            } catch (error) {
                return this.handleError(error);
            }
        });
    }

    private async compileCobolDocument(zoweExplorerApi: ZoweExplorerApi.IApiRegisterClient, loadedProfile: IProfileLoaded) {
        const jclToSubmit = CobolCompileJCLProvider.getCompileJobJCL(this.definition);
        const jesApi = zoweExplorerApi.getJesApi(loadedProfile);
        this.writeEmitter.fire(`Submitting JCL ...${os.EOL}`);
        const submitJob = await jesApi.submitJcl(`${jclToSubmit}\r\n${this.documentText.getText()}`);
        this.writeEmitter.fire(`JOB submitted. JOBID: ${submitJob.jobid} ...${os.EOL}`);
        this.writeEmitter.fire(`Fetching result ...${os.EOL}`);
        // TODO : Add a logic to not aggresively look for O/P
        let job = await jesApi.getJob(submitJob.jobid);
        do {
            job = await jesApi.getJob(submitJob.jobid);
        } while (!job.retcode);

        this.writeEmitter.fire(`JOB completed, return code: ${job.retcode} ...${os.EOL}`);
        if (`${job.retcode}` !== "JCL ERROR") {
        const sysPrintSpool = (await jesApi.getSpoolFiles(submitJob.jobname, submitJob.jobid))
            .filter(file => file.ddname === "SYSPRINT");
        const sysPrintContent = await jesApi.getSpoolContentById(submitJob.jobname, submitJob.jobid, sysPrintSpool[0].id);

        this.writeEmitter.fire(`Analysing output...${os.EOL}`);

        this.writeEmitter.fire(sysPrintContent.split("\n")
            .filter(str => str.match(this.ERROR_REGEX))
            .map(str => {
                const match = str.match(this.ERROR_REGEX);
                return `\x1b[4m\x1b[33m${this.documentText.uri.fsPath}:${match[1]}:7\x1b[24m\x1b[39m -72 - ${match[2]}: ${match[3]}`;
            })
            .join(os.EOL));
        this.storeSysPrint(submitJob, sysPrintContent, loadedProfile.profile.host.split(".")[0]);
        }
    }

    private storeSysPrint(submitJob: any, sysPrintContent: any, hostname: string) {
        if (this.definition.saveListing) {
            const defaultLocation = path.join(`${vscode.workspace.workspaceFolders[0].uri.fsPath}`, ".c4z", "listings", `${hostname}`);
            const fileLocation = this.definition.listingLocation ? `${this.definition.listingLocation}` : defaultLocation;
            if (!fs.existsSync(fileLocation)) {
                fs.mkdirSync(fileLocation, { recursive: true });
            }
            fs.writeFileSync(`${fileLocation}${path.sep}${submitJob.jobid}`, sysPrintContent);
            this.writeEmitter.fire(os.EOL);
            this.writeEmitter.fire(`SYSPRINT at \x1b[4m\x1b[33m${fileLocation}${path.sep}${submitJob.jobid}\x1b[24m\x1b[39m${os.EOL}`);
        }
    }

    private handleError(error: any, callback?: () => void) {
        this.writeEmitter.fire(`\x1b[1m\x1b[31mencountered error ...${os.EOL}`);
        this.writeEmitter.fire(`\x1b[31m${error.message}${os.EOL}`);
        this.closeEmitter.fire(0);
        if (typeof callback !== "undefined") { callback(); }
        return Promise.reject(error.message);
    }
}
