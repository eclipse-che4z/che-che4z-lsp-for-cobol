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
import { DialectRegistry } from "../../services/DialectRegistry";

describe("DialectRegistry test", () => {
  beforeEach(() => {
    DialectRegistry.clear();
  });

  it("register/unregister new dialect in the registry", () => {
    DialectRegistry.register("dialectId", "new", Uri.file("/"), "desc", "path");
    expect(DialectRegistry.getDialects().length).toBe(1);

    DialectRegistry.unregister("new");
    expect(DialectRegistry.getDialects().length).toBe(0);
  });

  it("retrieve dialects from the registry", () => {
    DialectRegistry.register(
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
    expect(result[0].uri.toString()).toBe(Uri.file("jar").toString());
    expect(result[0].snippetPath).toBe("snippetPath");
  });
});
