/*
 * Copyright (c) 2023 Broadcom.
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

import {
  isV1RuntimeDialectDetail,
  isV2RuntimeDialectDetail,
} from "../../dialect/utils";
import * as vscode from "vscode";

describe("Tests dialect util methods", () => {
  it("test isV1RuntimeDialectDetail if supplied dialect is null or not an Object", () => {
    expect(isV1RuntimeDialectDetail(null)).toBeFalsy();
    expect(isV1RuntimeDialectDetail(9)).toBeFalsy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect is null or not an Object", () => {
    expect(isV2RuntimeDialectDetail(null)).toBeFalsy();
    expect(isV2RuntimeDialectDetail(9)).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect contains name element and its a string", () => {
    expect(isV1RuntimeDialectDetail({ notname: "abc" })).toBeFalsy();
    expect(isV1RuntimeDialectDetail({ name: 1 })).toBeFalsy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect contains name element and its a string", () => {
    expect(isV2RuntimeDialectDetail({ notname: "abc" })).toBeFalsy();
    expect(isV2RuntimeDialectDetail({ name: 1 })).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect contains description element and its a string", () => {
    expect(isV1RuntimeDialectDetail({ name: "abc" })).toBeFalsy();
    expect(
      isV1RuntimeDialectDetail({ name: "abc", description: 1 }),
    ).toBeFalsy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect contains description element and its a string", () => {
    expect(isV2RuntimeDialectDetail({ name: "abc" })).toBeFalsy();
    expect(
      isV2RuntimeDialectDetail({ name: "abc", description: 1 }),
    ).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect contains jar element and its a string", () => {
    expect(
      isV1RuntimeDialectDetail({ name: "abc", description: "desc" }),
    ).toBeFalsy();
    expect(
      isV1RuntimeDialectDetail({ name: "abc", description: "desc", jar: 1 }),
    ).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect contains snippets element and its a string", () => {
    expect(
      isV1RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        jar: "jar-uri",
      }),
    ).toBeFalsy();
    expect(
      isV1RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        jar: "jar-uri",
        snippets: 1,
      }),
    ).toBeFalsy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect contains snippets element and its a string", () => {
    expect(
      isV2RuntimeDialectDetail({
        name: "abc",
        description: "desc",
      }),
    ).toBeFalsy();
    expect(
      isV2RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        snippets: 1,
      }),
    ).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect has a invalid jar and snippets uri", () => {
    vscode.Uri.parse = jest.fn().mockImplementationOnce(() => {
      throw new Error();
    });
    expect(
      isV1RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        jar: "jar-uri",
        snippets: "snippet-uri",
      }),
    ).toBeFalsy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect has a invalid snippets uri", () => {
    vscode.Uri.parse = jest.fn().mockImplementationOnce(() => {
      throw new Error();
    });
    expect(
      isV2RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        snippets: "snippet-uri",
      }),
    ).toBeFalsy();
  });

  it("test isV1RuntimeDialectDetail if supplied dialect has a valid jar and snippets uri", () => {
    vscode.Uri.parse = jest.fn().mockReturnValue(true);
    expect(
      isV1RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        jar: "jar-uri",
        snippets: "snippet-uri",
      }),
    ).toBeTruthy();
  });

  it("test isV2RuntimeDialectDetail if supplied dialect has a valid snippets uri", () => {
    vscode.Uri.parse = jest.fn().mockReturnValue(true);
    expect(
      isV2RuntimeDialectDetail({
        name: "abc",
        description: "desc",
        snippets: vscode.Uri.file("file"),
      }),
    ).toBeTruthy();
  });
});
