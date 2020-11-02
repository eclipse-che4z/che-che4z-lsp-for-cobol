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
import {activate} from "../extension";
import {CopybookDownloadService} from "../services/copybook/CopybookDownloadService";
import {CopybooksCodeActionProvider} from "../services/copybook/CopybooksCodeActionProvider";
import {CopybookURI} from "../services/copybook/CopybookURI";
import {JavaCheck} from "../services/JavaCheck";
import {LanguageClientService} from "../services/LanguageClientService";
import {Middleware} from "../services/Middleware";
import {ProfileService} from "../services/ProfileService";
import {TelemetryService} from "../services/reporter/TelemetryService";
import {createFileWithGivenPath, initializeSettings} from "../services/Settings";
import {ZoweApi} from "../services/ZoweApi";

jest.mock("../services/Settings", () => ({
    createFileWithGivenPath: jest.fn(),
    initializeSettings: jest.fn(),
}));
jest.mock("../commands/FetchCopybookCommand", () => ({
    fetchCopybookCommand: jest.fn(),
}));
jest.mock("vscode", () => ({
    commands: {
        registerCommand : jest.fn().mockImplementation((...args) => args),
    },
    extensions: {
        getExtension: jest.fn().mockReturnValue({extensionPath: "/test"}),
    },
    languages : {
        registerCodeActionsProvider: jest.fn(),
    },
    window: {
        showErrorMessage: jest.fn().mockReturnValue("test"),
    },
    workspace: {
        getConfiguration: jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(9),
        }),
        getWorkspaceFolder : jest.fn().mockReturnValue({ name: "workspaceFolder1" }),
        onDidChangeConfiguration: jest.fn().mockReturnValue("onDidChangeConfiguration"),
    },
    }));

jest.mock("../services/ProfileService");
jest.mock("../services/copybook/CopybooksPathGenerator");
jest.mock("../services/ProfileService");
jest.mock("../services/copybook/CopybookURI");
jest.mock("vscode-languageclient", () => ({
    LanguageClient: jest.fn(),
}));

jest.mock("../services/Middleware");
jest.mock("../services/PathsService");
jest.mock("../services/reporter/TelemetryService");
fs.existsSync = jest.fn().mockReturnValue(true);
new JavaCheck().isJavaInstalled = jest.fn().mockResolvedValue(true);

const context: any = {
    subscriptions: {
      push: jest.fn(),
    },
  };

const zoweApi: ZoweApi = new ZoweApi();
const profileService: ProfileService = new ProfileService(zoweApi);
const copyBooksDownloader: CopybookDownloadService = new CopybookDownloadService(zoweApi, null, null);
const middleware: Middleware = new Middleware(new CopybookURI(profileService), copyBooksDownloader);
const languageClientService: LanguageClientService = new LanguageClientService(middleware);
languageClientService.checkPrerequisites = jest.fn(() => Promise.resolve());
languageClientService.start = jest.fn().mockResolvedValue(true);
copyBooksDownloader.start = jest.fn().mockReturnValue("started");

beforeEach(() => {
    jest.clearAllMocks();
    context.subscriptions.push.mockReset();
  });

(vscode.commands as any).registerCommand = jest.fn().mockImplementation((...args) => args);

describe("Check plugin extension for cobol starts successfully.", () => {

    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValue(999),
    });
    LanguageClient.prototype.start = jest.fn().mockReturnValue("server started");
    copyBooksDownloader.start = jest.fn().mockReturnValue(true);
    jest.mock("../services/LanguageClientService", () => ({ languageClientService }));
    jest.mock("../services/copybook/CopybookDownloadService", () => ({ copyBooksDownloader }));
    fs.existsSync = jest.fn().mockReturnValue(true);

    test("start extension", async () => {
        await activate(context);
        expect(initializeSettings).toHaveBeenCalledTimes(1);
        expect(TelemetryService.registerEvent).toHaveBeenCalledWith("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");

        expect(vscode.workspace.onDidChangeConfiguration).toBeCalled();
        expect(context.subscriptions.push.mock.calls[0]).toContain("onDidChangeConfiguration");

        expect(vscode.commands.registerCommand).toBeCalledTimes(4);
        expect(createFileWithGivenPath).toHaveBeenCalledTimes(1);

        expect(vscode.languages.registerCodeActionsProvider)
        .toBeCalledWith({scheme: "file", language: "COBOL"}, expect.any(CopybooksCodeActionProvider));

        expect(context.subscriptions.push).toHaveBeenCalledTimes(8);
    });
});

describe("Check plugin extension for cobol starts successfully.", () => {
    beforeEach(() => {
        jest.clearAllMocks();
    });

    fs.existsSync = jest.fn().mockReturnValue(false);
    copyBooksDownloader.start = jest.fn().mockReturnValue(true);
    jest.mock("../services/LanguageClientService", () => ({ languageClientService }));
    jest.mock("../services/copybook/CopybookDownloadService", () => ({ copyBooksDownloader }));

    test("start fails.", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(0),
        });
        vscode.window.showErrorMessage = jest.fn();

        await activate(context);
        expect(initializeSettings).toHaveBeenCalledTimes(1);
        expect(TelemetryService.registerEvent).toHaveBeenCalledWith("log", ["bootstrap", "experiment-tag"], "Extension activation event was triggered");
        expect(vscode.window.showErrorMessage).toBeCalledTimes(1);
    });
});
