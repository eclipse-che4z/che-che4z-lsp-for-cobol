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
  clearProfiles,
  getProfileNameForCopybook,
  getProfileStatus,
} from "../../../services/util/ProfileUtils";

describe("Test profile Utils", () => {
  it("checks a profile passed through settings is always given preference over profile from doc path for copybook download", () => {
    const programUri = vscode.Uri.parse(
      "zowe-ds:/documentProfile/COBOLFILE.cbl",
    );
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profileInSettings"),
    });

    expect(getProfileNameForCopybook(programUri)).toBe("profileInSettings");
  });

  describe("getProfileStatus", () => {
    describe("result is cached", () => {
      beforeEach(() => {
        clearProfiles();
      });

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
