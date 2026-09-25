/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 */

import * as assert from "node:assert";
import * as fs from "node:fs";
import * as path from "node:path";
import * as vscode from "vscode";
import * as helper from "./testHelper";

interface JavaVariant {
  javaClass: string;
  variant: string;
  status: string;
  file?: string;
  expectSentinel?: boolean;
  usages?: {
    name: string;
    line: number;
    character: number;
    definitionLine: number;
  }[];
  diagnostics?: {
    name: string;
    line: number;
    character: number;
    message: string;
  }[];
}

const variants: JavaVariant[] = JSON.parse(
  fs.readFileSync(
    path.resolve(__dirname, "../../../test_files/parameterized/manifest.json"),
    "utf8",
  ),
);

suite("Parameterized Java IDMS usecases", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async () => helper.activate());
  this.afterEach(async () => helper.closeAllEditors());
  this.afterAll(async () => helper.closeAllEditors());

  for (const variant of variants.filter(
    (entry) => entry.status === "integration",
  )) {
    test(`${variant.javaClass}: ${variant.variant}`, async () => {
      assert.ok(variant.file);
      assert.ok(variant.usages?.length);
      const editor = await helper.showDocument(variant.file);
      if (variant.expectSentinel !== false) {
        try {
          await helper.waitFor(
            () =>
              vscode.languages
                .getDiagnostics(editor.document.uri)
                .some((diagnostic) =>
                  diagnostic.message.includes("NOT-EXISTING"),
                ),
            3000,
            variant.file,
          );
        } catch (error) {
          throw new Error(
            `No sentinel diagnostic in ${variant.file}: ${JSON.stringify(
              vscode.languages
                .getDiagnostics(editor.document.uri)
                .map((diagnostic) => diagnostic.message),
            )}`,
            { cause: error },
          );
        }
        const diagnostics = vscode.languages.getDiagnostics(
          editor.document.uri,
        );
        assert.deepStrictEqual(
          diagnostics.map((diagnostic) => diagnostic.message),
          ["Variable NOT-EXISTING is not defined"],
        );
      }
      for (const usage of variant.usages) {
        try {
          await helper.checkDefinition(
            editor,
            new vscode.Position(usage.line, usage.character),
            usage.definitionLine,
          );
        } catch (error) {
          throw new Error(`Definition of ${usage.name} in ${variant.variant}`, {
            cause: error,
          });
        }
      }
    });
  }

  for (const variant of variants.filter(
    (entry) => entry.status === "diagnostic",
  )) {
    test(`${variant.javaClass}: ${variant.variant} reports its own error`, async () => {
      assert.ok(variant.file);
      assert.ok(variant.diagnostics?.length);
      const editor = await helper.showDocument(variant.file);
      for (const expected of variant.diagnostics) {
        await helper.waitFor(
          () =>
            vscode.languages
              .getDiagnostics(editor.document.uri)
              .some((diagnostic) => diagnostic.message === expected.message),
          10000,
          variant.file,
        );
        helper.checkDiagnostic(
          vscode.languages.getDiagnostics(editor.document.uri),
          expected.message,
          new vscode.Range(
            expected.line,
            expected.character,
            expected.line,
            expected.character + expected.name.length,
          ),
        );
      }
    });
  }
});
