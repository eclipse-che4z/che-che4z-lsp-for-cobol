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
import * as vscode from "vscode";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Copybook Test Suite", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  this.afterAll(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  async function openWithoutIdmsErrors(fileName: string) {
    const editor = await helper.showDocument(fileName);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.deepStrictEqual(
      diagnostics.map((diagnostic) => diagnostic.message),
      ["Variable NOT-EXISTING is not defined"],
    );
    return editor;
  }

  function positionOf(editor: vscode.TextEditor, text: string, last = false) {
    const source = editor.document.getText();
    const offset = last ? source.lastIndexOf(text) : source.indexOf(text);
    assert.ok(offset >= 0, `${text} not found in ${editor.document.fileName}`);
    return editor.document.positionAt(offset);
  }

  async function checkHoverContains(
    editor: vscode.TextEditor,
    position: vscode.Position,
    expected: RegExp,
  ) {
    const hovers = await vscode.commands.executeCommand<vscode.Hover[]>(
      "vscode.executeHoverProvider",
      editor.document.uri,
      position,
    );
    const text = (hovers ?? [])
      .flatMap((hover) => hover.contents)
      .map((content) => (typeof content === "string" ? content : content.value))
      .join("\n");
    assert.match(text, expected);
  }

  test("Error inside the copybook", async () => {
    const editor = await helper.showDocument("Idms001.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Errors inside the copybook",
      range(pos(8, 7), pos(8, 28)),
      vscode.DiagnosticSeverity.Error,
    );

    const copyEditor = await helper.showDocument("copybooks/COPY001");
    const copyDiagnostics = await helper.waitForDiagnosticCount(
      copyEditor.document.uri,
      1,
    );
    helper.checkDiagnostic(
      copyDiagnostics,
      'A "PICTURE" or "USAGE INDEX" clause was not found for elementary item LDQLAB',
      range(pos(0, 11), pos(0, 17)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Copybook not found", async () => {
    const editor = await helper.showDocument("Idms002.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "COPY1: Copybook not found",
      range(pos(8, 20), pos(8, 25)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested copybook", async () => {
    const editor = await helper.showDocument("Idms003.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Circular dependency", async () => {
    const editor = await helper.showDocument("Idms004.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Errors inside the copybook",
      range(pos(9, 11), pos(9, 32)),
      vscode.DiagnosticSeverity.Error,
    );

    const copyEditor = await helper.showDocument("copybooks/COPY004");
    const copyDiagnostics = await helper.waitForDiagnosticCount(
      copyEditor.document.uri,
      1,
    );
    helper.printAllDiagnostics(copyDiagnostics);
    assert.strictEqual(copyDiagnostics.length, 1);

    helper.checkDiagnostic(
      copyDiagnostics,
      "COPY004: Copybook has circular dependency",
      range(pos(0, 21), pos(0, 28)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested copybook and its variables properly constructed (case 1)", async () => {
    const editor = await helper.showDocument("Idms005.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested regular COBOL copybook", async () => {
    const editor = await helper.showDocument("Idms006.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );

    const nodeUsage = editor.document.getText().indexOf("NODE OF SUBNODE");
    assert.ok(nodeUsage >= 0);
    const definitions = await vscode.commands.executeCommand<vscode.Location[]>(
      "vscode.executeDefinitionProvider",
      editor.document.uri,
      editor.document.positionAt(nodeUsage),
    );
    assert.strictEqual(definitions?.length, 1);
    assert.ok(definitions[0].uri.path.endsWith("/regularCopybooks/COPY006"));
    assert.strictEqual(definitions[0].range.start.line, 0);
  });

  test("Resolve nested copybook and its variables properly constructed (case 2)", async () => {
    const editor = await helper.showDocument("Idms007.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Ambiguous reference for IDMS-NODE",
      range(pos(12, 19), pos(12, 48)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 2)", async () => {
    const editor = await helper.showDocument("Idms008.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 3)", async () => {
    const editor = await helper.showDocument("Idms009.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 4)", async () => {
    const editor = await helper.showDocument("Idms010.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 5)", async () => {
    const editor = await helper.showDocument("Idms011.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 6)", async () => {
    const editor = await helper.showDocument("Idms012.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook in FILE SECTION", async () => {
    const editor = await helper.showDocument("Idms013.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(18, 19), pos(18, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook and its variables properly constructed (case 7)", async () => {
    const editor = await helper.showDocument("Idms014.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(10, 19), pos(10, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve SUBSCHEMA-NAMES copybook with section only", async () => {
    const editor = await helper.showDocument("Idms015.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(5, 19), pos(5, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook with comments", async () => {
    const editor = await helper.showDocument("Idms016.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook required cleanup", async () => {
    const editor = await helper.showDocument("Idms017.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook with variable levels adjustment", async () => {
    const editor = await helper.showDocument("Idms018.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook after concat", async () => {
    const editor = await helper.showDocument("Idms019.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(15, 19), pos(15, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook with COBOL (case 1)", async () => {
    const editor = await helper.showDocument("Idms020.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(5, 19), pos(5, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve copybook with COBOL (case 2)", async () => {
    const editor = await helper.showDocument("Idms021.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("ordinary and IDMS copybooks with the same name stay distinct", async () => {
    const editor = await openWithoutIdmsErrors("MixedCopybooks.cbl");
    for (const [name, directory] of [
      ["PROGRAM-STATUS", "regularCopybooks"],
      ["PROGRAM-NAME", "copybooks"],
    ]) {
      const locations = await vscode.commands.executeCommand<vscode.Location[]>(
        "vscode.executeDefinitionProvider",
        editor.document.uri,
        positionOf(editor, `DISPLAY ${name}`).translate(0, "DISPLAY ".length),
      );
      assert.strictEqual(locations?.length, 1);
      assert.ok(
        locations[0].uri.path.endsWith(`/${directory}/CBOOK`),
        `${name} resolved to ${locations[0].uri.path}`,
      );
    }
  });

  test("multiple and nested IDMS copybooks keep their variable definitions", async () => {
    const editor = await openWithoutIdmsErrors("CopyVariables.cbl");
    await helper.checkDefinition(
      editor,
      positionOf(editor, "VAR2.", true),
      helper.inDocument("CV-PARENT", 1),
    );
    await helper.checkDefinition(
      editor,
      positionOf(editor, "PROGRAM-NAME.", true),
      helper.inDocument("CV-PROGRAM", 1),
    );
    await helper.checkDefinition(
      editor,
      positionOf(editor, "MRB WITHIN"),
      positionOf(editor, "01 MRB.").line,
    );
  });

  test("special level 88 remains a condition-name in an IDMS copybook", async () => {
    const editor = await openWithoutIdmsErrors("Level88.cbl");
    const usage = positionOf(editor, "VAR3.", true);
    await helper.checkDefinition(
      editor,
      usage,
      helper.inDocument("LV88-COPY", 2),
    );
    await checkHoverContains(editor, usage, /\b88\s+VAR3\b/);
  });

  test("level above 49 remains unchanged and reports a warning", async () => {
    const editor = await openWithoutIdmsErrors("Level48.cbl");
    const usage = positionOf(editor, "VAR3.", true);
    await helper.checkDefinition(
      editor,
      usage,
      helper.inDocument("LV48-COPY", 2),
    );
    await checkHoverContains(editor, usage, /\b48\s+VAR3\b/);

    const copyEditor = await helper.showDocument("copybooks/LV48-COPY");
    const diagnostics = await helper.waitForDiagnosticCount(
      copyEditor.document.uri,
      1,
    );
    assert.strictEqual(
      diagnostics[0].severity,
      vscode.DiagnosticSeverity.Warning,
    );
    assert.strictEqual(
      diagnostics[0].message,
      "IDMS level not adjusted. 50 (2 + 48) exceeds maximum level adjustment of 49",
    );
    assert.strictEqual(diagnostics[0].relatedInformation?.length, 1);
    assert.strictEqual(
      diagnostics[0].relatedInformation?.[0].location.uri.toString(),
      editor.document.uri.toString(),
    );
  });

  for (const fileName of [
    "ControlWorking.cbl",
    "ControlLinkage.cbl",
    "ControlIncrement.cbl",
    "ControlProtocol.cbl",
  ]) {
    test(`${fileName} inserts the predefined copybook`, async () => {
      const editor = await openWithoutIdmsErrors(fileName);
      await helper.checkDefinition(
        editor,
        positionOf(editor, "DISPLAY EMPLOYEE").translate(0, "DISPLAY ".length),
        helper.inDocument("SUBSCHEMA-DESCRIPTION", 0),
      );
    });
  }

  test("missing predefined SUBSCHEMA-NAMES reports its own name", async () => {
    const configuration = vscode.workspace.getConfiguration(
      "cobol-lsp.cpy-manager.idms",
    );
    const originalPaths = configuration.get<string[]>("paths-local");
    await configuration.update(
      "paths-local",
      [],
      vscode.ConfigurationTarget.Workspace,
    );
    try {
      const editor = await helper.showDocument("MissingSubschema.cbl");
      const diagnostics = await helper.waitForDiagnosticCount(
        editor.document.uri,
        1,
      );
      const usage = positionOf(editor, "SUBSCHEMA-NAMES.");
      helper.checkDiagnostic(
        diagnostics,
        "SUBSCHEMA-NAMES: Copybook not found",
        new vscode.Range(usage, usage.translate(0, "SUBSCHEMA-NAMES".length)),
      );
    } finally {
      await configuration.update(
        "paths-local",
        originalPaths,
        vscode.ConfigurationTarget.Workspace,
      );
    }
  });
});
