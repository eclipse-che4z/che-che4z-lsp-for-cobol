/*
 * Copyright (c) 2020 Broadcom.
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
import * as vscode from "vscode";
import { LanguageClient } from "vscode-languageclient";
import { CopybookDownloadService } from "../../services/copybook/CopybookDownloadService";
import { JavaCheck } from "../../services/JavaCheck";
import { LanguageClientService } from "../../services/LanguageClientService";
import { Middleware } from "../../services/Middleware";

jest.mock("../../services/Middleware");
jest.mock("../../services/copybook/CopybookURI");
jest.mock("vscode", () => ({
    extensions: {
        getExtension: jest.fn().mockReturnValue({ extensionPath: "/test" }),
    },
    workspace: {
        getConfiguration: jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(0),
        }),
    },
}));
jest.mock("vscode-languageclient", () => ({
    LanguageClient: jest.fn(),
}));

const copyBooksDownloader: CopybookDownloadService = new CopybookDownloadService();
const middleware: Middleware = new Middleware(copyBooksDownloader);
let languageClientService: LanguageClientService;

const SERVER_DESC = "LSP extension for cobol language";
const SERVER_ID = "cobol";

beforeEach(() => {
    jest.clearAllMocks();
    vscode.workspace.getConfiguration(expect.any(String)).get = jest.fn().mockReturnValue(0);
});

const SERVER_STARTED_MSG = "server started";
const SERVER_STOPPED_MSG = "server stopped";
describe("LanguageClientService positive scenario", () => {
    beforeEach(() => {
        languageClientService = new LanguageClientService(middleware);
        new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
        vscode.workspace.getConfiguration(expect.any(String)).get = jest.fn().mockReturnValue(0);
        fs.existsSync = jest.fn().mockReturnValue(true);
    });

    test.skip("Test LanguageClientService checkPrerequisites passes", async () => {
        let message = false;
        fs.existsSync = jest.fn().mockReturnValue(true);
        vscode.workspace.getConfiguration(expect.any(String)).get = jest.fn().mockReturnValue(9999);
        try {
            await languageClientService.checkPrerequisites();
        } catch (error) {
            message = error;
        }
        expect(message).toBeFalsy();
    });

    test("Test LanguageClientService retrieve analysis passes", async () => {
        const expectedResult = { programs: [] };

        LanguageClient.prototype.sendRequest = () => Promise.resolve(expectedResult);
        LanguageClient.prototype.onReady = () => Promise.resolve();
        expect(await languageClientService.retrieveAnalysis("test", "text")).toBe(expectedResult);
    });

    test("Test LanguageClientService starts language client", () => {
        LanguageClient.prototype.start = jest.fn().mockReturnValue(SERVER_STARTED_MSG);
        expect(languageClientService.start()).toBe(SERVER_STARTED_MSG);
        expect(LanguageClient).toHaveBeenCalledTimes(1);
        expect(LanguageClient).toHaveBeenCalledWith(SERVER_ID, SERVER_DESC, {
            args: ["-Dline.separator=\r\n", "-Xmx768M", "-jar", "/test/server/server.jar", "pipeEnabled"],
            command: "java",
            options: { stdio: "pipe", detached: false },
        }, {
            documentSelector: [SERVER_ID],
            middleware: {
                workspace: {
                    configuration: expect.any(Function),
                },
            },
        });
    });

    test("LanguageClientService starts the language server when port is provided", () => {
        new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
        vscode.workspace.getConfiguration(expect.any(String)).get = jest.fn().mockReturnValue(9999);
        LanguageClient.prototype.start = jest.fn().mockReturnValue(SERVER_STARTED_MSG);
        expect(languageClientService.start()).toBe(SERVER_STARTED_MSG);
        expect(LanguageClient).toHaveBeenLastCalledWith(SERVER_ID, SERVER_DESC,
            expect.any(Function), {
                documentSelector: [SERVER_ID],
                middleware: {
                    workspace: {
                        configuration: expect.any(Function),
                    },
                },
            });
    });

    test("Test LanguageClientService fire a stop() command on LanguageClient", async () => {
        LanguageClient.prototype.stop = jest.fn().mockReturnValue(SERVER_STOPPED_MSG);
        // start the server, before shutdown.
        languageClientService.start();
        const returnedValue = await languageClientService.stop();
        expect(returnedValue).toBe(SERVER_STOPPED_MSG);
    });
});

describe("LanguageClientService negative scenario.", () => {

    test.skip("LSP port not defined and jar path doesn't exists", async () => {
        fs.existsSync = jest.fn().mockReturnValue(false);
        try {
            await new LanguageClientService(undefined).checkPrerequisites();
        } catch (error) {
            expect(error.toString()).toBe("Error: LSP server for COBOL not found");
        }
    });
});
