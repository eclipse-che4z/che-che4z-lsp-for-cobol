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

import { Uri } from "vscode";
import {
  createFileSearchPattern,
  getVariablesFromUri,
} from "../../../services/util/FSUtils";

describe("FSUtils tests", () => {
  describe("createFileSearchPattern", () => {
    it("creates search pattern", () => {
      const pattern = createFileSearchPattern(
        Uri.parse("file:///test/path"),
        "FILE",
      );
      expect(pattern.base).toEqual({ path: "/test/path" });
      expect(pattern.pattern).toEqual("FILE");
    });

    it("splits search path to base are pattern parts", () => {
      const pattern = createFileSearchPattern(
        Uri.parse("file:///base/path/*/pattern/path"),
        "*",
      );
      expect(pattern.base).toEqual({ path: "/base/path" });
      expect(pattern.pattern).toEqual("*/pattern/path/*");
    });
  });

  describe("getVariablesFromUri", () => {
    it("splits path to variables", () => {
      const result = getVariablesFromUri(Uri.parse("/test/path/filename.ext"));
      expect(result).toEqual({
        filename: "filename",
        dirName: "/test/path",
        dirBasename: "path",
        extension: ".ext",
      });
    });

    it("splits file with no extension", () => {
      const result = getVariablesFromUri(Uri.parse("/test/path/filename"));
      expect(result).toEqual({
        filename: "filename",
        dirName: "/test/path",
        dirBasename: "path",
        extension: "",
      });
    });

    it("splits dotfile with no extension", () => {
      const result = getVariablesFromUri(Uri.parse("/test/path/.filename"));
      expect(result).toEqual({
        filename: ".filename",
        dirName: "/test/path",
        dirBasename: "path",
        extension: "",
      });
    });

    it("includes extension in filename", () => {
      const result = getVariablesFromUri(
        Uri.parse("/test/path/filename.ext"),
        true,
      );
      expect(result).toEqual({
        filename: "filename.ext",
        dirName: "/test/path",
        dirBasename: "path",
        extension: ".ext",
      });
    });
  });
});
