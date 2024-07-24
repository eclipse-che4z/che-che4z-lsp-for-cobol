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
import * as fs from "node:fs";
import { E4E } from "../../../../type/e4eApi";
import {
  e4eResponseDatasetFirst,
  e4eResponseEndevorFirst,
} from "../../../../__mocks__/getE4EMock.utility";

jest.mock("node:fs", () => ({
  promises: {
    writeFile: jest.fn(),
  },
  mkdirSync: jest.fn(),
  existsSync: jest.fn(),
}));

describe("e4e copybook downloader tests", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  it("checks copybook downloaded into correct path", () => {
    expect(
      (CopybookDownloaderForE4E as any).getCopybookPath(
        "Instance.Instance",
        "pgm",
        "/storagePath",
        "Copy.cpy",
      ),
    ).toEqual(
      path.join(
        "/storagePath",
        "e4e",
        "copybooks",
        "Instance.Instance",
        "pgm",
        "Copy",
      ),
    );
    expect(fs.mkdirSync).toHaveBeenCalledWith(
      path.join("/storagePath", "e4e", "copybooks", "Instance.Instance", "pgm"),
      { recursive: true },
    );
  });
  it("checks not to try to download any if member or element not available in e4e", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E(
      "/storagePath",
      {} as any as E4E,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () => e4eResponseEndevorFirst;
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "NoCopybook",
      dialect: "COBOL",
    });
    expect(spyDownloadDataset).not.toHaveBeenCalled();
    expect(spyDownloadElement).not.toHaveBeenCalled();
  });
  it("check download performed with respect to configuration order", async () => {
    const e4eDownloader = new CopybookDownloaderForE4E(
      "/storagePath",
      {} as any as E4E,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () => e4eResponseEndevorFirst;
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
    const e4eDownloader = new CopybookDownloaderForE4E(
      "/storagePath",
      {} as any as E4E,
    );
    const spyDownloadDataset = jest.spyOn(e4eDownloader, "downloadDatasetE4E");
    const spyDownloadElement = jest.spyOn(e4eDownloader, "downloadElementE4E");
    e4eDownloader.getE4EConfig = async () => e4eResponseEndevorFirst;
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
    const getMember = jest.fn(async () => Error("failed"));
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
      getMember,
    } as any as E4E);
    e4eDownloader.getE4EConfig = async () => e4eResponseDatasetFirst;
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(getMember).toHaveBeenCalled();
    expect(fs.promises.writeFile).not.toHaveBeenCalled();
  });
  it("check downloadElementE4E does not perform IO in case of Error", async () => {
    const getElement = jest.fn(async () => Error("failed"));
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
      getElement,
    } as any as E4E);
    e4eDownloader.getE4EConfig = async () => e4eResponseEndevorFirst;
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(getElement).toHaveBeenCalled();
    expect(fs.promises.writeFile).not.toHaveBeenCalled();
  });
  it("check downloadDatasetE4E nominal performs writeFile with correct path and content", async () => {
    const getMember = jest.fn(async () => "content");
    const e4eDownloader = new CopybookDownloaderForE4E("/storagePath", {
      getMember,
    } as any as E4E);
    e4eDownloader.getE4EConfig = async () => e4eResponseDatasetFirst;
    await e4eDownloader.downloadCopybookE4E("uri", {
      name: "copybook",
      dialect: "COBOL",
    });
    expect(getMember).toHaveBeenCalledWith(
      { instance: "instance", profile: "profile" },
      { dataset: "dataset", member: "copybook" },
    );
    expect(fs.promises.writeFile).toHaveBeenCalledWith(
      path.join(
        "/storagePath",
        "e4e",
        "copybooks",
        "instance.profile",
        "dataset",
        "copybook",
      ),
      "content",
    );
  });
});
