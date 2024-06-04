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

import { SettingsService } from "../../../../services/Settings";
import { DownloadStrategyResolver } from "../../../../services/copybook/downloader/DownloadStrategyResolver";
import { zoweExplorerMock } from "../../../../__mocks__/getZoweExplorerMock.utility";
import { e4eMock } from "../../../../__mocks__/getE4EMock.utility";
import { E4ECopybookService } from "../../../../services/copybook/E4ECopybookService";

jest.mock("../../../../services/reporter/TelemetryService");

describe("tests download resolver", () => {
  const downloader = new DownloadStrategyResolver(
    "storage-path",
    zoweExplorerMock,
    e4eMock,
  );
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("checks order of resolution [E4E, DSN and USS order]", () => {
    const downloader = new DownloadStrategyResolver(
      "storage-path",
      zoweExplorerMock,
      e4eMock,
    );
    beforeEach(() => {
      jest.clearAllMocks();
    });
    it("checks the order of copybook resolution - DNS followed by USS)", async () => {
      (downloader as any).dsnDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(false);
      (downloader as any).ussDownloader.downloadCopybook = jest.fn();
      (downloader as any).fetchDownloadSettings = jest
        .fn()
        .mockReturnValue({ dsnPaths: ["dns"], ussPaths: ["uss"] });
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        (downloader as any).dsnDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dns",
      );
      expect(
        (downloader as any).ussDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "uss",
      );
    });

    it("checks the order of copybook resolution - USS is not called when DNS resolves)", async () => {
      (downloader as any).dsnDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(true);
      (downloader as any).ussDownloader.downloadCopybook = jest.fn();
      (downloader as any).fetchDownloadSettings = jest
        .fn()
        .mockReturnValue({ dsnPaths: ["dns"], ussPaths: ["uss"] });
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        (downloader as any).dsnDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dns",
      );
      expect(
        (downloader as any).ussDownloader.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
    });
  });

  it("checks resolver is able to fetch settings", () => {
    SettingsService.getDsnPath = jest.fn().mockReturnValue(["dsn"]);
    SettingsService.getUssPath = jest.fn().mockReturnValue(["uss"]);
    const settings = (downloader as any).fetchDownloadSettings(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
    );
    expect(settings).toEqual({ dsnPaths: ["dsn"], ussPaths: ["uss"] });
  });

  it("checks the order of resolution is same as the one provided in user settings", async () => {
    (downloader as any).dsnDownloader.downloadCopybook = jest
      .fn()
      .mockReturnValueOnce(false)
      .mockReturnValue(true);
    (downloader as any).ussDownloader.downloadCopybook = jest.fn();
    (downloader as any).fetchDownloadSettings = jest
      .fn()
      .mockReturnValue({ dsnPaths: ["dsn", "dsn-2"], ussPaths: [] });
    await downloader.downloadCopybook(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
    );
    expect(
      (downloader as any).dsnDownloader.downloadCopybook,
    ).toHaveBeenCalledWith(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
      "dsn",
    );
    expect(
      (downloader as any).dsnDownloader.downloadCopybook,
    ).toHaveBeenCalledWith(
      { name: "copybook", dialect: "COBOL" },
      "document-uri",
      "dsn-2",
    );
  });

  describe("checks successful resolution calls callback method", () => {
    const downloader = new DownloadStrategyResolver(
      "storage-path",
      zoweExplorerMock,
      e4eMock,
    );
    beforeEach(() => {
      jest.clearAllMocks();
    });

    it("resolution from dsn, calls callback method", async () => {
      (downloader as any).dsnDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(true);
      (downloader as any).fetchDownloadSettings = jest
        .fn()
        .mockReturnValue({ dsnPaths: ["dns"], ussPaths: ["uss"] });
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        (downloader as any).dsnDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dns",
      );
    });

    it("resolution from uss, calls callback method", async () => {
      (downloader as any).dsnDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(false);
      (downloader as any).ussDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(true);
      (downloader as any).fetchDownloadSettings = jest
        .fn()
        .mockReturnValue({ dsnPaths: ["dns"], ussPaths: ["uss"] });
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        (downloader as any).dsnDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "dns",
      );
      expect(
        (downloader as any).ussDownloader.downloadCopybook,
      ).toHaveBeenCalledWith(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
        "uss",
      );
    });
    it("checks the order of copybook resolution - USS and DSN is not called when E4E resolves)", async () => {
      (downloader as any).e4eDownloader.downloadCopybookE4E = jest
        .fn()
        .mockReturnValue(Promise.resolve());
      (downloader as any).dsnDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(false);
      (downloader as any).ussDownloader.downloadCopybook = jest
        .fn()
        .mockReturnValue(false);
      (E4ECopybookService as any).getE4EClient = jest.fn().mockReturnValue({});
      await downloader.downloadCopybook(
        { name: "copybook", dialect: "COBOL" },
        "document-uri",
      );
      expect(
        (downloader as any).e4eDownloader.downloadCopybookE4E,
      ).toHaveBeenCalledWith({ name: "copybook", dialect: "COBOL" }, {});
      expect(
        (downloader as any).dsnDownloader.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
      expect(
        (downloader as any).ussDownloader.downloadCopybook,
      ).toHaveBeenCalledTimes(0);
    });
  });
});
