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
import { E4E, EndevorElement, ResolvedProfile } from "../../../../type/e4eApi";

import * as vscode from "vscode";
import { FileNotFound } from "../../../../__mocks__/vscode";

jest.mock("path", () => ({
  ...jest.requireActual<typeof path>("path"),
  sep: "/",
}));

describe("e4e copybook downloader tests", () => {
  beforeEach(() => {
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

  describe("downloadDatasetE4E", () => {
    let e4eMock: E4E;
    let profile: ResolvedProfile;

    beforeEach(() => {
      e4eMock = {
        isEndevorElement: jest.fn(),
        getProfileInfo: jest.fn(),
        listElements: jest.fn(),
        getElement: jest.fn(),
        listMembers: jest.fn(),
        getMember: jest.fn().mockResolvedValue("CONTENT"),
        getConfiguration: jest.fn(),
        onDidChangeElement: jest.fn(),
      };
      profile = {
        instance: "instance",
        profile: "profile",
      };
    });
    describe("file not in cache", () => {
      beforeEach(() => {
        jest
          .spyOn(vscode.workspace.fs, "stat")
          .mockRejectedValue(new FileNotFound());
      });

      it("downloads the content and writes it to cache directory", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );
        const result = await e4eDownloader.downloadDatasetE4E(profile, {
          dataset: "ENDEVOR.DATASET",
          member: "MEMBER",
        });
        expect(result).toEqual(
          vscode.Uri.file(
            "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET/MEMBER",
          ),
        );
        expect(vscode.workspace.fs.writeFile).toHaveBeenCalledTimes(1);
      });
    });

    describe("member already exists in cache", () => {
      beforeEach(() => {
        jest.spyOn(vscode.workspace.fs, "stat").mockResolvedValue({
          size: 0,
          ctime: 0,
          mtime: 0,
          type: vscode.FileType.File,
        });
      });
      it("returns cached value if already exists", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );

        const result = await e4eDownloader.downloadDatasetE4E(profile, {
          dataset: "ENDEVOR.DATASET",
          member: "MEMBER",
        });
        expect(result).toEqual(
          vscode.Uri.file(
            "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET/MEMBER",
          ),
        );
        expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
      });
    });

    describe("error while downloading member", () => {
      beforeEach(() => {
        e4eMock.getMember = jest
          .fn()
          .mockResolvedValue(new Error("Endevor error"));
        jest
          .spyOn(vscode.workspace.fs, "stat")
          .mockRejectedValue(new FileNotFound());
      });

      it("returns undefined and error is displayed to the user", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );
        const result = await e4eDownloader.downloadDatasetE4E(profile, {
          dataset: "ENDEVOR.DATASET",
          member: "MEMBER",
        });
        expect(result).toBeUndefined();
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          expect.stringContaining("Unable to download E4E member"),
        );
        expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
      });
    });
  });
  describe("downloadElementE4E", () => {
    let e4eMock: E4E;
    let profile: ResolvedProfile;
    let element: EndevorElement;

    beforeEach(() => {
      e4eMock = {
        isEndevorElement: jest.fn(),
        getProfileInfo: jest.fn(),
        listElements: jest.fn(),
        getElement: jest.fn().mockResolvedValue("CONTENT"),
        listMembers: jest.fn(),
        getMember: jest.fn().mockResolvedValue("CONTENT"),
        getConfiguration: jest.fn(),
        onDidChangeElement: jest.fn(),
      };
      profile = {
        instance: "instance",
        profile: "profile",
      };
      element = {
        use_map: false,
        environment: "environment",
        stage: "stage",
        system: "system",
        subsystem: "subsystem",
        type: "type",
        element: "element",
        fingerprint: "12345",
      };
    });
    describe("file not in cache", () => {
      beforeEach(() => {
        jest
          .spyOn(vscode.workspace.fs, "stat")
          .mockRejectedValue(new FileNotFound());
      });

      it("downloads the content and writes it to cache directory", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );
        const result = await e4eDownloader.downloadElementE4E(profile, element);
        expect(result).toEqual(
          vscode.Uri.file(
            "/storage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/element",
          ),
        );
        expect(vscode.workspace.fs.writeFile).toHaveBeenCalledTimes(1);
      });
    });

    describe("member already exists in cache", () => {
      beforeEach(() => {
        jest.spyOn(vscode.workspace.fs, "stat").mockResolvedValue({
          size: 0,
          ctime: 0,
          mtime: 0,
          type: vscode.FileType.File,
        });
      });
      it("returns cached value if already exists", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );

        const result = await e4eDownloader.downloadElementE4E(profile, element);
        expect(result).toEqual(
          vscode.Uri.file(
            "/storage/e4e/copybooks/instance.profile/environment/stage/system/subsystem/type/element",
          ),
        );
        expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
      });
    });

    describe("error while downloading member", () => {
      beforeEach(() => {
        e4eMock.getElement = jest
          .fn()
          .mockResolvedValue(new Error("Endevor error"));
        jest
          .spyOn(vscode.workspace.fs, "stat")
          .mockRejectedValue(new FileNotFound());
      });

      it("returns undefined and error is displayed to the user", async () => {
        const e4eDownloader = new CopybookDownloaderForE4E(
          vscode.Uri.file("/storage"),
          e4eMock,
        );
        const result = await e4eDownloader.downloadElementE4E(profile, element);
        expect(result).toBeUndefined();
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
          expect.stringContaining("Unable to download E4E element"),
        );
        expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();
      });
    });
  });
});
