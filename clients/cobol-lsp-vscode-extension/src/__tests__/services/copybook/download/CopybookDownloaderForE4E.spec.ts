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
      beforeEach(() => {
        jest.replaceProperty(path, "sep", "\\");
        jest
          .spyOn(vscode.Uri, "joinPath")
          .mockImplementation((base, ...args) =>
            vscode.Uri.parse(base.fsPath + "\\" + args.join("\\")),
          );
      });

      it("allocates the copybook path incrementally", async () => {
        expect(
          await CopybookDownloaderForE4E["getCopybookPath"](
            ["Instance.Instance"],
            "pgm",
            "C:\\Users\\Developer\\globalStorage",
            "Copy.cpy",
          ),
        ).toEqual({
          path: "C:\\Users\\Developer\\globalStorage\\e4e\\copybooks\\Instance.Instance\\pgm\\Copy",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "C:\\Users\\Developer\\globalStorage\\e4e",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "C:\\Users\\Developer\\globalStorage\\e4e\\copybooks",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "C:\\Users\\Developer\\globalStorage\\e4e\\copybooks\\Instance.Instance",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "C:\\Users\\Developer\\globalStorage\\e4e\\copybooks\\Instance.Instance\\pgm",
        });
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
            "/home/developer/globalStorage",
            "Copy.cpy",
          ),
        ).toEqual({
          path: "/home/developer/globalStorage/e4e/copybooks/Instance.Instance/pgm/Copy",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "/home/developer/globalStorage/e4e",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "/home/developer/globalStorage/e4e/copybooks",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "/home/developer/globalStorage/e4e/copybooks/Instance.Instance",
        });
        expect(vscode.workspace.fs.createDirectory).toHaveBeenCalledWith({
          path: "/home/developer/globalStorage/e4e/copybooks/Instance.Instance/pgm",
        });
      });
    });
  });
  it("checks not to try to download any if member or element not available in e4e", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", e4e);
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "NoCopybook",
      dialect: "COBOL",
    });
    expect(spyDownloadDataset).not.toHaveBeenCalled();
    expect(spyDownloadElement).not.toHaveBeenCalled();
  });
  it("check download performed with respect to configuration order", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", e4e);
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(spyDownloadElement).toHaveBeenCalledWith(e4eResponseEndevorFirst, {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
      element: "copybook",
      fingerprint: "fingerprint",
    });
    expect(spyDownloadDataset).not.toHaveBeenCalled();
  });
  it("check download performed only for element when no member matches", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", e4e);
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(spyDownloadElement).toHaveBeenCalledWith(e4eResponseEndevorFirst, {
      use_map: false,
      environment: "environment",
      stage: "stage",
      system: "system",
      subsystem: "subsystem",
      type: "type",
      element: "copybook",
      fingerprint: "fingerprint",
    });
    expect(spyDownloadDataset).not.toHaveBeenCalled();
  });
  it("check downloadDatasetE4E does not perform IO in case of Error", async () => {
    const getMember = jest.fn(() => Error("failed"));
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
      getMember,
    } as unknown as E4E);
    e4eDownloader.getE4EConfig = async () =>
      await Promise.resolve(e4eResponseDatasetFirst);
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(getMember).toHaveBeenCalled();
    expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
  });

  it("check downloadElementE4E does not perform IO in case of Error", async () => {
    const getElement = jest.fn(() => Error("failed"));
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
      getElement,
    } as unknown as E4E);
    e4eDownloader.getE4EConfig = async () =>
      Promise.resolve(e4eResponseEndevorFirst);
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(getElement).toHaveBeenCalled();
    expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
  });

  describe("check downloadDatasetE4E nominal performs writeFile with correct path and content", () => {
    beforeAll(() => {
      jest.replaceProperty(path, "sep", "/");
    });

    it("writes to correct path and content", async () => {
      const getMember = jest.fn(() => "content");
      const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
        getMember,
      } as unknown as E4E);
      e4eDownloader.getE4EConfig = async () =>
        Promise.resolve(e4eResponseDatasetFirst);
      await e4eDownloader.downloadCopybookE4E("uri", {
        name: "copybook",
        dialect: "COBOL",
      });
      expect(getMember).toHaveBeenCalledWith(
        { instance: "instance", profile: "profile" },
        { dataset: "dataset", member: "copybook" },
      );
      expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
        {
          path: "/storagePath/e4e/copybooks/instance.profile/dataset/copybook",
        },
        Buffer.from("content"),
      );
    });
  });

  describe("listRemoteCopybooksE4E", () => {
    let e4eDownloader: CopybookDownloaderForE4E;
    beforeAll(() => {
      e4eDownloader = new CopybookDownloaderForE4E(
        "/storagePath",
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
