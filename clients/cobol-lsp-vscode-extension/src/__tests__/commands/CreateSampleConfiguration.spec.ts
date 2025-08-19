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

import * as vscode from "vscode";
import {
  createSampleConfiguration,
  pickWorkspace,
} from "../../commands/CreateSampleConfiguration";
import { showQuickPickMock } from "../../__mocks__/vscode";

beforeEach(() => {
  jest.clearAllMocks();
});

afterAll(() => {
  jest.clearAllMocks();
});

describe("Create sample configuration command", () => {
  it("No workspace", async () => {
    expect(await pickWorkspace(undefined)).toBe(undefined);
    expect(await pickWorkspace([])).toBe(undefined);
  });
  it("One workspace", async () => {
    const ws = { name: "ws", uri: vscode.Uri.parse("test:/"), index: 0 };
    expect(await pickWorkspace([ws])).toBe(ws);
  });
  it("More workspace", async () => {
    const ws1 = { name: "ws1", uri: vscode.Uri.parse("test:/"), index: 0 };
    const ws2 = { name: "ws2", uri: vscode.Uri.parse("test:/"), index: 1 };
    showQuickPickMock.mockImplementation((x: unknown[]) => x[0]);
    expect(await pickWorkspace([ws1, ws2])).toBe(ws1);
  });

  it("Create files", async () => {
    const ws = { name: "ws", uri: vscode.Uri.parse("test:/"), index: 0 };
    const stat = () => Promise.reject(Error("does not exist"));
    const writeFile = jest.fn().mockReturnValue(undefined);
    const createDirectory = jest.fn().mockReturnValue(undefined);
    await createSampleConfiguration(Promise.resolve(ws), {
      stat,
      writeFile,
      createDirectory,
    } as unknown as vscode.FileSystem);
    expect(createDirectory).toHaveBeenCalledWith(
      vscode.Uri.parse("test:/.cobolplugin"),
    );
    expect(writeFile).toHaveBeenCalledWith(
      vscode.Uri.parse("test:/.cobolplugin/pgm_conf.json"),
      expect.anything(),
    );
    expect(writeFile).toHaveBeenCalledWith(
      vscode.Uri.parse("test:/.cobolplugin/proc_grps.json"),
      expect.anything(),
    );
    expect(
      writeFile.mock.calls.map((x: Uint8Array[]) => Array.from(x[1])),
    ).toStrictEqual([
      expect.arrayContaining(Array.from(new TextEncoder().encode('"pgms"'))),
      expect.arrayContaining(Array.from(new TextEncoder().encode('"pgroups"'))),
    ]);
  });
});
