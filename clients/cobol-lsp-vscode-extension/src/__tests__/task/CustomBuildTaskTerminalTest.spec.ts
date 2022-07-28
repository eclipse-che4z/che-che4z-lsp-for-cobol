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

import * as os from "os";
import * as vscode from "vscode";
import { CobolCompileJobDefinition } from "../../task/CompileTaskProvider";
import { CRLF, CustomBuildTaskTerminal } from "../../task/CustomBuildTaskTerminal";
import {CobolCompileJCLProvider} from "../../task/jcl/CobolCompileJCLProvider";

const jobCard: string[] = ["jobCard"];
const docText = { fileName: "filename", getText: jest.fn().mockReturnValue("DUMMY TEXT"), uri: { fsPath: "tmp-ws" } };
let taskTerminal: CustomBuildTaskTerminal;
const writterEvent = jest.fn();
const closeEvent = jest.fn();
beforeAll(() => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue("testProfile"),
    });
    const fsPath = ".";
    (vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath } } as any];
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

        taskTerminal = new CustomBuildTaskTerminal(docText as any, {
            jobCard,
            steplib: ["steplib"],
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
            getExtension: jest.fn().mockReturnValue(undefined),
        };

        await (taskTerminal as any).doCompile().catch(e => {
            expect(e).toEqual("Please install Zowe Explorer");
        });
    });

    it("returns with error when ZE profile is not found", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(""),
        });
        (vscode.commands as any) = {
            executeCommand: jest.fn().mockReturnValue(undefined),
        };
        await (taskTerminal as any).doCompile().catch(e => {
            expect(e).toEqual("Please specify zowe profile for copybook download in settings.");
        });
    });

    it("return with error when jobCard is not provided", async () => {
        const incompleteTask = new CustomBuildTaskTerminal(docText as any, {
            type: "testTask",
            jobCard: [],
        });
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("testProfile"),
        });
        await (incompleteTask as any).doCompile().catch(e => {
            expect(e).toEqual("jobCard is missing. Update the task configuration in task.json .");
        });
    });

    it("checks compile works when all data is provided", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("testProfile"),
        });
        (taskTerminal as any).compileCobolDocument = jest.fn().mockReturnValue("TEST");
        await expect((taskTerminal as any).doCompile()).resolves.not.toThrowError();
    });

    it("checks proper flow of task", async () => {
        const loadedProfile: any = { profile: { host: "testHost.company.com" } };
        const task = new CustomBuildTaskTerminal(docText as any, {
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
        await (task as any).compileCobolDocument(vscode.extensions.getExtension("Zowe.vscode-extension-for-zowe")?.exports, loadedProfile);
        expect(writterEvent).toBeCalledTimes(6);
    });

    it("checks proper JCL is formed for compile job", async () => {

        const expectedJCL = "jobCard\r\n" +
            "//*\r\n" +
            "//*  COBOL LIBRARIES\r\n" +
            "//*\r\n" +
            "//*\r\n" +
            "//******************************************************************\r\n" +
            "//*  COMP - COMPILE THE COBOL PROGRAM\r\n" +
            "//******************************************************************\r\n" +
            "//*\r\n" +
            "//COMP     EXEC PGM=IGYCRCTL,REGION=0M\r\n" +
            "//*\r\n" +
            "//STEPLIB DD DISP=SHR,DSN=steplib1\r\n" +
            "//         DD DISP=SHR,DSN=steplib2\r\n" +
            "//SYSUT1   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT2   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT3   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT4   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT5   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT6   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT7   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT8   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT9   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT10  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT11  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT12  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT13  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT14  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT15  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSMDECK DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSPRINT DD  SYSOUT=*\r\n" +
            "//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),\r\n" +
            "//             UNIT=SYSDA,SPACE=(400,(2000,200))\r\n" +
            "//SYSLIB DD DISP=SHR,DSN=syslib1\r\n" +
            "//         DD DISP=SHR,DSN=syslib2\r\n" +
            "//SYSPUNCH DD  DUMMY\r\n" +
            "//SYSIN    DD  * ";

        const definition: CobolCompileJobDefinition = {
            jobCard,
            steplib: ["steplib1", "steplib2"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
            unit: "SYSDA"
        }

        const JCL = (CobolCompileJCLProvider as any).getCompileJobJCL(definition);
        expect(JCL).toEqual(expectedJCL);
    });

    it("checks proper JCL is formed for compile job with custom unit", async () => {

        const expectedJCL = "jobCard\r\n" +
            "//*\r\n" +
            "//*  COBOL LIBRARIES\r\n" +
            "//*\r\n" +
            "//*\r\n" +
            "//******************************************************************\r\n" +
            "//*  COMP - COMPILE THE COBOL PROGRAM\r\n" +
            "//******************************************************************\r\n" +
            "//*\r\n" +
            "//COMP     EXEC PGM=IGYCRCTL,REGION=0M\r\n" +
            "//*\r\n" +
            "//STEPLIB DD DISP=SHR,DSN=steplib1\r\n" +
            "//         DD DISP=SHR,DSN=steplib2\r\n" +
            "//SYSUT1   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT2   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT3   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT4   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT5   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT6   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT7   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT8   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT9   DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT10  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT11  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT12  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT13  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT14  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT15  DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSMDECK DD  UNIT=SYSDAYU8,SPACE=(TRK,(10,10))\r\n" +
            "//SYSPRINT DD  SYSOUT=*\r\n" +
            "//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),\r\n" +
            "//             UNIT=SYSDAYU8,SPACE=(400,(2000,200))\r\n" +
            "//SYSLIB DD DISP=SHR,DSN=syslib1\r\n" +
            "//         DD DISP=SHR,DSN=syslib2\r\n" +
            "//SYSPUNCH DD  DUMMY\r\n" +
            "//SYSIN    DD  * ";

        const definition: CobolCompileJobDefinition = {
            jobCard,
            steplib: ["steplib1", "steplib2"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
            unit: "SYSDAYU8"
        }

        const JCL = (CobolCompileJCLProvider as any).getCompileJobJCL(definition);
        expect(JCL).toEqual(expectedJCL);
    });

    it("checks proper JCL is formed with compiler options", async () => {

        const expectedJCL = "jobCard\r\n" +
            "//*\r\n" +
            "//*  COBOL LIBRARIES\r\n" +
            "//*\r\n" +
            "//*\r\n" +
            "//******************************************************************\r\n" +
            "//*  COMP - COMPILE THE COBOL PROGRAM\r\n" +
            "//******************************************************************\r\n" +
            "//*\r\n" +
            "//COMP     EXEC PGM=IGYCRCTL,REGION=0M,\r\n" +
            "// PARM=(LIST,APOST,NOSEQ,LIST,MAP,XREF,SOURCE,DATA(24),NODUMP,NODYNAM,X\r\n" +
            "//             NOEXIT,NOEXPORTALL)\r\n" +
            "//STEPLIB DD DISP=SHR,DSN=steplib1\r\n" +
            "//         DD DISP=SHR,DSN=steplib2\r\n" +
            "//SYSUT1   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT2   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT3   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT4   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT5   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT6   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT7   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT8   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT9   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT10  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT11  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT12  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT13  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT14  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSUT15  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSMDECK DD  UNIT=SYSDA,SPACE=(TRK,(10,10))\r\n" +
            "//SYSPRINT DD  SYSOUT=*\r\n" +
            "//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),\r\n" +
            "//             UNIT=SYSDA,SPACE=(400,(2000,200))\r\n" +
            "//SYSLIB DD DISP=SHR,DSN=syslib1\r\n" +
            "//         DD DISP=SHR,DSN=syslib2\r\n" +
            "//SYSPUNCH DD  DUMMY\r\n" +
            "//SYSIN    DD  * ";

        const definition: CobolCompileJobDefinition = {
            jobCard,
            steplib: ["steplib1", "steplib2"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
            compilerOptions: ["LIST", "APOST", "NOSEQ", "LIST", "MAP", "XREF", "SOURCE", "DATA(24)", "NODUMP", "NODYNAM", "NOEXIT", "NOEXPORTALL"],
            unit: "SYSDA",
        };

        const JCL = (CobolCompileJCLProvider as any).getCompileJobJCL(definition);
        expect(JCL).toEqual(expectedJCL);
    });

    it("checks proper compiler options are generated", async () => {
        const compileOptions = (CobolCompileJCLProvider as any).getCompilerOptions(["LIST"]);
        expect(compileOptions).toBe("// PARM=(LIST)");
    });

    it("checks proper compiler options are generated for a bigger list", async () => {
        const compilerOption = ["LIST"];
        for (let i = 0; i < 33; i++) {
            compilerOption.push("test1");
        }
        const compileOptions = (CobolCompileJCLProvider as any).getCompilerOptions(compilerOption);
        expect(compileOptions).toBe("// PARM=(LIST,test1,test1,test1,test1,test1,test1,test1,test1,test1,tesX" + CRLF +
            "//             t1,test1,test1,test1,test1,test1,test1,test1,test1,test1,X" + CRLF +
            "//             test1,test1,test1,test1,test1,test1,test1,test1,test1,tesX" + CRLF +
            "//             t1,test1,test1,test1,test1)");
    });

    it("checks a syslib provided with more than 44 char throws exception", () => {
        const task = new CustomBuildTaskTerminal(docText as any, {
            jobCard,
            steplib: ["steplib1", "steplib2", "123456789123456789123456789123456789123456789"],
            syslib: ["syslib1", "syslib2"],
            type: "testTask",
        });
        try {
            (task as any).validateParams();
        } catch (err) {
            expect(err.message).toBe("Invalid params provided. Steplib and Syslib has must have a max length of 44." + CRLF +
                "Correct/modify 123456789123456789123456789123456789123456789.");
        }
    });

    it("checks the jcl line generated with more than 71 chars throws error", () => {
        try {
            (CobolCompileJCLProvider as any).generateLibs("STEPLIB", ["qwertyuiopasdfghjklzxcvbnm1234567890qwertyuioplkjhgdf"]);
        } catch (error) {
            expect(error.message).toBe("Error while generating JCL line. Line: //STEPLIB DD DISP=SHR,DSN=qwertyuiopasdfghjklzxcvbnm1234567890qwertyuioplkjhgdf");
        }
    });

    it("checks a libname with more than 8 chars throws error", () => {
        try {
            (CobolCompileJCLProvider as any).generateLibs("STEPLIB12", ["qwerty"]);
        } catch (error) {
            expect(error.message).toBe("libName can have maximum of 8 characters.");
        }
    })
});
