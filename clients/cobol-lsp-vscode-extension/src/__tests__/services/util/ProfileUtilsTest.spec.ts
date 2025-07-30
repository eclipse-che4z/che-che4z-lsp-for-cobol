/*
 * Copyright (c) 2021 Broadcom.
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

import * as vscode from "vscode";
import {
  getProfileNameForCopybook,
  getProfileStatus,
} from "../../../services/util/ProfileUtils";
import { getConfigurationResult } from "../../../__mocks__/vscode";

describe("Test profile Utils", () => {
  describe("getProfileNameForCopybook", () => {
    describe("profile in settings configured", () => {
      beforeEach(() => {
        getConfigurationResult["profiles"] = "profileInSettings";
      });

      it("checks a profile passed through settings is always given preference over profile from doc path for copybook download", () => {
        const programUri = vscode.Uri.parse(
          "zowe-ds:/documentProfile/COBOLFILE.cbl",
        );

        expect(getProfileNameForCopybook(programUri)).toBe("profileInSettings");
      });
    });

    describe("profile in settings empty", () => {
      beforeEach(() => {
        getConfigurationResult["profiles"] = undefined;
      });

      it("return profile name from document URI", () => {
        const programUri = vscode.Uri.parse(
          "zowe-ds:/documentProfile/DATASET.WITH.COBOL/COBOL.cbl",
        );

        expect(getProfileNameForCopybook(programUri)).toBe("documentProfile");
      });

      it("returns undefined for non-zowe uris", () => {
        expect(
          getProfileNameForCopybook(vscode.Uri.file("/workspace/doc.cpy")),
        ).toBeUndefined();
      });
    });
  });

  describe("getProfileStatus", () => {
    describe("result is cached", () => {
      it("calls the check function only once for each profile name", async () => {
        const testCheck = jest.fn();

        const resultA = await getProfileStatus("profile", testCheck);
        expect(resultA).toEqual("valid-profile");
        const resultB = await getProfileStatus("profile", testCheck);
        expect(resultB).toEqual("valid-profile");

        expect(testCheck).toHaveBeenCalledTimes(1);

        const resultC = await getProfileStatus("other-profile", testCheck);
        expect(resultC).toEqual("valid-profile");

        expect(testCheck).toHaveBeenCalledTimes(2);
      });

      it("serializes parallel requests", async () => {
        const testCheckA = jest.fn();
        const testCheckB = jest.fn();

        await Promise.all([
          getProfileStatus("profile", testCheckA),
          getProfileStatus("profile", testCheckB),
        ]);

        expect(testCheckA).toHaveBeenCalledTimes(1);
        expect(testCheckB).not.toHaveBeenCalled();
      });
    });
  });
});
