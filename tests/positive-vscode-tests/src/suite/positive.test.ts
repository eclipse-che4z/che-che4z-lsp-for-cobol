/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import * as assert from "assert";
import * as path from "path";
import * as vscode from "vscode";
import { checkNoErrors, checkSnapshot } from "../lib/assertions";
import { findPrograms } from "../lib/discovery";
import { emptySnapshot, readSnapshot } from "../lib/snapshot";
import { AnalysisResultDto, CobolExtensionApi } from "../lib/types";

const COBOL_EXTENSION_ID = "BroadcomMFD.cobol-language-support";
const DIALECT_EXTENSION_IDS = [
  "BroadcomMFD.cobol-language-support-for-idms",
  "BroadcomMFD.cobol-language-support-for-daco",
];
const COBOL_LANGUAGE_IDS = ["cobol", "expcobol", "hpcobol"];
const TEST_TIMEOUT = Number(process.env.POSITIVE_TESTS_TIMEOUT || 150000);

const testFolder = process.env.POSITIVE_TEST_FOLDER!;
const programs = findPrograms(testFolder);

suite(`Positive tests: ${path.basename(testFolder)}`, function () {
  this.timeout(TEST_TIMEOUT);
  let api: CobolExtensionApi;

  suiteSetup(async function () {
    for (const id of DIALECT_EXTENSION_IDS) {
      await vscode.extensions.getExtension(id)?.activate();
    }
    const cobol = vscode.extensions.getExtension<CobolExtensionApi>(COBOL_EXTENSION_ID);
    assert.ok(cobol, `${COBOL_EXTENSION_ID} is not installed`);
    api = await cobol.activate();
    assert.ok(
      typeof api.analysisResult === "function",
      "The COBOL extension does not expose analysisResult(uri), it is available only in extension test mode (loaded from a development folder)",
    );
  });

  teardown(async function () {
    await vscode.commands.executeCommand("workbench.action.closeAllEditors");
  });

  if (programs.length === 0) {
    test("programs", () =>
      assert.fail(`No files in ${testFolder} match .cobolplugin/pgm_conf.json`));
  }

  for (const program of programs) {
    test(path.relative(testFolder, program.file), async function () {
      const document = await openDocument(vscode.Uri.file(program.file));
      const uri = document.uri.toString();
      const result = await fetchAnalysisResult(api, uri, TEST_TIMEOUT - 5000);

      const snapshot = program.snapshot ? readSnapshot(program.snapshot) : emptySnapshot();
      const failures = checkSnapshot(result, snapshot, program.fileName);
      const errors = checkNoErrors(result, uri, program.fileName);
      if (errors) {
        failures.push(errors);
      }
      if (failures.length > 0) {
        assert.fail(failures.join("\n"));
      }
    });
  }
});

async function openDocument(uri: vscode.Uri): Promise<vscode.TextDocument> {
  let document = await vscode.workspace.openTextDocument(uri);
  if (!COBOL_LANGUAGE_IDS.includes(document.languageId)) {
    document = await vscode.languages.setTextDocumentLanguage(document, "cobol");
  }
  await vscode.window.showTextDocument(document, { preview: false });
  return document;
}

/**
 * The server waits for a running analysis, but returns null until the document is known to it,
 * so retry until the result is available.
 */
async function fetchAnalysisResult(
  api: CobolExtensionApi,
  uri: string,
  timeout: number,
): Promise<AnalysisResultDto> {
  const deadline = Date.now() + timeout;
  for (;;) {
    const result = await api.analysisResult(uri);
    if (result) {
      return result;
    }
    if (Date.now() > deadline) {
      throw new Error(`No analysis result for ${uri} after ${timeout}ms`);
    }
    await new Promise((resolve) => setTimeout(resolve, 500));
  }
}
