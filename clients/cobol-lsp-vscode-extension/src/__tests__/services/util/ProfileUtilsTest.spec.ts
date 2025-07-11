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
import { ProfileUtils } from "../../../services/util/ProfileUtils";

describe("Test profile Utils", () => {
  const programUri = vscode.Uri.file("/COBOLFILE.cbl");
  it("checks a profile passed through settings is always given preference over profile from doc path for copybook download", () => {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
      get: jest.fn().mockReturnValue("profileInSettings"),
    });

    expect(ProfileUtils.getProfileNameForCopybook(programUri)).toBe(
      "profileInSettings",
    );
  });
});
