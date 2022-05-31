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
import { CompileTaskProvider } from "../../task/providers/CompileTaskProvider";
import TerminalLinkProvider, { CobolTerminalLink } from "../../task/providers/TerminalLinkProvider";

const TOOLTIP_MSG = "Click to open";
describe("TerminalLinkProvider", () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    const taskProvider = new CompileTaskProvider();
    const linkProvider = new TerminalLinkProvider(taskProvider);
    const filesPathString = "c:\\Users\\ap891843\\IdeaProjects\\che-che4z-lsp-for-cobol\\Cobol85PositiveTestsSuite\\positive\\OBSQ34.2.cbl:88:7 -72 - I: A \"RECORDING MODE\" of \"F\" was assumed for file \"PRINT-FILE\".\n";
    const ddLinkString = "4            JESYSMSG     JES2                                                             ";
    const openDoc = jest.fn();
    (vscode.workspace as any) = {
        openTextDocument: openDoc.mockResolvedValue({}),
    };
    (vscode.Selection as any) = jest.fn().mockImplementation((_a, _b) => { });
    (vscode.TextEditorRevealType as any) = { InCenter: 1 };
    (vscode.window as any) = {
        activeTextEditor: {
            revealRange: jest.fn(),
        },
        showTextDocument: jest.fn(),
    };

    it("provide terminal link for file path", async () => {
        const result: CobolTerminalLink[] = await linkProvider.provideTerminalLinks({ line: filesPathString } as vscode.TerminalLinkContext, {} as vscode.CancellationToken);
        expect(result[0].startIndex).toBe(0);
        expect(result[0].length).toBe(107);
        expect(result[0].tooltip).toBe(TOOLTIP_MSG);
        expect(result[0].type).toBe("fileLink");
        expect(result[0].data.link).toBe("c:\\Users\\ap891843\\IdeaProjects\\che-che4z-lsp-for-cobol\\Cobol85PositiveTestsSuite\\positive\\OBSQ34.2.cbl");
        expect(result[0].data.position).toBe(":88:7");
    });

    it("provide terminal link for dd's", async () => {
        const result: CobolTerminalLink[] = await linkProvider.provideTerminalLinks({ line: ddLinkString } as vscode.TerminalLinkContext, {} as vscode.CancellationToken);
        expect(result.length).toBe(2);
        expect(result[0].startIndex).toBe(13);
        expect(result[0].length).toBe(8);
        expect(result[0].tooltip).toBe(TOOLTIP_MSG);
        expect(result[0].type).toBe("ddLink");
        expect(result[0].data.link).toBe("JESYSMSG");
        expect(result[0].data.spoolId).toBe(4);
        expect(result[1].startIndex).toBe(0);
        expect(result[1].length).toBe(1);
        expect(result[1].tooltip).toBe(TOOLTIP_MSG);
        expect(result[1].type).toBe("ddLink");
        expect(result[1].data.link).toBe("JESYSMSG");
        expect(result[1].data.spoolId).toBe(4);
    });

    it("checks the terminal link for files are handled correctly", async () => {
        const fileLink: CobolTerminalLink = {
            startIndex: 0,
            length: 107,
            tooltip: TOOLTIP_MSG,
            data: {
                link: "c:\\Users\\ap891843\\IdeaProjects\\che-che4z-lsp-for-cobol\\Cobol85PositiveTestsSuite\\positive\\OBSQ34.2.cbl",
                position: ":88:7",
            },
            type: "fileLink",
        };
        await linkProvider.handleTerminalLink(fileLink);
        expect(openDoc).toBeCalledTimes(1);
    });

    it("checks the terminal link for DD's are handled correctly", async () => {
        const ddLink: CobolTerminalLink = {
            startIndex: 0,
            length: 1,
            tooltip: TOOLTIP_MSG,
            data: { link: "JESYSMSG", spoolId: 4 },
            type: "ddLink",
        };
        await linkProvider.handleTerminalLink(ddLink);
        expect(openDoc).toBeCalledTimes(1);
    });
});
