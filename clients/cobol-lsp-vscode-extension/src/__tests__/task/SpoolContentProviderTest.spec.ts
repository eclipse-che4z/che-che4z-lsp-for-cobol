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
import SpoolContentProvider from "../../task/providers/SpoolContentProvider";

const spoolContent = "0LineID  Message code  Message text\n" +
    "\n" +
    "     91  IGYGR1216-I   A \"RECORDING MODE\" of \"F\" was assumed for file \"PRINT-FILE\".\n" +
    "\n" +
    "     93  IGYGR1174-S   \"XXXXX084\" was not defined as a data-name.  \"XXXXX084\" was discarded.\n" +
    "\n" +
    "   1151  IGYPA3086-W   \"PERFORM\" start-of-range \"PROC-213-PFM-G-15\" follows the \"PERFORM\" end-of-range \"PROC-217-PFM-B-15\".  The\n" +
    "                       \"PERFORM\" end-of-range may be unreachable.  The statement was processed as written.";
describe("SpoolContentProvider", () => {

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
                            getSpoolContentById: jest.fn().mockReturnValue(spoolContent),
                            getSpoolFiles: jest.fn().mockReturnValue([{
                                ddname: "SYSPRINT",
                                id: 12,
                                stepname: "XYZ",
                                procstep: "",
                                jobName: "DUMMY",
                            }, {
                                ddname: "JESYSMSG",
                                id: 12,
                                stepname: "XYZ",
                                procstep: "",
                                jobName: "DUMMY",
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

        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("testProfile"),
        });
    });

    it("provides the spool contents", async () => {
        (vscode.ProgressLocation as any) = {Window: 10};
        const contentProvider = new SpoolContentProvider();
        const uri = {path: "TESTJOBID/DUMMY/12/JESYSMSG"} as vscode.Uri;
        const result = await contentProvider.provideTextDocumentContent(uri, {} as vscode.CancellationToken);
        expect(result).toBe(spoolContent);
    });
});
