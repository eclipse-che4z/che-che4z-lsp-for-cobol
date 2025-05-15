/*
 * Copyright (c) 2024 Broadcom.
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
import { CopybookDownloaderForE4E } from "../../../../services/copybook/downloader/CopybookDownloaderForE4E";
import * as path from "path";
import { E4E } from "../../../../type/e4eApi";
import {
  e4eResponseDatasetFirst,
  e4eResponseEndevorFirst,
} from "../../../../__mocks__/getE4EMock.utility";
import * as vscode from "vscode";
import { DEFAULT_DIALECT } from "../../../../constants";

jest.mock("path", () => ({
  ...jest.requireActual<typeof path>("path"),
  sep: "/",
}));

describe("e4e copybook downloader tests", () => {
  let e4e: E4E;

  beforeEach(() => {
    e4e = {} as E4E;
    jest.clearAllMocks();
    jest.restoreAllMocks();
  });

  describe("checks copybook downloaded into correct path", () => {
    describe("windows", () => {
      it("allocates the copybook path incrementally", async () => {
        const resultUri = await CopybookDownloaderForE4E["getCopybookPath"](
          ["Instance.Instance"],
          "pgm",
          vscode.Uri.file("C:/Users/Developer/globalStorage"),
          "Copy.cpy",
        );

        expect(decodeURIComponent(resultUri.toString())).toEqual(
          "file:///c:/Users/Developer/globalStorage/e4e/copybooks/Instance.Instance/pgm/Copy",
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file("C:/Users/Developer/globalStorage/e4e"),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file("C:/Users/Developer/globalStorage/e4e/copybooks"),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file(
            "C:/Users/Developer/globalStorage/e4e/copybooks/Instance.Instance",
          ),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file(
            "C:/Users/Developer/globalStorage/e4e/copybooks/Instance.Instance/pgm",
          ),
        );
      });
    });

    describe("unix", () => {
      beforeAll(() => {
        jest.replaceProperty(path, "sep", "/");
      });

      it("allocates the copybook path incrementally", async () => {
        expect(
          await CopybookDownloaderForE4E["getCopybookPath"](
            ["Instance.Instance"],
            "pgm",
            vscode.Uri.file("/home/developer/globalStorage"),
            "Copy.cpy",
          ),
        ).toEqual(
          vscode.Uri.file(
            "/home/developer/globalStorage/e4e/copybooks/Instance.Instance/pgm/Copy",
          ),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file("/home/developer/globalStorage/e4e"),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file("/home/developer/globalStorage/e4e/copybooks"),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file(
            "/home/developer/globalStorage/e4e/copybooks/Instance.Instance",
          ),
        );
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith(
          vscode.Uri.file(
            "/home/developer/globalStorage/e4e/copybooks/Instance.Instance/pgm",
          ),
        );
      });
    });
  });
  it("checks not to try to download any if member or element not available in e4e", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      e4e,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E(
      "uri",
      "NoCopybook",
      DEFAULT_DIALECT,
    );
    expect(spyDownloadDataset).not.toHaveBeenCalled();
    expect(spyDownloadElement).not.toHaveBeenCalled();
  });
  it("check download performed with respect to configuration order", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      e4e,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", "copybook", DEFAULT_DIALECT);
    expect(spyDownloadElement).toHaveBeenCalledWith(
      e4eResponseEndevorFirst.profile,
      {
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
        element: "copybook",
        fingerprint: "fingerprint",
      },
    );
    expect(spyDownloadDataset).not.toHaveBeenCalled();
  });
  it("check download performed only for element when no member matches", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      e4e,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", "copybook", DEFAULT_DIALECT);
    expect(spyDownloadElement).toHaveBeenCalledWith(
      e4eResponseEndevorFirst.profile,
      {
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
        element: "copybook",
        fingerprint: "fingerprint",
      },
    );
    expect(spyDownloadDataset).not.toHaveBeenCalled();
  });
  it("check downloadDatasetE4E does not perform IO in case of Error", async () => {
    const getMember = jest.fn(() => Error("failed"));
    const outputChannel = vscode.window.createOutputChannel("log");
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      {
        getMember,
      } as unknown as E4E,
      outputChannel,
    );
    e4eDownloader.getE4EConfig = async () =>
      await Promise.resolve(e4eResponseDatasetFirst);
    await e4eDownloader.downloadCopybookE4E("uri", "copybook", DEFAULT_DIALECT);
    expect(getMember).toHaveBeenCalled();
    expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    expect(outputChannel.appendLine).toHaveBeenCalledWith(
      expect.stringContaining(
        "Error while downloading copybook from Endevor copybook",
      ),
    );
  });

  it("check downloadElementE4E does not perform IO in case of Error", async () => {
    const getElement = jest.fn(() => Error("failed"));
    const outputChannel = vscode.window.createOutputChannel("log");
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      {
        getElement,
      } as unknown as E4E,
      outputChannel,
    );
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", "copybook", DEFAULT_DIALECT);
    expect(getElement).toHaveBeenCalled();
    expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
    expect(outputChannel.appendLine).toHaveBeenCalledWith(
      expect.stringContaining("Error while downloading copybook from Endevor"),
    );
  });

  it("check hasElement returns correct value when element is in the list", async () => {
    const e4eMock: E4E = {
      isEndevorElement: jest.fn().mockResolvedValue(false),
      getProfileInfo: jest.fn(),
      listElements: jest.fn().mockResolvedValue([
        ["element", "fingerprint"],
        ["element2", "fingerprint2"],
      ]),
      getElement: jest.fn(),
      listMembers: jest.fn(),
      getMember: jest.fn(),
      getConfiguration: jest.fn(),
      onDidChangeElement: jest.fn(),
    };
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      e4eMock,
    );

    const res = await e4eDownloader.hasElement(
      { profile: "profile", instance: "instance" },
      {
        environment: "environment",
        system: "system",
        subsystem: "subsystem",
        type: "type",
        stage: "1",
        use_map: false,
      },
      "copybook",
    );
    const res2 = await e4eDownloader.hasElement(
      { profile: "profile", instance: "instance" },
      {
        environment: "environment",
        system: "system",
        subsystem: "subsystem",
        type: "type",
        stage: "1",
        use_map: false,
      },
      "element",
    );
    expect(res).toBeFalsy();
    expect(res2).toBeTruthy();
  });

  it("checks getProfileInfo uses cache for same partialProfile", async () => {
    const e4eMock: E4E = {
      isEndevorElement: jest.fn().mockResolvedValue(false),
      getProfileInfo: jest.fn().mockResolvedValue("profile"),
      listElements: jest.fn().mockResolvedValue([
        ["element", "fingerprint"],
        ["element2", "fingerprint2"],
      ]),
      getElement: jest.fn(),
      listMembers: jest.fn(),
      getMember: jest.fn(),
      getConfiguration: jest.fn(),
      onDidChangeElement: jest.fn(),
    };
    const e4eDownloader = new CopybookDownloaderForE4E(
      vscode.Uri.file("/storagePath"),
      e4eMock,
    );
    await e4eDownloader.getProfileInfo("instance@connection");
    await e4eDownloader.getProfileInfo("instance@connection");
    expect(e4eMock.getProfileInfo).toHaveBeenCalledTimes(1);
  });

  describe("check downloadDatasetE4E nominal performs writeFile with correct path and content", () => {
    beforeAll(() => {
      jest.replaceProperty(path, "sep", "/");
    });

    it("writes to correct path and content", async () => {
      const getMember = jest.fn(() => "content");
      const e4eDownloader = new CopybookDownloaderForE4E(
        vscode.Uri.file("/storagePath"),
        {
          getMember,
        } as unknown as E4E,
      );
      e4eDownloader.getE4EConfig = async () =>
        Promise.resolve(e4eResponseDatasetFirst);
      await e4eDownloader.downloadCopybookE4E(
        "uri",
        "copybook",
        DEFAULT_DIALECT,
      );
      expect(getMember).toHaveBeenCalledWith(
        { instance: "instance", profile: "profile" },
        { dataset: "dataset", member: "copybook" },
      );
      expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
        vscode.Uri.file(
          "/storagePath/e4e/copybooks/instance.profile/dataset/copybook",
        ),
        Buffer.from("content"),
      );
    });
  });

  describe("listRemoteCopybooksE4E", () => {
    let e4eDownloader: CopybookDownloaderForE4E;
    beforeAll(() => {
      e4eDownloader = new CopybookDownloaderForE4E(
        vscode.Uri.file("/storagePath"),
        {} as unknown as E4E,
      );
      e4eDownloader.getE4EConfig = async () =>
        Promise.resolve(e4eResponseDatasetFirst);
    });

    it("list all remote copybooks", async () => {
      const results = await e4eDownloader.listRemoteCopybooksE4E("uri");
      expect(results).toEqual(["copybook", "copybook2"]);
    });
  });
});
