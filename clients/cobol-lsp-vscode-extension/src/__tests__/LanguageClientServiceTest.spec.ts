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
import {CopybookDownloadService} from "../services/copybook/CopybookDownloadService";
import {CopybookURI} from "../services/copybook/CopybookURI";
import {JavaCheck} from "../services/JavaCheck";
import { LanguageClientService } from "../services/LanguageClientService";
import { Middleware } from "../services/Middleware";
import { ProfileService } from "../services/ProfileService";
import {ZoweApi} from "../services/ZoweApi";

jest.mock("../services/Middleware");
jest.mock("../services/copybook/CopybookDownloadService");
jest.mock("../services/copybook/CopybookURI");
jest.mock("../services/ProfileService");
jest.mock("vscode", () => ({
    extensions: {
        getExtension: jest.fn().mockReturnValue({extensionPath: "/test"}),
    },
    workspace: {
        getConfiguration: jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(0),
        })}}));
jest.mock("vscode-languageclient", () => ({
    LanguageClient: jest.fn(),
}));

const zoweApi: ZoweApi = new ZoweApi();
const profileService: ProfileService = new ProfileService(zoweApi);
const copyBooksDownloader: CopybookDownloadService =
new CopybookDownloadService(zoweApi, null, null);
const middleware: Middleware = new Middleware(new CopybookURI(profileService), copyBooksDownloader);
let languageClientService: LanguageClientService ;

const SERVER_DESC = "LSP extension for COBOL language";
const SERVER_ID = "COBOL";

beforeEach(() => {
    jest.clearAllMocks();
});

describe("LanguageClientService negative scenario.", () => {

    test("LSP port not defined and jar path doesn't exists", async () => {
        await expect(new LanguageClientService(undefined).checkPrerequisites())
        .rejects.toThrowError("LSP server for COBOL not found");
}, 10000);
});

const SERVER_STARTED_MSG = "server started";
describe("LanguageClientService positive scenario", () => {
    languageClientService = new LanguageClientService(middleware);
    new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
    fs.existsSync = jest.fn().mockReturnValue(true);
    test("Test LanguageClientService checkPrerequisites passes", async () => {
        expect(async () => await languageClientService.checkPrerequisites()).not.toThrowError();
    });

    test("Test LanguageClientService starts language client", () => {
        LanguageClient.prototype.start = jest.fn().mockReturnValue(SERVER_STARTED_MSG);
        expect(languageClientService.start()).toBe(SERVER_STARTED_MSG);
        expect(LanguageClient).toHaveBeenCalledTimes(1);
        expect(LanguageClient).toHaveBeenCalledWith(SERVER_ID, SERVER_DESC, {
            args: ["-Dline.separator=\r\n", "-Xmx768M", "-jar", "/test/server/server.jar", "pipeEnabled"],
            command: "java",
            options: {stdio: "pipe", detached: false},
        }, {
            documentSelector: [SERVER_ID],
            middleware: {
                workspace: {
                    configuration : expect.any(Function),
                },
            },
        });
    });

    test("Test LanguageClientService starts language server is started when port is provided", () => {
        jest.clearAllMocks();
        new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);
        vscode.workspace.getConfiguration(expect.any(String)).get = jest.fn().mockReturnValue(9999);
        LanguageClient.prototype.start = jest.fn().mockReturnValue(SERVER_STARTED_MSG);
        expect(languageClientService.start()).toBe(SERVER_STARTED_MSG);
        expect(LanguageClient).toHaveBeenLastCalledWith(SERVER_ID, SERVER_DESC,
        expect.any(Function), {
            documentSelector: [SERVER_ID],
            middleware: {
                workspace: {
                    configuration : expect.any(Function),
                },
            },
        });
    });
});
