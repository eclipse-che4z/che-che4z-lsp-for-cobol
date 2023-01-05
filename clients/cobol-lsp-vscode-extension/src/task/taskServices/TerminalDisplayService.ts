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
import { CRLF } from "../terminal/CustomBuildTaskTerminal";

export class TerminalDisplayService {
    async displaySpoolContent(spoolUri: vscode.Uri) {
     const doc =  await vscode.workspace.openTextDocument(spoolUri);
     this.writeEmitter.fire(`${doc.fileName}${CRLF}${doc.getText().split(new RegExp("\r\n?|\n")).join(CRLF)}${CRLF}`)
    }

    private static getPaddedString(str: string, maxLength: number = 13) {
        if (str.length >= maxLength) { return str; }
        return str + " ".repeat(maxLength - str.length);
    }

    private readonly STEP_SUMMARY_REGEX = /(IEF472I|IEF142I) \S{1,8} ((\S+ -)|(\S+ \S+)) (((COMPLETION CODE)|-) )?(-|STEP WAS EXECUTED) (.*|-) (.*$)/;

    private readonly CCODE_REGEX = /SYSTEM=(\S+) USER=(\S+)/;

    constructor(private writeEmitter: vscode.EventEmitter<string>) {
    }

    public displayJobSummary(jobSummary: Array<{ stepname: string; procstep: string; msg: string; retCode: string; reason: string; }>) {
        this.writeEmitter.fire(`${CRLF}\x1b[35mStep         StepName     ProcStep     Status       CCode        AbendRsn${CRLF}\x1b[34m${jobSummary
            .map((file, index) => {
                return `${TerminalDisplayService.getPaddedString(`${index + 1}`)}${TerminalDisplayService.getPaddedString(file.stepname)}${TerminalDisplayService.getPaddedString(file.procstep)}${TerminalDisplayService.getPaddedString(file.msg)}${TerminalDisplayService.getPaddedString(file.retCode)}${TerminalDisplayService.getPaddedString(file.reason)}`;
            })
            .join(`${CRLF}`)} ${CRLF}`);
    }

    public async displaySpoolFiles(spoolFiles: IJobFile[]) {
        this.writeEmitter.fire(`${CRLF}\x1b[35mSpool-id     DDname       Stepname     Procstep${CRLF}\x1b[34m${spoolFiles
            .map(file => {
                return `${TerminalDisplayService.getPaddedString(file.id.toString())}${TerminalDisplayService.getPaddedString(file.ddname)}${TerminalDisplayService.getPaddedString(file.stepname)}${TerminalDisplayService.getPaddedString(file.procstep ? file.procstep : "")}`;
            })
            .join(`${CRLF}`)} ${CRLF}`);
    }


    public displayCombinedTable(spoolFiles: IJobFile[], jobSummary: Array<{ stepname: string; procstep: string; msg: string; retCode: string; reason: string; }>) {
        this.writeEmitter.fire(`${CRLF}\x1b[35mSpool-id     DDname       Stepname     Procstep     Status       CCode        AbendRsn     ${CRLF}\x1b[34m${spoolFiles
            .map(file => {
                let str: string = "";
                const matchedSummary = jobSummary.filter(summary => file.stepname === summary.stepname && ((file.procstep || "") === summary.procstep))[0];
                if (matchedSummary) {
                    str = `${TerminalDisplayService.getPaddedString("----")}${TerminalDisplayService.getPaddedString("----")}${TerminalDisplayService.getPaddedString(file.stepname)}${TerminalDisplayService.getPaddedString(matchedSummary.procstep)}${TerminalDisplayService.getPaddedString(matchedSummary.msg)}${TerminalDisplayService.getPaddedString(matchedSummary.retCode)}${TerminalDisplayService.getPaddedString(matchedSummary.reason)}${CRLF}`;
                }
                return str + `${TerminalDisplayService.getPaddedString(file.id.toString())}${TerminalDisplayService.getPaddedString(file.ddname)}${TerminalDisplayService.getPaddedString(file.stepname)}${TerminalDisplayService.getPaddedString(file.procstep ? file.procstep : "")}${TerminalDisplayService.getPaddedString("")}${TerminalDisplayService.getPaddedString("")}${TerminalDisplayService.getPaddedString("")}`;
            })
            .join(`${CRLF}`)} ${CRLF}`);
    }

    public async getMessageFromJesMsg(spoolFiles: any, jesApi: IJes) {
        const sysPrintContent = await jesApi.getSpoolContentById(spoolFiles.jobname, spoolFiles.jobid, spoolFiles.id);
        return sysPrintContent.split("\n")
            .filter(str => str.match(this.STEP_SUMMARY_REGEX))
            .map(str => {
                const matches = str.match(this.STEP_SUMMARY_REGEX);
                let stepname = matches[2].split(" ")[0];
                let procstep = "";
                let msg: string;
                let retCode: string;
                let reason = "";
                if (!matches[2].includes("-")) {
                    stepname = matches[2].split(" ")[1];
                    procstep = matches[2].split(" ")[0];
                }

                if (matches[1] === "IEF472I") {
                    msg = "ABENDED";
                } else {
                    msg = "EXECUTED";
                }

                if (matches[9].includes("COND CODE")) {
                    retCode = matches[10];
                } else {
                    const retmatches = matches[9].match(this.CCODE_REGEX);
                    retCode = retmatches[1] !== "000" ? `S${retmatches[1]}` : `U${retmatches[2]}`;
                }

                if (retCode !== "0000") {
                    reason = matches[10];
                }

                return { stepname, procstep, msg, retCode, reason };
            });

    }
}
