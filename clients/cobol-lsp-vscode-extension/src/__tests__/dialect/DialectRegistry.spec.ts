/*
 * Copyright (c) 2022 Broadcom.
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
import { DialectRegistry } from "../../dialect/DialectRegistry";

describe("DialectRegistry test", () => {
  beforeEach(() => {
    DialectRegistry.clear();
  });

  it("register/unregister new dialect in the registry", () => {
    DialectRegistry.registerV1(
      "dialectId",
      "new",
      Uri.file("/"),
      "desc",
      "path",
    );
    expect(DialectRegistry.getDialects().length).toBe(1);

    DialectRegistry.unregister("new");
    expect(DialectRegistry.getDialects().length).toBe(0);
  });

  it("retrieve dialects from the registry for v1 version", () => {
    DialectRegistry.registerV1(
      "id",
      "dialect",
      Uri.file("jar"),
      "desc",
      "snippetPath",
    );
    const result = DialectRegistry.getDialects();

    expect(result.length).toBe(1);
    expect(result[0].name).toBe("dialect");
    expect(result[0].description).toBe("desc");
    expect(result[0].extensionId).toBe("id");
    expect(result[0].protocolVersion).toBe(1);
    if (result[0].protocolVersion === 1) {
      expect(result[0].uri.toString()).toBe(Uri.file("jar").toString());
    }
    expect(result[0].snippetUri.toString()).toBe(
      Uri.file("snippetPath").toString(),
    );
  });

  it("retrieve dialects from the registry for v2 version", () => {
    const snippets = Uri.parse("file:/snippetPath");
    DialectRegistry.registerV2("id", "dialect", "desc", snippets);
    const result = DialectRegistry.getDialects();

    expect(result.length).toBe(1);
    expect(result[0].name).toBe("dialect");
    expect(result[0].description).toBe("desc");
    expect(result[0].extensionId).toBe("id");
    expect(result[0].protocolVersion).toBe(2);
    expect(result[0].snippetUri.fsPath).toContain("snippetPath");
  });
});
