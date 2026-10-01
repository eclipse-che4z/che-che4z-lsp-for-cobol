/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import { FileType } from "vscode";
import VirtualPathLib, {
  virtualCopybooks,
} from "../../../../services/copybookLibs/VirtualPathLib";
import * as vscode from "vscode";
import { initializeExternalAPIs } from "../../../../services/ExternalAPIsService";
import {
  getConfigurationResult,
  readDirectoryResult,
} from "../../../../__mocks__/vscode";
import { DEFAULT_DIALECT } from "../../../../constants";

describe("Virtual filesystem provider copybook library", () => {
  beforeEach(async () => {
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
    getConfigurationResult["copybook-extensions"] = [".CPY", ".cpy", ""];
    virtualCopybooks.clearCache();
    Object.keys(readDirectoryResult).forEach(
      (key) => delete readDirectoryResult[key],
    );
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  describe("create", () => {
    it("claims a scheme-qualified path", () => {
      expect(VirtualPathLib.create("zowe-uss:/profile/path")).toBeInstanceOf(
        VirtualPathLib,
      );
    });

    it("does not claim a plain local path", () => {
      expect(VirtualPathLib.create("local/copybooks")).toBeUndefined();
    });
  });

  describe("resolveCopybookUri", () => {
    it("resolves a copybook from the provider directory", async () => {
      readDirectoryResult["/profile/path"] = [["COPYBOOK.cpy", FileType.File]];

      const lib = new VirtualPathLib("zowe-uss:/profile/path");
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "COPYBOOK",
        document,
        DEFAULT_DIALECT,
      );

      expect(result).toEqual(
        vscode.Uri.parse("zowe-uss:/profile/path/COPYBOOK.cpy"),
      );
    });

    it("evaluates path variables before resolving", async () => {
      readDirectoryResult["/profile/ABCPROG"] = [
        ["ABCCOPY.cpy", FileType.File],
      ];

      const lib = new VirtualPathLib(
        "zowe-uss:/profile/${fileBasenameNoExtension}",
      );
      const document = vscode.Uri.file("/ABCPROG.cbl");
      const result = await lib.resolveCopybookUri(
        "ABCCOPY",
        document,
        DEFAULT_DIALECT,
      );

      expect(result).toEqual(
        vscode.Uri.parse("zowe-uss:/profile/ABCPROG/ABCCOPY.cpy"),
      );
    });

    it("returns undefined instead of throwing when the directory read fails", async () => {
      readDirectoryResult["/profile/missing"] = new Error("not found");

      const lib = new VirtualPathLib("zowe-uss:/profile/missing");
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.resolveCopybookUri(
        "COPYBOOK",
        document,
        DEFAULT_DIALECT,
      );

      expect(result).toBeUndefined();
    });
  });

  describe("listCopybooks", () => {
    it("lists copybooks from the provider directory", async () => {
      readDirectoryResult["/profile/path"] = [
        ["COPYBOOK.cpy", FileType.File],
        ["subdir", FileType.Directory],
      ];

      const lib = new VirtualPathLib("zowe-uss:/profile/path");
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.listCopybooks(document, DEFAULT_DIALECT);

      expect(result).toEqual(["COPYBOOK"]);
    });

    it("returns an empty array instead of throwing when the directory read fails", async () => {
      readDirectoryResult["/profile/missing"] = new Error("not found");

      const lib = new VirtualPathLib("zowe-uss:/profile/missing");
      const document = vscode.Uri.file("/program.cbl");
      const result = await lib.listCopybooks(document, DEFAULT_DIALECT);

      expect(result).toEqual([]);
    });
  });
});
