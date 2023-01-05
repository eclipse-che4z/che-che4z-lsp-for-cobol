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
import { TerminalDisplayService } from "../../task/taskServices/TerminalDisplayService";
import { CRLF } from "../../task/terminal/CustomBuildTaskTerminal";

describe("TerminalDisplayService", () => {
    const writterEvent = jest.fn();
    const writeEmitter  = {
        fire: writterEvent,
    };
    const spoolContent = "SOME DUMMY TEXT\n" +
        "IEF142I JOBNAME L ASMCLG - STEP WAS EXECUTED - COND CODE 0000\n" +
        "IEFC001I PROCEDURE HLASMCL WAS EXPANDED USING SYSTEM LIBRARY SYS1.PROCLIB\n" +
        "SOME MORE DUMMY TEXT";
    const displayService = new TerminalDisplayService(writeEmitter as any);
    beforeEach(() => {
        (vscode.extensions as any) = {
            getExtension: jest.fn().mockReturnValue(
                {
                    exports: {
                        getExplorerExtenderApi: jest.fn().mockReturnValue({
                            getProfilesCache: jest.fn().mockReturnValue({
                                loadNamedProfile: jest.fn().mockReturnValue("testProfile"),
                            }),
                        }),
                    },
                },
            ),
        };

        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("testProfile"),
        });

        const openDoc = jest.fn();
        (vscode.workspace as any) = {
            openTextDocument: openDoc.mockResolvedValue(
                {getText: jest.fn().mockReturnValue("A DUMMY DOC FOR TEST"), fileName: "DUMMYFILE"}),
        };
    });

    afterEach(() => {
        jest.clearAllMocks();
    });

    it("checks spool content is displayed", async () => {
        await displayService.displaySpoolContent({
            path: "JOBID/DUMMY/12/SYSPRINT",
            scheme: "spool-file.reference",
        } as any);
        expect(writterEvent).toBeCalledTimes(1);
        expect(writterEvent).toBeCalledWith(`DUMMYFILE${CRLF}A DUMMY DOC FOR TEST${CRLF}`);
    });

    it("checks job summary is displayed", async () => {
        await displayService.displayJobSummary([{ stepname: "TEST-STEP", procstep: "PROC_TEST", msg: "JOB MSG", retCode: "000", reason: "TEST REASON" }]);
        expect(writterEvent).toBeCalledTimes(1);
        expect(writterEvent).toBeCalledWith(`${CRLF}\x1b[35mStep         StepName     ProcStep     Status       CCode        AbendRsn${CRLF}\x1b[34m1            TEST-STEP    PROC_TEST    JOB MSG      000          TEST REASON   ${CRLF}`);
    });

    it("checks spool files table is displayed", async () => {
        await displayService.displaySpoolFiles([{id: 1, jobid: "ID", jobname: "JOBNAME", ddname: "DD_NAME", stepname: "STEP NAME", procstep: "PROC"} as any,
        {id: 2, jobid: "ID2", jobname: "JOBNAME2", ddname: "DD_NAME2", stepname: "STEP NAME2", procstep: "PROC2"} as any]);
        expect(writterEvent).toBeCalledTimes(1);
        expect(writterEvent).toBeCalledWith(`${CRLF}\x1b[35mSpool-id     DDname       Stepname     Procstep${CRLF}\x1b[34m1            DD_NAME      STEP NAME    PROC         ${CRLF}2            DD_NAME2     STEP NAME2   PROC2         ${CRLF}`);
    });

    it("checks combined table is displayed", async () => {
        await displayService.displayCombinedTable([{id: 1, jobid: "ID", jobname: "JOBNAME", ddname: "DD_NAME", stepname: "STEP NAME", procstep: "PROC"} as any,
        {id: 2, jobid: "ID2", jobname: "JOBNAME2", ddname: "DD_NAME2", stepname: "STEP NAME2", procstep: "PROC2"} as any],
        [{ stepname: "STEP NAME", procstep: "PROC", msg: "JOB MSG", retCode: "008", reason: "TEST REASON" }]);
        expect(writterEvent).toBeCalledTimes(1);
        expect(writterEvent).toBeCalledWith(`${CRLF}\x1b[35mSpool-id     DDname       Stepname     Procstep     Status       CCode        AbendRsn     ${CRLF}\x1b[34m----         ----         STEP NAME    PROC         JOB MSG      008          TEST REASON  ${CRLF}1            DD_NAME      STEP NAME    PROC                                                ${CRLF}2            DD_NAME2     STEP NAME2   PROC2                                                ${CRLF}`);
    });

    it("check parsing of JESMSG", async () => {
        const result = await displayService.getMessageFromJesMsg(
        {id: 1, jobid: "ID", jobname: "JOBNAME", ddname: "DD_NAME", stepname: "STEP NAME", procstep: "PROC"} as any,
        {getSpoolContentById: jest.fn().mockResolvedValue(spoolContent)} as any);
        expect(result.length).toBe(1);
        expect(result[0].stepname).toBe("ASMCLG");
        expect(result[0].procstep).toBe("L");
        expect(result[0].msg).toBe("EXECUTED");
        expect(result[0].retCode).toBe("0000");
        expect(result[0].reason).toBe("");
    });
});
