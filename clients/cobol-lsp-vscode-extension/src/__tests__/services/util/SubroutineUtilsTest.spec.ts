/*
 * Copyright (c) 2020 Broadcom.
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
import { resolveSubroutineURI } from "../../../services/util/SubroutineUtils";

describe("SubroutineUtils", () => {
  beforeEach(() => {
    jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
      get: () => ["subroutines", "more-subroutines"],
    } as unknown as vscode.WorkspaceConfiguration);
  });

  let findFilesSpy: jest.SpyInstance;
  describe("subroutine file exists in workspace", () => {
    findFilesSpy = jest
      .spyOn(vscode.workspace, "findFiles")
      .mockResolvedValue([
        vscode.Uri.file("/coding/cobol/subroutines/SUB1.cob"),
      ]);

    it("finds subroutine file in workspace folder by name", async () => {
      const uri = await resolveSubroutineURI("SUB1");
      expect(uri).toEqual("file:///coding/cobol/subroutines/SUB1.cob");
      expect(findFilesSpy).toHaveBeenCalledWith(
        "{subroutines,more-subroutines}/**/SUB1{.CBL,.COB,.COBOL,.cbl,.cob,.cobol}",
        null,
        1,
      );
    });
  });
});
