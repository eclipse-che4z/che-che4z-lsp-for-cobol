/*
 * Copyright (c) 2025 Broadcom.
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

import { EndevorMemberLib } from "../../../../services/copybookLibs/EndevorMemberLib";
import * as vscode from "vscode";
import {
  externalApis,
  initializeExternalAPIs,
} from "../../../../services/ExternalAPIsService";
import * as E4ECopybookService from "../../../../services/copybook/E4ECopybookService";
import { E4E } from "../../../../type/e4eApi";
import { DEFAULT_DIALECT } from "../../../../constants";
import { diagnosticsCollectionMock } from "../../../../__mocks__/vscode";

describe("Endevor Member Lib", () => {
  let e4eMock: E4E;
  const dataset = "ENDEVOR.DATASET.COPYBOOK";

  beforeEach(async () => {
    e4eMock = {
      isEndevorElement: jest.fn().mockResolvedValue(true),
      getProfileInfo: jest.fn().mockResolvedValue({
        profile: "profile",
        instance: "instance",
      }),
      listElements: jest.fn().mockResolvedValue([]),
      getElement: jest.fn(),
      listMembers: jest
        .fn()
        .mockResolvedValue(["COPYBOOK", "ANOTHER", "CaSeTeSt"]),
      getMember: jest.fn().mockResolvedValue([]),
      getConfiguration: jest.fn(),
      onDidChangeElement: jest.fn(),
    };

    jest
      .spyOn(E4ECopybookService, "getE4EAPI")
      .mockResolvedValue({ api: e4eMock });
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
  });

  describe("resolveCopybookUri", () => {
    it("resolves copybook into function that can be used to download copybook to local cache", async () => {
      const lib = new EndevorMemberLib({
        dataset,
        profile: "instance@profile",
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "COPYBOOK",
        document,
        DEFAULT_DIALECT,
      );
      expect(typeof result).toEqual("function");

      expect(e4eMock.getProfileInfo).toHaveBeenCalledWith({
        instance: "instance",
        profile: "profile",
      });

      // copybook is resolved, but hasn't been downloaded yet
      expect(vscode.workspace.fs.writeFile).not.toHaveBeenCalled();

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
        ),
      );

      // content of the copybook was written into the cache directory
      expect(vscode.workspace.fs.writeFile).toHaveBeenCalledWith(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
        ),
        expect.any(Buffer),
      );
    });

    it("reads profile configuration from opened document", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "COPYBOOK",
        document,
        DEFAULT_DIALECT,
      );

      expect(e4eMock.getProfileInfo).toHaveBeenCalledWith(
        vscode.Uri.file("/program.cbl").toString(),
      );

      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/COPYBOOK",
        ),
      );
    });

    it("copybook resolution is case insensitive", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "CASEtest",
        document,
        DEFAULT_DIALECT,
      );
      expect(typeof result).toEqual("function");

      const downloadResult = await result!();
      expect(downloadResult).toEqual(
        vscode.Uri.file(
          "/storage/e4e/copybooks/instance.profile/ENDEVOR.DATASET.COPYBOOK/CaSeTeSt",
        ),
      );
    });

    it("returns undefined if copybook is not present in the dataset", async () => {
      const lib = new EndevorMemberLib({
        dataset,
      });
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "NOTFOUND",
        document,
        DEFAULT_DIALECT,
      );
      expect(result).toBeUndefined();
    });

    describe("profile not configured", () => {
      beforeEach(() => {
        e4eMock.getProfileInfo = jest.fn().mockResolvedValue(undefined);
      });

      it("returns undefined if profile is not configured", async () => {
        const lib = new EndevorMemberLib({
          dataset,
          profile: "invalid",
        });
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();
      });
    });

    describe("E4E is not installed", () => {
      beforeEach(async () => {
        jest
          .spyOn(E4ECopybookService, "getE4EAPI")
          .mockResolvedValue(undefined);
        await initializeExternalAPIs(vscode.Uri.file("/storage"));
      });

      it("returns undefined if e4e is not installed", async () => {
        const lib = new EndevorMemberLib({
          dataset,
          profile: "profile",
        });
        const document = vscode.Uri.file("/program.cbl");
        const result = await lib.resolveCopybookUri(
          "COPYBOOK",
          document,
          DEFAULT_DIALECT,
        );
        expect(result).toBeUndefined();

        expect(result).toBeUndefined();
        expect(diagnosticsCollectionMock.set).toHaveBeenCalledWith(
          expect.objectContaining({ path: "/program.cbl" }),
          [
            {
              message: "Explorer for Endevor is not installed",
              range: {
                end: { character: 0, line: 1 },
                start: { character: 0, line: 0 },
              },
              severity: 1,
            },
          ],
        );
        diagnosticsCollectionMock.set.mockClear();

        // diagnostics disappear after ZE installation and copybook can be resolved
        externalApis.e4eAppeared(e4eMock);
        const resultAfter = await lib.resolveCopybookUri(
          "COPYBOOK",
          vscode.Uri.file("/program.cbl"),
          DEFAULT_DIALECT,
        );
        expect(typeof resultAfter).toEqual("function");
        expect(diagnosticsCollectionMock.clear).toHaveBeenCalled();
        expect(diagnosticsCollectionMock.set).not.toHaveBeenCalled();
      });
    });
  });

  describe("listCopybooks", () => {
    it("return list of members from endevor api", async () => {
      const lib = new EndevorMemberLib({ dataset });
      const document = vscode.Uri.file("/program.cbl");
      const copybooks = await lib.listCopybooks(document, DEFAULT_DIALECT);
      expect(copybooks).toEqual(["COPYBOOK", "ANOTHER", "CaSeTeSt"]);
    });
  });
});
