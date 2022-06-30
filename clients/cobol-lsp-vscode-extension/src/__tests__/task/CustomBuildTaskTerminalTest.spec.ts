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

import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import { CustomBuildTaskTerminal } from "../../task/CustomBuildTaskTerminal";

const jobCard: string = "jobCard";
let taskTerminal: CustomBuildTaskTerminal;
const writterEvent = jest.fn();
const closeEvent = jest.fn();
let jobcardFilePath;
beforeAll(() => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue("testProfile"),
    });
    const fsPath = ".";
    (vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath } } as any];
});

afterAll(() => {
    jest.clearAllMocks();
    if (fs.existsSync(jobcardFilePath)) {
        fs.remove(jobcardFilePath);
    }
});

afterEach(() => jest.clearAllMocks());

describe("CustomBuildTaskTerminal Test", () => {
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
                        getJesApi: jest.fn().mockReturnValue({
                            getJob: jest.fn().mockReturnValue({
                                retcode: "000",
                            }),
                            getSpoolContentById: jest.fn().mockReturnValue("0LineID  Message code  Message text\n" +
                                "\n" +
                                "     91  IGYGR1216-I   A \"RECORDING MODE\" of \"F\" was assumed for file \"PRINT-FILE\".\n" +
                                "\n" +
                                "     93  IGYGR1174-S   \"XXXXX084\" was not defined as a data-name.  \"XXXXX084\" was discarded.\n" +
                                "\n" +
                                "   1151  IGYPA3086-W   \"PERFORM\" start-of-range \"PROC-213-PFM-G-15\" follows the \"PERFORM\" end-of-range \"PROC-217-PFM-B-15\".  The\n" +
                                "                       \"PERFORM\" end-of-range may be unreachable.  The statement was processed as written."),
                            getSpoolFiles: jest.fn().mockReturnValue([{
                                ddname: "SYSPRINT",
                                id: "spoolID",
                            }]),
                            submitJcl: jest.fn().mockReturnValue({
                                jobid: "jobid",
                                jobname: "jobname",
                            }),
                        }),
                    },
                },
            ),
        };

        taskTerminal = new CustomBuildTaskTerminal({ fileName: "filename" } as any, {
            jobCard,
            steplib: "steplib",
            type: "testTask",
        });

    });

    it("initializes CustomBuildTaskTerminal properly", () => {
        const mockCompileFunction = jest.fn();
        (taskTerminal as any).doCompile = mockCompileFunction;
        taskTerminal.open(undefined);
        expect(mockCompileFunction).toBeCalledTimes(1);
    });

    it("returns with error when ZE is not installed", async () => {
        (vscode.extensions as any) = {
            getExtension : jest.fn().mockReturnValue(undefined),
        };

        await (taskTerminal as any).doCompile().catch(e => {
            expect(e).toEqual("Please install zowe Explorer");
        });
    });

    it("returns with error when ZE profile is not found", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(""),
        });
        await (taskTerminal as any).doCompile().catch(e => {
            expect(e).toEqual("Please specify zowe profile for copybook download for the task to run.");
        });
    });

    it("return with error when jobCard and steplib is not provided", async () => {
        const incompleteTask = new CustomBuildTaskTerminal({ fileName: "filename" } as any, {
            type: "testTask",
        });
        await (incompleteTask as any).doCompile().catch(e => {
            expect(e).toEqual("jobCard is mandatory. customize task and provide these attributed in task.json");
        });
    });

    it("checks compile works when all data is provided", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("testProfile"),
        });
        (taskTerminal as any).CompileCobolDocument = jest.fn().mockResolvedValue("TEST");
        await expect((taskTerminal as any).doCompile()).resolves.not.toThrowError();
    });

    it("checks proper flow of task", async () => {
        const loadedProfile: any = {};
        const task = new CustomBuildTaskTerminal({ fileName: "filename" } as any, {
            jobCard,
            steplib: ["steplib1", "steplib2"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
        });
        (task as any).storeSysPrint = jest.fn();
        (task as any).getCompileJobJCL = jest.fn().mockReturnValue("JCL TO SUBMIT");
        (task as any).documentText = {
            getText: jest.fn().mockReturnValue("THIS IS A DUMMY COBOL PRGM."),
            uri: {
                fsPath: "documentUri",
            },
        };
        (task as any).writeEmitter = {
            fire: writterEvent,
        };

        (task as any).closeEmitter = {
            fire: closeEvent,
        };
        await (task as any).CompileCobolDocument(vscode.extensions.getExtension("Zowe.vscode-extension-for-zowe")?.exports, loadedProfile);
        expect(writterEvent).toBeCalledTimes(6);
    });

    it("checks proper JCL is formed for compile job", async () => {
        jobcardFilePath = path.resolve(vscode.workspace.workspaceFolders[0].uri.fsPath, jobCard);
        await fs.writeFileSync(jobcardFilePath, "JOBCARD");

        const expectedJCL = "JOBCARD\r\n" +
            "//*\n" +
            "//*  COBOL LIBRARIES\n" +
            "//*\n" +
            "//*\n" +
            "//******************************************************************\n" +
            "//*  COMP - COMPILE THE COBOL PROGRAM\n" +
            "//******************************************************************\n" +
            "//*\n" +
            "//COMP     EXEC PGM=IGYCRCTL,REGION=0M\n" +
            "//*  PARM=('LIST,APOST,NOSEQ,LIST,MAP,XREF,SOURCE,LP(64)')\n" +
            "//*  PARM=('LIST,APOST,NOSEQ,LIST,MAP,XREF,SOURCE,DATA(24)')\r\n" +
            "//STEPLIB  DD  DISP=SHR,DSN=steplib1\r\n" +
            "//         DD  DISP=SHR,DSN=steplib2\r\n" +
            "//SYSUT1   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT2   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT3   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT4   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT5   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT6   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT7   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT8   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT9   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT10  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT11  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT12  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT13  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT14  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSUT15  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSMDECK DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\n" +
            "//SYSPRINT DD  SYSOUT=*\n" +
            "//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),\n" +
            "//             UNIT=SYSDA,SPACE=(400,(2000,200))\r\n" +
            "//SYSLIB  DD  DISP=SHR,DSN=syslib1\r\n" +
            "//         DD  DISP=SHR,DSN=syslib2\r\n" +
            "//SYSUDUMP DD  SYSOUT=*\n" +
            "//SYSPUNCH DD  DUMMY\n" +
            "//SYSIN    DD  * \r\n" +
            "THIS IS A DUMMY COBOL PRGM.";

        const task = new CustomBuildTaskTerminal({fileName: "filename"} as any, {
            jobCard,
            steplib: ["steplib1", "steplib2"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
        });
        (task as any).storeSysPrint = jest.fn();
        (task as any).documentText = {
            getText: jest.fn().mockReturnValue("THIS IS A DUMMY COBOL PRGM."),
            uri: {
                fsPath: "documentUri",
            },
        };
        (task as any).writeEmitter = {
            fire: writterEvent,
        };

        (task as any).closeEmitter = {
            fire: closeEvent,
        };
        const JCL = (task as any).getCompileJobJCL();
        expect(JCL).toEqual(expectedJCL);
    });
});
