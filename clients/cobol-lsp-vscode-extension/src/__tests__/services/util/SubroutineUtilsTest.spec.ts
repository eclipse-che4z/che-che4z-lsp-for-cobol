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
  afterEach(() => {
    jest.restoreAllMocks();
  });

  describe("Subroutines configuration exists", () => {
    beforeEach(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => ["subroutines", "more-subroutines"],
      } as unknown as vscode.WorkspaceConfiguration);
    });

    let findFilesSpy: jest.SpyInstance;
    describe("subroutine file exists in workspace", () => {
      beforeEach(() => {
        findFilesSpy = jest
          .spyOn(vscode.workspace, "findFiles")
          .mockResolvedValue([
            vscode.Uri.file("/coding/cobol/subroutines/SUB1.cob"),
          ]);
      });

      it("finds subroutine file in workspace folder by name and returns full path", async () => {
        const uri = await resolveSubroutineURI("SUB1");
        expect(uri).toEqual("file:///coding/cobol/subroutines/SUB1.cob");
        expect(findFilesSpy).toHaveBeenCalledWith(
          "subroutines/**/SUB1{.CBL,.COB,.COBOL,.cbl,.cob,.cobol}",
          null,
          1,
        );
      });
    });

    describe("subroutine file doesn't exist in the subroutines folders", () => {
      beforeEach(() => {
        findFilesSpy = jest
          .spyOn(vscode.workspace, "findFiles")
          .mockResolvedValue([]);
      });

      it("returns undefined", async () => {
        const uri = await resolveSubroutineURI("SUB1");
        expect(uri).toBeUndefined();
      });
    });
  });

  describe("No subroutines folders are configured", () => {
    beforeEach(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => undefined,
      } as unknown as vscode.WorkspaceConfiguration);
    });

    it("subroutine path is resolved as undefined", async () => {
      const uri = await resolveSubroutineURI("SUB1");
      expect(uri).toBeUndefined();
    });
  });

  describe("Absolute subroutines folders are configured", () => {
    beforeEach(() => {
      jest.spyOn(vscode.workspace, "getConfiguration").mockReturnValue({
        get: () => ["/absolute/subroutines"],
      } as unknown as vscode.WorkspaceConfiguration);
    });

    let findFilesSpy: jest.SpyInstance;
    beforeEach(() => {
      findFilesSpy = jest
        .spyOn(vscode.workspace, "findFiles")
        .mockResolvedValue([vscode.Uri.file("/absolute/subroutines/SUB1.cob")]);
    });

    it("subroutine path is resolved", async () => {
      const uri = await resolveSubroutineURI("SUB1");
      expect(uri).toEqual("file:///absolute/subroutines/SUB1.cob");
      expect(findFilesSpy).toHaveBeenCalledWith(
        {
          base: "/absolute/subroutines",
          pattern: "**/SUB1{.CBL,.COB,.COBOL,.cbl,.cob,.cobol}",
        },
        null,
        1,
      );
    });
  });
});
